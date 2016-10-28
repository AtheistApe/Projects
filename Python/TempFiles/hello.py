# -*- coding: utf-8 -*-
"""
Created on Wed Mar 30 15:45:02 2016

@author: gary
"""

# Demo file for Spyder Tutorial
# Hans Fangohr, University of Southampton, UK

mylongvariablename = 42
mydict = {'a':1, 'b':2, 'c':3, 'd':4, 'e':5, 'f':6}

def hello(name):
    """Give an object 'name', print 'Hello ' and the object."""
    print("Hello {}".format(name))

def average(a, b):
    """
    Given two numbers a and b, return their average value.
    
    Parameters
    ----------
    a : number
        A number
    b : number
        Another number
        
    Returns
    -------
    res : number
        The average of a and b, computed using 0.5*(a+b)
        
    Example
    -------
    >>> average(5,10)
    7.5
    """
    
    return (a+b)*0.5
    
print(average(7,3))
average(9,2)
hello('Gary')

i = 42


if __name__=='__main__':
    hello(i)