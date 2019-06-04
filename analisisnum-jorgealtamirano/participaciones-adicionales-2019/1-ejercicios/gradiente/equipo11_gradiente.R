h = 10^(-seq(1:16))

X0 = c(1,3,-2)

funcion = function(x){
  x[1]*x[2]*exp((x[1]^2)+(x[3]^2)-5)
}

err = function(x) {
  abs(funcion(X0) - funcion(x))
}

gradiente = function(x,h){
  g1 = c()
  g2 = c()
  g3 = c()
  
  for(i in seq(1:16)){
    p1 = (funcion(c(x[1]+h[i],x[2:3])) - funcion(x))/h[i]
    p2 = (funcion(c(x[1],x[2]+h[i],x[3])) - funcion(x))/h[i]
    p3 = (funcion(c(x[1:2],h[i]+x[3])) - funcion(x))/h[i]
    
    g1 = rbind(g1,p1)
    g2 = rbind(g2,p2)
    g3 = rbind(g3,p3)
  }
  
  
  return(data.frame('p1'=g1,'p2'=g2,'p3'=g3))
}


ErrR = c()

grad = gradiente(X0,h)

obj = c(9,1,-12)

for(i in 1:nrow(grad)){
  e = norm(((grad[i,]-obj)),type="2")/norm(obj,type="2")
  ErrR = rbind(ErrR,e)
}



library(ggplot2)
library(ggthemes)

qplot(log(h),log(ErrR))  + 
  theme_economist() +
  ggtitle('Error Relativo vs h') + 
  labs(x = 'log(h)', y = 'log(ErrR)')
