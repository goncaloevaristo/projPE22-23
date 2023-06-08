set.seed(1187)  # Fixar a semente em 1187
m <- 200  # Número de amostras
n <- 39  # Dimensão de cada amostra
mu <- 51.3  # Valor esperado conhecido
sigma <- 2  # Desvio padrão conhecido
alpha <- 0.1  # Nível de significância
samples <- matrix(rnorm(m * n, mean = mu, sd = sigma), nrow = m, ncol = n) #gerar amostras
sample_means <- rowMeans(samples) #média de cada amostra
null_hypothesis_accepted <- sum(abs(sample_means - 50.1) <= qnorm(1 - alpha/2) * sigma/sqrt(n)) #contar quantas vezes a hipótese nula é aceite
probability_accept_H0 <- null_hypothesis_accepted / m #calcular a probabilidade