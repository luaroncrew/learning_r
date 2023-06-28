# TD 3
# ex1
library(FactoMineR)
data = read.csv2('data/AFC_vertigo.csv')
analysis = CA(data[,-1])
analysis

#ex 2
data = read.csv2('data/Vins.csv')
str(data)

analysis = MCA(data)
plot(analysis,invisible=c("ind"),cex=0.8)
analysis$var
analysis$eig

data = read.csv2('data/Vins_bis.csv')
str(data)
analysis = MCA(data)
plot(analysis,invisible=c("ind"),cex=0.8)
analysis$var
analysis$eig
