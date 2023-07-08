# Fixar a semente para garantir a reprodutibilidade dos resultados
set.seed(1891)

# Gerar amostra de tamanho n
n <- 1173

# Definir parâmetro p
p <- 0.35

# Simular valores de uma distribuição uniforme (0,1)
u <- runif(n)

# Aplicar o método de transformação inversa para obter valores da distribuição desejada
x <- ceiling(log(1-u) / log(1-p))

# Calcular a média e o desvio padrão amostrais
mean_x <- mean(x)
sd_x <- sd(x)

# Contar quantos valores são maiores que a soma da média e do desvio padrão
count <- sum(x > mean_x + sd_x)

# Calcular a proporção
proporcao <- count / sum(x > mean_x)

# Apresentar o resultado com 4 casas decimais
round(proporcao, 4)
