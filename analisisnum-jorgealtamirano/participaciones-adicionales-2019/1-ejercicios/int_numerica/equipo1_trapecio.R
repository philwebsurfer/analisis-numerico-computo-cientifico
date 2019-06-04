# Métodos Numéricos y de Optimización
# Equipo 1

options(digits=16)
trapecio_exp<-function(n){
  a<-0;b<-1
  h<-b-a
  seq_exp<-seq(a,b,length.out=n)
  if(n<2){
    trap<-(h/2)*(exp(-a^2)+exp(-b^2))
  }
  else{
    trap<-(h/(2*n))*(exp(-a^2)+exp(-b^2)+2*sum(exp(-seq_exp[2:(length(seq_exp)-1)])))
  }
  return(trap)
}

real<-0.746824132812

# Error total
err_tot<-numeric()
n<-1000
for(i in 1:n)
  err_tot[i]<-abs((trapecio_exp(i)-real))

# Error relativo
err_rel<-err_tot/abs(real)

plot(1:n,err_rel,type="l")
plot(1:n,err_tot,type="l")
