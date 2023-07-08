seed <- 1153
lambda <- 9.0
k <- 1087
set.seed(seed)
inter <- rexp(k, lambda) 
arr <- cumsum(inter)
Tk <- ceiling(arr[k])
res <- abs(lambda - mean(table(cut(arr, breaks = 0:Tk))))