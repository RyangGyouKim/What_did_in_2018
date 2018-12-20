# -*- coding: utf-8 -*-
"""
Created on Thu Nov 29 20:25:18 2018

@author: 302
"""
import numpy as np
import cv2

def region_of_interest(frame,vertices,color_chanel3=(255,255,255),color_chanel1=255):
    mask = np.zeros_like(frame)
    if len(frame.shape)>2:
        color = color_chanel3
    else:
        color = color_chanel1
    cv2.fillPoly(mask, vertices,color)
    Roi_image =cv2.bitwise_and(frame,mask)
    return Roi_image