# -*- coding: utf-8 -*-
"""
Created on Thu Nov 29 20:21:06 2018

@author: 302
"""
import numpy as np

def order_points(pts):
    
    rect= np.zeros((4,2),dtype="float32")

    s=np.sum(pts,axis=1)
    rect[0] = pts[np.argmin(s)]
    
    rect[2] = pts[np.argmax(s)]

    diff = np.diff(pts, axis =1 )
    rect[1]= pts[np.argmin(diff)]
    rect[3]= pts[np.argmax(diff)]
    
    rect[0][0]=(rect[0][0]+20)
    #rect[0][1]=(rect[0][1]+5)
    
    rect[3][0]=(rect[3][0]+20)
    #rect[3][1]=(rect[3][1]+5)
    
    rect[1][0]=(rect[1][0]-20)
    #rect[1][1]=(rect[1][1]+5)
    
    rect[2][0]=(rect[2][0]-20)
    #rect[2][1]=(rect[2][1]+5)
    
    return rect