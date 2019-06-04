# Equipo 1

grad_cos<-function(x,h){
  (cos(x+h)-cos(x-h))/(2*h)
}

# Se utilizó un linspace de -1 a -16 con 150 puntos
x<-rep(2,150)
h<-10^(-seq(1,16,length.out=150))


errabs<-abs(-sin(x)-grad_cos(x,h))
errrel<-errabs/(abs(-sin(x)))
errR<-log(errrel)
plot(log(h),errR,type="l")



