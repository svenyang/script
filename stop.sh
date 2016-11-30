#!/bin/sh
dir=`dirname $0`
app=`ls -F "$dir"|grep -v "\."|grep "\*$"|sed "s/\*$//g"|sed "s/.*\///g"`
if [ -z "$app" ]
then
	echo "No App To Stop!"
	exit
fi

#echo "Stop ffmpeg"
#ps -ef | grep ffmpeg | awk '{print $2}' | xargs kill -9
#echo "After stop ffmpeg"

echo "Stop $app"
echo "Before Stop"
pidof "$app"
ps ax|grep " $app$"|grep "guard.sh"|grep -v grep
ps ax|grep " $app$"|grep "guard.sh"|grep -v grep|awk '{printf("kill -9 %s", $1)}'|bash
pidof "$app"|awk '{printf("kill -9 %s", $1)}'|bash
echo "Wait Stop..."
p=`pidof "$app"`
while [ "$p" ]
do
	sleep 1
	p=`pidof "$app"`
done
echo "After Stop"
pidof "$app"
ps ax|grep " $app$"|grep "guard.sh"|grep -v grep
