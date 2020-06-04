queueing_metadata{
	egress_port;
	queue_enqueue_timestamp;
	queue_dequeue_timestamp;
	queue_depth;
}

pifo_metadata{
	pifo_block_id;      // PIFO block ID
	queue_id;			// Queue ID in the PIFO block
	rank_calc_priority; // rank value
	rank_calc_flow_id;  // parameter for rank calculation: flow id
	rank_calc_weight;   // parameter for rank calculation: weight
}

struct scheduling_metadata {
	queueing_metadata;
	pifo_metadata[n];
}


control Scheduler(user_metadata_t u_meta, scheduling_metadata_t s_meta){
	
	// init registers
	registers<bit<32>> pifo1_reg[][]
	registers<bit<32>> pifo2_reg[][]
	registers<bit<32>> pifo3_reg[][]

	// define custom functions.
	// Documented since p4_16 v1.1.0
	bit<n> max(bit<n> num1, bit<n> num2)  //  example: bit<8> max(bit<8> num1, bit<8> num2)
	bit<n> min(bit<n> num1, bit<n> num2)

	// define actions
	action rank_calc1(){}        // rr algorithm
	action rank_calc2(){}        // wrr algorithm 
	action rank_calc3(){}        // calendar queue(work-conserving) algorithm
	action update_register1(){}  // update parameters(e.g, global counter) 
	action update_register2(){}  // update parameters(e.g, global counter) 
	action update_register3(){}  // update parameters(e.g, global counter) 


	// Init PIFO Block

	// note that, the root block can only have one queue per port,
	// see the apply section for why.
	pifo1 = PIFO(n_of_queue = 1, 
				length_of_queue = 128, 
				is_work_conserving=True, 
				rank_calc_func = rank_calc1
				after_dequeue_process = update_register1);

	pifo2 = PIFO(n_of_queue = 2, 
			length_of_queue = 128, 
			is_work_conserving=True, 
			rank_calc_func = rank_calc2
			after_dequeue_process = update_register2);

	pifo3 = PIFO(n_of_queue = 2, 
			length_of_queue = 128, 
			is_work_conserving=True, 
			rank_calc_func = rank_calc3
			after_dequeue_process = update_register3);


	//define control logic
	apply{

		enqueue{  //TODO: move to fixed function?

			for pifo_meta in pifo_metadata:
			    push(pifo_meta);   // push packet into dedicated pifo_block and queue by pifo_meta
		}

		// dequeue process
		// defined as state transition machine.

		dequeue{

			state start {
                transition dequeue_pifo1;
			}

			state dequeue_pifo1 {
				pkt = pifo1.pop();
				transition select(pkt.s_meta.flow_id){
					0: dequeue_pifo2;
					1: dequeue_pifo3;
					default: transmit
				}

			state dequeue_pifo2 {
				pkt = pifo2.pop();
				transition select(pkt.s_meta.flow_id){
					default: transmit;
				}

			state dequeue_pifo3 {
				pkt = pifo3.pop();
				transition transmit;
			}



		}
	}




}