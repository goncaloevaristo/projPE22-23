library(ggplot2)
url <-"/home/goncaloevaristo/Documentos/PE/Projeto/GENDER_EMP_19032023152556091.txt"
gender <- read.delim(url, check.names = FALSE)
pais <- "Canada"
ano <- 2010
variavel <- "EMP3"

classes <- c("1524", "2554", "5564")
data <- subset(gender, Country == pais & IND == variavel & SEX != 'ALL_PERSONS' & AGE %in% classes &
                 TIME == ano)
var_desc <- data$Indicator[1]

ggplot(data) +
  geom_col(aes(`Age Group`, Value, fill = SEX), position = "dodge") +
  labs(title = paste("Employment in", pais, "in", ano),
       subtitle = paste0(var_desc, " (", variavel, ")"),
       y = paste(variavel, "(%)")) +
  theme_linedraw()