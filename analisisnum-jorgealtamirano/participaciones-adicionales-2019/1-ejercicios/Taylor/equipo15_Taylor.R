library(tidyverse)

centro <- -2.5
int <- seq(-3, -2, 0.001)

f_x <- function(x) { x^(-2) }
f1_x <- function(x) { -2*x^(-3) }
f2_x <- function(x) { 6*x^(-4) }
f3_x <- function(x) { -24*x^(-5) }
f4_x <- function(x) { 120*x^(-6) }

real <- 1/int^2
p0 <- f_x(centro)
p1 <- p0 + f1_x(centro)*(int - centro)
p2 <- p1 + 0.5*f2_x(centro)*(int - centro)^2
p3 <- p2 + (1/6)*f3_x(centro)*(int - centro)^3
p4 <- p3 + (1/24)*f4_x(centro)*(int - centro)^4

aproximaciones <- 
  data.frame(x = int,
             real = real,
             ord0 = p0,
             ord1 = p1,
             ord2 = p2,
             ord3 = p3,
             ord4 = p4)

aproximaciones %>%
  gather(aprox, valor, -x) %>% 
  ggplot(aes(x, valor)) +
  geom_line(aes(color = aprox), size = 1) +
  theme_minimal()
