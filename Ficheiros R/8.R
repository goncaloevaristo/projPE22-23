library(ggplot2)

# Fixar a semente
set.seed(1961)

# Definir os parâmetros da distribuição de Cauchy
localizacao_cauchy <- -1.4
escala_cauchy <- 1.8
n <- 109

# Gerar a amostra da distribuição de Cauchy
sample_cauchy <- rcauchy(n, location = localizacao_cauchy, scale = escala_cauchy)

# Ordenar os valores da amostra de Cauchy
sample_ordered_cauchy <- sort(sample_cauchy)

# Gerar os quantis de probabilidade da distribuição de Cauchy
quantis <- seq(1, n) / (n + 1)

#Cálculo dos quantis da distribuição de Cauchy
cauchy <- quantile(sample_ordered_cauchy,quantis)

# Gerar uma amostra da distribuição normal
normal <- qnorm(quantis, mean = 2.2, sd = sqrt(1.8))

cauchydata <- data.frame(Quantil = sample_ordered_cauchy, Valor = cauchy)
normaldata <- data.frame(Quantil = sample_ordered_cauchy, Valor = normal)

ggplot() + geom_point(data = cauchydata, aes(x= Valor, y = Quantil, color = "Cauchy")) +
  geom_point(data = normaldata, aes(x= Valor, y = Quantil, color = "Normal")) +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed") + 
  labs(y = "Quantis de Probabilidade", x = "Valores ordenados", title = "Amostras Normal e Cauchy") +
  guides(color = guide_legend(title = "Variáveis")) + xlim(-25, 10) + ylim(-25, 25)