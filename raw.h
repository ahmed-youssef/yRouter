/* 
 * File:   raw.h
 * Author: Ahmed Youssef
 *
 * Created on April 9, 2015, 6:52 PM
 */

#ifndef RAW_H
#define	RAW_H

#include "vpl.h"

void* toRawDev(void *arg);
void* fromRawDev(void *arg);
vpl_data_t* raw_connect(char* interface, unsigned char* mac_addr);
int create_raw_interface(unsigned char *nw_addr);

#endif	/* RAW_H */

