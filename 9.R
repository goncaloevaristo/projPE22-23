seed <- 1645
k <- 2000
p <- 0.7
gama <- 0.97

library(ggplot2)
set.seed(seed)

tam <- c(30, 50, 100, 200, 300, 500, 1000)
z <- qnorm((1 + gama) / 2)
c1 <- vector(length = k)
c2 <- vector(length = k)
res <- data.frame()
for(n in tam) {
  for(i in 1:k) {
    amostra <- rbinom(n, 1, p)
    media <- mean(amostra)
    c1[i] <- sqrt((2 * media + z^2 / n)^2 - 4 * media^2 * (1 + z^2 / n)) / (1 + z^2 / n)
    c2[i] <- 2 * z * sqrt(media * (1 - media) / n)
  }
  res <- rbind(res, c(n, mean(c2 - c1)))
}
names(res) <- c("n", "d")

ggplot(res) +
  geom_line(aes(n,  d), color = "lightblue") +
  geom_point(aes(n, d), color = "magenta") +
  labs(title = "Comparação de dois métodos de construção de IC para o parâmetro de uma população de Bernoulli",
       x = 'Tamanho da amostra',
       y = 'Diferença média dos comprimentos dos IC') +
  theme_linedraw()