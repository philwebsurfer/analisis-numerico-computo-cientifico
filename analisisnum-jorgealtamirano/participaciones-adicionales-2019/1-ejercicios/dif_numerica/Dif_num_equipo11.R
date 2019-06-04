#Function que genera la diferencia centrada
centerdif = function(x=2,h){
  (cos(x+h)-cos(x-h))/(2*h)
}

#Function que genera el error absoluto
err = function(x) {
  abs(-sin(2) - x)
}

#Vector de h
v = c(10^(-seq(1:16)))

# Aproximacion
y = centerdif(2,v)

#Error absoluto
ErrR = err(y)
 
library(ggplot2)
library(ggthemes)
 
qplot(log(v),log(ErrR))  + 
  theme_economist() +
  ggtitle('Error Absoluto vs h') + 
  labs(x = 'log(h)', y = 'log(ErrA)')


qplot(log(v),log(ErrR/abs(-sin(2)))) + 
  theme_economist() +
  ggtitle('Error Relativo vs h') + 
  labs(x = 'log(h)', y = 'log(ErrR)')
