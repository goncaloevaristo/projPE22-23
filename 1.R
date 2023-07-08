library(ggplot2)
theme_set(theme_light())
vars <- c("gcp", "pop") 
ano <- 1991

# Lê os dados do arquivo econ.xlsx
econ <- readxl::read_excel("/home/goncaloevaristo/Documentos/PE/Projeto/econ.xlsx", sheet = "IndicadoresEcon")

# Converte a coluna "tempo" para o formato de data
econ$tempo <- as.Date(econ$tempo, format = "%d-%m-%Y")

# Filtra os dados a partir do ano especificado
ss <- subset(econ, tempo >= as.Date(paste0(ano, "-1-1")))

# Padroniza as variáveis "gcp" e "pop"
ss$gcp <- scale(ss$gcp)
ss$pop <- scale(ss$pop)

# Define as cores para as variáveis na legenda do gráfico
colmy <- c("GCP" = "darkred", "Pop." = "steelblue")

# Cria o objeto de gráfico com ggplot()
graf <- ggplot(ss, aes(x = tempo)) +

  # Adiciona as linhas para as variáveis "gcp" e "pop"
  geom_line(aes(y = gcp, color = "GCP")) + 
  geom_line(aes(y = pop, color = "Pop.")) +

  # Define o título e rótulos dos eixos e da legenda
  ggtitle("Evolução das variáveis Gasto Consumo Pessoal e População (padronizadas) entre 1991 e 2015") +
  labs(x = "Anos", y = "Valores Padronizados", color = "Variáveis") +
  scale_color_manual(values = colmy)

# Personaliza o título do gráfico
graf <- graf + theme(plot.title = element_text(color = "blue", size = 10, face = "bold.italic"))
