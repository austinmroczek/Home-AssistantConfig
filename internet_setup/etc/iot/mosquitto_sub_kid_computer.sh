#!/bin/sh
p="mqttPipeKidComputer"
([ ! -p "$p" ]) && mkfifo $p
(mosquitto_sub -q 1 -d -t ha/internet/kid_computer >$p 2>/dev/null) &
PID=$!

trap 'kill $PID' HUP INT TERM QUIT KILL

while read line <$p
do
   echo $line > /tmp/kid_computer
      TASK=`cat /tmp/kid_computer`
      #echo $TASK
      if [ "$TASK" == "OFF" ]; then
         /etc/iot/disable_kid_computer.sh
      elif [ "$TASK" == "ON" ]; then
         /etc/iot/enable_kid_computer.sh
      fi
      #echo "Event: " $line
done

