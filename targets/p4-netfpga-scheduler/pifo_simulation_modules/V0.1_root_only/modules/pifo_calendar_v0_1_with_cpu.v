`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2019 02:26:16 PM
// Design Name: 
// Module Name: pifo_calendar_v0_1_with_cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pifo_calendar_v0_1_with_cpu

 #(
    parameter PIFO_CALENDAR_SIZE = 1024,
    parameter PIFO_CALENDAR_INDEX_WIDTH = 10,
    parameter BUFFER_ADDR_WIDTH = 12,
    parameter PIFO_RANK_WIDTH = 19,
    parameter PIFO_ROOT_WIDTH = 32,
    parameter ROOT_RANK_START_POS = 12,
    parameter ROOT_RANK_END_POS = 30,
    parameter ROOT_PIFO_INFO_VALID_POS = 31
    
    
    )
    (
        s_axis_pifo_info_root,
        s_axis_insert_en,
        s_axis_pop_en,
        
        m_axis_buffer_addr, // pop result, buffer address
        m_axis_buffer_addr_valid, // indicate the value is valid.
        m_axis_bypass_en,
        
        m_axis_calendar_full,
        
        // add cpu i/o later.
        
        
        cpu_rd_valid,
        cpu_rd_addr,
        cpu_rd_result_valid,
        cpu_rd_result, 
        
        cpu_wr_valid,
        cpu_wr_addr,
        cpu_wr_data,
        cpu_wr_result_valid,
              

        // reset & clock
        rstn,
        clk,
        
    
    );
    
    input [PIFO_ROOT_WIDTH-1:0]  s_axis_pifo_info_root;
    input                        s_axis_insert_en;
    input                        s_axis_pop_en;
    
    output [BUFFER_ADDR_WIDTH-1:0] m_axis_buffer_addr;
    output                         m_axis_buffer_addr_valid;
    output                         m_axis_bypass_en;

    output                          m_axis_calendar_full;

    input                                   cpu_rd_valid;
    input [PIFO_CALENDAR_INDEX_WIDTH-1:0]   cpu_rd_addr;
    output                                  cpu_rd_result_valid;
    output [PIFO_ROOT_WIDTH-1:0]            cpu_rd_result;
        
    input                                   cpu_wr_valid;
    input [PIFO_CALENDAR_INDEX_WIDTH-1:0]   cpu_wr_addr;
    input [PIFO_ROOT_WIDTH-1:0]             cpu_wr_data;
    output                                  cpu_wr_result_valid;

    input rstn;
    input clk;

    wire                        w_ctl_insert;
    wire                        w_ctl_pop;
    



    wire [PIFO_ROOT_WIDTH-1:0] w_pifo_atom_element[0:PIFO_CALENDAR_SIZE-1];
    wire [PIFO_CALENDAR_SIZE-1:0] w_pifo_atom_compare_result;    
    
    reg  [PIFO_CALENDAR_INDEX_WIDTH-1:0] r_pifo_element_count;
    reg  [PIFO_CALENDAR_INDEX_WIDTH-1:0] r_pifo_element_count_next;
    
    // FF register and combinational output for CPU channel
    reg [PIFO_ROOT_WIDTH-1:0] r_cpu_write_data;
    reg [PIFO_ROOT_WIDTH-1:0] r_cpu_write_data_next;
    reg [PIFO_CALENDAR_INDEX_WIDTH-1:0] r_cpu_write_data_addr;
    reg [PIFO_CALENDAR_INDEX_WIDTH-1:0] r_cpu_write_data_addr_next;
    reg                       r_cpu_write_en;
    reg                       r_cpu_write_en_next;
    reg                       r_cpu_write_result_valid;
    reg                       r_cpu_write_result_valid_next;
    
    
    reg [PIFO_ROOT_WIDTH-1:0] r_cpu_read_data;
    reg [PIFO_ROOT_WIDTH-1:0] r_cpu_read_data_next;
    reg                       r_cpu_read_result_valid;
    reg                       r_cpu_read_result_valid_next;
        
    wire [PIFO_CALENDAR_SIZE-1:0] w_cpu_write_index_bit_array;
    assign  w_cpu_write_index_bit_array = 1 << cpu_wr_addr;             


genvar i;
generate
    
    for(i=0; i < PIFO_CALENDAR_SIZE; i=i+1)    
        begin: generate_pifo_atom
            if(i == 0)
                begin
                    pifo_calendar_atom_v0_2
                    #(      .ELEMENT_WIDTH(PIFO_ROOT_WIDTH),  // 32 for root element
                            .ELEMENT_RANK_WIDTH(PIFO_RANK_WIDTH),
                            .RANK_START_POS(ROOT_RANK_START_POS),
                            .RANK_END_POS(ROOT_RANK_END_POS),
                            .PIFO_INFO_VALID_POS(ROOT_PIFO_INFO_VALID_POS)
                     )
                    atom_root
                    (
                        .in_pifo_input(s_axis_pifo_info_root),                       // input data
                        // set 0 for this field,
                        .in_pifo_neighbour_element_from_head_direction(0),           // neighbour element data
                        // set next data for 
                        .in_pifo_neighbour_element_from_tail_direction(w_pifo_atom_element[i+1]),          // element data
                         
                        // always set 0 for this value.
                        .in_pifo_neighbour_compare_large_from_head_direction('b0),
                        .in_pifo_neighbour_compare_large_from_tail_direction(w_pifo_atom_compare_result[i+1]),                     
                        .in_ctl_insert(w_ctl_insert),
                        .in_ctl_pop(w_ctl_pop),
                        
                        .in_cpu_data(cpu_wr_data),
                        .in_cpu_insert(r_cpu_write_en & w_cpu_write_index_bit_array[i]),
                        
                        // Output signal
                        .out_pifo_output(w_pifo_atom_element[i]),         // output self register value
                        .out_pifo_compare_large(w_pifo_atom_compare_result[i]),  // output large compare value, used for insert. 1 for larger, 0 for small or equal.
                        
                        .clk(clk),
                        .rstn(rstn)  
                    );
                end
            else if(i == PIFO_CALENDAR_SIZE-1)
                begin
                     pifo_calendar_atom_v0_2
                        #(      .ELEMENT_WIDTH(PIFO_ROOT_WIDTH),  // 32 for root element
                                .ELEMENT_RANK_WIDTH(PIFO_RANK_WIDTH),
                                .RANK_START_POS(ROOT_RANK_START_POS),
                                .RANK_END_POS(ROOT_RANK_END_POS),
                                .PIFO_INFO_VALID_POS(ROOT_PIFO_INFO_VALID_POS)
                         )
                        atom_root
                        (
                            .in_pifo_input(s_axis_pifo_info_root),                       // input data
                            // set previous data for this field,
                            .in_pifo_neighbour_element_from_head_direction(w_pifo_atom_element[i-1]),           // neighbour element data
                            // set 0 for next data. 
                            .in_pifo_neighbour_element_from_tail_direction('b0),          // element data
                           
                            // get previous compare result.
                            .in_pifo_neighbour_compare_large_from_head_direction(w_pifo_atom_compare_result[i-1]),
                            .in_pifo_neighbour_compare_large_from_tail_direction('b1),                         
                            .in_ctl_insert(w_ctl_insert),
                            .in_ctl_pop(w_ctl_pop),
                            
                            .in_cpu_data(cpu_wr_data),
                            .in_cpu_insert(r_cpu_write_en & w_cpu_write_index_bit_array[i]),
                            
                            // Output signal
                            .out_pifo_output(w_pifo_atom_element[i]),         // output self register value
                            .out_pifo_compare_large(w_pifo_atom_compare_result[i]),  // output large compare value, used for insert. 1 for larger, 0 for small or equal.
                            
                            .clk(clk),
                            .rstn(rstn)  
                        );    
                end   
            else
                begin
                    pifo_calendar_atom_v0_2
                       #(      .ELEMENT_WIDTH(PIFO_ROOT_WIDTH),  // 32 for root element
                               .ELEMENT_RANK_WIDTH(PIFO_RANK_WIDTH),
                               .RANK_START_POS(ROOT_RANK_START_POS),
                               .RANK_END_POS(ROOT_RANK_END_POS),
                               .PIFO_INFO_VALID_POS(ROOT_PIFO_INFO_VALID_POS)
                        )
                       atom_root
                       (
                           .in_pifo_input(s_axis_pifo_info_root),                       // input data
                           // set previous data for this field,
                           .in_pifo_neighbour_element_from_head_direction(w_pifo_atom_element[i-1]),           // neighbour element data
                           // set 0 for next data. 
                           .in_pifo_neighbour_element_from_tail_direction(w_pifo_atom_element[i+1]),          // element data
                          
                           // get previous compare result.
                           .in_pifo_neighbour_compare_large_from_head_direction(w_pifo_atom_compare_result[i-1]),
                           .in_pifo_neighbour_compare_large_from_tail_direction(w_pifo_atom_compare_result[i+1]),                         
                           .in_ctl_insert(w_ctl_insert),
                           .in_ctl_pop(w_ctl_pop),
                           
                           .in_cpu_data(cpu_wr_data),
                           .in_cpu_insert(r_cpu_write_en & w_cpu_write_index_bit_array[i]),
                           
                           // Output signal
                           .out_pifo_output(w_pifo_atom_element[i]),         // output self register value
                           .out_pifo_compare_large(w_pifo_atom_compare_result[i]),  // output large compare value, used for insert. 1 for larger, 0 for small or equal.
                           
                           .clk(clk),
                           .rstn(rstn)  
                       );    
                    
                end 
        end

endgenerate

always @(*)
    begin
        r_pifo_element_count_next = r_pifo_element_count;
        
        case({w_ctl_insert,w_ctl_pop})
            2'b01:
                r_pifo_element_count_next = r_pifo_element_count -1;
            2'b10:
                r_pifo_element_count_next = r_pifo_element_count +1;
        endcase    
        
    end


always @(posedge clk)
    begin
        if(~rstn) // reset statement.
            begin
                r_pifo_element_count <= 0;
            end
            
        else
            begin // update registers.
                r_pifo_element_count <= r_pifo_element_count_next;
            end
    end

// combinational logic block for CPU

always @(*)
    begin
        r_cpu_write_data_next = r_cpu_write_data;
        r_cpu_write_data_addr_next = r_cpu_write_data_addr;
        r_cpu_write_en_next = r_cpu_write_en;
        r_cpu_write_result_valid_next = 0;
        
        r_cpu_read_data_next = r_cpu_read_data;
        r_cpu_read_result_valid_next = 0;
        
        // if 
        if(cpu_wr_valid)
            begin
                r_cpu_write_data_addr_next = cpu_wr_addr;
                r_cpu_write_data_next =  cpu_wr_data;
                r_cpu_write_en_next = 1;
            end
            
        // if no insert & no pop,
        // which occur cpu write.
        // then set write register value to 0,
        
        else if(~w_ctl_insert & ~w_ctl_pop & r_cpu_write_en) //
            begin
                r_cpu_write_en_next = 0;
                r_cpu_write_result_valid_next = 1;
            end
    
        
        // if read en,
        // then return valid signal in next cycle,
        // return value.
        // NOTICE!!: if the read mux can't meet timing, need other approach,
        // hierachical mux or use fsm to support multi-cycle.
     
        if(cpu_rd_valid)
            begin
                r_cpu_read_result_valid_next = 1;
                r_cpu_read_data_next = w_pifo_atom_element[cpu_rd_addr];
            end
    
    end



// sync logic block for CPU

always @(posedge clk)
    begin
        if(~rstn)
            begin
                r_cpu_write_data <= 0;
                r_cpu_write_data_addr <= 0;
                r_cpu_write_en <= 0;
                r_cpu_write_result_valid <= 0;
                r_cpu_read_data <= 0;
            end
        else
            begin
                r_cpu_write_data <= r_cpu_write_data_next;
                r_cpu_write_data_addr <= r_cpu_write_data_addr_next;
                r_cpu_write_en <= r_cpu_write_en_next;
                r_cpu_read_data <= r_cpu_read_data_next;                
                r_cpu_write_result_valid <= r_cpu_write_result_valid_next;
                r_cpu_read_result_valid <= r_cpu_read_result_valid_next;
                
            end
    end


assign m_axis_buffer_addr = w_pifo_atom_element[0][BUFFER_ADDR_WIDTH-1:0];
assign m_axis_buffer_addr_valid = w_pifo_atom_element[0][ROOT_PIFO_INFO_VALID_POS];
assign m_axis_bypass_en = w_pifo_atom_compare_result[0];
assign w_ctl_insert = s_axis_insert_en;
assign w_ctl_pop = s_axis_pop_en;

assign cpu_rd_result_valid = r_cpu_read_result_valid;
assign cpu_rd_result = r_cpu_read_data;
assign cpu_wr_result_valid = r_cpu_write_result_valid;
assign m_axis_calendar_full = (r_pifo_element_count == PIFO_CALENDAR_SIZE) ? 1 : 0;
endmodule