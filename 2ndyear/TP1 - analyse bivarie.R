library(pwr)
# Q1
abeilles = read.csv2('data/Abeilles(1).csv')
abeilles_a = abeilles[abeilles$Champ == 'Champ A',]
abeilles_b = abeilles[abeilles$Champ == 'Champ B',]
abeilles_c = abeilles[abeilles$Champ == 'Champ C',]

shapiro.test(abeilles_a$Temps)
qqnorm(abeilles_a$Temps)
qqline(abeilles_a$Temps)

shapiro.test(abeilles_b$Temps)
qqnorm(abeilles_b$Temps)
qqline(abeilles_b$Temps)

shapiro.test(abeilles_c$Temps)
qqnorm(abeilles_c$Temps)
qqline(abeilles_c$Temps)

# Q2
# a
t.test(abeilles_a$Temps, conf.level = 0.9)
ic = t.test(abeilles_a$Temps, conf.level = 0.9)$conf.int

#b
pvaleur = t.test(abeilles_a$Temps, mu=5)$p.value
pvaleur

puissance = power.t.test(
  n=nrow(abeilles$Temps),
  delta=mean(abeilles_a$Temps) - 5,
  sd=sd(abeilles_a$Temps),
  sig.level = 0.05,
  power=NULL,
  type='one.sample',
  alternative='two.sided'
)

# Q3
# a
abeilles_bc = abeilles[
  !abeilles$Champ == 'Champ A',
]
pvaleur = var.test(Temps~Champ, data=abeilles_bc)$p.value
pvaleur

# b
t.test(Temps~Champ, data=abeilles_bc, conf.level=0.95, var.equal=T)


# c
pvaleur = t.test(Temps~Champ, data=abeilles_bc, alternative='less', var.equal=T)$p.value

sigma = sqrt(
  ((nrow(abeilles_b$Temps)-1)*var(abeilles_b$Temps) + 
     (nrow(abeilles_c$Temps)-1)*var(abeilles_c$Temps)) /
    (nrow(abeilles_b) + nrow(abeilles_c) -2)
)
sigma


# Q4

xB = 6.41
xC = 6.68
sB = 1.15
sC = 1.03
Z = abs(xB-xC)/sqrt(sB^2/500 + sC^2/500)
pvaleur = pnorm(Z, lower.tail = F)
pvaleur


sigma=sqrt(((500-1)*sB^2+(500-1)*sC^2)/(500+500-2))
puissance=pwr.t.test(
  n=500,
  sig.level=0.05,
  power=NULL,
  d=(xB-xC)/sigma,
  type='two.sample',
  alternative='less'
)

puissance
