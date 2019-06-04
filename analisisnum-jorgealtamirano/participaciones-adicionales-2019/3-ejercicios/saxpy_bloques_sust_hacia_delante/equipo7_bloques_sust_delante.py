# -*- coding: utf-8 -*-

import numpy as np

ar = np.array

A = ar([[3, 0, 0, 0], 
        [2, 1, 0, 0], 
        [1, 5, 1, 0], 
        [7, 9, 8, 4]])

b = ar([-9, 6, 2, 5])
bb= ar([b, b]).T

b_p = b

n = 4
for i in range(n):
    #xi = b[i] / A[i, i]
    xi = b_p[0] / A[i, i]
    print('x',i, '=', xi)
    b_p = b_p[1:] - (xi * A[i+1:, i])
    print(b_p)

# Algoritmo general
# 1.- Resolvemos L_11 * X_1 = B_1
# 2.- Resolvemos B_2 = B_2 - L_21 * X_1
    
# Supongamos que tenemos un parámetro de bloque bloque

def elim_gauss_bloque(A, b, n):
        
    # primer paso: Resolvemos L_11 X_1 = B_1
    X_1 = np.linalg.solve(A[:n, :n], b[:n])
    if  A.shape[0] == n:
        return X_1
    else:
        #print(X_1)
        
        # 2do paso:  Actualizamos la B
        b = b[n:,] - np.matmul(A[n:, :n], X_1)
        #print(b)
        # Tercer paso:llamada recursiva
        #print('falta:', A[n:, n:], 'b:', b[n:, ])
        return np.append(X_1, elim_gauss_bloque(A[n:, n:], b, n), axis = 0)

A = ar([[3, 0, 0, 0], 
        [2, 1, 0, 0], 
        [1, 5, 1, 0], 
        [7, 9, 8, 4]])

b = ar([[-9, 12], [6, -1], [2, 0], [5, 1]])

elim_gauss_bloque(A, b, n = 1)

elim_gauss_bloque(A, b, n = 2)
