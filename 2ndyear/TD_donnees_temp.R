# SAE donnees temp

freq = read.csv2('data/Fréquentation.csv')

visites = ts(freq$Visites, start=c(1994, 1), frequency=1)
plot(visites)
lreg = lm(visites~freq$Anne)
abline(lreg)
lissage_exp_double = HoltWinters(visites[1:28], alpha=NULL, beta=NULL, gamma=F)
lissage_exp_double$fitted


# Q2

library(readxl)
file = read_excel("data/AirPassengers.xlsx")
model = decompose(AirPassengers, type='multiplicative')
plot(model)


scvs = AirPassengers/model$seasonal
plot(scvs)


ml_scvs = lm(scvs~seq(from=1949, by=1/12, length=144))
plot(ml_scvs)
seasonal_predictions = ml_scvs$fitted.values * model$seasonal
plot(seasonal_predictions)
plot(model$x)
