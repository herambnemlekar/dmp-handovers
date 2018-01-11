import rospy
from std_msgs.msg import String
import baxter_interface
limb = 0
a = []
def baxter_movement(data):
    #rate = rospy.Rate(10000)
    commands = data.data
    global a
    #print("received commands = ",data.data)
    commands = commands.split(',')
    Y = [float(i) for i in commands]
    Y_command = {'right_s0': Y[0], 'right_s1': Y[1], 'right_e0': Y[2], 'right_e1': Y[3], 'right_w0': Y[4], 'right_w1': Y[5], 'right_w2': Y[6]}
    a.append(Y_command)
    for i in range(200):
        limb.set_joint_positions(Y_command)
    #if len(a)>2:
    #    run_last_two(a)
    '''a=a+1
    if a>5:
        for i in range(0,5):
            limb.set_joint_positions(Y_command)
        a = 0'''
    #limb.set_joint_positions(Y_command)
       
def listener():
    global limb
    rospy.init_node('listener', anonymous=True)
    limb = baxter_interface.Limb('right')
    #t = rospy.Time(100)
    angles = limb.joint_angles()
    initial_position = {'right_s0': 0.2666, 'right_s1': 0.3342, 'right_w0': 0.1273, 'right_w1': -0.26419999999999999, 'right_w2': 0.028400000000000002, 'right_e0': 0.1079, 'right_e1': 0.96830000000000005}
    limb.move_to_joint_positions(initial_position)
    #t.sleep() [use if required]
    rospy.Subscriber("commands", String, baxter_movement)
    rospy.spin()

def run_last_two(a):
    global limb
    for x in a[-2:]:
        limb.set_joint_positions(x)
   
if __name__ == '__main__':
    listener()
