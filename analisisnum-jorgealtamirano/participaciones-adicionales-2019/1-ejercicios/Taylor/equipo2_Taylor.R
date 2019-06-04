
x <- seq(-3,-2,.1)



f1 <- 1/x^2


f1 <- function(x){1/x^2}

funcion <- f1(x)

tabla <- data.frame(x,funcion,pn0,pa1,pa2,pa3,pa4)

pn0 <- 0.16

pn1 <- pracma::taylor(f1,-2.5,1)

p1 <- function(x){.48 +.128*x}

pa1 <- p1(x)

pn2 <- pracma::taylor(f1,-2.5,2)

p2 <- function(x){.96 +.512*x + .0768*x^2} 

pa2 <- p2(x)

pn3 <- pracma::taylor(f1,-2.5,3)

p3 <- function(x){1.6 + 1.28*x + 0.384*x^2 + 0.041*x^3}

pa3 <- p3(x)

pn4 <- pracma::taylor(f1,-2.5,4)

p4 <- function(x){2.4 + 2.56*x + 1.152*x^2 + 0.2458*x^3 + 0.0205*x^4}

pa4 <- p4(x)

library(ggplot2)
ggplot(tabla) + geom_line(aes(x=x,y=funcion)) + geom_line(aes(x=x,y=funcion)) + geom_line(aes(x=x,y=pn0)) + geom_line(aes(x=x,y=pa1)) + geom_line(aes(x=x,y=pa2)) +  geom_line(aes(x=x,y=pa3)) +  geom_line(aes(x=x,y=pa4))
