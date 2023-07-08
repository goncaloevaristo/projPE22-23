# Define a semente para a geração de números aleatórios
seed <- 1153

# Define o parâmetro lambda da distribuição exponencial
lambda <- 9.0

# Define o número de eventos a serem gerados
k <- 1087

# Define a semente para a geração dos números aleatórios
set.seed(seed)

# Gera os tempos interchegada dos eventos seguindo uma distribuição exponencial
inter <- rexp(k, lambda)

# Calcula os tempos de chegada cumulativos
arr <- cumsum(inter)

# Calcula o último tempo de chegada
Tk <- ceiling(arr[k])

# Calcula a diferença entre o valor médio observado e o valor esperado
res <- abs(lambda - mean(table(cut(arr, breaks = 0:Tk))))
