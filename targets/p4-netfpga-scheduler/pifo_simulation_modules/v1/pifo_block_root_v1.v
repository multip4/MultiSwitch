`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/28/2019 10:59:12 PM
// Design Name: 
// Module Name: pifo_block_root_v1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// In Racing Condition, if the wr element is more sigificant than the first element,
// output the new element directly.
// 


// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pifo_block_root_v1
    #(
    // root pifo_info format {valid bit<1>, rank bit<16>, is_last bit<1>, field <11>}
    /*
    [28:28] valid
    [27:12] rank
    [11:11] islast,
    [10:0] field,
    
    */
    
    
    parameter PIFO_INFO_WIDTH = 29,
    parameter PIFO_DEPTH = 2048,
    parameter PIFO_INDEX_WIDTH = 11
         
    )
    (
        s_axis_pifo_info,
        s_axis_pifo_insert_en,
        s_axis_pifo_pop_en,
        
        m_axis_pifo_info_async,
        
        clk,
        rstn // active at low
    );
    
    input [PIFO_INFO_WIDTH-1:0] s_axis_pifo_info;
    input                       s_axis_pifo_insert_en;
    input                       s_axis_pifo_pop_en;
    
    output [PIFO_INFO_WIDTH-1:0] m_axis_pifo_info_async;
    
    input clk;
    input rstn; 
    
    // FF arrays for PIFO Calendar
    reg [PIFO_INFO_WIDTH-1:0] pifo_calendar[0:PIFO_DEPTH-1];
    
    // comparator bit array 
    reg [PIFO_DEPTH-1:0] insert_bit_array_reg;
    reg [PIFO_DEPTH-1:0] insert_bit_array_reg_next;
        
    
    // output registers
    // TODO: Do we need this register ?
    reg [PIFO_INFO_WIDTH-1:0] m_axis_pifo_info_reg;
    reg [PIFO_INFO_WIDTH-1:0] m_axis_pifo_info_reg_next;
    
    // used for INSERT FSM.
    reg offset;
    reg offset_next;
    
    
    // update the specific pifo calendar element.
    // the following paramenters are combinational logic output.
    reg [PIFO_INDEX_WIDTH-1:0] pifo_calendar_update_index;
    reg [PIFO_INFO_WIDTH-1:0] pifo_calendar_update_value;
       
    // shift master position -> slave position.
    // the following paramenters are combinational logic output.
    reg [PIFO_INDEX_WIDTH-1:0] pifo_shift_slave_index_start;
    reg [PIFO_INDEX_WIDTH-1:0] pifo_shift_master_index_start;
    reg [PIFO_INDEX_WIDTH-1:0] pifo_shift_count;
    

    
    
    reg [PIFO_INDEX_WIDTH-1:0] pifo_counter;
    reg [PIFO_INDEX_WIDTH-1:0] pifo_counter_next;
        

    reg                         cur_state;
    reg                         cur_state_next;
    
    wire    pifo_empty_wire;
    wire    [PIFO_INDEX_WIDTH-1:0]   priority_encoder_result_index;
    wire    priority_encoder_result_valid;
    
    // PIFO Root uses 1 bit FSM    
    // local parameter
    localparam IDLE = 0;
    localparam INSERT = 1;
    
    localparam INSERT_ONLY = 2'b01; // case{read,write}
    localparam POP_ONLY =  2'b10;
    localparam POP_AND_INSERT = 2'b11;
    
    localparam RANK_START_POS = 12;
    localparam RANK_END_POS = 27;
    localparam PIFO_INFO_VALID_POS = 28;
        
    
             
    priority_encoder_v0_1
    #(.ARRAY_LENGTH(PIFO_DEPTH),
      .ADDR_WIDTH(PIFO_INDEX_WIDTH)
    )
    priority_encoder_inst(
        .s_axis_bit_array(insert_bit_array_reg_next),
        .m_axis_index(priority_encoder_result_index),
        .m_axis_valid(priority_encoder_result_valid)
    );
    
    integer j;
    always @(*)
        begin
        
        // manually set combinational logic output delay for simulation.
        // synthesis translate_off
        #100 // 0.1ns
        // synthesis translate_on

        pifo_shift_slave_index_start = 0;
        pifo_shift_master_index_start = 0;
        pifo_shift_count = 0;
        
        pifo_calendar_update_index = 0;
        pifo_calendar_update_value = pifo_calendar[0];
        
        // reset comparator bit array
        insert_bit_array_reg_next = insert_bit_array_reg;
        
        // reset cur_state_next
        cur_state_next = cur_state;
        
        // output reg.
        m_axis_pifo_info_reg_next = m_axis_pifo_info_reg;
        
        // pifo_calendar counter
        pifo_counter_next = pifo_counter;
        offset_next = 0;
            if(rstn)
                begin

                    case(cur_state)
                        // Defalt Status.
                        IDLE:
                            begin
                            
                                // generate compare bit array.
                                for(j = 0; j < PIFO_DEPTH; j = j + 1)
                                    begin
                                        // set bit array value to 1 if the new element's rank is smaller than target one.
                                        // or the target calendar element is not valid.
                                        insert_bit_array_reg_next[j] = (s_axis_pifo_info[RANK_END_POS:RANK_START_POS] <
                                                               pifo_calendar[j][RANK_END_POS:RANK_START_POS]) | ~pifo_calendar[j][PIFO_INFO_VALID_POS];
                                    end
                                
                                // condition check
                                case({s_axis_pifo_pop_en, s_axis_pifo_insert_en})
                                    
                                    // condition read only
                                    // note that, the read control signal is received when the pifo is not empty
                                    POP_ONLY:
                                        begin
                                            // in read mode, set output element value as clalendar[0]
                                            // ready to shift.
                                            m_axis_pifo_info_reg_next = pifo_calendar[0];
                                            pifo_counter_next = pifo_counter_next - 1;
                                            
                                            pifo_shift_slave_index_start = 0;
                                            pifo_shift_master_index_start = 1;
                                            pifo_shift_count = pifo_counter-1;                                            
                                            
                                            pifo_calendar_update_index = pifo_counter-1;
                                            pifo_calendar_update_value = 0;
                                            
                                            
                                        end
                                    // condition2. write only    
                                    INSERT_ONLY:
                                         begin
                                            
                                            // if pifo calendar is empty, then shift pifo calendar to left,
                                            // set first element as new value.
                                            if(pifo_empty_wire)
                                                begin
                                                    // if the pifo_empty, then set the first element as new element,
                                                    // no shift.
                                                    pifo_calendar_update_index = 0;
                                                    pifo_calendar_update_value = s_axis_pifo_info;
                                                end
                                            // if pifo calendar is not empty, then compare to head and tail to skip priority encoder,
                                            // else, move to insert state.
                                            else
                                                begin
                                                
                                                    // compare to the first element at pifo calendar
                                                    if(s_axis_pifo_info[RANK_END_POS:RANK_START_POS] 
                                                            < pifo_calendar[0][RANK_END_POS:RANK_START_POS])
                                                        begin
                                                            // shift all original values to tail direction.
                                                            pifo_shift_slave_index_start = 1;
                                                            pifo_shift_master_index_start = 0;
                                                            pifo_shift_count = pifo_counter;
                                                            
                                                            // update head element.
                                                            pifo_calendar_update_index = 0;
                                                            pifo_calendar_update_value = s_axis_pifo_info;                 
                                                        end
                                                    
                                                    // compare to the last element at pifo calendar
                                                    else if(s_axis_pifo_info[RANK_END_POS:RANK_START_POS] 
                                                            >= pifo_calendar[pifo_counter-1][RANK_END_POS:RANK_START_POS])
                                                        begin
                                                            // update tail element
                                                            pifo_calendar_update_index = pifo_counter;
                                                            pifo_calendar_update_value = s_axis_pifo_info;     
                                                        
                                                        end
                                                    else
                                                        // condition that the new element should insert into the middle of pifo calendar,
                                                        // calculate compare bit array and move to INSERT state
                                                        begin
                                                            cur_state_next = INSERT;
                                                        end
                                                    

                                                end
                                            // increment counter
                                            pifo_counter_next = pifo_counter_next + 1;                                                
                                                
                                         end
                                    //condition3. read and write
                                    POP_AND_INSERT:
                                        begin
                                            // if the write element has higher priority than the first element of pifo_calendar,
                                            // bypass the write element.
                                            if(s_axis_pifo_info[RANK_END_POS:RANK_START_POS] 
                                                    < pifo_calendar[0][RANK_END_POS:RANK_START_POS])
                                                begin
                                                    // bypass the write element.
                                                    m_axis_pifo_info_reg_next = s_axis_pifo_info;
                                                
                                                end
                                            // else if the write element has lower priority than the tail element,
                                            // shift element to head direction,
                                            // update tail element.
                                            else if(s_axis_pifo_info[RANK_END_POS:RANK_START_POS] 
                                                        > pifo_calendar[pifo_counter-1][RANK_END_POS:RANK_START_POS])
                                                    begin
                                                        
                                                        // shift element
                                                        pifo_shift_slave_index_start = 0;
                                                        pifo_shift_master_index_start = 1;
                                                        pifo_shift_count = pifo_counter-1;    
                                                    
                                                        // update tail element
                                                        pifo_calendar_update_index = pifo_counter-1;
                                                        pifo_calendar_update_value = s_axis_pifo_info;     
                                                    
                                                        // set output value
                                                        m_axis_pifo_info_reg_next = pifo_calendar[0];
                                                    end
                                            
                                            // else,
                                            else
                                             // condition that the new element should insert into the middle of pifo calendar,
                                             // calculate compare bit array and move to INSERT state
                                             begin
                                                 cur_state_next = INSERT;
                                                 offset_next = 1;
                                                 
                                                 // shift element
                                                 pifo_shift_slave_index_start = 0;
                                                 pifo_shift_master_index_start = 1;
                                                 pifo_shift_count = pifo_counter-1; 
                                                 
                                                 // set output value
                                                 m_axis_pifo_info_reg_next = pifo_calendar[0];
                                                                                                 
                                             end
                                           
                                        end                    
                                endcase
                                         
                            end
                        INSERT:
                            begin
                            
                                // race condition.
                                if(s_axis_pifo_pop_en)
                                    begin
                                                      
                                    // shift element to head direction,
                                    // from 1 to priority_encoder_index.
                                     
                                    pifo_shift_slave_index_start = 0;
                                    pifo_shift_master_index_start = 1;
                                    pifo_shift_count = priority_encoder_result_index - offset - 1; 
                                    
                                    // set output value
                                    m_axis_pifo_info_reg_next = pifo_calendar[0];                                   
                                    
                                    // decrement counter
                                    pifo_counter_next = pifo_counter - 1;
                                    
                                    // Insert Element. 
                                    pifo_calendar_update_index = priority_encoder_result_index - offset -1;
                                    pifo_calendar_update_value = s_axis_pifo_info;                                                                     
                                    end
                                else
                                    begin
                                    // shift element to tail, . 
                                    pifo_shift_slave_index_start = priority_encoder_result_index + 1 - offset;
                                    pifo_shift_master_index_start = priority_encoder_result_index - offset;
                                    pifo_shift_count = pifo_counter - priority_encoder_result_index - 1; // minus 1 here because the pifo_counter is incremented in previous state 
                                    
                                    // Insert Element. 
                                    pifo_calendar_update_index = priority_encoder_result_index - offset;
                                    pifo_calendar_update_value = s_axis_pifo_info;     
                                    
                                    end
                                    
                                    
                            cur_state_next = IDLE;
                            end
                    
                    endcase
                                     
                end
        end
    

    integer i;
    always @(posedge clk) begin
        
        if(~rstn)
            begin
                // reset pifo calendar
                for(i = 0 ; i < PIFO_DEPTH ; i = i + 1)
                    begin
                        pifo_calendar[i] <= 0;
                    end
                    
                cur_state <= 0;
                m_axis_pifo_info_reg <= 0;     
                pifo_counter <= 0;
                offset <= 0;
                insert_bit_array_reg <= 0;
            end
        else
            begin
//                pifo_calendar[]
                cur_state <= cur_state_next;
                m_axis_pifo_info_reg <= m_axis_pifo_info_reg_next;
                pifo_counter <=  pifo_counter_next;
                offset <= offset_next;
                insert_bit_array_reg <= insert_bit_array_reg_next;
                
                //shift
                for(i = 0 ; i < pifo_shift_count; i = i+1 )
                    begin
                        pifo_calendar[pifo_shift_slave_index_start+i] <= pifo_calendar[pifo_shift_master_index_start+i];
                    end
                
                // update single calendar element    
                pifo_calendar[pifo_calendar_update_index] <= pifo_calendar_update_value;
                
            end
    end
    
    assign m_axis_pifo_info_async = m_axis_pifo_info_reg_next; // return async data.
    assign pifo_empty_wire = (pifo_counter == 0)? 1 : 0; // 1 for empty, 0 for not empty
    
endmodule