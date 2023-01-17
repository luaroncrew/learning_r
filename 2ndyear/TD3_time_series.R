visitors = read.csv2('data/Cinema - mensuel.csv')

# remove non-stationnary ts
visitors_time_series = ts(visitors$Entrées[241:480], start=c(2000, 1), freq=12)

plot(visitors_time_series)
dc = decompose(visitors_time_series)

plot(dc)

fit = HoltWinters(visitors_time_series)
plot(fit)

# forecasting 120 months
library(forecast)
plot(forecast(fit, 24))
forecast(fit, 24)

# calculating model error
sum(dc$random, na.rm = TRUE)
