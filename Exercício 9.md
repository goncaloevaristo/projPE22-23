#### Exercício 9
```Rstudio
library(ggplot2)
set.seed(1645)
n_values <- c(30, 50, 100, 200, 300, 500, 1000)
k <- 2500
gamma <- 0.97
prob <- 0.7

length_method1 <- function(med, n, z) {
  a <- ((z^2)/n) + 1
  b <- - ((z^2)/n) - 2 * med
  c <- med^2
  discriminant <- b^2 - 4 * a * c
  p1 <- (-b + sqrt(discriminant)) / (2 * a)
  p2 <- (-b - sqrt(discriminant)) / (2 * a)
  ci_length <- Re(p1) - Re(p2)
  return(ci_length)
}

length_method2 <- function(med, n, z) {
  p1 <- med - (z * sqrt(med * (1-med) / n))
  p2 <- med + (z * sqrt(med * (1-med) / n))
  ci_length <- p2 - p1
  return(ci_length)
}

diff_means <- sapply(n_values, function(n) {
  z <- qnorm(0.5 + gamma/2)
  samples <- matrix(rbinom(k * n, size = 1, prob = prob), nrow = k)
  x_bars <- colMeans(samples)
  ci_lengths_method1 <- length_method1(x_bars, n, z)
  ci_lengths_method2 <- length_method2(x_bars, n, z)
  mean(abs(ci_lengths_method1 - ci_lengths_method2))
})

data <- data.frame(n = n_values, diff_means = diff_means)
ggplot(data, aes(x = n, y = diff_means)) + geom_line() + geom_point() +
  labs(x = "Dimensão da amostra", y = "Diferença entre intervalos de confiança") +
  ggtitle("Diferença das médias dos intervalos de confiança da distribuição de Bernoulli")

  ```
<img src="/9.png" width="50%">


 <span style="font-size: 12px;"> Ao observar o gráfico rapidamente se verifica que, conforme aumenta a dimensão da amostra, a diferença entre os intervalos de confiança vai-se tornando substancialmente mais pequena e, no limite, tenderá para zero. Com isto pode-se concluir que é viavel a utilização de qualquer um dos métodos, visto que a diferença entre os métodos vai reduzindo conforme a amostra é maior.</span>
