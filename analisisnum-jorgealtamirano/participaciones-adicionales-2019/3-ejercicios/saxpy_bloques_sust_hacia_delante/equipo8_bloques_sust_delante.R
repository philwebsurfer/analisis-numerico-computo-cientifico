# Eliminacion Gaussiana por bloques 
A <- matrix(c(3,2,1,7,0,1,5,9,0,0,1,8,0,0,0,4),4,4)
B <- matrix(c(-9,6,2,5,12,-1,0,1),4,2)

N <- 2 #tamaño del bloque
s <- ceiling(dim(A)[1]/N) #numero de sistemas a resolver
X <- NULL

for(j in 1:s){
  L <- A[1:N, 1:N]
  b <- B[1:N, 1:N]
  x <- solve(L,b)
  X <- rbind(X,x)
  
  for(i in (j+1):s){
    if(i > nrow(B)){
      break
    }
      B <- B[(i+1):nrow(B), 1:ncol(B)] - A[(i+1):nrow(A), 1:N] %*% x
      A <- A[(i+1):nrow(A), (i+1):ncol(A)]
  }
}
