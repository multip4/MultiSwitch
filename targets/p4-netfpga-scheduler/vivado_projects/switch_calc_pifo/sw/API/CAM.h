//----------------------------------------------------------------------------
//   This file is owned and controlled by Xilinx and must be used solely    //
//   for design, simulation, implementation and creation of design files    //
//   limited to Xilinx devices or technologies. Use with non-Xilinx         //
//   devices or technologies is expressly prohibited and immediately        //
//   terminates your license.                                               //
//                                                                          //
//   XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY   //
//   FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY   //
//   PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE            //
//   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS     //
//   MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY     //
//   CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY      //
//   RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY      //
//   DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE  //
//   IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR         //
//   REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF        //
//   INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A  //
//   PARTICULAR PURPOSE.                                                    //
//                                                                          //
//   Xilinx products are not intended for use in life support appliances,   //
//   devices, or systems.  Use in such applications are expressly           //
//   prohibited.                                                            //
//                                                                          //
//   (c) Copyright 1995-2016 Xilinx, Inc.                                   //
//   All rights reserved.                                                   //
//----------------------------------------------------------------------------
//----------------------------------------------------------------------------
#ifndef CAM_H
#define CAM_H

#include <stdint.h>
#include "CAM_INST0.h"

#ifdef MICROBLAZE
    typedef unsigned int addr_t;
#else
    typedef unsigned long long addr_t;
#endif
typedef enum { false, true } bool;

/************************** Constant Definitions *****************************/
#define CAM_MAX_KEY_WIDTH      320 
#define CAM_MAX_VALUE_WIDTH    256 
#define CAM_NO_OF_KEY_REGS     (CAM_MAX_KEY_WIDTH/32) 
#define CAM_NO_OF_VALUE_REGS   (CAM_MAX_VALUE_WIDTH/32)    
#define CAM_ADDR_SIZE      256

enum CAM_OP
{
nop,
ins,
del,
lkp
}cam_op_type;


typedef enum AgingMode {
AGING_MODE_DISABLED,
AGING_MODE_AUTO
} CAM_AGING_MODE;


#define INIT_EN_OFFSET              0
#define INIT_EN_MASK                0x00000001
#define INIT_DONE_OFFSET            8
#define INIT_DONE_MASK              0x00000100
#define AGING_CNTL_MODE_OFFSET      0
#define AGING_CNTL_MODE_MASK        0x00000001
#define AGING_CNTL_CAPABLE_OFFSET   8
#define AGING_CNTL_CAPABLE_MASK     0x00000100
#define CAM_UPDATE_REQ_OP_OFFSET        0
#define CAM_UPDATE_REQ_OP_MASK          0x00000003
#define CAM_UPDATE_REQ_STATIC_OFFSET    8
#define CAM_UPDATE_REQ_STATIC_MASK      0x00000100
#define CAM_UPDATE_ACK_OFFSET           0
#define CAM_UPDATE_ACK_MASK             0x00000001
#define CAM_UPDATE_ACK_CODE_OFFSET      1
#define CAM_UPDATE_ACK_CODE_MASK        0x00000002
/**
* Error Codes
*/

//success
#define CAM_SUCCESS                    0 
//failed
#define CAM_OP_FAILED                  1 
//register_write, register_read, or log_message function pointer is NULL
#define CAM_ERROR_INIT_NULL_FUNCPTR    2
//register reads to CAM instance did not return the expected data written via register writes
#define CAM_ERROR_INIT_READ_MISMATCH   3
//log_message did not return the expected number of arguments on output of init messages
#define CAM_ERROR_INIT_LOG             4
//Context pointer is NULL
#define CAM_ERROR_NULL_CONTEXT_PTR     5
//Context magic number mismatch
#define CAM_ERROR_INVALID_CONTEXT      6
//key string pointer is NULL
#define CAM_ERROR_KEY_NULL             7   
//mask string pointer is NULL
#define CAM_ERROR_MASK_NULL            8  
//value string pointer is NULL
#define CAM_ERROR_VALUE_NULL           9 
//invalid key string format
#define CAM_ERROR_KEY_FORMAT           10
//invalid mask string format
#define CAM_ERROR_MASK_FORMAT          11
//invalid value string format
#define CAM_ERROR_VALUE_FORMAT         12 
//Miscellaneous device access error
#define CAM_ERROR_ACC                  13
//the size argument is not less than CAM_ADDR_SIZE
#define CAM_ERROR_INIT_SIZE            14 


typedef struct CAM_DEVICE{
//device_id @ offset 0x00
uint32_t device_id;
//reserved0 @ offset 0x04 to 0x1F
uint32_t reserved0[7];
//init_control @ offset 0x20
uint32_t init_control;
//no_of_stored_entries @ offset 0x24
uint32_t no_of_stored_entries;
//reserved1 @ offset 0x28 to 0x2F
uint32_t reserved1[2];
//aging_contol @ offset 0x30
uint32_t aging_contol;
//aging_time @ offset 0x34
uint32_t aging_time;
//reserved2 @ offset 0x38 to 0x3F
uint32_t reserved2[2];
//update_req @ offset 0x40
uint32_t update_req;
//update_resp @ offset 0x44
uint32_t update_resp;
//update_found @ offset 0x48
uint32_t update_found;
//reserved3 @ offset 0x4C
uint32_t reserved3;
//key @ offset 0x50 to 0x77
uint32_t key[CAM_NO_OF_KEY_REGS];
//reserved4 @ offset 0x78 to 0x7F
uint32_t reserved4[2];
//mask @ offset 0x80 to 0x9F
uint32_t value[CAM_NO_OF_VALUE_REGS];
//reserved5 @ offset 0xA0 to 0xFF
uint32_t reserved5[24];
}CAM_DEVICE;


typedef struct CAM_CONTEXT{
uint32_t max_depth;
uint32_t key_width;
uint32_t value_width;
uint32_t aging_width;
uint32_t clock_period;
addr_t base;
void(*register_write)(addr_t addr, uint32_t data);
uint32_t(*register_read)(addr_t addr);
int(*log_message)(const char * format, ...);
uint32_t log_level;
}CAM_CONTEXT;

/************************** Function Prototypes ******************************/

uint32_t CAM_Init_GetAddrSize();

int CAM_Init_ValidateContext(
CAM_CONTEXT* cx,
addr_t base,
uint32_t size,
uint32_t max_depth,
uint32_t key_width,
uint32_t clock_period,
uint32_t value_width,
uint32_t aging_width,
void (*register_write)(addr_t addr, uint32_t data),
uint32_t(*register_read)(addr_t addr),
int(*log_message)(const char * format),
uint32_t log_level
);

int CAM_Init_SetLogLevel(CAM_CONTEXT* cx, uint32_t log_level);

int CAM_Init_Activate(CAM_CONTEXT* cx);

uint32_t CAM_Mgt_GetSize(CAM_CONTEXT* cx);

CAM_AGING_MODE CAM_Mgt_GetAgingMode(CAM_CONTEXT* cx);

int CAM_Mgt_SetAgingMode(CAM_CONTEXT* cx, CAM_AGING_MODE mode);

uint64_t CAM_Mgt_MinAgingTime(CAM_CONTEXT* cx);

uint64_t CAM_Mgt_MaxAgingTime(CAM_CONTEXT* cx);

int CAM_Mgt_GetAgingTime(CAM_CONTEXT* cx, uint64_t *cycles);

int CAM_Mgt_SetAgingTime(CAM_CONTEXT* cx, uint64_t cycles);

int CAM_Mgt_InsertEntry(CAM_CONTEXT* cx, const char* key, const char* value, bool static_flag);

int CAM_Mgt_RemoveEntry (CAM_CONTEXT* cx, const char* key);

int CAM_Mgt_ReadEntry(CAM_CONTEXT* cx, const char* key, uint32_t value[], bool* static_flag, bool* found);

const char* CAM_Error_Decode( int error);

#endif 

