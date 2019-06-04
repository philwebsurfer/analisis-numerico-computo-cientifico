library(tidyverse)

n <- seq(100, 10000, 10)
fx <- function(x) { exp(-x^2) }

trapecio <- function(num_part) {
  
  particiones <- seq(0, 1, length.out = num_part + 1)
  
  h <- (particiones[num_part+1] - particiones[1]) / num_part
  
  sumatoria <- sum(fx(particiones[-c(1, (num_part + 1))]))
  
  aproximacion <- h / 2 * (fx(0) + fx(1) + 2 * sumatoria)  
  
}

aprox <- map(n, ~trapecio(.)) %>% flatten_dbl()

real <- 0.746824132812

df <- data.frame(n = n,
           errRel = abs(real - aprox) / real)

df %>% 
  ggplot(aes(n, errRel)) +
  geom_line(size = 1, color = 'royal blue') +
  theme_minimal()
