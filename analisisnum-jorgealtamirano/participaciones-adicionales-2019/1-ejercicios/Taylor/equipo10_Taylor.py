#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan 30 18:35:38 2019

@author: Equipo 10 {

        -Francisco Alvarez
        -Francisco Acosta
        -Francisco Paz

}
"""
import numpy as np
import matplotlib.pyplot as plt



def func(x):
    return(1/x**2)
    
def ord1(x):
    x0=-2.5
    h=x-x0
    return((1/x**2)+(-2*x**-3)*h)
    
def ord2(x):
    x0=-2.5
    h=x-x0
    return((1/x**2)+(-2*x**-3)*h+((6*x**-4)*h**2)/2)

def ord3(x):
    x0=-2.5
    h=x-x0
    return(((1/x**2)+(-2*x**-3)*h+((6*x**-4)*h**2)/2)+(((-24*x**-5)*h**3)/6))
    
def ord4(x):
    x0=-2.5
    h=x-x0
    return(((1/x**2)+(-2*x**-3)*h+((6*x**-4)*h**2)/2)+(((-24*x**-5)*h**3)/6)+(((120*x**-5)*h**4)/24))
    

t = np.arange(-3., -2., 0.2)

plt.plot(t, t, 'r--', t, func(t), 'r--', t,ord1(t), 'r--',t, ord2(t),'r--',t, ord3(t),'r--',t, ord4(t))
plt.axis([-3, -2, 0., 0.3])
plt.show()


