#!/usr/bin/env python

import websocket
import thread
import time

import rospy

from std_msgs.msg import String
from kinect_data.msg import skeleton, joint


def on_message(ws, message, num=[0,0,0,0], r=skeleton()):
	words = message[1:-1].split(",")
	if words[0][1:-1] != "/NI_mate_sync":
		words[1] = float(words[1])
		words[2] = float(words[2])
		words[3] = float(words[3])
	
	pub = rospy.Publisher('skeleton_data', skeleton, queue_size=10)
	if words[0][1:-1] == "/NI_mate_sync":
		num =  [0, 0, 0, 0]
		r = skeleton()
		
	elif words[0][1:-1] == "Right_Shoulder":
		r.joints[0].joint_name = words[0][1:-1]
		r.joints[0].x = words[1]
		r.joints[0].y = words[2]
		r.joints[0].z = words[3]
		r.joints[0].stamp = rospy.get_time()
		num[0] = 1
	elif words[0][1:-1] == "Left_Shoulder":
		r.joints[1].joint_name = words[0][1:-1]
		r.joints[1].x = words[1]
		r.joints[1].y = words[2]
		r.joints[1].z = words[3]
		r.joints[1].stamp = rospy.get_time()
		num[1] =  1
	elif words[0][1:-1] == "Right_Hand":
		r.joints[2].joint_name = words[0][1:-1]
		r.joints[2].x = words[1]
		r.joints[2].y = words[2]
		r.joints[2].z = words[3]
		r.joints[2].stamp = rospy.get_time()
		num[2] = 1
	elif words[0][1:-1] == "Left_Hand":
		r.joints[3].joint_name = words[0][1:-1]
		r.joints[3].x = words[1]
		r.joints[3].y = words[2]
		r.joints[3].z = words[3]
		r.joints[3].stamp = rospy.get_time()
		num[3] = 1
		
		if sum(num) == 4:
			# Write the correct publish data
			print("Publishing...")
			rospy.loginfo(r)
			pub.publish(r)
			#rospy.loginfo(r)
	#print(num)


def on_error(ws, error):
	print(error)

def on_close(ws):
	print("Closed connection!")

def on_open(ws):
	ws.readyState = 1
	print("opened connection")


if __name__ == '__main__':

	rospy.init_node('kinect_data', anonymous=True)	
	try:	
		websocket.enableTrace(True)
		ws = websocket.WebSocketApp("ws://130.215.206.204:3000", on_message=on_message, on_error=on_error, on_close=on_close)
		ws.on_open = on_open
		ws.run_forever()
		
	except KeyboardInterrupt:
		ws.close()
