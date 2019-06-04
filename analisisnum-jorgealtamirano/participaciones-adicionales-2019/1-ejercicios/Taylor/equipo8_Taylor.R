library(ggplot2)
library(tidyr)

x <- seq(-3,-2,.01)
x_0 <- -2.5

DD <- function(expr, name, order = 1) {
    if(order < 1) stop("'order' must be >= 1")
    if(order == 1) D(expr, name)
    else DD(D(expr, name), name, order - 1)
}

f <- x^-2
p_0 <- x_0^-2
p_1 <- p_0 + eval(DD(expression(x^-2), "x",1))*(x-x_0)
p_2 <- p_1 + (eval(DD(expression(x^-2), "x",2))*(x-x_0)^2)/factorial(2)
p_3 <- p_2 + (eval(DD(expression(x^-2), "x",3))*(x-x_0)^3)/factorial(3)
p_4 <- p_3 + (eval(DD(expression(x^-2), "x",4))*(x-x_0)^4)/factorial(4)

result <- data.frame(f,p_0,p_1,p_2,p_3,p_4) %>%
    gather(label,value,1:ncol(.))

ggplot(result, aes(x = rep(x,6), y = value,group = label, colour=label )) + 
    geom_line() 
