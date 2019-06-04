# compactar los loops internos en funciones implementadas en los lenguajes


# Matrices de prueba:
A = matrix(1:6, nrow = 2) # m x r = 2 x 3
B = matrix(10:15, nrow = 3) # r x n = 3 x 2

m = 2
n = 2
r = 3

C2 = matrix(rep(0, 4), nrow = 2)
# i, j, k
for(i in 1:m){
  for(j in 1:n){
    C2[i, j] = A[i,] %*% B[,j]
  }
}


# k, i, j
C3 = matrix(rep(0, 4), nrow = 2)
for(k in 1:r){
  for(j in 1:n){
    C3[, j] = C3[,j] + A[, k] * B[k, j]
    print(C3)
  }
}



# i, k, j
C4 = matrix(rep(0, 4), nrow = 2)
for(i in 1:m){
  for(j in 1:n){
    C4[i,j] = A[i,] %*% B[,j]
  }
}

