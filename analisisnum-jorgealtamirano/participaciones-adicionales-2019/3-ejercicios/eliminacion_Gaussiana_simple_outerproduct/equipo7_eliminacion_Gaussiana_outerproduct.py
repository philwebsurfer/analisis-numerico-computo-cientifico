# -*- coding: utf-8 -*-

# 2do ejercicio: eliminación gaussiana

import numpy as np

ar = np.array

A = ar([[3, 0, 0, 0], 
        [2, 1, 0, 0], 
        [1, 5, 1, 0], 
        [7, 9, 8, 4]])

b = ar([[-9, 12], 
        [6,  -1], 
        [2,   0], 
        [5,   1]])

def gauss(A, b):
    n = A.shape[0]
    
    for k in range(n-1):
        i = slice(k+1,n)
        lk = np.divide(A[i, k] , A[k, k])
        A[i, i] = A[i,i] - np.multiply(A[k,i], lk)
        b[i] = b[i] - np.multiply(b[k], lk[:, np.newaxis])

    return A, b

A_gauss, b_gauss = gauss(A, b)
sol = np.linalg.solve(np.triu(A_gauss), b_gauss)

print(sol)
