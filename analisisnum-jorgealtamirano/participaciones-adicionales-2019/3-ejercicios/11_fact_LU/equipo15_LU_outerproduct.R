
library(tidyverse)

# Generamos una matriz A aleatoria de entradas enteras
genera_A <- function(ord, n) {
  # ord: orden de magnitud de los elementos de A
  # n: dimensión de A
  
  m <- floor(ord*runif(1) + 2)
  
  A <- round(matrix(ord*runif(n*n), nrow = n))
  
  return(A)
  
}

set.seed(1291)
A <- genera_A(100, 400) 
A

fact_LU <- function(A) {
  
  n <- nrow(A)
  L <- diag(n)
  U <- diag(n)
  
  for(k in 1:(n-1)) {
    i <- (k+1):n
    A[i,k] <- A[i,k] / A[k,k]
    A[i,i] <- A[i,i] - matrix(A[i,k]) %*% A[k,i]
  }
  
  # U[upper.tri(A, diag = T)] <- A[upper.tri(A, diag = T)]
  U <- A
  U[lower.tri(U)] <- 0
  
  for(i in 1:n)
    for(j in 1:n)
      if(i > j)
        L[i,j] <- A[i,j]
  
  diag(L) <- 1
  
  return(list(L = L, U = U))
  
}

U <- fact_LU(A)$U
L <- fact_LU(A)$L

# Verificamos que la descomposición sea correcta
sum(!near(A, L %*% U))
