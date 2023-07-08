# Define a semente para a geração de números aleatórios
seed <- 1961

# Define o tamanho da amostra
n <- 109

# Define os parâmetros da distribuição Cauchy
mu0 <- 2.2
sigma2 <- 1.8
loc <- -1.4
scale <- 1.8

# Define a semente para a geração dos números aleatórios
set.seed(seed)

# Gera uma amostra da distribuição Cauchy
x <- sort(rcauchy(n, location = loc, scale = scale))

# Calcula os quantis de probabilidade da distribuição Cauchy
y1 <- qcauchy((1:n) / (n + 1), location = loc, scale = scale)

# Calcula os quantis de probabilidade da distribuição normal
y2 <- qnorm((1:n) / (n + 1), mean = mu0, sd = sqrt(sigma2))

# Cria o gráfico Q-Q
plot(x, y1, pch = 1, xlab = "Amostra ordenada",
     ylab = "Quantis de probabilidade", main = "Gráfico Q-Q")

# Adiciona os pontos para os quantis da distribuição normal
points(x, y2, pch = 3, col = 2)

# Adiciona a linha de referência y = x
abline(a = 0, b = 1, col = 4)

# Adiciona a legenda no canto inferior direito
legend(x = "bottomright", legend = c("Cauchy", "normal"),
       cex = 0.7, lwd = c(2, 2), pch = c(2, 3), col = c(1, 2))
