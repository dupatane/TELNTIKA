#Monitor process particular process on an instance, send an email on incase of state change like process got stopped, taking more CPU that threshold

#!/bin/bash

ser="tomcat"
cpu_thr="0.9"
ps aux > temp1
        sed -i '1d' temp1 
        while read line
        do
        ps_u=`echo $line | cut -d " " -f1`
        ps_id=`echo $line | cut -d " " -f2`
        cpu=`echo $line | cut -d " " -f3`
        cpu_round=$(printf "%.0f" $(echo "$cpu * 10" | bc -l))
        if [ "$ps_u" = "$ser" ] && [ $cpu_round -le 700 ]; then
        echo "process_id = $ps_id"
        echo "cpu utilization is optimum value = $cpu "
        else
        echo "cpu is overloaded value = $cpu " | mail -s "CPU overloaded for service_name: $ser process_id : $ps_id and cpu_utilization in % $cpu " dupatanekrishna@gmail.com
        fi
        done < temp1 

for i in $ser
do
    systemctl is-active --quiet $i
    if [ $? -ne 0 ]; then
        sudo systemctl start $i
        echo $i >> temp
    fi
done
mail -s "Service Stopped $ser " dupatanekrishna@gmail.com < temp
