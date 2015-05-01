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
vpl_data_t* raw_connect(char* interface);


#endif	/* RAW_H */

