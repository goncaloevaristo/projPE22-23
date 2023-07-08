seed <- 1526
m <- 2492
n <- 15
a <- 0.54
set.seed(seed)
chi <- vector(length = m)
for (i in 1:m){
  amostra <- rnorm(n)
  chi[i] <- sum(amostra^2)
}
res <- round(abs(quantile(chi, a, names = FALSE, type = 2) - qchisq(a, n)), 4)