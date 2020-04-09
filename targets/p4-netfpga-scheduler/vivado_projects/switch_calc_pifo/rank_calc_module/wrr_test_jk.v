`timescale 1ps / 1ps
module test_trigger_jk;


//------------------------------ 
// Parameter
integer PORT = 5;
integer MAX_CLASS_PER_PORT = 32;
integer MAX_WEIGHT_VALUE = 255;

integer index_port; // for loop iteration
integer index_class; // for loop iteration

reg check_overflow; // signal to point the overflow location in wave form 

//------------------------------


reg clk_dp, clk_cp;
reg rst;

//---------DP Input Data and Output Data------------------
reg d_in_valid;
reg [4:0] d_in_class;
reg [7:0] d_in_port; //Maximum support 8 ports.
wire [12:0] d_in_data = {d_in_port,d_in_class};// Port 8 --> Bit Array, Class 5

wire d_out_valid;
wire [31:0] d_out_data; // ValidOut+ Rank + Pifo Info {1, 19, 12}
wire d_out_pifo_valid; // pifo info valid bit 
wire [18:0] d_out_pifo_rank; // pifo rank 19bit 
wire [11:0] d_out_pifo_reserved; // pifo reserved 12bit

assign {d_out_pifo_valid, d_out_pifo_rank, d_out_pifo_reserved} = d_out_data;

wire       d_out_unused;
wire [4:0] d_out_wrr_class;
wire [1:0] d_out_wrr_overflow;
wire [10:0] d_out_wrr_round;

assign {d_out_unused, d_out_wrr_class, d_out_wrr_overflow, d_out_wrr_round} = d_out_pifo_rank;


//---------CP Input Data and Output Data Handling------------------
reg cp_valid_in,cp_read_sig_in, cp_write_sig_in;
reg [4:0] cp_class_id;
reg [3:0] cp_port_id; //Maximum support 8 ports.
wire [7:0] cp_index_in = {cp_port_id,cp_class_id};// Port 8 --> Bit Array, Class 5

reg [8:0] cp_write_val;    // Write Config Weight
wire [26:0] cp_val_out; // Round:11 , Weight & Config Weight: 8
wire cp_valid_out;
wire [7:0] cp_index_out;


// -----------------Signal from PIFO scheduler

reg [31:0] lastcalcedrank[0:4] ;

integer id_j;    

//define clock.
always begin 
  #(5000 / 2) clk_dp =  0; 
  #(5000 / 2) clk_dp =  1; 
end
always begin 
  #(5000 / 2) clk_cp =  0; 
  #(5000 / 2) clk_cp =  1; 
end

wrr_without_blkmem wrr(
.clk_dp(clk_dp),
.rst(rst),
.tuple_in_my_pifo_rank_calc_input_VALID(d_in_valid),
.tuple_in_my_pifo_rank_calc_input_DATA(d_in_data),
.tuple_out_my_pifo_rank_calc_output_VALID(d_out_valid),
.tuple_out_my_pifo_rank_calc_output_DATA(d_out_data),
.wire_in_last_pkt_info0(lastcalcedrank[0]),
.wire_in_last_pkt_info1(lastcalcedrank[1]),
.wire_in_last_pkt_info2(lastcalcedrank[2]),
.wire_in_last_pkt_info3(lastcalcedrank[3]),
.wire_in_last_pkt_info4(lastcalcedrank[4]),
.clk_cp(clk_cp),
.wire_in_cpu_valid(cp_valid_in),
.wire_in_cpu_index(cp_index_in),
.wire_in_cpu_write_sig(cp_write_sig_in),
.wire_in_cpu_config_write(cp_write_val),
.wire_in_cpu_read_sig(cp_read_sig_in),
.wire_out_cpu_index(cp_index_out),
.wire_out_cpu_val(cp_val_out),
.wire_out_cpu_valid(cp_valid_out)
);



wire [10:0] w_reg_round_0 = wrr.reg_round[0];
wire [1:0] w_reg_overflow_0 = wrr.reg_overflow[0];




initial begin 
//Test Read and write Block Ram.
clk_dp = 0;
clk_cp = 0;

lastcalcedrank[0] = 0;
lastcalcedrank[1] = 0;
lastcalcedrank[2] = 0;
lastcalcedrank[3] = 0;
lastcalcedrank[4] = 0;

rst = 1;
#100000 rst = 0;
#100  

// Set CPU Config 
/*
Set Weighted Round Robin Config weight, And Check Whether the value is correctly set. 
Port0:  5:3:2:1
Port1:  1:1:1
*/


// --------------------------------------------//
// CP Scenario

$display("=======> Start CP TestCase");
for (index_port = 0; index_port < PORT; index_port = index_port+1)
begin
    for(index_class = 0; index_class < MAX_CLASS_PER_PORT; index_class = index_class + 1)
    begin
        // Calculate Randome Value for weight
        #5000  cp_valid_in = 1; cp_write_sig_in =1; cp_port_id =index_port; cp_class_id =index_class; cp_write_val = {$random} % MAX_WEIGHT_VALUE;
        #5000  cp_valid_in = 0; cp_write_sig_in =0;
        $display("Check CPU Write at Port:%d, Class:%d ", index_port, index_class);
        $display("Check CPU Write (Expected): %d : (Actual  ): %d ", cp_write_val, wrr.reg_config_weight[cp_port_id*32+cp_class_id]);
        if(cp_write_val != wrr.reg_config_weight[cp_port_id*32+cp_class_id])
        begin
            $display("Error Found at CPU Write");
            $finish;
        end
    end
end

$display("=======> End CP TestCase");
// End. CP Scenario--------------------------------------------//


#50000

//Check DP Channel.  
//for (id_j=0; id_j<=9; id_j= id_j+1)
//    begin
//    #5 dp_valid_in = 1; dp_port_id_in= 'b00000001; dp_class_id_in =0; // Round 1 Weight 5
//    #5 dp_valid_in = 0;
    
//    #5 dp_valid_in = 1; dp_port_id_in= 'b00000001; dp_class_id_in =1; // Round 3 Weight 1
//    #5 dp_valid_in = 0;
    
//    #5 dp_valid_in = 1; dp_port_id_in= 'b00000001; dp_class_id_in =2; // Round 4 Weight 2
//    #5 dp_valid_in = 0;
    
//    #5 dp_valid_in = 1; dp_port_id_in= 'b00000001; dp_class_id_in =3; // Round 9 Weight 1
//    #5 dp_valid_in = 0;
    
//    #5 dp_valid_in = 1; dp_port_id_in= 'b00000100; dp_class_id_in =0; // Round 9 Weight 1
//    #5 dp_valid_in = 0;
    
//    #5 dp_valid_in = 1; dp_port_id_in= 'b00000100; dp_class_id_in =1; // Round 9 Weight 1
//    #5 dp_valid_in = 0;
    
//    #5 dp_valid_in = 1; dp_port_id_in= 'b00000100; dp_class_id_in =2; // Round 9 Weight 1
//    #5 dp_valid_in = 0;
//    end
    


$display("=======> Start DP TestCase");
// --------------------------------------------//
// DP Scenario

// TestCase #1  Normal Rank Calc
$display("===DP Scenario 1 (Normal) ====> Step0. Write CP Weight. port0, class0 to 1");
// Step 0. Set port0 class 0 weight as 1
#5000  cp_valid_in = 1; cp_write_sig_in =1; cp_port_id =0; cp_class_id =0; cp_write_val = 1;
#5000  cp_valid_in = 0; cp_write_sig_in =0;

// Step 1. Set port0 class 1 weight as 2
$display("===DP Scenario 1 (Normal) ====> Step1. Write CP Weight. port0, class1 to 2");
#5000  cp_valid_in = 1; cp_write_sig_in =1; cp_port_id =0; cp_class_id =1; cp_write_val = 2;
#5000  cp_valid_in = 0; cp_write_sig_in =0;

// check cpu value 
$display("===DP Scenario 1 (Normal) ====> Step3. Check CP Weight.");
$display("Check CPU Write (Expected): %d : %d ", 1, 2);
$display("Check CPU Write (Actual  ): %d : %d ", wrr.reg_config_weight[0], wrr.reg_config_weight[1]);

$display("===DP Scenario 1 (Normal) ====> Step4. Send Packets. 100 packets per each flow.");
for (id_j=0; id_j<100; id_j= id_j+1)
begin
        #5000 d_in_valid = 1; d_in_port= 'b00000001; d_in_class =0; 
        #5000 d_in_valid = 0;
        
        #5000 d_in_valid = 1; d_in_port= 'b00000001; d_in_class =1; 
        #5000 d_in_valid = 0;
end
$display("===DP Scenario 1 (Normal) ====> Step4. Send Packets. End");

$display("===DP Scenario 1 (Normal) ====> Step5. Check Rounds");
$display("Check P0C0, P0C1 reg_config_weight (Actual  ): %d : %d ", wrr.reg_config_weight[0], wrr.reg_config_weight[1]);
$display("Check P0C0, P0C1 reg_overflow (Actual  ): %d : %d ", wrr.reg_overflow[0], wrr.reg_overflow[1]);
$display("Check P0C0, P0C1 reg_round (Actual  ): %d : %d ", wrr.reg_round[0], wrr.reg_round[1]);
$display("Check P0C0, P0C1 reg_weight (Actual  ): %d : %d ", wrr.reg_weight[0], wrr.reg_weight[1]);
$display("===DP Scenario 1 (Normal) ====> End");
// Step 0. Set port0 class 1 weight as 1
// Step 1. Set port0 class 2 weight as 2
// check cpu value 

$display("RESET Registers");
rst = 1;
#100000 rst = 0;




$display("===DP Scenario 2 (Outaged) ====> Step0. Write CP Weight. port0, class0 to 1");
// Step 0. Set port0 class 0 weight as 1
#5000  cp_valid_in = 1; cp_write_sig_in =1; cp_port_id =0; cp_class_id =0; cp_write_val = 1;
#5000  cp_valid_in = 0; cp_write_sig_in =0;

// Step 1. Set port0 class 1 weight as 2
$display("===DP Scenario 2 (Outaged) ====> Step1. Write CP Weight. port0, class1 to 2");
#5000  cp_valid_in = 1; cp_write_sig_in =1; cp_port_id =0; cp_class_id =1; cp_write_val = 2;
#5000  cp_valid_in = 0; cp_write_sig_in =0;

$display("===DP Scenario 2 (Outaged) ====> Step3. Check CP Weight.");
$display("Check CPU Write (Expected): %d : %d ", 1, 2);
$display("Check CPU Write (Actual  ): %d : %d ", wrr.reg_config_weight[0], wrr.reg_config_weight[1]);

$display("===DP Scenario 2 (Outaged) ====> Step4. Send 50 pkts for P0C0.");
for (id_j=0; id_j<50; id_j= id_j+1)
begin
        #5000 d_in_valid = 1; d_in_port= 'b00000001; d_in_class =0; 
        #5000 d_in_valid = 0;
end

$display("===DP Scenario 2 (Outaged) ====> Step5. SetLast Dequeue Rank as 0x80031000."); // round 49
lastcalcedrank[0] = 'h80031000;
$display("===DP Scenario 2 (Outaged) ====> Step6. Send 50 pkts for P0C1.");
for (id_j=0; id_j<50; id_j= id_j+1)
begin
        #5000 d_in_valid = 1; d_in_port= 'b00000001; d_in_class =1; 
        #5000 d_in_valid = 0;
end
$display("===DP Scenario 2 (Outaged) ====> Step7. Check Rounds");
$display("Check P0C0, P0C1 reg_config_weight (Actual  ): %d : %d ", wrr.reg_config_weight[0], wrr.reg_config_weight[1]);
$display("Check P0C0, P0C1 reg_overflow (Actual  ): %d : %d ", wrr.reg_overflow[0], wrr.reg_overflow[1]);
$display("Check P0C0, P0C1 reg_round (Actual  ): %d : %d ", wrr.reg_round[0], wrr.reg_round[1]);
$display("Check P0C0, P0C1 reg_weight (Actual  ): %d : %d ", wrr.reg_weight[0], wrr.reg_weight[1]);
$display("===DP Scenario 2 (Outaged) ====> End");



$display("RESET Registers");
rst = 1;
#100000 rst = 0;





$display("===DP Scenario 3 (Overflow) ====> Step0. Write CP Weight. port0, class0 to 1");
// Step 0. Set port0 class 0 weight as 1
#5000  cp_valid_in = 1; cp_write_sig_in =1; cp_port_id =0; cp_class_id =0; cp_write_val = 1;
#5000  cp_valid_in = 0; cp_write_sig_in =0;

// Step 1. Set port0 class 1 weight as 2
$display("===DP Scenario 3 (Overflow) ====> Step1. Write CP Weight. port0, class1 to 2");
#5000  cp_valid_in = 1; cp_write_sig_in =1; cp_port_id =0; cp_class_id =1; cp_write_val = 2;
#5000  cp_valid_in = 0; cp_write_sig_in =0;

$display("===DP Scenario 3 (Overflow) ====> Step3. Check CP Weight.");
$display("Check CPU Write (Expected): %d : %d ", 1, 2);
$display("Check CPU Write (Actual  ): %d : %d ", wrr.reg_config_weight[0], wrr.reg_config_weight[1]);


$display("===DP Scenario 2 (Outaged) ====> Step4. Send 2050 pkts for P0C0 to trigger first overflow.");
for (id_j=0; id_j<2050; id_j= id_j+1)
begin
        #5000 d_in_valid = 1; d_in_port= 'b00000001; d_in_class =0; 
        #5000 d_in_valid = 0;
end

$display("Check P0C0, reg_overflow (Expected): %d ; (Actual  ): %d ", 1, wrr.reg_overflow[0]);



$display("===DP Scenario 2 (Outaged) ====> Step5. Send 2050 pkts for P0C0 to trigger second overflow.");
for (id_j=0; id_j<2050; id_j= id_j+1)
begin
        #5000 d_in_valid = 1; d_in_port= 'b00000001; d_in_class =0; 
        #5000 d_in_valid = 0;
end

check_overflow = 1;
$display("Check P0C0, reg_overflow (Expected): %d ; (Actual  ): %d ", 2, wrr.reg_overflow[0]);
#5000 check_overflow = 0;

$display("===DP Scenario 2 (Outaged) ====> Step6. Send 2050 pkts for P0C0 to trigger thrid overflow.");
for (id_j=0; id_j<2050; id_j= id_j+1)
begin
        #5000 d_in_valid = 1; d_in_port= 'b00000001; d_in_class =0; 
        #5000 d_in_valid = 0;
end

check_overflow = 1;
#5000 check_overflow = 0;
$display("Check P0C0, reg_overflow (Expected): %d ; (Actual  ): %d ", 3, wrr.reg_overflow[0]);


$display("===DP Scenario 2 (Outaged) ====> Step7. Send 2050 pkts for P0C0 to trigger fourth overflow.");
for (id_j=0; id_j<2050; id_j= id_j+1)
begin
        #5000 d_in_valid = 1; d_in_port= 'b00000001; d_in_class =0; 
        #5000 d_in_valid = 0;
end
check_overflow = 1;
#5000 check_overflow = 0;
$display("Check P0C0, reg_overflow (Expected): %d ; (Actual  ): %d ", 0, wrr.reg_overflow[0]);



//Check Config Weight
/*Result: 
Config Weight Port0:  5:3:2:1
Config Weight Port1:  1:1:1:1
*/
//#10  cp_valid_in = 1; cp_read_sig_in =1;  cp_port_id =0; cp_class_id =0; 
//#10  cp_valid_in = 0; cp_read_sig_in =0;

//#5 lastcalcedrank0= 'b10001000000000000000000000000000; //Last Round up to 1024.

//#5 dp_valid_in = 1; dp_port_id_in= 'b00000001; dp_class_id_in =0; // Round 1 Weight 5
//#5 dp_valid_in = 0;
 
//#5 dp_valid_in = 1; dp_port_id_in= 'b00000001; dp_class_id_in =2; // Round 1 Weight 5
//#5 dp_valid_in = 0;

//#10  cp_valid_in = 1; cp_read_sig_in =1;  cp_port_id =0; cp_class_id =2; 
//#10  cp_valid_in = 0; cp_read_sig_in =0;

end
//initial begin
//$monitor( "cp_valid_out %d, index %d, config weight %d ,round %d, counter: %d ",cp_valid_out,cp_index_out,cp_val_out[15:8],cp_val_out[26:16],cp_val_out[7:0]);
//end


endmodule
