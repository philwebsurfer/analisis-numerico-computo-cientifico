#A triangular sul de nxn, b vector de nx1


##################################################
###########SUSTITUCIÓN HACIA ATRÁS ###############
##################################################


A=matrix(c(4,-1,2,3,0,-2,7,-4,0,0,6,5,0,0,0,3), nrow=4,ncol=4, byrow=TRUE)
B=c(20,-7,4,6)



sustitucion_atras<-function(A,B){
  nr=nrow(A)
  nc=ncol(A)
  x<-rep(0,nr)
  
  x[nr]=B[nr]/A[nr,nc]
  
  for(i in 1:nr){
  
    if(A[i,i]==0){
      print("La matriz no es invertible")
      break()
  }
  
}

  for (i in (nr-1):1){
    suma=0
  
    for (j in (i+1):nc){
      suma=suma+A[i,j]*x[j]
    }
    x[i]=(B[i]-suma)/A[i,i]
}
  return(x)
}


sustitucion_atras(A,B)




##################################################
###########SUSTITUCIÓN HACIA ADELANTE#############
##################################################


sustitucionAdelante<-function(A,B){
  n<-nrow(A)
  x<-rep(0,n)
  
  x[1]<-B[1]/A[1,1]  
  for (i in 2:n) {
    sum<-0
    for (j in 1:(i-1)){
     sum<-sum+A[i,j]*x[j];
  }
  
   x[i]<-(B[i]-sum)/A[i,i];

  }
  return(x)

}



A=matrix(c(3,0,0,0,-1,1,0,0,3,-2,-1,0,1,-2,6,2), nrow=4,ncol=4, byrow=TRUE)
B=c(5,6,4,2)

sustitucionAdelante(A,B)


