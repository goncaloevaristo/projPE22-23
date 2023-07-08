# Define a semente para a geração de números aleatórios
seed <- 1187

# Define o tamanho da amostra
n <- 39

# Define o número de repetições
m <- 200

# Define o valor da média sob a hipótese nula
m0 <- 50.1

# Define o valor da média sob a hipótese alternativa
m1 <- 51.3

# Define a variância
sigma2 <- 4

# Define o nível de significância
alpha <- 0.1

# Define a semente para a geração dos números aleatórios
set.seed(seed)

# Calcula o quantil para o nível de significância
quant <- qnorm(1 - alpha / 2)

# Inicializa o resultado como zero
res <- 0

# Loop pelo número de repetições
for (i in 1:m) {
  # Gera uma amostra aleatória com distribuição normal
  amostra <- rnorm(n, mean = m1, sd = sqrt(sigma2))
  
  # Calcula o valor absoluto do teste estatístico
  valorabs <- abs(sqrt(n) * (mean(amostra) - m0) / sqrt(sigma2))
  
  # Verifica se o valor absoluto está abaixo do quantil
  res <- res + (valorabs <= quant)
}

# Calcula a probabilidade de rejeição da hipótese nula
res <- res / m
