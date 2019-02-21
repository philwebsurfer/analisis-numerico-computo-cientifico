#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
# @author: Jorge Altamirano, Ariel Vallarino, Eduardo Martínez 2019
# @description: Ejecuta pruebas de benchmarking en punto flotante, basado en numpy con fines comparativos.

# Basado en http://stackoverflow.com/questions/11443302/compiling-numpy-with-openblas-integration

import numpy as np
from time import time

print("==========================================================================")
print("Valores de la configuracion OpenBLAS")
np.__config__.show()
print("========================================================================\n")

# Establecer la semilla con fines de reproducibilidad
np.random.seed(0)

# Tamaño d ela matriz
size = 4096
# Declaracion de las matrices
A, B = np.random.random((size, size)), np.random.random((size, size))
C, D = np.random.random((size * 128,)), np.random.random((size * 128,))
E = np.random.random((int(size / 2), int(size / 4)))
F = np.random.random((int(size / 2), int(size / 2)))
#Producto punto
F = np.dot(F, F.T)
G = np.random.random((int(size / 2), int(size / 2)))

# Multiplicacion de matriz 20 veces (N) para sacar un promedio.
N = 20
t = time()
for i in range(N):
    np.dot(A, B)
delta = time() - t
print('Producto punto de 2 matrices %dx%d tomo %0.2f segundos en promedio. ' % (size, size, delta / N))
del A, B

# Multiplicacion de vectores 5000 Veces para sacar un promedio.
N = 5000
t = time()
for i in range(N):
    np.dot(C, D)
delta = time() - t
print('Producto punto de 2 vectores de longitud %d tomo %0.2f ms en promedio.' % (size * 128, 1e3 * delta / N))
del C, D

# SVD: promedio de 3.
N = 3
t = time()
for i in range(N):
    np.linalg.svd(E, full_matrices = False)
delta = time() - t
print("SVD de una matriz %dx%d tomo %0.2f segundos." % (size / 2, size / 4, delta / N))
del E

# Cholesky: promedio de 3.
N = 3
t = time()
for i in range(N):
    np.linalg.cholesky(F)
delta = time() - t
print("Descomposicion de una Cholesky de una matriz %dx%d tomo  %0.2f segundos." % (size / 2, size / 2, delta / N))

# Valores y vectores propios: promedio de 3.
t = time()
for i in range(N):
    np.linalg.eig(G)
delta = time() - t
print("Descompisicion de valores y vectores propios de una matriz %dx%d tomo %0.2f segundos." % (size / 2, size / 2, delta / N))


