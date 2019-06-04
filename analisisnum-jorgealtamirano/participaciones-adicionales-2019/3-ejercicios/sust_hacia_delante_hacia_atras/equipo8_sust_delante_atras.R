
# Hacia atrás

A <- matrix(c(4,0,0,0,-1,-2,0,0,2,7,6,0,3,-4,5,3),4,4)
b <- c(20,-7,4,6)
n <- length(b)

b[n] <- b[n]/A[n,n]
for(i in (n-1):1){
  b[i] <- (b[i] - A[i,(i+1):n] %*% b[(i+1):n])/A[i,i]
}


# Hacia delante
A <- matrix(c(3,-1,3,1,0,1,-2,-2,0,0,-1,6,0,0,0,2),4,4)
b <- c(5,6,4,2)
n <- length(b)

b[1] <- b[1]/A[1,1]
for(i in 2:n){
  b[i] <- (b[i] - A[i,1:(i-1)] %*% b[1:(i-1)])/A[i,i]
}
