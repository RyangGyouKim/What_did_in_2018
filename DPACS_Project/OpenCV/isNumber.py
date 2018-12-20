# -*- coding: utf-8 -*-
"""
Created on Thu Nov 29 19:14:08 2018

@author: 302
"""

def isNumber(s):
    try:
        float(s)
        return True
    except ValueError:
        return False