# Fixar a semente
set.seed(1961)

# Definir os parâmetros da distribuição de Cauchy
localizacao_cauchy <- -1.4
escala_cauchy <- 1.8

# Gerar a amostra da distribuição de Cauchy
amostra_cauchy <- rcauchy(109, location = localizacao_cauchy, scale = escala_cauchy)

# Ordenar os valores da amostra de Cauchy
amostra_ordenada_cauchy <- sort(amostra_cauchy)

# Gerar os quantis de probabilidade da distribuição de Cauchy
quantis_cauchy <- seq(1, 109) / (109 + 1)

# Gerar uma amostra da distribuição normal
amostra_normal <- rnorm(109, mean = 2.2, sd = sqrt(1.8))

# Ordenar os valores da amostra normal
amostra_ordenada_normal <- sort(amostra_normal)

# Gerar os quantis de probabilidade da distribuição normal
quantis_normal <- seq(1, 109) / (109 + 1)

# Criar o gráfico
plot(amostra_ordenada_cauchy, quantis_cauchy, type = "l", col = "blue",
     xlab = "Valores Gerados (Distribuição de Cauchy)", ylab = "Quantis de Probabilidade",
     main = "Valores Gerados vs. Quantis de Probabilidade",
     xlim = c(-15, 15), ylim = c(0, 1))
lines(amostra_ordenada_normal, quantis_normal, type = "l", col = "red")
abline(a = 0, b = 1, lty = 2)

# Adicionar legenda
legend("bottomright", legend = c("Distribuição de Cauchy", "Distribuição Normal", "Reta Bissectriz"),
       col = c("blue", "red", "black"), lty = c(1, 1, 2), bty = "n")