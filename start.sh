#!/bin/sh
dir=`dirname $0`
USER=www-data
app=`ls -F "$dir"|grep -v "\."|grep "\*$"|sed "s/\*$//g"|sed "s/.*\///g"`
if [ -z "$app" ]
then
        echo "No App To Start!"
        exit
fi
p=`pidof "$app"`
if [ "$p" ]
then
	echo "Already Running $app"
	echo "$p"
else
	echo "Stop ffmpeg"
	ps -ef | grep ffmpeg | awk '{print $2}' | xargs kill -9
	echo "After stop ffmpeg"
	echo "Start $app"
	ulimit -c unlimited
	ulimit -n 655350
	`$dir/$app -c $dir/conf/rtmp.conf > /dev/null 2>&1`
	error="$?"
	if [ "$error" -ne "0" ]
	then
		echo "[$error]Start $app Fail!!!"
		exit "$error"
	fi
	sleep 1
	echo "After Start"
	pidof "$app"
fi

p=`ps aux|grep " $app$"|grep "guard.sh"|grep -v grep`
if [ "$p" ]
then
	echo "Already Running $app Guard"
	echo "$p"
else
	echo "Start $app Guard"
	"$dir/guard.sh" "$app" >> "$dir/log/guard.log" &
	echo "After Start Guard"
	ps aux|grep " $app$"|grep "guard.sh"|grep -v grep
fi
