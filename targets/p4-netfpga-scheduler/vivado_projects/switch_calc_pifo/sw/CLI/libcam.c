
/* AUTO GENERATED FILE!! DO NOT MODIFY!!
 *
 * Author: Stephen Ibanez
 *
 * This file is provides the implementation of some convenience functions
 * that can be used when working with SDNet generated CAM tables. 
 */

#include <err.h>
#include <fcntl.h>
#include <limits.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "CAM.h"
#include "sume_reg_if.h"

#define SUME_SDNET_BASE_ADDR          0x44020000

// global variables

uint32_t lookup_table_ID = 0;
CAM_CONTEXT CAM_CONTEXT_lookup_table;



/* Some helper functions for the API functions 
 * Note: uint_* helper functions are from SDNet 2016.4 CAM.c
 */

int uint_to_str(uint32_t val, char *out_buf, int radix);

int uint_array_to_hex_string( uint32_t *in_buf, char *out_buf, int in_arr_size);

int log_msg(const char* msg);

/*
Arguments   :   val - An unsigned integer value
                out_buf - A pointer to an array that can hold a string representation of the
                        hexadecimal value
return      :   int - length of the hexadecimal string
Description :   This function converts the input unsigned integer to its equivalent hexadecimal string
*/
int uint_to_str(uint32_t val, char *out_buf, int radix)
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

/*
Arguments   :   in_buf - A pointer to an unsigned integer array
                out_buf - A pointer to an array that can hold a null terminated C string representation of the
                          hexadecimal value
                in_arr_size - size of the input array
return      :   int - (An integer indicating success or an error code)
Description :   This function converts the unsigned integer array to null terminated hex string
*/
int uint_array_to_hex_string( uint32_t *in_buf, char *out_buf, int in_arr_size)
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
        len = uint_to_str(*in_buf, result_buf, 16);
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

uint32_t log_level=0;

//log message
int log_msg(const char* msg) {
    printf("%s", msg);
    return 0;
}


void init_lookup_table() {
    CAM_CONTEXT* cx = &CAM_CONTEXT_lookup_table;
    uint32_t size = CAM_Init_GetAddrSize();
    // TODO: set baseAddr to the base address of the table
    addr_t baseAddr = SUME_SDNET_BASE_ADDR + 0x000;
    uint32_t max_depth = 64;
    uint32_t key_width = 32;
    // TODO: not sure what to use for clk_period
    uint32_t clk_period = 6667;
    uint32_t value_width = 34;
    uint32_t aging_width = 0;
    void (*register_write)(addr_t addr, uint32_t data);
    uint32_t (*register_read)(addr_t addr);
    // cast the driver functions to the appropriate types
    register_write = (void (*)(addr_t addr, uint32_t data)) &sume_register_write;
    register_read = (uint32_t (*)(addr_t addr)) &sume_register_read;

    // Initialize the CAM_CONTEXT
    if(CAM_Init_ValidateContext(cx,baseAddr,size,max_depth,key_width,clk_period,value_width,aging_width,register_write,register_read, &log_msg, log_level)) {
        printf("CAM_Init_ValidateContext() - failed\n");
    } else {
        printf("CAM_Init_ValidateContext() - done\n");
    }

}


/*
 * Read an entry from a table
 */
int cam_read_entry(uint32_t tableID, char* key, char* value, char* found) {

    CAM_CONTEXT* cx = NULL;

    if (tableID == lookup_table_ID) {
        init_lookup_table();
        cx = &CAM_CONTEXT_lookup_table;
    }

    if (cx != NULL) {
        int num_val_regs = (cx->value_width%32 == 0) ? (cx->value_width/32) : ((cx->value_width/32)+1);
        uint32_t val_arr[num_val_regs];
        bool static_flag, found_bool;
        int rc = CAM_Mgt_ReadEntry(cx, key, val_arr, &static_flag, &found_bool);
        uint_array_to_hex_string( val_arr, value, num_val_regs );
        if (found_bool == true) {
            strcpy(found, "True");
        } else {
            strcpy(found, "False");
        }
        return rc;
    }
    else {
        return CAM_OP_FAILED;
    }
}

/*
 * Add and entry to a table
 */
int cam_add_entry(uint32_t tableID, const char* key, const char* value) {


    if (tableID == lookup_table_ID) {
        init_lookup_table();
        return CAM_Mgt_InsertEntry(&CAM_CONTEXT_lookup_table, key, value, 0);
    }

    else {
        return CAM_OP_FAILED;
    }
}

/*
 * Delete an entry from a table
 */
int cam_delete_entry(uint32_t tableID, const char* key) {


    if (tableID == lookup_table_ID) {
        init_lookup_table();
        return CAM_Mgt_RemoveEntry (&CAM_CONTEXT_lookup_table, key);
    }

    else {
        return CAM_OP_FAILED;
    }
}

/*
 * Get the current number of entries in the table
 */
uint32_t cam_get_size(uint32_t tableID) {
    

    if (tableID == lookup_table_ID) {
        init_lookup_table();
        return CAM_Mgt_GetSize(&CAM_CONTEXT_lookup_table);
    }

    else {
        return CAM_OP_FAILED;
    }
}


const char* cam_error_decode(int error) {
    return CAM_Error_Decode(error);
}

