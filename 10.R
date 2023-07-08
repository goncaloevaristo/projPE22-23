seed <- 1187
n <- 39
m <- 200
m0 <- 50.1
m1 <- 51.3
sigma2 <- 4
alpha <- 0.1
set.seed(seed)  
quant <- qnorm(1 - alpha / 2)
res <- 0
for (i in 1:m){
  amostra <- rnorm(n, mean = m1, sd = sqrt(sigma2))
  valorabs <- abs(sqrt(n) * (mean(amostra) - m0) / sqrt(sigma2))
  res <- res + (valorabs <= quant)
}
res <- res / m