#!/usr/bin/env python

import rospy
from std_msgs.msg import String
from kinect_data.msg import skeleton, joint


def talker():
	pub = rospy.Publisher('skeleton_data', skeleton, queue_size=10)
	rospy.init_node('talker', anonymous=True)
	rate = rospy.Rate(10)
	while not rospy.is_shutdown():
		hello_str = "hello world %s" % rospy.get_time()
		r = skeleton()
		r.joints[0].joint_name = "Right_shoulder"
		r.joints[0].x = 0.1
		r.joints[0].y = 0.2
		r.joints[0].z = 0.3
		r.joints[0].stamp = rospy.get_time()

		
		r.joints[1].joint_name = "Left_hand"
		r.joints[1].x = 0.3
		r.joints[1].y = 0.4
		r.joints[1].z = 0.5
		r.joints[1].stamp = rospy.get_time()

				
		r.joints[2].joint_name = "Left_shoulder"
		r.joints[2].x = 0.6
		r.joints[2].y = 0.7
		r.joints[2].z = 0.8
		r.joints[2].stamp = rospy.get_time()
		
		
		r.joints[3].joint_name = "Right_hand"
		r.joints[3].x = 0.9
		r.joints[3].y = 0.11
		r.joints[3].z = 0.10
		r.joints[3].stamp = rospy.get_time()

		rospy.loginfo(r)
		pub.publish(r)
		rate.sleep()

if __name__ == '__main__':
	try:
		talker()
	except rospy.ROSInterruptException:
		pass
