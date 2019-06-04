# -*- coding: utf-8 -*-

import numpy as np
from functools import reduce

ar = np.array

def gauss(A, b):
    n = A.shape[0]
    
    for k in range(n-1):
        i = slice(k+1,n)
        lk = np.divide(A[i, k] , A[k, k])
        A[i, i] = A[i,i] - np.multiply(A[k,i], lk)
        b[i] = b[i] - np.multiply(b[k], lk[:, np.newaxis])

    return A, b

# Factorización LU
# Algoritmo que reescribe la matriz A para que la parte superior almacene
# la matriz U de la descomposición LU
def LU(A):
    n = A.shape[0]
    for k in range(n-1):
        i = slice(k+1,n)
        A[i, k] = np.divide(A[i, k] , A[k, k])
        A[i,i] = A[i,i] - np.multiply(A[i, k], A[k,i])
    
    U = np.triu(A)
    L = np.tril(A)
    np.fill_diagonal(L, 1)
    return L, U

L, U = LU(ar([[1, 2], [3, 4]]))

np.matmul(L, U)

# Generar mil lados derechos, y calcular con eliminación gaussiana
# Generar los matrices


A = ar([[3, 0, 0, 0], 
        [2, 1, 0, 0], 
        [1, 5, 1, 0], 
        [7, 9, 8, 4]])

b = ar([[-9, 12], 
        [6,  -1], 
        [2,   0], 
        [5,   1]])

mil_bs = [ b for i in range(1000) ]
mil_bs = reduce(lambda a, b: np.append(a, b, axis = 1), mil_bs)

def sustitucion_adelante(A, b):
    """A matriz triangular inferior"""
    n = A.shape[0]
    x = np.zeros((n, b.shape[1]))

    x[0,:] = b[0,:] / A[0, 0]
    
    for i in range(1, n):
        x[i,:] = b[i,:] - np.matmul(A[i,:i], x[:i,:])
        x[i,:] = x[i,:] / A[i, i]
#
    return x

def sustitucion_atras(A, b):
    """A matriz triangular superior"""
    n = A.shape[0]
    x = np.zeros((n, b.shape[1]))

    x[-1,:] = b[-1,:] / A[-1, -1]
    
    for i in range(n-1, -1, -1):
        x[i,:] = b[i,:] - np.matmul(A[i,(i+1):], x[(i + 1):,:])
        x[i,:] = x[i,:] / A[i, i]
#
    return x

# Tiempo que se tarda en ejecutar eliminación gaussiana
def fun1_gauss():
    gauss(A, mil_bs)
    return

fun1_gauss()

#%timeit fun1_gauss()
#The slowest run took 10.18 times longer than the fastest. This could mean that an intermediate result is being cached.
#10000 loops, best of 3: 70.2 µs per loop

# Tiempo que se tarda en Resolver con sustitución hacia adelante y hacia atrás
def fun2_LU():
    L, U = LU(A)
    # Paso 1: Resolvemos LY = b
    y = sustitucion_adelante(L, mil_bs)
    # Paso 2: Resolvemos Ux = Y
    sustitucion_atras(U, y)
    return 

fun2_LU()

#%timeit fun2_LU()
#The slowest run took 8.52 times longer than the fastest. This could mean that an intermediate result is being cached.
#10000 loops, best of 3: 164 µs per loop
