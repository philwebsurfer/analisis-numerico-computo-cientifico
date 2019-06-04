# Equipo 1

# Sustitución hacia atrás

back_sust<-function(A,b){
  n<-ncol(A)
  x<-rep(NA,n)
  x[n]<-b[n]/A[n,n]
  for(i in rev(1:(n-1))){
    x[i]<-(b[i]-A[i,(i+1):n]%*%x[(i+1):n])/A[i,i]
  }
  return(x)
}

# Evaluamos con el ejercicio 1
A<-matrix(c(4,-1,2,3,0,-2,7,-4,0,0,6,5,0,0,0,3),nrow=4,byrow=T)
b<-c(20,-7,4,6)

x1<-back_sust(A,b)

# Sustitución hacia adelante

fwd_sust<-function(A,b){
  n<-ncol(A)
  x<-rep(NA,n)
  x[1]<-b[1]/A[1,1]
  for(i in 2:n){
    x[i]<-(b[i]-A[i,1:(i-1)]%*%x[1:(i-1)])/A[i,i]
  }
  return(x)
}

# Evaluamos con el ejercicio 2

A<-matrix(c(3,0,0,0,-1,1,0,0,3,-2,-1,0,1,-2,6,2),nrow=4,byrow=T)
b<-c(5,6,4,2)

x2<-fwd_sust(A,b)