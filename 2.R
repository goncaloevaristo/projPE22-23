library(ggplot2)
theme_set(theme_light())
ocupacoes <- c("Lazer", "Trabalho não remunerado")
grupo <- "Total"
tempo <-read.csv( "/home/goncaloevaristo/Documentos/PE/Projeto/TIME_USE_24092022.csv")
tempo <- subset(tempo, País != 'África do Sul')
dados <- subset(tempo, Sexo == grupo & Ocupação %in% ocupacoes)
ggplot(dados) +
  geom_boxplot(aes(Ocupação, Tempo)) +
  labs(title = paste0("Uso do tempo diário em vários países ", "(", grupo,")"),
       y = "Tempo médio (minutos)")