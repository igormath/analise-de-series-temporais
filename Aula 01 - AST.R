#################################################################
# Aula 01 - Apresenta��o e Estat�sticas Descritivas
# Curso de An�lise das S�ries Temporais
# Prof. Thyago Nepomuceno
################################################################

###Carregamento dos dados###

Dados <- read.csv2("G:/Meu Drive/Drive (UFPE)/1. Teaching/Eng. de Produ��o - UFPE/An�lise das S�ries Temporais/2020.1/Aula 01/HE_Dataset_UFPE.csv")
attach(Dados)
View(Dados)

###Estat�sticas Descritivas###

summary(Dados) #M�dia, Mediana,1st Q., 3rd Q., Min, Max
summary(Dados$X.x._pub_exp_)#M�dia, Mediana,1st Q., 3rd Q., Min, Max para uma vari�vel
fivenum(Dados$X.x._pub_exp_) #Tukey min, 25th Q., Mediana, 75th Q., Max

sd(Dados$X.x._pub_exp_)  #Desvio Padr�o da Vari�vel 'Gastos P�blicos'
sd(Dados$X.y1.1._gr) #Desvio Padr�o da Vari�vel 'Taxa de Formandos'
sd(Dados$X.y1.2._publications) #Desvio Padr�o da Vari�vel 'Taxa de Publica��o'
sd(Dados$X.y1.3._PCTpat_HE) #Desvio Padr�o da Vari�vel 'Patentes'

###Defina��o das vari�veis###

X <- Dados$X.x._pub_exp_ #Atribuindo os Gastos P�blicos para a vari�vel X
Y1 <- Dados$X.y1.1._gr #Atribuindo a Taxa de Graduados para a vari�vel Y1
Y2 <- Dados$X.y1.2._publications #Atribuindo a Taxa de Publica��o para a vari�vel Y2
Y3 <- Dados$X.y1.3._PCTpat_HE #Atribuindo as Patentes para a vari�vel Y3
View(X)
View(Y1)
View(Y2)
View(Y3)

summary(X)
sd(X)

cor.test(Y1, Y2) #Teste de correla��o de Pearson entre os pares das amostras Y1 e Y2
cor.test(Y1, Y3) #Teste de correla��o de Pearson entre os pares das amostras Y1 e Y3
cor.test(Y2, Y3) #Teste de correla��o de Pearson entre os pares das amostras Y2 e Y3

###Visualiza��es Gr�ficas###

#Boxplot: An�lise visual da posi��o (a partir da mediana), dispers�o, simetria,
          #caudas e valores discrepantes (outliers) do conjunto de dados.

boxplot(X) 
boxplot(Y1)
boxplot(Y2)
boxplot(Y3)
boxplot(X, Y1, Y2, Y3)
boxplot(X, Y1, Y2, Y3, names = c("Gastos", "Graduados", "Publica��es", "Patentes"))
boxplot(X, Y1, Y2, Y3, notch = TRUE, outline = FALSE, names = c("Gastos", "Graduados", "Publica��es", "Patentes"))
boxplot(Y1, Y2, Y3, notch = TRUE, outline = FALSE, names = c("Graduados", "Publica��es", "Patentes"))
boxplot(Y1, Y2, notch = TRUE, outline = FALSE, names = c("Graduados", "Publica��es"))
title(main = "Boxplots para Graduados e Publica��es")

#Scatterplots (Gr�ficos de Disper��o): Rela��o positiva, negativa ou aleat�ria 
                                       #entre duas vari�veis

plot(Y1, Y2, xlab = "Graduados", ylab = "Publica��es") #Gr�fico de Disper��o entre Y1 e Y2 ajustado pela linha de regress�o
abline(lm(Y2~Y1), col="red")
title(main = "Gr�fico de Dispers�o")
title(main = "

    (cor = 0.2370649)",cex.main = 1)
plot(Y1, Y3) #Gr�fico dos res�duos entre Y1 e Y3 ajustado pela linha de regress�o
abline(lm(Y3~Y1), col="red")
title(main = "Gr�fico de Res�duos")
title(main = "

    (cor = 0.3729648)",cex.main = 1)
plot(Y2, Y3) #Gr�fico dos res�duos entre Y2 e Y3 ajustado pela linha de regress�o
abline(lm(Y3~Y2), col="red")
title(main = "Gr�fico de Res�duos")
title(main = "

    (cor = 0.7297745)",cex.main = 1)

#Histograma: Distribui��o da frequ�ncia dos dados em barras dividida por classes 
             #uniformemente distribu�das (mais comum).

hist(X)
hist(Y1)
hist(Y2)
hist(Y3)
hist(Y3, col = "gray", density = 20, lwd=2)
hist(Y3, col = "gray", density = 20, lwd=2, xlab = "Patentes", ylab = "Frequ�ncia", breaks = 20)
hist(Y3, col = "gray", density = 20, lwd=2, xlab = "Patentes", ylab = "Frequ�ncia", breaks = 100)

#Gr�fico Q-Q: compara��o entre duas distribui��es de probabilidade (emp�rica vs. normal)
              # pelo tra�ado e ader�ncia de seus quantis.

qqnorm(Y3)
qqline(Y3)
qqnorm(Y2)
qqline(Y2)
qqnorm(Y1)
qqline(Y1)
qqnorm(X)
qqline(X)


###Consulta ao manual dos comandos atrav�s do comando 'help()'###

help("boxplot")
help("plot")
help("hist")
