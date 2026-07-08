#!/bin/bash
FREE=$(free -m | grep Mem | awk '{print $4}')
if [ $FREE -lt 500 ]; then
 echo "$(date) WARN: свободно $FREE MB" >> ~/memory-alert.log
else
 echo "$(date) OK: свободно $FREE MB" >> ~/memory-alert.log
fi
