# -*- coding: utf-8 -*-
"""
Created on Mon Oct 30 16:48:52 2017

@author: Onkar
"""
import numpy as np
import matplotlib.pyplot as plt
from train_dmp import train_dmp
from DMP_runner import DMP_runner
#from simple_trajectories import y_cubed_trajectory
#from simple_trajectories import y_lin_trajectory
import simple_trajectories


#from DMP_test import runner

#Name of the file
name = 'test.xml'

#Set no. of basis functions
n_rfs = 200

#Set the time-step
dt = 0.001


##### TRAJECTORY  FOR TRAINING ########
""" Available trajectories: 
    Linear = simple_trajectories.y_lin_trajectory(dt)
    Exponential = simple_trajectories.y_exp_trajectory(dt)
    Step = simple_trajectories.y_step_trajectory(dt)
    Baxter_s0 = simple_trajectories.bax_trajectory(dt,x) [x = 9 to x = 15 for the 7 baxter joints]
"""
T = simple_trajectories.bax_trajectory(dt,9)
#T = simple_trajectories.y_exp_trajectory(dt)
#Obtain w, c & D (in that order) from below function, and generate XML file
Important_values = train_dmp(name, n_rfs, T, dt)

start = 0.266
goal = 1.1539
#start = 0
#goal = 1

my_runner = DMP_runner(name,start,goal)

Y = []
tau = 1
for i in np.arange(0,int(tau/dt)+1):
    
    '''Dynamic change in goal'''
    #new_goal = 2
    #new_flag = 1
    #if i > 0.6*int(tau/dt):
    #    my_runner.setGoal(new_goal,new_flag)
    '''Dynamic change in goal'''    
    
    my_runner.step(tau,dt)
    Y.append(my_runner.y)

time = np.arange(0,tau+dt,dt)

plt.title("2-D DMP demonstration")
plt.xlabel("Time(t)")
plt.ylabel("Position(y)")
plt.plot(time,T)
plt.plot(time,Y)
plt._show()
