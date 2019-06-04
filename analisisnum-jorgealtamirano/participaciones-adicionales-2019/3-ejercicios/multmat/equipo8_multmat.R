
m <- 2
n <- 3
r <- 4

A <- matrix(runif(m*r),m,r)
B <- matrix(runif(r*n),r,n)

C1 <- matrix(rep(0,m*n),m,n)
C2 <- matrix(rep(0,m*n),m,n)
C3 <- matrix(rep(0,m*n),m,n)


for (i in 1:m){
  C1[i,] <- A[i,] %*% B
}

for (k in 1:r){
  C2 <- C2 + outer(A[,k], B[k,])
}

for (i in 1:m){
  C3[i,] <- A[i,] %*% B
}





