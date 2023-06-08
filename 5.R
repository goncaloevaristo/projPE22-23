# fixar a semente
set.seed(1891)

# gerar amostra de tamanho n
n <- 1173
# definir parâmetro p
p <- 0.35

u <- runif(n)  # simular valores de uma distribuição uniforme (0,1)
x <- ceiling(log(1-u) / log(1-p))  # aplicar o método de transformação inversa

# calcular média e desvio padrão amostrais
mean_x <- mean(x)
sd_x <- sd(x)

# contar quantos valores são maiores que a soma da média e do desvio padrão
count <- sum(x > mean_x + sd_x)

# calcular proporção
proporcao <- count / sum(x > mean_x)

# apresentar resultado com 4 casas decimais
round(proporcao, 4)