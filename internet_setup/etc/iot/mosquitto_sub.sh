#!/bin/sh
p="mqttPipeiPad"
([ ! -p "$p" ]) && mkfifo $p
(mosquitto_sub -q 1 -d -t ha/internet/ipad >$p 2>/dev/null) &
PID=$!

trap 'kill $PID' HUP INT TERM QUIT KILL

while read line <$p
do
   echo $line > /tmp/cmds/ipad
      TASK=`cat /tmp/cmds/ipad`
      #echo $TASK
      if [ "$TASK" == "off" ]; then
         /etc/iot/disable_ipad.sh
      elif [ "$TASK" == "on" ]; then
         /etc/iot/enable_ipad.sh
      fi
      #echo "Event: " $line
done

