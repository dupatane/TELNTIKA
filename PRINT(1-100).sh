#Write a short program that prints each number from 1 to 100 on a new line#

#!/bin/bash
i=1
while [ $i -le 100 ]; do
echo "$i "
i=`expr $i + 1`
done
