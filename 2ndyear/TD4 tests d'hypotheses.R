#TD 4 feille d'ex no41, 
# ex 1
hommes = c(37, 20, 30, 28)
femmes = c(27, 7, 71, 45)

# H0 les variables sont inedpandates
# H1 les variables sont dependantes

# p value = 2.24e-5 < 5% donc on rejette H0, les variables sont dependantes
tableau = matrix(c(hommes, femmes),2,4,byrow=T)
test = chisq.test(tableau)

test$statistic
qchisq(0.95, 3)


# ex 2
tels = c(80, 50, 75, 32)
test = chisq.test(tels, p=rep(0.25, 4))
test
#p-value < 5% on rejette H0

#2eme methode
test$statistic
qchisq(0.95, 2)

# ex 3
data = read.csv2("data/Naissances 2016.csv",
                 header=FALSE,
                 stringsAsFactors=FALSE,
                 fileEncoding="latin1"
                 )
data  
names(data) = data[1,]
data = data[-1, ]
data
names(data)

# le nombre moyen de naissance quotidiennes 
table(data$`Mois de naissance`)
tablo = table(data$`Mois de naissance`)/c(31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31)
test = chisq.test(tablo)
