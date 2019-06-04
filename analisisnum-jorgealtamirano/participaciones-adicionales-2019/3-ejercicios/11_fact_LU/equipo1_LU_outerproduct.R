
A <- matrix(c(1,2,3,4,2,3,1,5,3,1,5,6,4,5,6,7),ncol=4)
A


factorizacion_lu <- function(A){
  n <- dim(A)[1]
  L <- diag(1,ncol=n,nrow=n)
  U <- A
  for(k in 1:(n-1)){
    for(i in (k+1):n){
      print(U[k,k])
      L[i,k] <-U[i,k] /U[k,k]
      for (j in k:n){
      U[i,j] <-U[i,j] -L[i,k]*U[k,j] 
      }
    }
    
  }

  
  return(list(L=L,U=U))
}


res <- factorizacion_lu(A)
res
res$L %*% res$U
