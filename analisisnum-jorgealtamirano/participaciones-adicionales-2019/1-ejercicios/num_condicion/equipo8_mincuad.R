
x <- 1:10
y <- c(1.3,3.5,4.2,5,7,8.8,10.1,12.5,13,15.6)

A <- matrix(c(1+vector('numeric',10),x,x^2,x^3),ncol=4)

# Ecuaciones Normales
A_prima = t(A)%*%A
b_prima = t(A)%*%y

kappa(A_prima,exact = T)

beta_norm = solve(A_prima,b_prima)


# Factorizacion QR
QR_desc <- qr(A)
Q <- qr.Q(QR_desc)
R <- qr.R(QR_desc)

A_QR = R
b_QR = t(Q)%*%y

kappa(A_QR,exact = T)

beta_QR = solve(A_QR,b_QR)

# LM

beta_r <- lm.fit(x = A, y=y)$coefficients

# Comparacion

norm(beta_QR - beta_r,"2") / norm(beta_r,"2")

norm(beta_norm - beta_r,"2") / norm(beta_r,"2")

