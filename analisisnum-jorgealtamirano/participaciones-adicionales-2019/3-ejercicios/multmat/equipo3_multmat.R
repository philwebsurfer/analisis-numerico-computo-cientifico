m <- 5
n <- 5
r <- 8
A <- matrix(runif(10),m,r); A
B <- matrix(runif(10),r,n); B

# ijk: C = C + A*B

# Version 1 loop
C_ijk <- matrix(0,m,n)
for(i in 1:m) {
  C_ijk[i,] <- C_ijk[i,] + A[i,] %*% B
}; C_ijk

# Version 3 loop
C <- matrix(0,m,n)
for(i in 1:m) {
  for(j in 1:n) {
    for(k in 1:r) {
      C[i,j] <- C[i,j] + A[i,k] * B[k,j] 
    }
  }
}; C



# kij: C = C + A*B

# Version 1 loop
C_kij <- matrix(0,m,n)
for(k in 1:r) {
      C_kij <- C_kij + A[,k] %*% t(B[k,]) 
}; C_kij

# Version 3 loop
C <- matrix(0,m,n)
for(k in 1:r) {
  for(i in 1:m) {
    for(j in 1:n) {
      C[i,j] <- C[i,j] + A[i,k] * B[k,j] 
    }
  }
}; C



# ikj: C = C + A*B

# Version 1 loop
C_ikj <- matrix(0,m,n)
for(i in 1:m) {
      C_ikj[i,] <- C_ikj[i,] + A[i,] %*% B
}; C_ikj


# Version 3 loop
C <- matrix(0,m,n)
for(i in 1:m) {
  for(k in 1:r) {
    for(j in 1:n) {
      C[i,j] <- C[i,j] + A[i,k] * B[k,j] 
    }
  }
}; C








