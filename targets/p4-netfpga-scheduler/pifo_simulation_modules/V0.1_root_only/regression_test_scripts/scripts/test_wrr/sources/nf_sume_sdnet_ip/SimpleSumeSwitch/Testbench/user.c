#include <stdint.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

# include "CAM.h"

# include "svdpi.h"
# include "dpi.h"

// ******************************************************

// global context vars
CAM_CONTEXT CAM_CONTEXT_table_strict_priority_context;
CAM_CONTEXT CAM_CONTEXT_table_switch_mode_context;
CAM_CONTEXT CAM_CONTEXT_table_rank_calc_mode_context;
CAM_CONTEXT CAM_CONTEXT_table_l2_switch_context;
CAM_CONTEXT CAM_CONTEXT_table_l1_switch_context;
CAM_CONTEXT CAM_CONTEXT_table_wrr_class_lookup_context;
uint32_t log_level=0;

// enumeration
  #define TABLE_table_strict_priority 0
 #define TABLE_table_switch_mode 1
 #define TABLE_table_rank_calc_mode 2
 #define TABLE_table_l2_switch 3
 #define TABLE_table_l1_switch 4
 #define TABLE_table_wrr_class_lookup 5

// user-level wrapper functions for SV
// NOTE: needed to provide an function pointer for context
// NOTE: and link to SV function by name

// register write control
void            
register_write_control(uint32_t Addr, uint32_t Data) {
//   printf("[SW] register_write_control(%08x, %08x) - start\n", Addr, Data);
    s_vpi_vecval sv_addr;
    sv_addr.aval = Addr;
    sv_addr.bval = 0;
    
    s_vpi_vecval sv_data;
    sv_data.aval = Data;
    sv_data.bval = 0;
    
    SV_write_control(&sv_addr, &sv_data);
//    printf("[SW] register_write_control(%08x, %08x) - done\n", Addr, Data);
}

// register read control
uint32_t       
register_read_control(uint32_t Addr) {
//    printf("[SW] register_read_control(%08x) - start\n", Addr);
    s_vpi_vecval sv_addr;
    sv_addr.aval = Addr;
    sv_addr.bval = 0;
    
    s_vpi_vecval sv_data;
    
    SV_read_control(&sv_addr, &sv_data);
//    printf("[SW] register_read_control(%08x) = %08x - done\n", Addr, sv_data.aval);
    
    return sv_data.aval;
}

//log message
int log_msg(const char * msg)
{
	printf(msg);
	return 0;
}

// ******************************************************
    //CAM user-level functions creating an interface to SV

int
CAM_GetAddrSize() {
    uint32_t addr_size;
    printf("[SW] CAM_GetAddrSize() - start\n");
    addr_size = CAM_Init_GetAddrSize();
    printf("[SW] CAM_GetAddrSize() - done\n");
    return (int)addr_size;
}

void
CAM_Init(int tableID, int clk_period,int k, int v, int depth, int aging) {
	CAM_CONTEXT * cx; 
	void( * register_write)(uint32_t addr, uint32_t data); 
	uint32_t( * register_read)(uint32_t addr);
	int baseAddr = 0;
	switch (tableID) {
	case 0:
		cx = &CAM_CONTEXT_table_strict_priority_context;
		register_read  = &register_read_control;
		register_write = &register_write_control;
		baseAddr = 0;
		break;
	case 1:
		cx = &CAM_CONTEXT_table_switch_mode_context;
		register_read  = &register_read_control;
		register_write = &register_write_control;
		baseAddr = 256;
		break;
	case 2:
		cx = &CAM_CONTEXT_table_rank_calc_mode_context;
		register_read  = &register_read_control;
		register_write = &register_write_control;
		baseAddr = 512;
		break;
	case 3:
		cx = &CAM_CONTEXT_table_l2_switch_context;
		register_read  = &register_read_control;
		register_write = &register_write_control;
		baseAddr = 768;
		break;
	case 4:
		cx = &CAM_CONTEXT_table_l1_switch_context;
		register_read  = &register_read_control;
		register_write = &register_write_control;
		baseAddr = 1024;
		break;
	case 5:
		cx = &CAM_CONTEXT_table_wrr_class_lookup_context;
		register_read  = &register_read_control;
		register_write = &register_write_control;
		baseAddr = 1280;
		break;
	}

    printf("[SW] CAM_Init() - start\n");

    if(CAM_Init_ValidateContext(cx,baseAddr,256,depth,k,clk_period,v,aging,register_write, register_read, &log_msg, log_level))
    {
    	printf("[SW] CAM_Init() - failed\n");
    }
    else
    {
    	printf("[SW] CAM_Init() - done\n");
    }
}

int
CAM_GetSize(int tableID, int* size_out) {
	CAM_CONTEXT * cx; 
	switch (tableID) {
	case 0:
		cx = &CAM_CONTEXT_table_strict_priority_context;
		break;
	case 1:
		cx = &CAM_CONTEXT_table_switch_mode_context;
		break;
	case 2:
		cx = &CAM_CONTEXT_table_rank_calc_mode_context;
		break;
	case 3:
		cx = &CAM_CONTEXT_table_l2_switch_context;
		break;
	case 4:
		cx = &CAM_CONTEXT_table_l1_switch_context;
		break;
	case 5:
		cx = &CAM_CONTEXT_table_wrr_class_lookup_context;
		break;
	}

    uint32_t size;
    printf("[SW] CAM_GetSize() - start\n");
    size =  CAM_Mgt_GetSize(cx);
    *size_out = size;
    printf("[SW] CAM_GetSize() - done\n");
    return 0;
}


int
CAM_SetLogLevel(int tableID, int msg_level) {
	CAM_CONTEXT * cx; 
	switch (tableID) {
	case 0:
		cx = &CAM_CONTEXT_table_strict_priority_context;
		break;
	case 1:
		cx = &CAM_CONTEXT_table_switch_mode_context;
		break;
	case 2:
		cx = &CAM_CONTEXT_table_rank_calc_mode_context;
		break;
	case 3:
		cx = &CAM_CONTEXT_table_l2_switch_context;
		break;
	case 4:
		cx = &CAM_CONTEXT_table_l1_switch_context;
		break;
	case 5:
		cx = &CAM_CONTEXT_table_wrr_class_lookup_context;
		break;
	}

    int error_code=0;
    printf("[SW] CAM_SetLogLevel() - start\n");
    error_code = CAM_Init_SetLogLevel(cx,msg_level);
    printf("[SW] CAM_SetLogLevel() - done\n");
    return error_code;
}

int
CAM_EnableDevice(int tableID) {
	CAM_CONTEXT * cx; 
	switch (tableID) {
	case 0:
		cx = &CAM_CONTEXT_table_strict_priority_context;
		break;
	case 1:
		cx = &CAM_CONTEXT_table_switch_mode_context;
		break;
	case 2:
		cx = &CAM_CONTEXT_table_rank_calc_mode_context;
		break;
	case 3:
		cx = &CAM_CONTEXT_table_l2_switch_context;
		break;
	case 4:
		cx = &CAM_CONTEXT_table_l1_switch_context;
		break;
	case 5:
		cx = &CAM_CONTEXT_table_wrr_class_lookup_context;
		break;
	}

    int error_code=0;
    printf("[SW] CAM_EnableDevice() - start\n");
    error_code = CAM_Init_Activate(cx);
    printf("[SW] CAM_EnableDevice() - done\n");
    return error_code;
}


int
CAM_WriteEntry(int tableID, const char* key, const char* value, int static_flag) {
	CAM_CONTEXT * cx; 
	switch (tableID) {
	case 0:
		cx = &CAM_CONTEXT_table_strict_priority_context;
		break;
	case 1:
		cx = &CAM_CONTEXT_table_switch_mode_context;
		break;
	case 2:
		cx = &CAM_CONTEXT_table_rank_calc_mode_context;
		break;
	case 3:
		cx = &CAM_CONTEXT_table_l2_switch_context;
		break;
	case 4:
		cx = &CAM_CONTEXT_table_l1_switch_context;
		break;
	case 5:
		cx = &CAM_CONTEXT_table_wrr_class_lookup_context;
		break;
	}

    int error_code=0;
    bool stat_flag = (bool)static_flag;
    printf("[SW] CAM_WriteEntry() - start\n");
    error_code = CAM_Mgt_InsertEntry(cx, key, value, stat_flag);
    printf("[SW] CAM_WriteEntry() - done\n");
	return error_code;
}

int
CAM_EraseEntry (int tableID, const char* key) {
	CAM_CONTEXT * cx; 
	switch (tableID) {
	case 0:
		cx = &CAM_CONTEXT_table_strict_priority_context;
		break;
	case 1:
		cx = &CAM_CONTEXT_table_switch_mode_context;
		break;
	case 2:
		cx = &CAM_CONTEXT_table_rank_calc_mode_context;
		break;
	case 3:
		cx = &CAM_CONTEXT_table_l2_switch_context;
		break;
	case 4:
		cx = &CAM_CONTEXT_table_l1_switch_context;
		break;
	case 5:
		cx = &CAM_CONTEXT_table_wrr_class_lookup_context;
		break;
	}

    int error_code=0;
    printf("[SW] CAM_EraseEntry() - start\n");
    error_code = CAM_Mgt_RemoveEntry(cx, key);
    printf("[SW] CAM_EraseEntry() - done\n");
    return error_code;
}



char value[1024];
bool found = false;

const char* returnValue() {
  return value;
}

int returnFound() {
  return (found)?1:0;
}

int
CAM_ReadEntry(int tableID, const char* key) {
	CAM_CONTEXT * cx; 
	switch (tableID) {
	case 0:
		cx = &CAM_CONTEXT_table_strict_priority_context;
		break;
	case 1:
		cx = &CAM_CONTEXT_table_switch_mode_context;
		break;
	case 2:
		cx = &CAM_CONTEXT_table_rank_calc_mode_context;
		break;
	case 3:
		cx = &CAM_CONTEXT_table_l2_switch_context;
		break;
	case 4:
		cx = &CAM_CONTEXT_table_l1_switch_context;
		break;
	case 5:
		cx = &CAM_CONTEXT_table_wrr_class_lookup_context;
		break;
	}

    printf("[SW] CAM_ReadEntry() - start\n");
    bool static_flag = 0; 
    int no_of_value_regs = (cx->value_width%32 == 0) ? (cx->value_width/32) : ((cx->value_width/32)+1);
    uint32_t value_arr[no_of_value_regs];

    int result = CAM_Mgt_ReadEntry(cx, key, value_arr, &static_flag, &found);

    char localvalue[1024];
    int i=no_of_value_regs-1;
    sprintf(localvalue, "%04x", value_arr[i--]);
    for (; i>=0; i--) {
      sprintf(localvalue+strlen(localvalue), "%04x", value_arr[i]);
    }

    printf("[SW] CAM_ReadEntry() - done\n");

    value[sizeof(value)-1]='\0';
    strncpy(value, localvalue, sizeof(value-1));
    return result;}



