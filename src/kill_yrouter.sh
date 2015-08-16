#!/bin/sh

# Author: Ahmed Youssef
# Date: April 2015
# This script is used by the WGINI server to kill the yRouter
# and delete the misc files that it creates.

yrouter_path=/root
PID="$(cat $yrouter_path/test$1.pid)"
echo "Killing yrouter with PID $PID"
kill $PID
#if raw interface present 
#	del_iface t$1
#	restart_net
rm $yrouter_path/test$1.*
