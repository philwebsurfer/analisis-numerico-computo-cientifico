

# Eliminacion Gaussiana "saxpy"
A <- matrix(c(3,2,1,7,0,1,5,9,0,0,1,8,0,0,0,4),4,4)
b <- c(-9,6,2,5)

n <- dim(A)[1]
x <- rep(0,n)

for(i in 1:(n-1)){
  x[i] <- b[1]/A[1,1]
  k <- dim(A)[1]
  
  b <- b[2:k] - A[2:k,1]*x[i]
  A <- A[2:k,2:k]
  
}
x[n] <- b/A



