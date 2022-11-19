# serie temporelle

Stock = read.csv2("data/Stock.csv", h=T)
Stock.ts = ts(Stock, freq=12, start=2015)

Stock.ts
time(Stock.ts)

plot(Stock.ts)


model1 = cumsum(Stock.ts)/1:28
plot(model1)


model2 = c()
for (i in 5:29){
  model2 = c(model2, mean(Stock.ts[(i-4): (i-1)]))
}
model2
plot(model2)


model3 = HoltWinters(Stock.ts, beta=F, gamma=F, l.start = Stock.ts[1])
model3
