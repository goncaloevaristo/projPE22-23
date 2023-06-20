set.seed(1153)

# Parâmetro da distribuição exponencial
lam <- 9

# Gerando a amostra
amostra <- rexp(1087, rate = lam)

# Calculando o instante de ocorrência de cada evento
s <- cumsum(amostra)

# Encontrando o menor número inteiro maior ou igual a s[1087]
T <- ceiling(s[1087])

# Dividindo o intervalo ]0,T] em intervalos de amplitude 1
limites <- seq(0, T, by = 1)

# Contando o número de eventos em cada subintervalo
contagem <- table(cut(s, breaks = limites, right = FALSE))

# Calculando a média do número de acontecimentos por subintervalo
media <- mean(contagem)

# Calculando o desvio absoluto em relação ao valor esperado
desvio_absoluto <- abs(media - lam)

# Arredondando o desvio absoluto a 4 casas decimais
desvio_absoluto <- round(desvio_absoluto, 4)
