# Soal 1
# 1a
# Data Sebelum melakukan aktivitas
x <- c(78, 75, 67, 77, 70, 72, 28, 74, 77)
# Data Setelah melakukan aktivitas
y <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

sd(x-y)

# 1b
t.test(x, y, alternative = "greater", var.equal = FALSE)

# 1c
var.test(x, y)
t.test(x, y, mu = 0, alternative = "two.sided", var.equal = TRUE)

# Soal 2
zsum.test(mean.x=23500, sigma.x = 3900, n.x = 100,  
          alternative = "less", mu = 20000,
          conf.level = 0.95)

# Soal 3
# 3b 
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, mean.y =2.79 , s.y = 1.32, 
          n.y = 27, alternative = "two.side", var.equal = TRUE)

# 3c
n1 <- 19
n2 <- 27
mean1 <- 3.64
mean2 <- 2.79
sd1 <- 1.67
sd2 <- 1.32
alpha <- 0.05
df <- 2

t_tabel <- qt(p=alpha/2,df=df,lower.tail = FALSE)
t_tabel
# 3d
sp <- sqrt(((n1-1)*sd1^2 + (n2-1)*sd2^2)/(df))
sp
T_value <- (mean1-mean2)/(sp*sqrt((1/n1)+(1/n2)))
T_value

# soal 4
# 4a
df4 <- read.delim("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt")

library(ggpubr)
ggboxplot(df4, x = "Group", y = "Length", 
          color = "Group",
          ylab = "Length", xlab = "Group")

# 4b
library(onewaytests)
bartlett.test(Length ~ Group, data = df4)

# 4c
Model1 <- lm(formula = Group ~ Length, data = df4)
print(Model1)

# 4d
summary(Model1)$coefficients[2,4]

# soal 5
# 5a
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)

# membaca dan mengecek data
GTL <- read_csv("https://drive.google.com/u/0/uc?id=1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ&export=download")
head(GTL)
str(GTL)

# membuat plot sederhana
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)

# 5b
# membuat variabel sebagai faktor untuk ANOVA
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)

# menghitung varians
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)

# 5c
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)

# 5d
tukey <- TukeyHSD(anova)
print(tukey)

# 5e
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)

cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
