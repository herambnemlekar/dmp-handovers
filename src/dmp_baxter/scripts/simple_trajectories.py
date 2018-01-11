# -*- coding: utf-8 -*-
"""
Created on Wed Nov 01 22:45:30 2017

@author: Onkar
"""
import numpy as np

import matplotlib.pyplot as plt

Angles = [[] for i in range(16)]

with open("handover-trajectory.txt", "rt") as f:
    for line in f:
        for i in range(0,16):
            Angles[i].append(line.split(',')[i])

def y_exp_trajectory(dt):    
    t = list(i for i in np.arange(0,1+dt,dt))
    y = list(np.power(t,2))
    y2 = [0]
    y2 = np.append(y2,np.divide(np.diff(y,1),np.power(dt,1)))
    #y2 = np.gradient(y)
    y3 = [0,0]
    y3 = np.append(y3,np.divide(np.diff(y,2),np.power(dt,2)))
    #y3 = np.gradient(y,2)
    T = []
    T_rec = []
    T_rec.append(y)
    T.append(y)
    T.append(y2)
    T.append(y3)
    return T

def y_lin_trajectory(dt):
    y = list(i for i in np.arange(0,1+dt,dt))
    y2 = [0]
    y2 = np.append(y2,np.divide(np.diff(y,1),np.power(dt,1)))
    y3 = [0,0]
    y3 = np.append(y3,np.divide(np.diff(y,2),np.power(dt,2)))
    T = []
    T_rec = []
    T_rec.append(y)
    T.append(y)
    T.append(y2)
    T.append(y3)
    return T    

def y_step_trajectory(dt):
    y = []
    for i in range(int(1/dt)/2):
        y.append(0)
    for i in range(int(1/dt)/2):
        y.append(1)
    y.append(1)
    y2 = [0]
    y2 = np.append(y2,np.divide(np.diff(y,1),np.power(dt,1)))
    y3 = [0,0]
    y3 = np.append(y3,np.divide(np.diff(y,2),np.power(dt,2)))
    T = []
    T_rec = []
    T_rec.append(y)
    T.append(y)
    T.append(y2)
    T.append(y3)
    return T   

def bax_trajectory(dt,x):
    Angles = [[] for i in range(16)]

    with open("handover-trajectory.txt", "rt") as f:
        for line in f:
            for i in range(0,16):
                Angles[i].append(line.split(',')[i])
    right_s0 = [float("{0:.4f}".format(float(x))) for x in Angles[x][1:]]
    while len(right_s0) < 1001:
        right_s0.append(right_s0[-1])
    right_s0_vel = [0]
    right_s0_vel = np.append(right_s0_vel,np.divide(np.diff(right_s0,1),0.01))
    #right_s0_vel = np.gradient(right_s0)
    right_s0_accel = [0,0]
    right_s0_accel = np.append(right_s0_accel,np.divide(np.diff(right_s0,2),np.power(0.01,2)))
    #right_s0_accel = np.gradient(right_s0,2)
    #T = []
    #T.append(right_s0)
    #T.append(right_s0_vel)
    #T.append(right_s0_accel)
    return right_s0