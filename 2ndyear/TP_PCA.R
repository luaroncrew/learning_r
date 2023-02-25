library(FactoMineR)
weather = read.csv('data/weather2019.csv', sep=';', dec='.')

weather$OPINION = as.factor(weather$OPINION)
weather$MONTH = as.factor(weather$MONTH)
weather$DAY = as.factor(weather$DAY)
weather$WEATHER_CODE_EVENING = as.factor(weather$WEATHER_CODE_EVENING)
weather$WEATHER_CODE_MORNING = as.factor(weather$WEATHER_CODE_MORNING)
weather$WEATHER_CODE_NOON = as.factor(weather$WEATHER_CODE_NOON)

par(mfrow=c(1,3))
df2quant = weather[, c(2:15, 20, 21)]
cor(df2quant)

pca = PCA(df2quant)

plot(pca, choix='ind', habillage=17)

