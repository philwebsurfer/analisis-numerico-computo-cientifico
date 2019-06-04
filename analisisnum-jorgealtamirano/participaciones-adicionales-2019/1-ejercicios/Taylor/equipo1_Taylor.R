
library(ggplot2)
library(tidyverse)

#definimos la función original
f <- function(x){
  return(1/x^2)
}
#definirmos la función de Taylor con n derivadas
P_n <- function(x,x_0,n){
  p <- 0
  i <- 0
  while(i<=n){
    g <- ((-1)^i*(i+1)*(x-x_0)^i)/(x^(i+2))
    p <- p+g
    i <- i+1
  }
  return(p)
}

x_0 <- -2.5
n <- c(0:4)
x <- c(seq(from=-3,to=-2,by=0.01))
#evaluamos la función en el intervalo [-3,-2]
f_v <- f(x)
#evaluamos para n de 0 a 4
p_n <- data.frame(p_0=P_n(x,x_0,0), p_1=P_n(x,x_0,1), p_2= P_n(x,x_0,2),p_3= P_n(x,x_0,3),p_4= P_n(x,x_0,4),x,f_v)



#graficamos las funciones obtenidas por taylor vs original

ggplot(p_n)+geom_line(aes(x=x,y=p_0))+geom_line(aes(x=x,y=p_1))+geom_line(aes(x=x,y=p_2))+geom_line(aes(x=x,y=p_3))+geom_line(aes(x=x,y=p_4))+geom_line(aes(x=x,y=f_v,colour='red'))+ylim(c(0,0.3))

