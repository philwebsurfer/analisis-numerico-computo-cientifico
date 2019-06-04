

A <- matrix(runif(16),4,4)

A_estrella <- A
n <- dim(A)[1]
  

for(k in 1:(n-1)){
  i <- (k+1):n
  A[i,k] <- A[i,k]/A[k,k]
  A[i,i] <- A[i,i]-outer(A[i,k],A[k,i])
}

L <- A
U <- A

U[lower.tri(U)] <- 0

L[upper.tri(L)] <- 0
diag(L) <- 1

L%*%U - A_estrella
