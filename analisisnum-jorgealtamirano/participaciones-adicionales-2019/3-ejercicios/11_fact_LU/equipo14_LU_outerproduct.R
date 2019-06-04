## Factorizacion LU

A1 <-matrix(c(1:9),nrow = 3)
A2 <- A1
N <- ncol(A2)  


for (k in 1:(N-1)){
     i <-  (k+1):N
    A2[i,k]<-A2[i,k]/A2[k,k]  
    A2[i,i]<-A2[i,i]-(A2[i,k]%o%A2[k,i])
  }



## Comprobacion 

L2 <-matrix(c(1,0,0,
              2,1,0,
              3,2,1),nrow = 3, ncol = 3, byrow = TRUE)
U2 <-matrix(c(1, 4,7,
              0,-3,-6,
              0, 0,0),nrow = 3, ncol = 3, byrow = TRUE)