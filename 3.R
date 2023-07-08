library(ggplot2)

# Define a URL do arquivo de dados
url <- "/home/goncaloevaristo/Documentos/PE/Projeto/GENDER_EMP_19032023152556091.txt"

# Lê os dados do arquivo delimitado por tabulação
gender <- read.delim(url, check.names = FALSE)

# Define o país de interesse
pais <- "Canada"

# Define o ano de interesse
ano <- 2010

# Define a variável de interesse
variavel <- "EMP3"

# Define as classes de idade
classes <- c("1524", "2554", "5564")

# Filtra os dados para o país, variável, sexo, classes de idade e ano selecionados
data <- subset(gender, Country == pais & IND == variavel & SEX != 'ALL_PERSONS' & AGE %in% classes & TIME == ano)

# Obtém a descrição da variável
var_desc <- data$Indicator[1]

# Cria o gráfico de colunas utilizando ggplot()
ggplot(data) +
  geom_col(aes(`Age Group`, Value, fill = SEX), position = "dodge") +
  labs(title = paste("Employment in", pais, "in", ano),
       subtitle = paste0(var_desc, " (", variavel, ")"),
       y = paste(variavel, "(%)")) +
  theme_linedraw()
