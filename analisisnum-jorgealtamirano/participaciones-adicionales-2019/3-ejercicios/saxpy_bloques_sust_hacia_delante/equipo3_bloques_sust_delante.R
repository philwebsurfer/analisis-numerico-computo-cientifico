bloques = function(L, B, N_bloque) {
  N = nrow(L)
  if (N %% N_bloque != 0) {
    stop("El tamaño de la matriz debe ser divisible por el número del bloque")
  }
    
  # Inicializamos la matriz solución con 1s.
  X = matrix(data = c(1, 1, 1, 1), nrow = N, ncol = N_bloque)
  
  for (j in seq(from = 1, to = N, by = N_bloque)) {
    index_inicial = j
    index_final = j + N_bloque - 1
    X[index_inicial:index_final,1:(N_bloque)] =
      solve(
        L[(index_inicial:index_final),(index_inicial:index_final)],
        B[index_inicial:index_final, 1:N_bloque])

    for (k in seq(from = (j + N_bloque), to = (N + 1), by = N_bloque)) {
      # La siguiente validación es necesaria ya que el parámetro "to"
      # en la secuencia del for anterior es igual a (N + 1). Esto puede
      # causar un error "subscript out of bounds".
      if (k == N+1) break
      
      k_inicial = k
      k_final = k + N_bloque - 1
      
      B[k_inicial:k_final, 1:N_bloque] =
        B[k_inicial:k_final, 1:N_bloque] -
        (L[(k_inicial:k_final),(index_inicial:index_final)] %*%
           X[index_inicial:index_final,1:(N_bloque)])
    }
  }
  return (X)
}


solucion =
  bloques(
    L = matrix(data = c(3, 2, 1, 7, 0, 1, 5, 9, 0, 0, 1, 8, 0, 0, 0, 4), nrow = 4, ncol = 4),
    B = matrix(data = c(-9, 6, 2, 5, 12, -1, 0, 1), nrow = 4, ncol = 2),
    N_bloque = 2)

print("Solución de un sistema de ecuaciones en bloques de 2")
print(solucion)


solucion =
  bloques(
    L = matrix(data = c(3, -1, 3, 1, 0, 1, -2, -2, 0, 0, -1, 6, 0, 0, 0, 2), nrow = 4, ncol = 4),
    B = matrix(data = c(5, 6, 4, 2), nrow = 4, ncol = 1),
    N_bloque = 1)

print("Solución de un sistema de ecuaciones en bloques de 1")
print(solucion)

