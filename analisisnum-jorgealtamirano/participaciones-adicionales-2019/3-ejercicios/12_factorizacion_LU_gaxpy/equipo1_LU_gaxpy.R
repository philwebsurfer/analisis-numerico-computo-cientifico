# Equipo 1

rm(list=ls())

library(Matrix)
library(tidyverse)

LU_gaxpy<-function(A){
  n<-ncol(A)
  L<-diag(1,n)
  U<-diag(0,n)
  for(j in 1:n){
    if(j==1){
      v<-A[,1]
    }else{
      a<-A[,j]
      z<-solve(L[1:(j-1),1:(j-1)],a[1:(j-1)])
      U[1:(j-1),j]<-z
      if(length(z)>1)
        v[j:n]<-as.matrix(a[j:n],ncol=1)-L[j:n,1:(j-1)]%*%z
      else
        v[j:n]<-as.matrix(a[j:n],ncol=1)-L[j:n,1:(j-1)]*z
    }
    U[j,j]<-v[j]
    # Excepto la última iteración
    if(j<n)
      L[(j+1):n,j]<-v[(j+1):n]/v[j]
  }
  return(list(L=L,U=U))
}

# Solucion de sistema de ecuaciones con LU
res_LU<-function(A,b){
  resultados<<-LU_gaxpy(A)
  L<-resultados$L
  U<-resultados$U
  n<-ncol(A)
  
  if(class(b)!="matrix")
    b<-matrix(b)
  
  # Sustitución hacia adelante
  # Resolvemos LD=b
  n1<-ncol(b)
  D<-matrix(rep(NA,n*n1),nrow=n)
  
  D[1,]<-b[1,]
  for(i in 2:n){
    D[i,]<-b[i,]-L[i,1:(i-1)]%*%D[1:(i-1),]
  }
  
  # Sustitución hacia atrás
  # Resolvemos UX=D
  X<-matrix(rep(NA,n*n1),nrow=n)
  
  X[n,]<-D[n,]/U[n,n]
  for(i in rev(1:(n-1))){
    X[i,]<-(D[i,]-U[i,(i+1):n]%*%X[(i+1):n,])/U[i,i]
  }
  
  # Resultado
  return(X)
}

# Ejercicio 1
# Inciso a
A<-matrix(c(3,-0.1,-0.2,1,7,0.3,0.3,-0.2,10),ncol=3,byrow=T)
b<-c(7.85,-19.3,71.4)
# Resultado
solve(A,b)
res_LU(A,b)

# Inciso
A<-matrix(c(2,1,-1,1,3,-1,-1,2,-1,2,3,-1,1,1,0,3),ncol=4,byrow=T)
b<-c(1,-3,4,4)
# Resultado
solve(A,b)
res_LU(A,b)


