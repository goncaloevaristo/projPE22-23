# Define a semente para a geração de números aleatórios
seed <- 1526

# Define o tamanho da amostra
m <- 2492

# Define o tamanho da amostra para a distribuição normal
n <- 15

# Define o valor do quantil
a <- 0.54

# Define a semente para a geração dos números aleatórios
set.seed(seed)

# Cria um vetor vazio para armazenar os valores de chi quadrado
chi <- vector(length = m)

# Realiza a simulação de m amostras
for (i in 1:m) {
  # Gera uma amostra de tamanho n com distribuição normal
  amostra <- rnorm(n)
  
  # Calcula o valor de chi quadrado como a soma dos quadrados da amostra
  chi[i] <- sum(amostra^2)
}

# Calcula o desvio absoluto entre o quantil de chi quadrado e o valor esperado
res <- round(abs(quantile(chi, a, names = FALSE, type = 2) - qchisq(a, n)), 4)
