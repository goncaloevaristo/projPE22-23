p2 <- log10(1+(1/2))
p8 <- log10(1+(1/8))
p <- p2+p8

potencias_de_dois <- 2^(2:21)
potencias_de_dois_2_ou_8 <- potencias_de_dois[substr(as.character(potencias_de_dois), 1, 1) %in% c("2", "8")]
frac_2_ou_8 <- length(potencias_de_dois_2_ou_8) / length(potencias_de_dois)

desvio_absoluto <- abs(p - frac_2_ou_8)
round(desvio_absoluto, 4)