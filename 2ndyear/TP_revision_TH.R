#TP3 de revision tests d'hypotheses
measures = read.csv2('data/Kergoff.csv')

# if for shapiro test we have a small p-value, that means
# the probability of having such a distribution 
# that follows the normal distribution
# is very very low, so the hypothesis H0: distribution is normal
# could be rejected!

a = c(1, 2, 3, 1, 1, 1, 1, 1, 1, 1,1 ,1, 1, 1 ,1 ,1 ,1 )
shapiro.test(measures$NO2)
shapiro.test(a)
qqnorm(measures$NO2)

# Q2
# H0: f = 0.5 | H1: f != 0.5
n = length(measures$Direction.vent.principale)
prop.test(x=sum(measures$Direction.vent.principale%in%c("ONO", "O", "OSO")), n=n, p=0.5, correct=F)
# p-value is very low, so we reject H0.


# Q3
# H0: max temperature has an impact on the ozon concentration 
cor.test(measures$O3, measures$Temperature.max..C.)
# P-value < 0.05 so we reject H0


# Q4
# H0: MUpluie = MUnonpluie
# H1: MUpluie > MUnonpluie
pluie = measures[measures$Pluie == 'Oui',]
nonpluie = measures[measures$Pluie == 'Non',]

# at first, let's compare the standard deviation
var.test(pluie$O3, nonpluie$O3)
# p-value is very low so we consider stdev to be different for pluie and nonpluie
t.test(pluie$O3, nonpluie$O3, var.equal = F)
# the p-value is low so we consider that average o3 pollution is less exposed 
# when it's raining


# Q5

