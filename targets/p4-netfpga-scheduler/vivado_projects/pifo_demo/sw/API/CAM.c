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
/***************************** Include Files *********************************/
#include <stdio.h>
#include <string.h>
#include <math.h>
#include "CAM.h"


void cam_wait_for_update_ack(CAM_CONTEXT* cx);

int cam_convert_hex_string_to_uint_array(const char *in_buf, uint32_t *out_buf, int out_arr_size);

unsigned int cam_ChartoInt(char c);

int cam_convert_uint_array_to_hex_string( uint32_t *in_buf, char *out_buf, int in_arr_size);

int cam_uint_to_str(uint32_t val, char *out_buf, int radix);

/*
Arguments   :     None
return      :     uint32_t (an integer indicating the size of the memory space in bytes)
Description :     This function returns the CAM_ADDR_SIZE and can be called at runtime to dynamically
                  allocate or resize the configuration memory mapping of the CAM instance
*/
uint32_t CAM_Init_GetAddrSize()
{
    return CAM_ADDR_SIZE;
}

/*
Arguments   :   cx - A pointer to the CAM_CONTEXT structure to be initialized
                base - starting offset of the configuration memory address range assigned to this CAM instance
                size - size in bytes of the configuration memory address range assigned to this CAM instance
                max_depth - maximum number of entries that can be stored in the CAM
                key_width - width of the entry key in bits
                value_width - width of the entry value in bits
                aging_width- contains the width of the aging tag in bits if SMC is configured with aging functionality, zero otherwise.
                *register_write - pointer to the register write function.
                *register_read - pointer to the register read function.
                *log_message - pointer to the formatted output log function.
                log_level - verbosity level.
return      :   int (An integer indicating success or an error code)
Description :   This function creates the instance context data structure
*/
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
uint32_t (*register_read)(addr_t addr),
int(*log_message)(const char * format),
uint32_t log_level
)
{
    if(size >= CAM_ADDR_SIZE)
    {
        if(register_write != NULL && register_read != NULL && log_message != NULL)
        {
            cx->base = base;
            cx->max_depth = max_depth;
            cx->key_width = key_width;
            cx->value_width = value_width;
            cx->aging_width = aging_width;
            cx->log_level = log_level;
            cx->clock_period = clock_period;
            cx->register_write = register_write;
            cx->register_read = register_read;
            return CAM_SUCCESS;
        }
        else
        {
            return CAM_ERROR_INIT_NULL_FUNCPTR;
        }
    }
    else
    {
        return CAM_ERROR_INIT_SIZE;
    }
}

/*
Arguments   :     cx - A pointer to the CAM_CONTEXT structure to be updated
                  log_level - A new logging level
return      :     int (An integer indicating success or an error code)
Description :     This function updates the logging level in the device context data structure.
*/
int CAM_Init_SetLogLevel(CAM_CONTEXT* cx, uint32_t log_level)
{
    if(cx != NULL)
    {
        cx->log_level = log_level;
        return CAM_SUCCESS;
    }
    else
    {
        return CAM_ERROR_NULL_CONTEXT_PTR;
    }
}

/*
Arguments   :     cx - A pointer to the CAM_CONTEXT structure
return      :     int (An integer indicating success or an error code)
Description :     This function performs
 self-initialization, erasing and invalidating all stored rules
*/
int CAM_Init_Activate(CAM_CONTEXT* cx)
{
    uint32_t data=0;
    if(cx != NULL)
    {
        CAM_DEVICE * dev = (CAM_DEVICE *)cx->base;
        //set Init En to '1'
        data = ((1 << INIT_EN_OFFSET) & INIT_EN_MASK);
        cx->register_write((addr_t)&dev->init_control,data);
        //wait for init done
        while(((cx->register_read((addr_t)&dev->init_control) & INIT_DONE_MASK) >> INIT_DONE_OFFSET) != 1)
        {
            ;
        }
        //set Init En to '0'
        data = ((0 << INIT_EN_OFFSET) & INIT_EN_MASK);
        cx->register_write((addr_t)&dev->init_control,data);
        return CAM_SUCCESS;
    }
    else
    {
        return CAM_ERROR_NULL_CONTEXT_PTR;
    }
}


/*
Arguments   :     cx - A pointer to the CAM_CONTEXT structure
return      :     uint32_t (An integer containing the number of {key, value} entries currently stored in the device)
Description :     This function returns the number of entries currently present in the SMC
*/
uint32_t CAM_Mgt_GetSize(CAM_CONTEXT* cx)
{
    uint32_t size=0;
    CAM_DEVICE * dev = (CAM_DEVICE *)cx->base;

    size = cx->register_read((addr_t)&dev->no_of_stored_entries) ;
    return size;

}

/*
Arguments   :     cx - A pointer to the CAM_CONTEXT structure
return      :     CAM_AGING_MODE (An integer encoded according to the CAM_AGING_MODE type definition, which indicates whether aging is enabled or not)
Description :     This function returns the current Aging mode
*/
CAM_AGING_MODE CAM_Mgt_GetAgingMode(CAM_CONTEXT* cx)
{
    CAM_AGING_MODE aging_mode=0;
    CAM_DEVICE * dev = (CAM_DEVICE *)cx->base;

    aging_mode = ((cx->register_read((addr_t)&dev->aging_contol) >> AGING_CNTL_MODE_OFFSET) & AGING_CNTL_MODE_MASK) ;
    return aging_mode;
}

/*
Arguments   :     cx - A pointer to the CAM_CONTEXT structure
                  mode (An integer encoded according to the CAM_AGING_MODE type definition, which indicates whether aging is enabled or not)
return      :     int (An integer indicating success or an error code)
Description :     This function sets the current Aging mode
*/
int CAM_Mgt_SetAgingMode(CAM_CONTEXT* cx, CAM_AGING_MODE mode)
{
    uint32_t aging_mode = mode;
    uint32_t data;
    CAM_DEVICE * dev = (CAM_DEVICE *)cx->base;
    if(cx != NULL)
    {
        data = ((aging_mode << AGING_CNTL_MODE_OFFSET) & AGING_CNTL_MODE_MASK);
        cx->register_write((addr_t)&dev->aging_contol,data);
        return CAM_SUCCESS;
    }
    else
    {
        return CAM_ERROR_NULL_CONTEXT_PTR;
    }
}

/*
Arguments   :     cx - A pointer to the CAM_CONTEXT structure
return      :     uint64_t (Minimum supported aging time in microseconds)
Description :     This function returns the minimum valid value for the Aging Time setting
*/
uint64_t CAM_Mgt_MinAgingTime(CAM_CONTEXT* cx)
{
    uint64_t min_aging_time = 0;
    CAM_DEVICE * dev = (CAM_DEVICE *)cx->base;
    //Need to review this calculation
    min_aging_time = ((2*((1 << LOOPDETECT_BITS) + NO_OF_HASHES + AGING_MARGIN)*cx->max_depth*AGING_BITS*(uint64_t)cx->clock_period))/1000000;
    return min_aging_time;
}

/*
Arguments   :     cx - A pointer to the CAM_CONTEXT structure
return      :     uint64_t (Maximum supported aging time in microseconds)
Description :     This function returns the maximum valid value for the Aging Time setting
*/
uint64_t CAM_Mgt_MaxAgingTime(CAM_CONTEXT* cx)
{
    uint64_t max_aging_time = 0;
    uint64_t max_aging = (((uint64_t)1<<32)-1);
    CAM_DEVICE * dev = (CAM_DEVICE *)cx->base;
    double clock_period = (double)cx->clock_period/(double)1000;
    //Need to review this calculation
    max_aging_time = ((uint64_t)((2*((1 << LOOPDETECT_BITS) + NO_OF_HASHES + AGING_MARGIN)*cx->max_depth*AGING_BITS)*clock_period)*max_aging)/1000;
    return max_aging_time;
}

/*
Arguments   :     cx - A pointer to the CAM_CONTEXT structure
                  cycles - A pointer to the memory location to be loaded with the read aging time
return      :     int (An integer indicating success or an error code)
Description :     This function returns the current AgingTime setting rounded to the supported precision and expressed in microseconds.
*/
int CAM_Mgt_GetAgingTime(CAM_CONTEXT* cx, uint64_t *cycles)
{
    uint32_t data=0;
    uint64_t aging_time=0;
    CAM_DEVICE * dev = (CAM_DEVICE *)cx->base;
    double clock_period = (double)cx->clock_period/(double)1000;
    if(cx != NULL)
    {
        data = cx->register_read((addr_t)&dev->aging_time);
        aging_time = ((uint64_t)((2*((1 << LOOPDETECT_BITS) + NO_OF_HASHES + AGING_MARGIN)*cx->max_depth*AGING_BITS)*clock_period)*(uint64_t)data)/1000;
        *cycles = aging_time;
        return CAM_SUCCESS;
    }
    else
    {
        return CAM_ERROR_NULL_CONTEXT_PTR;
    }
}

/*
Arguments   :     cx - A pointer to the CAM_CONTEXT structure
                  cycles - the age of entries (time-to-live) in microseconds for deletion
return      :     int (An integer indicating success or an error code)
Description :     This function sets the current AgingTime setting rounded to the supported precision and expressed in microseconds.
*/
int CAM_Mgt_SetAgingTime(CAM_CONTEXT* cx, uint64_t cycles)
{
    uint32_t data=0;
    CAM_DEVICE * dev = (CAM_DEVICE *)cx->base;
    if(cx != NULL)
    {
        data = (uint32_t)round(cycles/((2*((1 << LOOPDETECT_BITS) + NO_OF_HASHES + AGING_MARGIN)*cx->max_depth*AGING_BITS*(uint64_t)cx->clock_period)/(double)1000000));
        cx->register_write((addr_t)&dev->aging_time,data);
        return CAM_SUCCESS;
    }
    else
    {
        return CAM_ERROR_NULL_CONTEXT_PTR;
    }
}

/*
Arguments   :   cx - A pointer to the CAM_CONTEXT structure
                key - A pointer to a null-terminated C string encoding the key in hexadecimal
                value - A pointer to a null-terminated C string encoding the value in hexadecimal
                static_flag - a boolean flag indicating that the entry will be exempt from aging when true
return      :   int (An integer indicating success or an error code)
Description :   This function inserts a new entry into the SMC
*/
int CAM_Mgt_InsertEntry(CAM_CONTEXT* cx, const char* key, const char* value, bool static_flag)
{
    uint32_t wr_data=0;
    uint32_t rd_data=0;
    int i =0;
    int no_of_key_regs = (cx->key_width%32 == 0) ? (cx->key_width/32) : ((cx->key_width/32)+1);
    int no_of_value_regs = (cx->value_width%32 == 0) ? (cx->value_width/32) : ((cx->value_width/32)+1);
    uint32_t key_arr[no_of_key_regs];
    uint32_t value_arr[no_of_value_regs];
    uint32_t *key_buf;
    uint32_t *value_buf;

    //Initialize arrays
    for(i=0;i<no_of_key_regs;i++)
    {
        key_arr[i]=0;
    }
    for(i=0;i<no_of_value_regs;i++)
    {
        value_arr[i]=0;
    }

    //  Assign the starting address
    key_buf = &key_arr[0];
    value_buf = &value_arr[0];
    CAM_DEVICE * dev = (CAM_DEVICE *)cx->base;
    if(cx != NULL && key != NULL && value != NULL)
    {
        if(cam_convert_hex_string_to_uint_array(key, key_buf, no_of_key_regs) != 0)
            return CAM_ERROR_KEY_FORMAT;
        if(cam_convert_hex_string_to_uint_array(value, value_buf, no_of_value_regs) != 0)
            return CAM_ERROR_VALUE_FORMAT;
        //write key registers
        for(i=0;i<no_of_key_regs;i++)
        {
            cx->register_write((addr_t)&dev->key[i],*key_buf);
            key_buf++;
        }
        //write value registers
        for(i=0;i<no_of_value_regs;i++)
        {
            cx->register_write((addr_t)&dev->value[i],*value_buf);
            value_buf++;
        }
        //wait for update ACK
        cam_wait_for_update_ack(cx);
        //update request
        cam_op_type = ins;
        wr_data = ((cam_op_type << CAM_UPDATE_REQ_OP_OFFSET) & CAM_UPDATE_REQ_OP_MASK) | ((static_flag << CAM_UPDATE_REQ_STATIC_OFFSET) & CAM_UPDATE_REQ_STATIC_MASK);
        cx->register_write((addr_t)&dev->update_req,wr_data);
        //wait for update ACK
        cam_wait_for_update_ack(cx);
        rd_data = (((cx->register_read((addr_t)&dev->update_resp)) & CAM_UPDATE_ACK_CODE_MASK) >> CAM_UPDATE_ACK_CODE_OFFSET);
        return rd_data;

    }
    else
    {
        if(cx == NULL)
            return CAM_ERROR_NULL_CONTEXT_PTR;
        else if(key == NULL)
            return CAM_ERROR_KEY_NULL;
        else
            return CAM_ERROR_VALUE_NULL;
    }
}

/*
Arguments   :     cx - A pointer to the CAM_CONTEXT structure
                  key - A pointer to a null-terminated C string encoding the key
return      :     int (An integer indicating success or an error code)
Description :     This function removes an entry from the SMC
*/
int CAM_Mgt_RemoveEntry (CAM_CONTEXT* cx, const char* key)
{
    uint32_t wr_data=0;
    uint32_t rd_data=0;
    int i =0;
    int no_of_key_regs = (cx->key_width%32 == 0) ? (cx->key_width/32) : ((cx->key_width/32)+1);
    uint32_t key_arr[no_of_key_regs];
    uint32_t *key_buf;

    //Initialize arrays
    for(i=0;i<no_of_key_regs;i++)
    {
        key_arr[i]=0;
    }
    //  Assign the starting address
    key_buf = &key_arr[0];
    CAM_DEVICE * dev = (CAM_DEVICE *)cx->base;
    if(cx != NULL)
    {
        if(cam_convert_hex_string_to_uint_array(key, key_buf, no_of_key_regs) != 0)
            return CAM_ERROR_KEY_FORMAT;
        //write key registers
        for(i=0;i<no_of_key_regs;i++)
        {
            cx->register_write((addr_t)&dev->key[i],*key_buf);
            key_buf++;
        }
        //wait for update ACK
        cam_wait_for_update_ack(cx);
        //update request
        cam_op_type = del;
        wr_data = ((cam_op_type << CAM_UPDATE_REQ_OP_OFFSET) & CAM_UPDATE_REQ_OP_MASK);
        cx->register_write((addr_t)&dev->update_req,wr_data);
        //wait for update ACK
        cam_wait_for_update_ack(cx);
        rd_data = (((cx->register_read((addr_t)&dev->update_resp)) & CAM_UPDATE_ACK_CODE_MASK) >> CAM_UPDATE_ACK_CODE_OFFSET);
        return rd_data;
    }
    else
    {
        return CAM_ERROR_NULL_CONTEXT_PTR;
    }
}

/*
Arguments   :   cx - A pointer to the CAM_CONTEXT structure
                key - A pointer to an array that can hold a null terminated C string representation of the
                      hexadecimal value of the key.
                value - A pointer to an array that can hold a null terminated C string representation for the
                        hexadecimal value of the value.Loaded by the API upon successful lookup.
                static_flag - A pointer to a boolean flag. Loaded by the API with the static flag associated with the key upon successful lookup.
return      :   int (An integer indicating success or an error code)
Description :   This function performs a lookup for an entry
*/
int CAM_Mgt_ReadEntry(CAM_CONTEXT* cx, const char* key, uint32_t value_arr[], bool* static_flag, bool* found)
{
    uint32_t wr_data=0;
    uint32_t rd_data=0;
    int i = 0;
    int no_of_key_regs = (cx->key_width%32 == 0) ? (cx->key_width/32) : ((cx->key_width/32)+1);
    int no_of_value_regs = (cx->value_width%32 == 0) ? (cx->value_width/32) : ((cx->value_width/32)+1);
    uint32_t key_arr[no_of_key_regs];
    //uint32_t value_arr[no_of_value_regs];
    uint32_t *key_buf;
    uint32_t *value_buf;
    uint32_t value_arr_exp[no_of_value_regs];
    uint32_t *value_buf_exp;  

    //Initialize arrays
    for(i=0;i<no_of_key_regs;i++)
    {
        key_arr[i]=0;
    }
    for(i=0;i<no_of_value_regs;i++)
    {
        value_arr[i]=0;
    }
    //  Assign the starting address
    key_buf = &key_arr[0];
    value_buf = &value_arr[0];
    CAM_DEVICE * dev = (CAM_DEVICE *)cx->base;
    if(cx != NULL)
    {
        if(cam_convert_hex_string_to_uint_array(key, key_buf, no_of_key_regs) != 0)
            return CAM_ERROR_KEY_FORMAT;
        //write key registers
        for(i=0;i<no_of_key_regs;i++)
        {
            cx->register_write((addr_t)&dev->key[i],*key_buf);
            key_buf++;
        }
        //wait for update ACK
        cam_wait_for_update_ack(cx);
        //read request
        cam_op_type = lkp;
        wr_data = ((cam_op_type << CAM_UPDATE_REQ_OP_OFFSET) & CAM_UPDATE_REQ_OP_MASK);
        cx->register_write((addr_t)&dev->update_req,wr_data);
        //wait for update ACK
        cam_wait_for_update_ack(cx);
        rd_data = (((cx->register_read((addr_t)&dev->update_resp)) & CAM_UPDATE_ACK_CODE_MASK) >> CAM_UPDATE_ACK_CODE_OFFSET);
        if(rd_data == 0)
        {
            //read value registers
            for(i=0;i<no_of_value_regs;i++)
            {
                *value_buf = cx->register_read((addr_t)&dev->value[i]);
                value_buf++;
            }
            //  Assign the starting address
            *found = cx->register_read((addr_t)&dev->update_found);
	
        return CAM_SUCCESS;        }
        return rd_data;
    }
    else
    {
        return CAM_ERROR_NULL_CONTEXT_PTR;
    }
}

/*
Arguments   :     error - A non-zero error code returned by the CAM API function
return      :     char* - null-terminated string pointer containing a short description of the error code
Description :     This function provides the runtime description of each error code
*/
const char* CAM_Error_Decode( int error)
{
    switch(error)
    {
        case CAM_SUCCESS :
            return "success";
        case CAM_ERROR_INIT_SIZE :
            return "the size argument is not less than CAM_ADDR_SIZE";
        case CAM_ERROR_INIT_NULL_FUNCPTR :
            return "register_write, register_read or log_message function pointer is NULL";
        case CAM_ERROR_INIT_READ_MISMATCH :
            return "register reads to CAM instance did not return the expected data written via register writes";
        case CAM_ERROR_INIT_LOG :
            return "log_message did not return the expected number of arguments on output of init messages";
        case CAM_ERROR_NULL_CONTEXT_PTR :
            return "Context pointer is NULL";
        case CAM_ERROR_INVALID_CONTEXT :
            return "Context magic number mismatch";
        case CAM_ERROR_KEY_NULL :
            return "key string pointer is NULL";
        case CAM_ERROR_VALUE_NULL :
            return "value string pointer is NULL";
        case CAM_ERROR_KEY_FORMAT :
            return "invalid key string format";
        case CAM_ERROR_VALUE_FORMAT :
            return "invalid value string format";
        default :
            return "Miscellaneous device access error";
    }
}

/*
Arguments   :     cx - A pointer to the CAM_CONTEXT structure
return      :     void
Description :     This function waits for update ack to be set
*/
void cam_wait_for_update_ack(CAM_CONTEXT* cx)
{
    CAM_DEVICE * dev = (CAM_DEVICE *)cx->base;
    while(((cx->register_read((addr_t)&dev->update_resp) & CAM_UPDATE_ACK_MASK) >> CAM_UPDATE_ACK_OFFSET) != 1)
    {
        ;
    }
}

/*
Arguments   :   in_buf - A pointer to an array that can hold a null terminated C string representation of the
                         hexadecimal value
                out_buf - A pointer to an unsigned integer array
                out_arr_size - size of the output array
return      :   int - (An integer indicating success or an error code)
Description :   This function converts the null terminated hex string to unsigned integer array
*/
int cam_convert_hex_string_to_uint_array(const char *in_buf, uint32_t *out_buf, int out_arr_size)
{
    int i = 0;
    int len=0;
    int num_of_chars=0;
    uint32_t result = 0;
    uint32_t *start_addr;
    len=strlen(in_buf);
    //  Assign the starting address
    start_addr = out_buf;
    if((len*4) > (out_arr_size*32))
        return -1;
    else
    {
        //initialize output buffer
        for(i=0;i<out_arr_size;i++)
        {
            *out_buf = 0;
            out_buf++;
        }
        //  Assign the starting address
        out_buf = start_addr;
        for(i=len-1;i>=0;i--)
        {
            if(cam_ChartoInt(in_buf[i]) != -1)
            {
                result = (result | (cam_ChartoInt(in_buf[i]) << (4*num_of_chars)));
                num_of_chars++;
                if(num_of_chars == 8 || i == 0)
                {
                    num_of_chars = 0;
                    *out_buf = result;
                    out_buf++;
                    result = 0;
                }
            }
            else
                return -2;
        }
        //  Assign the starting address
        out_buf = start_addr;
        return 0;
    }
}

/*
Arguments   :     c - A hexadecimal character input
return      :     unsigned int - An unsigned integer value of input hexadecimal character
Description :     This function converts the input hexadecimal character to its equivalent value
*/
unsigned int cam_ChartoInt(char c)
{
    if (c >= '0' && c <= '9')
        return (unsigned int)c - '0';
    else if (c >= 'A' && c <= 'F')
        return (unsigned int)10 + c - 'A';
    else if (c >= 'a' && c <= 'f')
        return (unsigned int)10 + c - 'a';
    else
        return (unsigned int)-1;
}

/*
Arguments   :   in_buf - A pointer to an unsigned integer array
                out_buf - A pointer to an array that can hold a null terminated C string representation of the
                          hexadecimal value
                in_arr_size - size of the input array
return      :   int - (An integer indicating success or an error code)
Description :   This function converts the unsigned integer array to null terminated hex string
*/
int cam_convert_uint_array_to_hex_string( uint32_t *in_buf, char *out_buf, int in_arr_size)
{
    int i = 0;
    int j = 0;
    uint32_t *result;
    int len=0;
    char result_str[16] = "";
    char *result_buf;
    //  Assign the starting address
    result = in_buf;
    result_buf = &result_str[0];
    in_buf = in_buf + in_arr_size - 1;
    for (i = 0; i < in_arr_size; i++)
    {
        len = cam_uint_to_str(*in_buf, result_buf, 16);
        in_buf--;
        for(j=0;j < 8-len;j++)
        {
            *out_buf = '0';
            out_buf++;
        }
        while(*result_buf)
        {
          *out_buf = *result_buf;
          result_buf++;
          out_buf++;
        }
        result_buf = &result_str[0];
    }
    *out_buf = '\0';

    //  Assign the starting address
    in_buf = result;
    return 0;
}

/*
Arguments   :   val - An unsigned integer value
                out_buf - A pointer to an array that can hold a string representation of the
                        hexadecimal value
return      :   int - length of the hexadecimal string
Description :   This function converts the input unsigned integer to its equivalent hexadecimal string
*/
int cam_uint_to_str(uint32_t val, char *out_buf, int radix)
{
    char tmp[16] = "";
    char *tp = tmp;
    int i;
    int len=0;
    while (val || tp == tmp)
    {
        i = val % radix;
        val /= radix;
        if (i < 10)
            *tp++ = i+'0';
        else
            *tp++ = i + 'a' - 10;
    }
    len = tp - tmp;
    while (tp > tmp)
        *out_buf++ = *--tp;

    return len;
}




