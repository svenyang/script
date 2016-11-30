import subprocess
import re
import time
import pytz
from datetime import datetime
from influxdb import client as influxdb
client = influxdb.InfluxDBClient("", 8086, "", "", "")

last_hour = time.strftime("%H", time.localtime(time.time()))
#filename = '/data/release/srs/log/publish.log.' + time.strftime("%Y-%m-%d_%H00", time.localtime(time.time()))
#filename = '/home/sven/IMS_Ingester_SRS/trunk/log/publish.log.' + time.strftime("%Y-%m-%d_%H00", time.localtime(time.time()))
filename = '/data/release/srs/log/publish.log'
last_log_time = "2010-"
numLinesAdded = 0
pattern_type = re.compile(r'\[(?P<localtime>.*?)\](\s)source(\s)(?P<event_type>.*?)\|(\S*)')
pattern_publish = re.compile(r'req_ip=(?P<client_ip>.*?)\|client_id=(?P<client_id>.*?)\|stream_id=(?P<stream_id>.*?)\|kbps=(?P<kbps>.*?)\|kbps_30s=(?P<kbps_30s>.*?)\|kbps_5m=(?P<kbps_5m>.*?)\|height=(?P<height>.*?)\|width=(?P<width>[\d]*)')
pattern_connect = re.compile(r'req_ip=(?P<client_ip>.*?)\|client_id=(?P<client_id>.*?)\|req_streamid=(?P<stream_id>.*?)\|sourceid=(?P<sourceid>.*?)\|hascache=(?P<hascache>[\d]*)')
pattern_disconnect = re.compile(r'req_ip=(?P<client_ip>.*?)\|client_id=(?P<client_id>.*?)\|stream_id=(?P<stream_id>.*?)\|sourceid=(?P<sourceid>.*?)\|ret=(?P<ret>[\d]*)')

def get_tz(country_code):
	try:
		return pytz.timezone(pytz.country_timezones(country_code)[0])
	except:
		return pytz.timezone('Asia/Singapore')

def strptime_with_tz(dt_string, dt_format, country_code):
	dt = datetime.strptime(dt_string, dt_format)
	return get_tz(country_code).localize(dt)

def parseLine (s):
        ret = pattern_type.match(s)
        if not ret:
            return None
        event_type = ret.groupdict()['event_type']
#	timestamp = time.strptime(ret.groupdict()['localtime'], '%Y-%m-%d %H:%M:%S.%f')
#        timearray = time.strptime(ret.groupdict()['localtime'], '%Y-%m-%d %H:%M:%S.%f')
#        timestamp = int(time.mktime(timearray))
	timestamp = strptime_with_tz(ret.groupdict()['localtime'], '%Y-%m-%d %H:%M:%S.%f', 'sg')
        detail = ret.group(5)
        if event_type == "publishing":
            regex = pattern_publish.match(detail)
	    if not regex:
		return None
	    matched_event = regex.groupdict()
	    return timestamp, event_type, matched_event['client_ip'], int(matched_event['client_id']), \
	           matched_event['stream_id'], int(matched_event['kbps']), int(matched_event['kbps_30s']), \
                   int(matched_event['kbps_5m']), int(matched_event['height']), int(matched_event['width'])
        elif event_type == "connect":
            regex = pattern_connect.match(detail)
            if not regex:
                return None
            matched_event = regex.groupdict()
            return timestamp, event_type, matched_event['client_ip'], int(matched_event['client_id']), \
                    matched_event['stream_id'], 0, 0, \
                    0, 0, 0
        elif event_type == 'disconnected':
            regex = pattern_disconnect.match(detail)
            if not regex:
                return None
            matched_event = regex.groupdict()
            return timestamp, event_type, matched_event['client_ip'], int(matched_event['client_id']), \
                    matched_event['stream_id'], int(matched_event['ret']), 0, \
                    0, 0, 0

def writeToDB (s):
	out = parseLine(s);
	if out is None:
		return
	else:
		timestamp, event_type, client_ip, client_id, stream_id, kbps, kbps_30s, kbps_5m, height, width = out
	print out
	json_body = [
	    {
                "measurement": "publish",
                "tags": {
                    "type" : event_type,
                    "stream_id": stream_id,
                    },
                "time": timestamp,
                "fields": {
                    "client_ip" : client_ip,
                    "client_id" : client_id,
                    "kbps" : kbps,
                    "kbps_30s" : kbps_30s,
                    "kbps_5m" : kbps_5m,
                    "height" : height,
                    "width" : width
                    }
                }
	]
	client.write_points(json_body)
	global numLinesAdded
	numLinesAdded += 1

print filename
f = subprocess.Popen(['tail', '-F', filename], \
	stdout = subprocess.PIPE, stderr=subprocess.PIPE)
while True:
	line = f.stdout.readline()
       	writeToDB(line)
print "numLinesAdded: " + str(numLinesAdded)
	

