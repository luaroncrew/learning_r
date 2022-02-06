library(questionr)

data(hdv2003)

View(x = hdv2003)

d = hdv2003

# getting info about existing table
nrow(x = d)
ncol(x = d)
colnames(x = d)
str(object = d)

d$sexe
head(x = d$age)
tail(x = d$age, 10)


# creation of new variables
head(x = d$heures.tv, n = 10)
d$minutes.tv <- d$heures.tv * 60
head(x = d$minutes.tv)


# creating temporary column
d$temp <- NA
d$temp
class(d$temp)
# deleting column
ncol(x = d) # before
d$temp = NULL
ncol(d)


# some short analysis
min(d$age)
median(d$age)

# dispersion indicators, stats
max(d$age) - min(d$age)
var(x = d$age)
sd(x = d$age)
quantile(x = d$age, probs = 0.25)
quantile(x = d$age, probs = 0.75)
summary(object = d$age) # i would probably dream about this function!!


# some graphs
hist(x = d$age)
hist(x = d$age, breaks = 20)

hist(x = d$age, col = "skyblue",
     main = "Répartition des ages des enquêtés",
     xlab = "age",
     ylab = "Effectif")


boxplot(x = d$age, main = "Distribution de l'age")

table(x = d$sexe)
table(x = d$qualif)

tab <- table(x = d$qualif, useNA = "always")
sort(tab)
summary(object = d$qualif)

# tab de frequencies
freq(x = d$qualif)
freq(x = d$qualif, valid = FALSE, total = TRUE, sort = "dec")


tab <- table( x = d$qualif )
barplot(height = tab, main = 'Répartition par qualification', las= 2, cex.names = 0.4)

tab <- table(x = d$sexe)
pie(x = tab)