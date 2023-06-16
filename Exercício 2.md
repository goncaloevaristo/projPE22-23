# Exercício 2
```Rstudio
library(ggplot2)
mydata <-read.csv( "/home/goncaloevaristo/Documentos/PE/Projeto/TIME_USE_24092022.csv")
mydata <- subset(mydata, País != "África do Sul")
mydata_lazer <- subset(mydata, Sexo == "Total" & Ocupação == "Lazer")
mydata_trabalho <- subset(mydata, Sexo == "Total" & Ocupação == "Trabalho não remunerado")

data <- data.frame(
  Occupation = rep(c("Leisure", "Unpaid work"), each = nrow(mydata_lazer)),
  Tempo = c(mydata_lazer$Tempo, mydata_trabalho$Tempo))
  
  ggplot(data, aes(x = Occupation, y = Tempo, fill = Occupation)) +
    geom_boxplot() +
    labs(x = "Occupation", y = "Time") +
    ggtitle("Comparison of Average Daily Time in Two Occupations")
  ```

![Gráfico](/2.png)