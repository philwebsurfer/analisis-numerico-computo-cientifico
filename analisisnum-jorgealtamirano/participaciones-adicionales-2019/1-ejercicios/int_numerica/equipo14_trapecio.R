# regla compuesta del trapecio
# definimos la funcion Tc_f
Tc_f<-function(limite_inf, limite_sup, intervalos, funcion){
  
  a<-limite_inf
  b<-limite_sup
  n<-intervalos
  h<-(b-a)/n # paso
  x_i<-a+(0:n)*h 
  f_x<-funcion

  aprox<-(h/(2))*(f_x(a) + f_x(b) + 2*sum(unlist(Map(f_x, x_i[2:(n-1)]))))
  return(aprox)
}

p<-Tc_f(limite_inf=0,
        limite_sup=1,
        intervalos=800,
        funcion=function(x){return(exp(-x^2))})
p
# Errores

ErrR<-abs(p-.746824)/abs(.746824)
ErrR
ErrA<-abs(p-.746824)
ErrA