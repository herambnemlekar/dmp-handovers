# -*- coding: utf-8 -*-
"""
Created on Mon Oct 30 17:40:33 2017

@author: Onkar
"""
# name       : filename for trained dmp to be stored into
# n_rfs      : number of basis functions to train dmp with
# T          : training trajectory formatted: [Y; dY; ddY];
# dt         : timestep between each sequential trajectory point

import numpy as np
from lxml import etree

def train_dmp(name, n_rfs, T, dt):
    name = name
    n_rfs = n_rfs
    T = T
    dt = dt

    # Extract trajectory into pos, vel, accl vectors
    #Tdd = T[2]
    #Td = T[1]
    T = T
    Tdd = [0,0]
    Tdd = np.append(Tdd,np.divide(np.diff(T,2),np.power(0.01,2)))
    Td = [0]
    Td = np.append(Td,np.divide(np.diff(T,1),0.01))
    
    
    #the time constants for chosen for critical damping
    alpha_z = 25
    beta_z  = np.divide(float(alpha_z),4)
    alpha_g = np.divide(float(alpha_z),2)
    alpha_v = alpha_z
    beta_v  = beta_z
    
    
    t_con = np.divide(1,float(n_rfs-1))
    t = list(float(i) for i in np.arange(0,1+t_con,t_con))

    ######## BUG FIX FOR CERTAIN RANGES OF N_RFS, FIND ELABORATE SOLUTION LATER #######################
    for i in range(0,len(t)):
        if t[i] > 1:
            t.remove(t[i])
        t[i] = float("{0:.4f}".format(t[i]))
    ###################################################################################################
    
    np.reshape(t,(n_rfs,1))
    #Canonical Function
    Pc1 = (np.multiply(np.divide(alpha_z,float(2)),t))+1
    Pc2 = np.exp(np.multiply(np.divide(float(-alpha_z),2),t))
    #c = np.multiply(Pc1,Pc2)
    c = Pc1*Pc2
    
    # Misc. Memory Allocations
    D = np.power((np.diff(c)*0.55),2)
    D = np.divide(1,np.append(D,D[-1]))
    #the start state is the first state in the trajectory
    y0 = T[0]
    g = y0
    goal = T[-1]
    #compute the hidden states
    X = np.zeros(len(T))
    V = np.zeros(len(T))
    G = np.zeros(len(T))
    x = 1
    v = 0
    
    for i in range(0,len(T)):
        X[i] = x
        V[i] = v
        G[i] = g
        
        vd = np.multiply((np.multiply(beta_v,(0-x))-v),alpha_v)
        xd = v
        
        gd = np.multiply((goal - g),alpha_g)
        x    = np.multiply(xd,dt)+x
        v    = np.multiply(vd,dt)+v
        g    = np.multiply(gd,dt)+g
    dG = goal - y0
    A  = np.amax(T)-np.amin(T)
    s = 1 #for fitting a new primitive, the scale factor is always equal to one
    
    #Forcing term
    Ft  = (Tdd-(np.multiply(alpha_z,(np.multiply(beta_z,(G-T))-Td))))
    Ft_res = np.reshape(Ft,(len(Ft),1))
    PSI1 = np.dot(np.reshape(X,(len(X),1)),np.ones((1,len(c))))
    PSI2 = np.dot(np.ones((len(T),1)),np.reshape(c,(1,n_rfs)))
    PSID = np.dot(np.ones((len(T),1)),np.reshape(D,(1,len(D))))

    #compute the weights for each local model along the trajectory
    
    PSI = np.exp(np.multiply(np.multiply(-0.5,np.power((PSI1-PSI2),2)),PSID))
    #compute the regression -- (sx2, sxtd)
    sx2_temp = np.dot(np.power(np.reshape(V,(len(V),1)),2),np.ones((1,len(c))))
    sx2 = np.sum(np.multiply(sx2_temp,PSI),0)
    #######sxtd = sum(((V.*Ft)*ones(1,length(c))).*PSI,1)';
    sxtd_temp = np.dot(np.multiply(np.reshape(V,(len(V),1)),Ft_res),np.ones((1,len(c))))
    sxtd = np.sum(np.multiply(sxtd_temp,PSI),0)    
    #Final weights
    w    = np.divide(sxtd,(sx2+(1.e-10)));
    ############XML file creation ############################    
    w_st = ["%.6f" % number for number in w]
    #w_sent = ",".join(w_str )
    
    D_st = ["%.6f" % number for number in D]
    #D_sent = ",".join(D_str )
    
    c_st = ["%.6f" % number for number in c]
    #c_sent = ",".join(c_str )
 
    root = etree.Element('DMPs')
    weights = etree.Element('Weights')
    inv_sq_var = etree.Element('inv_sq_var')
    gauss_means = etree.Element('gauss_means')
    dGx = etree.Element('dG')
    dGx.text = np.str(np.int(dG))
    Ax = etree.Element('A')
    Ax.text = np.str(np.int(A))
    sx = etree.Element('s')
    sx.text = str(np.int(s))
    y0x = etree.Element('y0')
    y0x.text = np.str(np.int(y0))

    
    for i in range(0,n_rfs):
        etree.SubElement(weights, "w").text = w_st[i]
        etree.SubElement(inv_sq_var, "D").text = D_st[i]
        etree.SubElement(gauss_means, "c").text = c_st[i]
    
    root.append(weights)
    root.append(inv_sq_var)
    root.append(gauss_means)
    root.append(dGx)
    root.append(Ax)
    root.append(sx)
    root.append(y0x)
    tree = etree.ElementTree(root)
    tree.write(name, pretty_print=True, xml_declaration=True,   encoding="utf-8")
    

    
    
