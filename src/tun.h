/* 
 * File:   tun.h
 * Author: Ahmed Youssef
 *
 * Created on March 4, 2015, 8:50 PM
 */

#ifndef TUN_H
#define	TUN_H

#include "vpl.h"
#include "grouter.h"

void *toTunDev(void *arg);
void* fromTunDev(void *arg);
vpl_data_t *tun_connect(short int src_port, uchar* src_IP,
                        short int dst_port, uchar* dst_IP);


#endif	/* TUN_H */

