library(ggplot2)

# Define o tema do gráfico como "theme_light()"
theme_set(theme_light())

# Define as ocupações de interesse
ocupacoes <- c("Lazer", "Trabalho não remunerado")

# Define o grupo de interesse
grupo <- "Total"

# Lê os dados do arquivo CSV
tempo <- read.csv("/home/goncaloevaristo/Documentos/PE/Projeto/TIME_USE_24092022.csv")

# Filtra os dados excluindo observações do país 'África do Sul'
tempo <- subset(tempo, País != 'África do Sul')

# Filtra os dados para o grupo e ocupações selecionados
dados <- subset(tempo, Sexo == grupo & Ocupação %in% ocupacoes)

# Cria o gráfico de boxplot usando ggplot()
ggplot(dados) +
  geom_boxplot(aes(Ocupação, Tempo)) +
  labs(title = paste0("Uso do tempo diário em vários países ", "(", grupo, ")"),
       y = "Tempo médio (minutos)")
