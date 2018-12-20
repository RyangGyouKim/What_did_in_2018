# -*- coding: utf-8 -*-
"""
Created on Thu Nov 29 20:14:52 2018

@author: 302
"""
import isNumber

def sort_number_plate(array):
    sort_result=''
    for i in range(len(array)):
        if (len(sort_result)==2):
            if isNumber.isNumber(array[i])==False:
                sort_result= sort_result+array[i]
            else:
                continue
        if isNumber.isNumber(array[i]):
            sort_result= sort_result+array[i]
        if len(sort_result)==7:
            break
                
    return sort_result