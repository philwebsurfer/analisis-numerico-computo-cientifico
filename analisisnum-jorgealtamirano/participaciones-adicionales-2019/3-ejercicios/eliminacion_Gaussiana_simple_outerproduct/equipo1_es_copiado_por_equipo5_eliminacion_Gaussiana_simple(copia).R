#Eliminacion Gaussiana
#Ax=b
gauss<-function(A,b){

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
  X<-matrix(rep(0,m*n1),nrow=m)
  
  X[m,]<-b[m,]
  for(i in rev(1:(m-1))){
    X[i,]<-b[i,]-A[i,(i+1):n]%*%X[(i+1):m,]
  }
  return(X)
}

