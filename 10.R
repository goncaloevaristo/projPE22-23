# Fixar a semente em 1187
set.seed(1187)

# Número de amostras
m <- 200

# Dimensão de cada amostra
n <- 39

# Valor esperado conhecido
mu <- 51.3

#Desvio padrão conhecido
sigma <- 2

# Nível de significância
alpha <- 0.1

#gerar amostras
samples <- matrix(rnorm(m * n, mean = mu, sd = sigma), nrow = m, ncol = n)

#média de cada amostra
sample_means <- rowMeans(samples)

#contar quantas vezes a hipótese nula é aceite
null_hypothesis_accepted <- sum(abs(sample_means - 50.1) <= qnorm(1 - alpha/2) * sigma/sqrt(n))

#calcular a probabilidade
probability_accept_H0 <- null_hypothesis_accepted / m
