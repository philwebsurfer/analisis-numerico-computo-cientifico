library(tidyverse)

b <- c(rep(-1, 19), 1)
b2 <- b + 0.00001

A <- matrix(rep(0, 400), nrow = 20)

for (i in 1:20) {
  for (j in 1:20) {
    if (i == j)
      A[i, j] <- 1
    if (i < j)
      A[i, j] <- -1
  }
}

A

kappa(A, exact = T)

A %>% as.data.frame %>% 
  setNames(c(paste0('0', 1:9), as.character(10:20))) %>% 
  mutate(row = rev(c(paste0('0', 1:9), as.character(10:20)))) %>% 
  gather(col, val, -row) %>% 
  ggplot(aes(x = col, y = row)) +
  geom_text(aes(label = val)) +
  theme_void()


x1 <- solve(t(A) %*% A) %*% t(A) %*% b
x2 <- solve(t(A) %*% A) %*% t(A) %*% b2

df <- data.frame(sol1 = x1, sol2 = x2)
df
