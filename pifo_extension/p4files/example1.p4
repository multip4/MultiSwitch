/* example1. hierachical example
   2 level- scheduling,
   4 flows,(A,B,C,D)
   2 classes, (class1-[A,B], class2-[C,D])

   use 3 pifo block.
   pifo_block1 => scheduling among class1 and class2 (Weighted round robin) 
   pifo_block2 => scheduling among Flow A and Flow B (Deficit round robin)
   pifo_block3 => scheduling among Flow C and Flow D (Calendar Queue(work-conserving))

   dequeue sequence
   (port idle event) -> pifo_block1 -------> pifo_block2
                                       |
                                       -----> pifo_block3
*/


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

	// Weighted Round Robin
	// [class1,class2][local_counter, remain_weight]
	registers<bit<32>> pifo1_reg[2][2] 
	registers<bit<32>> pifo1_reg_global_counter 
	
	// Deficit Round Robin
	// [flow1, flow2][local_counter, remain_weight, enqueue_counter, dequeue_counter]
	registers<bit<32>> pifo2_reg[2][4]
	registers<bit<32>> pifo2_reg_global_counter 

	// Calendar Queue(Work-Conserving)
	// [flow1, flow2][local_last_sent_round, remain_bucket]
	registers<bit<32>> pifo3_reg[2][2]


	// define custom functions.
	// Documented since p4_16 v1.1.0
	bit<n> max(bit<n> num1, bit<n> num2)  //  example: bit<8> max(bit<8> num1, bit<8> num2)
	bit<n> min(bit<n> num1, bit<n> num2)
	bit<n> div_plus(bit<n> num1, bit<n> num2) // if mod() > 0, then return div()+1

	// define actions
	action rank_calc1(){}        // wrr algorithm
	action rank_calc2(){}        // drr algorithm 
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

	pifo2 = PIFO(n_of_queue = 1, 
			length_of_queue = 128, 
			is_work_conserving=True, 
			rank_calc_func = rank_calc2
			after_dequeue_process = update_register2);

	pifo3 = PIFO(n_of_queue = 1, 
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
					0: dequeue_pifo2; // flow_id 0 for class1
					1: dequeue_pifo3; // flow_id 1 for class2
					default: transmit
				}

			state dequeue_pifo2 {
				pkt = pifo2.pop();
				transition transmit; // send packet to port 

			state dequeue_pifo3 {
				pkt = pifo3.pop();
				transition transmit; // send packet to port
			}
		}
	}




}