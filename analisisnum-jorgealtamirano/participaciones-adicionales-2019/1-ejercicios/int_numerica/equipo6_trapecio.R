#Trapecio
#Se define la fórmula del trapecio para aproximar integrales
#Limite inferior (a) y superior (b)
a=0
b=1
#Número de subintervalos de a a b
n=10
#Ancho de los subintervalos
h=(b-a)/n
#Vector que contiene los n valores de x. Es decir, x1, x2,...,xn
x=seq(a,b,(b-a)/n)
#Cada elemento de x se eleva al cuadrado
x_2=x^2
#obtención de los valores de y. Es decir, y1, y2,...,yn
y=exp(-x_2)
#Resultado de aplicar la fórmula simplificada del trapecio
R=h*(sum(y)-(0.5*(y[1]+y[n])))

#El cálculo anterior se puede obtener por medio de una función:
Fn_Trapecio=function(a,b,n)
{
  h=(b-a)/n
  x=seq(a,b,(b-a)/n)
  x_2=x^2
  y=exp(-x_2)
  R=h*(sum(y)-(0.5*(y[1]+y[n])))
  return(R)
}
Fn_Trapecio(0,1,100)

#Se define el error relativo de la siguiente forma:
# ErrR=abs(p-o)/abs(o)

#Se define una función para calcular el Error relativo vs sus iteraciones:
# El valor objetivo (o) es dado por el profesor.
Fn_ErrR=function(a,b,m)
{
  obj=0.746824132
  ErrR=rep(0,m)
  for (i in 1:m) 
  {
    ErrR[i]=abs(Fn_Trapecio(a,b,i)-obj)/abs(obj) 
  }
  return(ErrR)
}  
#Ahora se busca comparar el Error Relativo conforme el ancho de los subintervalos decrece
# con el fin de graficar la eficiencia del algoritmo.
Fn_ErrR(0,1,100)
plot(Fn_ErrR(0,1,100),main = "Error Relativo del Trapecio Vs Ancho de intervalo", xlab = "Divisor del ancho del intervalo", 
     ylab = "Error Relativo del Trapecio", line=3)
lines(Fn_ErrR(0,1,100),main = "Error Relativo del Trapecio Vs Ancho de intervalo", xlab = "Divisor del ancho del intervalo", 
     ylab = "Error Relativo del Trapecio", line=3)

