# Eliminación Gaussiana por entrada

A <- rbind(c(3,0,0,0),c(2,1,0,0),c(1,5,1,0),c(7,9,8,4)); A
b <- c(-9,6,2,5); b

br <- b
n <- nrow(A)
x <- matrix(1,n)
x[1] <- b[1]/A[1,1] 

for (i in 2:n) {
  br[i:n] <- br[i:n]-A[i:n,(i-1)]*x[(i-1)]
  x[i] <- br[i]/A[i,i] ; x[i]
}; x

A%*%x-b



# Eliminación Gaussiana Simple

A <- rbind(c(1,2,1),c(2,2,3),c(-1,-3,0)); A
b <- c(0,3,2); b
Ap <- A
bp <- b

n <- nrow(A)
for (k in 1:(n-1)){
  pivote <- A[k,k]
  for(i in (k+1):n) {
    mult = A[i,k]/pivote 
    A[i,] <- A[i,]-mult*A[k,];
  }   
  b[i] <- b[i]-mult*b[k]
};

A[lower.tri(A)] <- 0
x <- solve(A,b)

Ap%*%x - bp

