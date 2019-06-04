
# Inciso 1

# Mal condicionada
A <- matrix(c(3,1,6.2,2),nrow=2)
A_mod <- matrix(c(3.1,1,6.2,1.8),nrow=2)
b <- c(1,2)

x_est <- solve(A,b)
x_gorro <- solve(A_mod,b)

(er_rel <- norm(x_est-x_gorro,"2")/norm(x_est,"2"))
(res_sel <- norm(A%*%x_gorro-b,"2")/norm(b,"2"))

kappa(A,exact = T)

#Bien condicionada
A <- matrix(c(5,1,1,1,4,2,1,2,4),nrow=3)
A_mod <- matrix(c(5.1,1,1,1,3.9,2,1,2,4.01),nrow=3)
b <- c(1,2,3)

x_est <- solve(A,b)
x_gorro <- solve(A_mod,b)

(er_rel <- norm(x_est-x_gorro,"2")/norm(x_est,"2"))
(res_sel <- norm(A%*%x_gorro-b,"2")/norm(b,"2"))

kappa(A,exact = T)

# Inciso 2

A <- matrix(rep(-1,20*20),nrow = 20)
A[lower.tri(A)] <- 0
diag(A) <- 1

b <- c(rep(-1,19),1)
b_mod <- c(rep(-1,19),1.00001)


x_est <- solve(A,b)
x_gorro <- solve(A,b_mod)

(er_rel <- norm(x_est-x_gorro,"2")/norm(x_est,"2"))
(res_sel <- norm(A%*%x_gorro-b,"2")/norm(b,"2"))

kappa(A,exact = T)
