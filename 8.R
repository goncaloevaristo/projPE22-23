seed <- 1961
n <- 109
mu0 <- 2.2
sigma2 <- 1.8
loc <- -1.4
scale <- 1.8

set.seed(seed)

x <- sort(rcauchy(n, location = loc, scale = scale))
y1 <- qcauchy((1:n) / (n + 1), location = loc, scale = scale)
y2 <- qnorm((1:n) / (n + 1), mean = mu0, sd = sqrt(sigma2))

plot(x, y1, pch = 1, xlab = "Amostra ordenada", 
     ylab = "Quantis de probabilidade", main = "Gráfico Q-Q")
points(x, y2, pch = 3, col = 2)
abline(a = 0, b = 1, col = 4)
legend(x = "bottomright", legend = c("Cauchy", "normal"),
       cex = 0.7, lwd = c(2,2), pch = c(2, 3), col = c(1, 2))