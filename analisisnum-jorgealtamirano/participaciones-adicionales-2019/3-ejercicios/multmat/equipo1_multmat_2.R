# Equipo 1
library(sys)
# Ejercicio sección 3.1.1

#### Algoritmo ijk ####

# Nivel 1:
ijk_nivel1<-function(A,B){
  t0<-Sys.time()
  m<-nrow(A)
  r<-ncol(A)
  n<-ncol(B)
  C<-matrix(rep(0,m*n),nrow=m)
  for(i in 1:m)
    for(j in 1:n)
      for(k in 1:r)
        C[i,j]<-C[i,j]+A[i,k]*B[k,j]
  return(list(matrix = C, time = Sys.time()-t0))
}

# Nivel 2:
ijk_nivel2<-function(A,B){
  t0<-Sys.time()
  m<-nrow(A)
  r<-ncol(A)
  n<-ncol(B)
  C<-matrix(rep(0,m*n),nrow=m)
  for(i in 1:m)
    for(j in 1:n)
      C[i,j]<-C[i,j]+A[i,]%*%B[,j]
  return(list(matrix = C, time = Sys.time()-t0))
}

# Nivel 3:
ijk_nivel3<-function(A,B){
  t0<-Sys.time()
  m<-nrow(A)
  r<-ncol(A)
  n<-ncol(B)
  C<-matrix(rep(0,m*n),nrow=m)
  for(i in 1:m)
    C[i,]<-C[i,]+A[i,]%*%B
  return(list(matrix = C, time = Sys.time()-t0))
}

#### Algoritmo kij ####

# Nivel 1:
kij_nivel1<-function(A,B){
  t0<-Sys.time()
  m<-nrow(A)
  r<-ncol(A)
  n<-ncol(B)
  C<-matrix(rep(0,m*n),nrow=m)
  for(k in 1:r)
    for(i in 1:m)
      for(j in 1:n)
        C[i,j]<-C[i,j]+A[i,k]*B[k,j]
  return(list(matrix = C, time = Sys.time()-t0))
}

# Nivel 2:
kij_nivel2<-function(A,B){
  t0<-Sys.time()
  m<-nrow(A)
  r<-ncol(A)
  n<-ncol(B)
  C<-matrix(rep(0,m*n),nrow=m)
  for(k in 1:r)
    for(i in 1:m)
      C[i,]<-C[i,]+A[i,k]*B[k,]
  return(list(matrix = C, time = Sys.time()-t0))
}

# Nivel 3:
kij_nivel3<-function(A,B){
  t0<-Sys.time()
  m<-nrow(A)
  r<-ncol(A)
  n<-ncol(B)
  C<-matrix(rep(0,m*n),nrow=m)
  for(k in 1:r)
    C<-C+A[,k]%*%t(B[k,]) # Trasponemos porque R convierte a vector columna cuando llamamos filas o renglones
  return(list(matrix = C, time = Sys.time()-t0))
}

#### Algoritmo ikj ####

# Nivel 1:
ikj_nivel1<-function(A,B){
  t0<-Sys.time()
  m<-nrow(A)
  r<-ncol(A)
  n<-ncol(B)
  C<-matrix(rep(0,m*n),nrow=m)
  for(i in 1:m)
    for(k in 1:r)
      for(j in 1:n)
        C[i,j]<-C[i,j]+A[i,k]*B[k,j]
  return(list(matrix = C, time = Sys.time()-t0))
}




# Nivel 2:
ikj_nivel2<-function(A,B){
  t0<-Sys.time()
  m<-nrow(A)
  r<-ncol(A)
  n<-ncol(B)
  C<-matrix(rep(0,m*n),nrow=m)
  for(i in 1:m)
    for(k in 1:r)
      C[i,]<-C[i,]+A[i,k]*B[k,]
  return(list(matrix = C, time = Sys.time()-t0))
}

# Nivel 3:
ikj_nivel3<-function(A,B){
  t0<-Sys.time()
  m<-nrow(A)
  r<-ncol(A)
  n<-ncol(B)
  C<-matrix(rep(0,m*n),nrow=m)
  for(i in 1:m)
    C[i,]<-C[i,]+A[i,]%*%B
  return(list(matrix = C, time = Sys.time()-t0))
}

# Pruebas

library(Matrix)

set.seed(50)
n<-20
m<-30
r<-15
A<-matrix(rnorm(m*r,0,1),nrow=m)
B<-matrix(rnorm(r*n,0,1),nrow=r)

# Calculamos normas de Frobenius de todos y comparamos

# Método ijk
mod_ijk<-data.frame(Frobenius = double() , Time = double()) # Este modelo incluye la medida  del tiempo
W <- ijk_nivel1(A,B)
X <- ijk_nivel2(A,B)
Y <- ijk_nivel3(A,B)
mod_ijk[1,1]<-norm(W$matrix,type="F")
mod_ijk[2,1]<-norm(X$matrix,type="F")
mod_ijk[3,1]<-norm(Y$matrix,type="F")
mod_ijk[1,2]<-W$time
mod_ijk[2,2]<-X$time
mod_ijk[3,2]<-Y$time

# Método kij
mod_kij<-numeric()
mod_kij[1]<-norm(kij_nivel1(A,B)$matrix,type="F")
mod_kij[2]<-norm(kij_nivel2(A,B)$matrix,type="F")
mod_kij[3]<-norm(kij_nivel3(A,B)$matrix,type="F")

# Método ikj
mod_ikj<-numeric()
mod_ikj[1]<-norm(ikj_nivel1(A,B)$matrix,type="F")
mod_ikj[2]<-norm(ikj_nivel2(A,B)$matrix,type="F")
mod_ikj[3]<-norm(ikj_nivel3(A,B)$matrix,type="F")

# Todos son iguales por lo que son equivalentes los métodos