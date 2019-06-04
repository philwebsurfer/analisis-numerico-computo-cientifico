
x = seq(0,1,10^-3)

y = 0

hat = c(rep(0,length(x)-2))
err = c(rep(0,length(x)-2))

for(i in 2:(length(x)-1)){
  a = x[i-1]
  b = x[i]
  d = (a+b) / 2
  y = y + (exp(-(d^2)))
  hat[i] = (exp(-(a^2)) + exp(-(b^2)) + 2*y) / (2*i)
  err[i] = abs(hat[i] - 0.7468241328124271) / 0.7468241328124271
}


library(ggplot2)

qplot(x = x[2:length(x)-2], y = err[2:length(err)]) +
  labs(x='n', y = 'ErrR')

