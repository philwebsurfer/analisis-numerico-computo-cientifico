A <- matrix(c(3,2,1,7,0,1,5,9,0,0,1,8,0,0,0,4),ncol=4)
b <- matrix(c(-9,6,2,5,12,-1,0,1),ncol=2)
t_bloque <- 2


triang_inf_bloq <- function(A,b,t_bloque){
  n <- dim(b)[1]
  m <- dim(b)[2]
  

  X <- matrix(rep(0,m*n),ncol=m)
  num_bloque <-n/t_bloque 
  for(i in 1:num_bloque){
    n_sub <- ((i-1)*t_bloque+1)
    m_sub <- (t_bloque*i)

    A_sub <- A[n_sub:m_sub,n_sub:m_sub]
    b_sub <- b[n_sub:m_sub,1:m]

    x <- matrix(rep(0,t_bloque*m),ncol=m)
    for(j in 1:m){
      n_s <- dim(A_sub)[2]
      x_s <- rep(0,times=n_s)
      x_s[1] <- b_sub[1,j]/A_sub[1,1]

      for(l in 1:(n_s-1)){
        b_sub_sub <-b_sub[-1,j]-x_s[l]%*%A_sub[-(1:(l)),(l)]
        x_s[l+1] <- b_sub_sub[1]
      }
      x[,j] <- x_s

    }

    X[(((i-1)*t_bloque)+1):(i*t_bloque),] <- x

    for(k in 1:(num_bloque-i)){
      n_bloq <- (k*t_bloque+1)
      m_bloq <- ((k+1)*t_bloque)
      b[n_bloq:m_bloq,] <- b[n_bloq:m_bloq,]-A[n_bloq:m_bloq,n_sub:m_sub] %*% x
      
    } 
  }
  return(X)
  
}

res <- triang_inf_bloq(A,b,t_bloque)
res
