# Fixar a semente
set.seed(1526)
# Definir os parâmetros
m <- 2492
n <- 15
# Simular as amostras
amostras <- matrix(rnorm(m * n), nrow = m)
# Calcular as somas dos quadrados
somas_quadrados <- rowSums(amostras^2)
# Calcular o quantil da amostra
quantil_amostra <- quantile(somas_quadrados, probs = 0.54, type = 2)
# Gerar as variáveis normais reduzidas independentes
var_normais_reduzidas <- rnorm(m)
# Calcular o quantil da distribuição teórica
quantil_teorico <- quantile(var_normais_reduzidas, probs = 0.54, type = 2)
# Calcular a diferença em valor absoluto
diferenca_absoluta <- abs(quantil_amostra - quantil_teorico)
# Arredondar a diferença em valor absoluto
diferenca_arredondada <- round(diferenca_absoluta, 4)