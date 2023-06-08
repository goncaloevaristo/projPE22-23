# Exercício 3
```Rstudio
library(ggplot2)
mydata <-read.table( "/home/goncaloevaristo/Documents/PE/Projeto/GENDER_EMP_19032023152556091.txt",header = TRUE, sep = "\t")
# Filter the data
mydata_men <- subset(mydata, 
                     Country == "Canada" & 
                       SEX == "MEN" & 
                       Time == 2010 &
                       Indicator == "Unemployment rate, by sex and age group" &
                       (Age.Group == "15-24" | Age.Group == "25-54" | Age.Group == "55-64"))
mydata_women <- subset(mydata, 
                       Country == "Canada" & 
                         SEX == "WOMEN" & 
                         Time == 2010 &
                         Indicator == "Unemployment rate, by sex and age group" &
                         (Age.Group == "15-24" | Age.Group == "25-54" | Age.Group == "55-64"))
df <- data.frame(
  Gender = c(rep("Women", 3), rep("Men", 3)),
  age_group = c(rep(c("15-24", "25-54", "55-64"), 2)),
  value = c(mydata_women$Value, mydata_men$Value)
)
ggplot(df, aes(x = age_group, y = value, fill = Gender)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  labs(x = "Age Group", y = "Unemployment Rate", title = "Comparison of Women and Men by Age Group")
  ```
![Gráfico](/3.png)