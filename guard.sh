#!/bin/sh
dir=`dirname $0`
USER=www-data
if [ -z "$1" ]
then
	echo "Usage: guard.sh APPNAME [INTERVAL]"
	exit
fi
app="$1"
if [ "$2" ]
then
	interval="$2"
else
	interval='10'
fi

while true
do
	sleep "$interval"
	p=`pidof "$app"`
	if [ -z "$p" ]
	then
		echo "--------"
		date
		echo "Process $app not found"
		echo "Stop ffmpeg"
		ps -ef | grep ffmpeg | awk '{print $2}' | xargs kill -9
		echo "After stop ffmpeg"
		echo "Start $app"
		ulimit -c unlimited
		ulimit -n 655350
		`$dir/$app -c $dir/conf/rtmp.conf > /dev/null 2>&1` &
		sleep 1
		echo "After Start"
		pidof "$app"
		date
	fi
done
