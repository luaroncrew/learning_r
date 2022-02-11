# TP 1

# ex 1
dataframe = mtcars
anotherframe = mtcars
dim(dataframe)

colnames(x=dataframe)
str(dataframe)


dataframe[,c('cyl', 'vs', 'am', 'gear', 'carb')] = lapply(dataframe[,c('cyl', 'vs', 'am', 'gear', 'carb')], as.factor)
str(dataframe)


# ex 2
mean(dataframe$mpg)
max(dataframe$wt)
median(dataframe$hp)
quantile(dataframe$qsec)
quantile(dataframe$qsec, probs=seq(0, 1, 0.1))
sd(x=dataframe$qsec, na.rm=TRUE)
var(x=dataframe$qsec, na.rm=TRUE)

install.packages('purrr')
library(purrr)
map(dataframe[,c('cyl', 'vs', 'am', 'gear', 'carb')], table)

# ex 3

hist(x=dataframe$qsec)
boxplot(x=dataframe$qsec)
barplot(table(dataframe$carb))
pie(table(dataframe$vs))

# ex 4

# 1 mile/gal is 235.214583 l/100km so:
dataframe$consumption_per_100km <-  235.214583 / dataframe$mpg
dataframe$qsec_cut = cut(dataframe$qsec, breaks=3)

average_consumption = mean(dataframe$consumption_per_100km)
dataframe$consumption_class <- ifelse(test = (
  dataframe$consumption_per_100km >= average_consumption),
                       yes = "high consumption",
                       no = "low consumption")

