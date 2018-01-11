#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from kinect_data.msg import skeleton

def callback(data):
	rospy.loginfo(rospy.get_caller_id() + "I heard %s", data.data)

def listener():
	rospy.init_node('listener', anonymous=True)
	rospy.Subscriber("skeleton_data", String, callback)
	rospy.spin()

if __name__ == '__main__'
	listener()

