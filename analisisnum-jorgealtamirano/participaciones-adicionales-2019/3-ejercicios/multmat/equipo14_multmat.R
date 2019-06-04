
producto_matricial_con_un_for_loop<-function(A,B){
  
  nr<-nrow(A)
  nc<-ncol(B)
  c1<-matrix(, nrow = nr, ncol = nc)
  
  for(i in 1:ncol(A)){
    c1[i,]<- A[i,]%*%B
  }
  
  return(c1)
}

######### Verificamos el resultado

m1<-matrix(1:9, nrow = 3, ncol = 3)
m2<-matrix(1:9, nrow = 3, ncol = 3)

producto_matricial_con_un_for_loop(m1,m2)
m1%*%m2
