
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
x
