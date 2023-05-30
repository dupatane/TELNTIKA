#!/bin/bash
i=1
while [ $i -le 100 ]; do
if [ `expr $i % 3` -eq 0 ] && [ `expr $i % 5` -eq 0 ]; then
echo "AVAAMO"
elif [ `expr $i % 3` -eq 0 ]; then
echo "AVA"
elif [ `expr $i % 5` -eq 0 ]; then
echo "AMO"
else
echo "$i "
fi
i=`expr $i + 1`
done
