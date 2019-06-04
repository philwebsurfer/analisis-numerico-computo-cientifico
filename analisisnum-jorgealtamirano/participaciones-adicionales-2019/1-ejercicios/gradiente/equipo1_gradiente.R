
#definimos la funcion f(x)
f <- function(x){
  f=x[1]*x[2]*exp(x[1]^2+x[3]^2-5)
  return(f)
}
#definimos el punto x
x <- c(1,3,-2)
#evaluamos f en x
f(x)

#definimos la función para obtener el graduente de f(x)
gradiente_f <- function(f,h,x){
  grad <- rep(0,length(x))
  for(i in 1:length(x)){
    x_0 <- x
    x_0[i] <- x_0[i]+h

    grad[i] <- (f(x_0)-f(x))/h
  }
  return(grad)
}
gradiente_f(f,10^-16,x)
#definimos el vector de h
h <- c(10^(-1:-16))

aprox_grad <-matrix(nrow=length(h),ncol=length(x))
error <- rep(0,length(h))
#gradiente real
p_bueno <- c(9,1,-12)
#evaluamos los gradientes y errores para cada h
for(j in 1:length(h)){
  aprox_grad[j,] <- gradiente_f(f,h[j],x)
  error[j] <- norm(((aprox_grad[j,]-p_bueno)),type="2")/norm(p_bueno,type="2")
}
#imprimmimos los gradientes
aprox_grad 
#imprimimos los errores
error
#graficamos log(errores)vs log(h)
plot(x=log(h),y=log(error))
