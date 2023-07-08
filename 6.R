# Calcula log10(1 + 1/2)
p2 <- log10(1 + (1/2))

# Calcula log10(1 + 1/8)
p8 <- log10(1 + (1/8))

# Calcula a soma das proporções p2 e p8
p <- p2 + p8

# Gera uma sequência de potências de dois de 2^2 até 2^21
potencias_de_dois <- 2^(2:21)

# Filtra as potências de dois que começam com os dígitos 2 ou 8
potencias_de_dois_2_ou_8 <- potencias_de_dois[substr(as.character(potencias_de_dois), 1, 1) %in% c("2", "8")]

# Calcula a proporção entre as potências de dois que começam com 2 ou 8 e todas as potências de dois
frac_2_ou_8 <- length(potencias_de_dois_2_ou_8) / length(potencias_de_dois)

# Calcula o desvio absoluto entre p e frac_2_ou_8
desvio_absoluto <- abs(p - frac_2_ou_8)

# Arredonda o desvio absoluto para 4 casas decimais
round(desvio_absoluto, 4)
