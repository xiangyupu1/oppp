#!/bin/sh
MonitorIP1=192.168.12.102
MonitorIP2=192.168.12.103
MonitorIP3=192.168.12.101
MonitorIP4=192.168.12.105
MonitorIP5=192.168.12.110
MonitorIP6=192.168.12.112
MonitorIP7=192.168.12.254
js=0
b=1
c=2
while true 
do 	
	k=0
	j=0
	while [ $j -ne 7 ]
	do
		j=`expr ${j} +  ${b}`
		na="MonitorIP${j}"
		m=`eval echo '$'$na`
		#echo "$j   na:$na  ip:$m"
		#echo $m
		if [ "$m" != "" ];then
			ping1=`ping -c 2 $m |grep time`
			#echo $ping1
 			if [ "$ping1" = "" ];then
				#echo "$m down "
				eval $na=""
				k=`expr ${k} +  ${b}`
			fi
		else
			k=`expr ${k} +  ${b}`			
		fi
		
	done
	logger -s "now , $k is down"
	if [ $k -eq 7 ]
	then
		#echo " everyone is down" 
		poweroff
	fi
	sleep 5s
done
