library(ggplot2)
theme_set(theme_light())
vars <- c("gcp", "pop") 
ano <- 1991

econ <- readxl::read_excel("/home/goncaloevaristo/Documentos/PE/Projeto/econ.xlsx", sheet = "IndicadoresEcon")
econ$tempo <- as.Date(econ$tempo, format = "%d-%m-%Y")
ss <- subset(econ, tempo >= as.Date(paste0(ano, "-1-1")))
ss$gcp <- scale(ss$gcp)
ss$pop <- scale(ss$pop)

colmy <- c("GCP"="darkred", "Pop." = "steelblue")
graf <- ggplot(ss, aes(x = tempo))+
  geom_line(aes(y = gcp, color = "GCP")) + 
  geom_line(aes(y = pop, color = "Pop.")) +
  ggtitle("Evolução das variáveis Gasto Consumo Pessoal e População (padronizadas) entre 1991 e 2015") +
  labs(x = "Anos", y = "Valores Padronizados", color = "Variáveis") +
  scale_color_manual(values = colmy)  

graf + theme(plot.title = element_text(color = "blue", size = 10, face = "bold.italic"))