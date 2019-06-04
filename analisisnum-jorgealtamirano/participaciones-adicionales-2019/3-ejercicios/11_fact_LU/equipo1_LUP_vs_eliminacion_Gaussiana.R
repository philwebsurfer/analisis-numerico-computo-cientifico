# Equipo 1

library(Matrix)
library(tidyverse)

# Creamos matriz
set.seed(55)

n<-100
A<-matrix(sample(1:20,n*n,replace=T),ncol=n)

# Pivoteo parcial
fact_LUP<-function(A){
  n<-ncol(A)
  # Matrices iniciales
  L<-P<-diag(1,n)
  for(i in 1:(n-1)){
    # Encontramos la línea con mayor magnitud
    piv<-max(abs(A[(i+1):n,i]))
    # Verificamos que no tengamos columna de ceros
    if(piv>0){
      # Si el elemento a eliminar es cero, permutamos
      if(A[i,i]==0){
        ind<-which.max(abs(A[i+1:n,i]))+i
        A[c(i,ind),i:n]<-A[c(ind,i),i:n]
        L[c(i,ind),1:(i-1)]<-L[c(ind,i),1:(i-1)]
        P[c(i,ind),]<-P[c(ind,i),]
      }
      # Eliminamos por outer product
      L[(i+1):n,i]<-A[(i+1):n,i]/A[i,i]
      A[(i+1):n,(i+1):n]<-A[(i+1):n,(i+1):n]-L[(i+1):n,i]%*%t(A[i,(i+1):n])
    }
  }
  A[lower.tri(A)]<-0
  return(list(L=L,U=A,P=P))
}

resultados<-fact_LUP(A)
L<-resultados$L
U<-resultados$U
P<-resultados$P

# Observamos diferencia en norma de Frobenius
norm(A-L%*%U%*%P,type="F")

# Solucion de sistema de ecuaciones con LU
res_LU<-function(A,b){
  resultados<<-fact_LUP(A)
  L<-resultados$L
  U<-resultados$U
  P<-resultados$P
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
  
  # Permutamos
  X<-P%*%X

  return(X)
}

# Simulación de resultados

# Cargamos función de eliminación Gaussiana

res_gauss<-function(A,b){
  # Eliminación gaussiana
  n1<-ncol(A)
  A<-cbind(A,b)
  m<-nrow(A)
  n<-ncol(A)
  for(i in 1:(m-1)){
    A[i,i:n]<-A[i,i:n]/A[i,i]
    A[(i+1):m,(i+1):n]<-A[(i+1):m,(i+1):n]-A[(i+1):m,i]%*%t(A[i,(i+1):n])
    A[(i+1):m,i]<-rep(0,m-i)
  }
  A[m,m:n]<-A[m,m:n]/A[m,m]
  b<-as.matrix(A[,(n1+1):n])
  A<-A[,1:n1]
  
  # Sustitución hacia atrás
  n<-ncol(A)
  n1<-ncol(b)
  X<-matrix(rep(NA,m*n1),nrow=m)
  
  X[m,]<-b[m,]
  for(i in rev(1:(m-1))){
    X[i,]<-b[i,]-A[i,(i+1):n]%*%X[(i+1):m,]
  }
  return(X)
}

tiempo_gauss<-tiempo_lu<-numeric()

# Simulaciones
set.seed(30)
for(i in 1:1000){
  b<-rnorm(n,0,20)
  # Gauss
  t0<-Sys.time()
  x<-res_gauss(A,b)
  tiempo_gauss[i]<-Sys.time()-t0
  
  # LU
  t0<-Sys.time()
  x<-res_LU(A,b)
  tiempo_lu[i]<-Sys.time()-t0
}

mean(tiempo_gauss)
mean(tiempo_lu)
aux_plot<-data.frame(x=1:1000,gauss=tiempo_gauss,lu=tiempo_lu)

ggplot(aux_plot,(aes(x=x)))+geom_line(aes(y=gauss),col="red")+geom_line(aes(y=lu))
