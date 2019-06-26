#!/usr/bin/env python3
# @author: Jorge Altamirano, Ariel Vallarino, Eduardo Martínez 2019
# @description: Ejecuta pruebas de benchmarking en punto flotante, basado en numpy con fines comparativos.

import pandas as pd
import numpy as np
import cudamat as cm
from time import time

df = pd.DataFrame(columns=['BLAS', 'Tamaño', 'Operación', 'Iteraciones', 'Tiempo'])

np.random.seed(0)

for i in range(4, 14):
    # Multiplicacion de matriz 20 veces (N) para sacar un promedio.
    size = 2**i
    A, B = np.random.random((size, size)), np.random.random((size, size))
    N = 5
    t = time()
    for i in range(N):
        np.dot(A, B)
    delta = time() - t
    del A, B
    df = df.append({'BLAS': np.__config__.blas_opt_info['libraries'][0],
               'Tamaño': size, 
               'Operación': "Producto Punto de Matrices", 
               'Iteraciones': N,
               'Tiempo': delta/N}, 
              ignore_index=True)

for i in range(6, 12):
    # Multiplicacion de matriz 20 veces (N) para sacar un promedio.
    size = 2**i
    A, B = np.random.random((size, size)), np.random.random((size, size))
    N = 5
    t = time()
    for i in range(N):
        np.dot(A, B)
    delta = time() - t
    del A, B
    df = df.append({'BLAS': np.__config__.blas_opt_info['libraries'][0],
               'Tamaño': size, 
               'Operación': "Producto Punto de Matrices", 
               'Iteraciones': N,
               'Tiempo': delta/N}, 
              ignore_index=True)
    
for i in range(8, 14):
    # Multiplicacion de vectores 5000 Veces para sacar un promedio.
    size = 2**i
    N = 2500
    C, D = np.random.random((size * 128,)), np.random.random((size * 128,))
    t = time()
    for i in range(N):
        np.dot(C, D)
    delta = time() - t
    df = df.append({'BLAS': np.__config__.blas_opt_info['libraries'][0],
               'Tamaño': (size*128), 
               'Operación': "Producto Punto de 2 Vectores", 
               'Iteraciones': N,
               'Tiempo': delta/N}, 
              ignore_index=True)
    del C, D
    
for i in range(6, 12):
    # SVD: promedio de 3.
    size = 2**i
    E = np.random.random((int(size), int(size/2)))
    N = 5
    t = time()
    for i in range(N):
        np.linalg.svd(E, full_matrices = False)
    delta = time() - t
    df = df.append({'BLAS': np.__config__.blas_opt_info['libraries'][0],
           'Tamaño': (size),
           'Operación': "SVD", 
           'Iteraciones': N,
           'Tiempo': delta/N}, 
          ignore_index=True)
    del E
    
for i in range(6, 12):
    # Cholesky: promedio de 3.
    size = 2**i
    F = np.random.random((int(size / 2), int(size / 2)))
    F = np.dot(F, F.T)
    N = 5
    t = time()
    for i in range(N):
        np.linalg.cholesky(F)
    delta = time() - t
    df = df.append({'BLAS': np.__config__.blas_opt_info['libraries'][0],
       'Tamaño': size/2,
       'Operación': "Cholesky", 
       'Iteraciones': N,
       'Tiempo': delta/N}, 
      ignore_index=True)
    del F

for i in range(6, 12):
    # Valores y vectores propios: promedio de 3.
    size = 2**i
    t = time()
    G = np.random.random((int(size / 2), int(size / 2)))
    N = 5
    for i in range(N):
        np.linalg.eig(G)
    delta = time() - t
    df = df.append({'BLAS': np.__config__.blas_opt_info['libraries'][0],
       'Tamaño': size/2,
       'Operación': "Eigen", 
       'Iteraciones': N,
       'Tiempo': delta/N}, 
      ignore_index=True)
    del G

for i in range(2, 16):
    # Multiplicacion de matriz 20 veces (N) para sacar un promedio.
    size = 2**i
    A, B = np.random.random((size, size)), np.random.random((size, size))
    N = 5
    t = time()
    for i in range(N):
        np.multiply(A, B)
    delta = time() - t
    del A, B
    df = df.append({'BLAS': np.__config__.blas_opt_info['libraries'][0],
               'Tamaño': size, 
               'Operación': "Producto de Matrices", 
               'Iteraciones': N,
               'Tiempo': delta/N}, 
              ignore_index=True)

filename = "compare.%s.csv"%(np.__config__.blas_opt_info['libraries'][0])
print("Guardando archivo en " + filename)
df.to_csv(filename, encoding="utf-8", index=False)
