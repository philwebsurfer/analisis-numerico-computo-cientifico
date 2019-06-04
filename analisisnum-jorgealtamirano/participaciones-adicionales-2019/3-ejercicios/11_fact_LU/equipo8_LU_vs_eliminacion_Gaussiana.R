
# LU

start.time <- Sys.time()

A <- matrix(runif(16),4,4)
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

for(n in 1:1000){
  try(b <- runif(4))
  try(d <- solve(L,b))
  try(x <- solve(U,d))
  
}


end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken

# Eliminacion Gaussiana

start.time <- Sys.time()

for(n in 1:1000){
  A <- matrix(runif(16),4,4)
  b <- runif(4)
  
  n <- dim(A)[1]
  
  for(k in 1:(n-1)){
    l <- rep(0,(n-k))
    i <- (k+1):n
    l <- A[i,k]/A[k,k]
    A[i,i] <- A[i,i] - outer(A[k,i],l)
    b[i] <- b[i] - b[k]*l
  }
  
  A[lower.tri(A)] <- 0
  x <- solve(A,b)
}

end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken

