import xml.etree.ElementTree as ET
import numpy as np
import re

class DMP_runner():
    """
        Initialization of DMP_runner class.
            Inputs:
                filename: full path to .xml file containing trained DMP
                start   : desired starting coordinate of DMP
                goal    : desired ending coordinate of DMP
    """
    def __init__(self,file_name,start,goal):
        readInXML(self, file_name)
        self.g = 0   # progress towards goal (current goal state)
        self.gd = 0  # change in goal position
        self.G = 1   # Goal position of DMP
        
        # state variables
        self.x = 1
        self.v = 0
        self.z = 0      
        self.y = 0
        self.vd = 0
        self.xd = 0
        self.zd = 0
        self.flag = 0
        
        self.setStart(start)
        self.setGoal(goal,self.flag)

    """
        Generates one time-step of a DMP trajectory
            Inputs:
                tau: time constant
                dt : integration time constant
            Outputs:
                y  : current 0th derivative DMP trajectory
                yd : current 1st derivative DMP trajectory
                ydd: current 2nd derivative DMP trajectory
    """
    def step(self,tau_old,dt):
        
        tau = np.divide(float(1),tau_old)
        alpha_z = 25
        beta_z = np.divide(alpha_z,float(4))
        alpha_g = np.divide(alpha_z,float(2))
        alpha_v = alpha_z
        beta_v = beta_z
        
        psi = np.exp(np.multiply(-0.5,np.multiply(np.power((np.array(self.c)-self.x),2),np.array(self.D))))
        
        amp = self.s
        In = self.v

        f  = np.divide(np.sum(np.dot(np.dot(In,(self.w)),psi)), np.sum(psi+1.e-10)) * amp
        
        self.vd = np.multiply(np.multiply(alpha_v,(np.multiply(beta_v,(0-self.x))-self.v)),tau)
        
        self.xd = np.multiply(self.v,tau)
        
        # PROBLEM HERE
        # obj.zd = (alpha_z*(beta_z*A-obj.z)+f)*tau;
        self.zd = np.multiply((np.multiply(alpha_z,(np.multiply(beta_z,self.g-self.y)-self.z))+f),tau)
        yd = np.multiply(self.z,tau)
        ydd= np.multiply(self.zd,tau)
        
        self.gd = np.multiply(alpha_g,(self.G-self.g))
        
        self.x = np.multiply(self.xd,dt)+self.x
        self.v = np.multiply(self.vd,dt)+self.v
        
        self.z = np.multiply(self.zd,dt)+self.z
        self.y = np.multiply(yd,dt)+self.y

        self.g = np.multiply(self.gd,dt)+self.g
        
        # Return o/p trajectory
        y = self.y
        return y,yd,ydd

    """
        Changes the start position of the DMP
            Inputs:
                start_val: start position
    """
    def setStart(self, start_val):
        self.y = start_val
        self.G = start_val
        self.g = start_val
        self.y0 = start_val
        self.s = 1
        
        #Minor Change here
        

    """
        Changes the goal position of the DMP
            Inputs:
                G   : goal position
                flag: 1 initial setting; 0 mid-run update
    """
    def setGoal(self, goal_val, flag):
       self.G = goal_val

       if (flag == 1):
           self.x = 1
           self.y0 = self.y

       if (self.A != 0):  # check whether dcp has been fit
           if (np.divide(float(self.A), (np.abs(self.dG) + (1.e-10))) > 2.0):
               # amplitude-based scaling needs to be set explicity
               pass
           else:
               # dG based scaling cab work automatically
               self.s = np.divide((self.G - self.y0), float(self.dG))


"""
    Parses XML file containing trained DMP data.  Current format is:
        <root>
            <Weights>...</Weights>
            <inv_sq_var>...</inv_sq_var>
            <gauss_means>...</gauss_means>
            <dD>...</dG>
            <A>...</A>
            <s>...</s>
        </root>
"""
def readInXML(runner, filename):
    runner.w = []
    runner.D = []
    runner.c = []
    
    root = ET.parse(filename).getroot()

    for weight in root.findall("Weights")[0]:
        runner.w.append(float(weight.text))

    for inv_sq in root.findall("inv_sq_var")[0]:
        runner.D.append(float(inv_sq.text))

    for mean in root.findall("gauss_means")[0]:
        runner.c.append(float(mean.text))

    runner.dG = float(root.findall("dG")[0].text)
    runner.A = float(root.findall("A")[0].text)
    #runner.s = float(root.findall("s")[0].text)
    #runner.y0 = float(root.findall("y0")[0].text)
