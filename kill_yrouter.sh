#!/bin/sh

yrouter_path=/root
PID="$(cat $yrouter_path/test$1.pid)"
echo "Killing yrouter with PID $PID"
kill $PID
#del_iface t$1
rm $yrouter_path/test$1.*
