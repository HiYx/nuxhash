#!/bin/sh

echo "starting hash..."
pid=`ps -ef|grep "nuxhashd"| grep -v "grep"|awk '{print $2}'`

if [ "$pid" != "" ]
then
        echo "nuxhashd already run, stop it first"
        kill -9 ${pid}
fi
 
echo "starting now..."


nohup nuxhashd --show-mining > test.out 2>&1 &
 
#pid=`ps -ef|grep "python -u main.py"| grep -v "grep"|awk '{print $2}'`
pid=`ps -ef|grep "nuxhashd"| grep -v "grep"|awk '{print $2}'`
echo ${pid} > pid.out
echo "nuxhashd started at pid: "${pid}