# Exercício 1
```Rstudio
library(ggplot2)
library(readxl)
econ <-read_excel( "/home/goncaloevaristo/Documentos/PE/Projeto/econ.xlsx")
filtro <- subset(econ, tempo > "1990-12-01")
ddesemp <- filtro$ddesemp
ndesemp <- filtro$ndesemp
t <- filtro$tempo
y1 <- (ddesemp-mean(ddesemp))/sd(ddesemp)
y2 <- (ndesemp-mean(ndesemp))/sd(ndesemp)
dados <- data.frame(tempo = t)
meu_plot <- ggplot(data = dados, aes(x = tempo))
meu_plot + geom_line(aes(y = y1, color = "ddesemp")) + 
  geom_line(aes(y = y2, color = "ndesemp")) +
  labs(x = "Year", y = "Value", color = "Variables") +
  scale_color_manual(values = c("ddesemp" = "red", "ndesemp" = "blue"))
  ```

![Gráfico](/1.png)