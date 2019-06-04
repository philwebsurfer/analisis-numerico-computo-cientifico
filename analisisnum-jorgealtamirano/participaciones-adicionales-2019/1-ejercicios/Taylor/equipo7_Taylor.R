library(ggplot2)

p_0 <- function(f, x_0){
  function(x){ f(x_0) }
}

p_1 <- function(f, x_0){
  function(x) { f(x_0) + 0.128 *(x - x_0)}
}

p_2 <- function(f, x_0){
  function(x) { f(x_0) + 0.128 *(x - x_0) +  0.1536 * (x - x_0)^2 / 2}
}

p_3 <- function(f, x_0){
  function(x) { f(x_0) + 0.128 *(x - x_0) +  0.1536 * (x - x_0)^2 / 2 + 0.24576 * (x - x_0)^3 / 6 }
}

p_4 <- function(f, x_0){
  function(x) { f(x_0) + 0.128 *(x - x_0) +  0.1536 * (x - x_0)^2 / 2 + 0.24576 * (x - x_0)^3 / 6 + 0.49152 * (x - x_0)^4 / 24
 }
}

f <- function(x){
  1/x^2
}
x_0 = -2.5
P_0 <- p_0(f, x_0)
P_1 <- p_1(f, x_0)
P_2 <- p_2(f, x_0)
P_3 <- p_3(f, x_0)
P_4 <- p_4(f, x_0)


X <- seq(-3, -2, 0.01)
ggplot(data.frame(x = X, y = P_0(X)), aes(x = x, y = y)) + 
  geom_line() + 
  geom_line(data = data.frame(x = X, y = P_1(X)), color = 'red') + 
  geom_line(data = data.frame(x = X, y = P_2(X)), color = 'blue') +
  geom_line(data = data.frame(x = X, y = P_3(X)), color = 'orange') +
  geom_line(data = data.frame(x = X, y = P_4(X)), color = 'pink') + 
geom_line(data = data.frame(x = X, y = f(X)), color = 'gray')

