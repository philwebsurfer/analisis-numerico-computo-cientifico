#!/usr/bin/env python3
# @author: Jorge Altamirano, Ariel Vallarino, Eduardo Martínez 2019
# @description: Ejecuta pruebas de benchmarking en punto flotante, basado en numpy con fines comparativos.

import pandas as pd
#import numpy as np
import cupy as cp
from time import time

df = pd.DataFrame(columns=['BLAS', 'Tamaño', 'Operación', 'Iteraciones', 'Tiempo'])

cp.random.seed(0)

eng = cp.cuda.cublas.getVersion(cp.cuda.get_cublas_handle()) / 1000
eng = "cupy+cublas+%f"%eng

for i in range(4, 14):
    # Multiplicacion de matriz 20 veces (N) para sacar un promedio.
    size = 2**i
    A, B = cp.random.random((size, size)), cp.random.random((size, size))
    N = 5
    t = time()
    for i in range(N):
        cp.multiply(A, B)
    delta = time() - t
    del A, B
    df = df.append({'BLAS': eng,
               'Tamaño': size, 
               'Operación': "Producto Punto de Matrices", 
               'Iteraciones': N,
               'Tiempo': delta/N}, 
              ignore_index=True)

for i in range(6, 12):
    # Producto Punto de matriz 20 veces (N) para sacar un promedio.
    size = 2**i
    A, B = cp.random.random((size, size)), cp.random.random((size, size))
    N = 5
    t = time()
    for i in range(N):
        cp.dot(A, B)
    delta = time() - t
    del A, B
    df = df.append({'BLAS': eng,
               'Tamaño': size, 
               'Operación': "Producto Punto de Matrices", 
               'Iteraciones': N,
               'Tiempo': delta/N}, 
              ignore_index=True)
    
for i in range(8, 14):
    # Multiplicacion de vectores 5000 Veces para sacar un promedio.
    size = 2**i
    N = 2500
    C, D = cp.random.random((size * 128,)), cp.random.random((size * 128,))
    t = time()
    for i in range(N):
        cp.dot(C, D)
    delta = time() - t
    df = df.append({'BLAS': eng,
               'Tamaño': (size*128), 
               'Operación': "Producto Punto de 2 Vectores", 
               'Iteraciones': N,
               'Tiempo': delta/N}, 
              ignore_index=True)
    del C, D
    
for i in range(6, 12):
    # SVD: promedio de 3.
    size = 2**i
    E = cp.random.random((int(size), int(size/2)))
    N = 5
    t = time()
    for i in range(N):
        cp.linalg.svd(E, full_matrices = False)
    delta = time() - t
    df = df.append({'BLAS': eng,
           'Tamaño': (size),
           'Operación': "SVD", 
           'Iteraciones': N,
           'Tiempo': delta/N}, 
          ignore_index=True)
    del E
    
for i in range(6, 12):
    # Cholesky: promedio de 3.
    size = 2**i
    F = cp.random.random((int(size / 2), int(size / 2)))
    F = cp.dot(F, F.T)
    N = 5
    t = time()
    for i in range(N):
        cp.linalg.cholesky(F)
    delta = time() - t
    df = df.append({'BLAS': eng,
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
    G = cp.random.random((int(size / 2), int(size / 2)))
    N = 5
    for i in range(N):
        cp.linalg.eigh(G)
        cp.linalg.eigvalsh(G)
    delta = time() - t
    df = df.append({'BLAS': eng,
       'Tamaño': size/2,
       'Operación': "Eigen", 
       'Iteraciones': N,
       'Tiempo': delta/N}, 
      ignore_index=True)
    del G

filename = "compare.%s.csv"%(eng)
print("Guardando archivo en " + filename)
df.to_csv(filename, encoding="utf-8", index=False)
