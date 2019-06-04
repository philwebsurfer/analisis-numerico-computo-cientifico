##### Revisar estabilidad numérica de la regla del trapecio compuesta para aproximar
##### la integral de 0 a 1 de exp(-x^2)
#####
##### Realizar la gráfica del error (eje y) vs n (eje x)

library(tidyverse)
f <- function(x){exp(-x^2)}

a = 0
b = 1

n <- 1000
reg <- seq(1,100,2)

trap <- function(n){
  h = 1/n
  sumaR = 0
  for (i in 1:n){
    c = a + (h)*i
    c_0 = c - h
    sumaR = sumaR + (f(c_0) + f(c)) * h/2
    }
  sumaR
}

dat <- sapply(reg, trap)
datos <- data.frame(reg, dat) 

datos <- datos %>%
  mutate(ErrR = abs(0.746824132812 - datos[,2])/0.746824132812)

ggplot(datos)+
  geom_line(aes(x = datos$reg, y = datos$ErrR))
