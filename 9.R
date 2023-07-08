# Define a semente para a geração de números aleatórios
seed <- 1645

# Define o número de repetições
k <- 2000

# Define a probabilidade de sucesso
p <- 0.7

# Define o valor de gama
gama <- 0.97

# Carrega a biblioteca ggplot2
library(ggplot2)

# Define a semente para a geração dos números aleatórios
set.seed(seed)

# Define os tamanhos da amostra
tam <- c(30, 50, 100, 200, 300, 500, 1000)

# Calcula o quantil z para o valor de gama
z <- qnorm((1 + gama) / 2)

# Cria vetores vazios para armazenar os valores dos comprimentos dos intervalos de confiança
c1 <- vector(length = k)
c2 <- vector(length = k)

# Cria um data frame vazio para armazenar os resultados
res <- data.frame()

# Loop pelos tamanhos da amostra
for(n in tam) {
  # Loop pelo número de repetições
  for(i in 1:k) {
    # Gera uma amostra binomial
    amostra <- rbinom(n, 1, p)
    
    # Calcula a média da amostra
    media <- mean(amostra)
    
    # Calcula o primeiro método de construção do intervalo de confiança
    c1[i] <- sqrt((2 * media + z^2 / n)^2 - 4 * media^2 * (1 + z^2 / n)) / (1 + z^2 / n)
    
    # Calcula o segundo método de construção do intervalo de confiança
    c2[i] <- 2 * z * sqrt(media * (1 - media) / n)
  }
  
  # Armazena os resultados no data frame
  res <- rbind(res, c(n, mean(c2 - c1)))
}

# Define os nomes das colunas do data frame
names(res) <- c("n", "d")

# Cria o gráfico utilizando ggplot2
ggplot(res) +
  geom_line(aes(n, d), color = "lightblue") +
  geom_point(aes(n, d), color = "magenta") +
  labs(title = "Comparação de dois métodos de construção de IC para o parâmetro de uma população de Bernoulli",
       x = 'Tamanho da amostra',
       y = 'Diferença média dos comprimentos dos IC') +
  theme_linedraw()
