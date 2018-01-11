def module(commands):
	import rospy
	import baxter_interface
	rospy.init_node('Joints')
	limb = baxter_interface.Limb('right')
	rate = rospy.Rate(10000)
	angles = limb.joint_angles()
	length = len(commands)
	limb.move_to_joint_positions(commands[0])
	rate.sleep()
	for i in range(0,length,1):
		for x in range(0,400,1):
			limb.set_joint_positions(commands[i])





