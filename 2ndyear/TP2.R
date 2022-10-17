data = read.csv2('data/base-ic-logement-2018.csv')

str(data)
tot = sum(data$P18_LOG)
avg = mean(data$P18_LOG)
stdev = sd(data$P18_LOG)
N = nrow(data)

n = 1000
ech_index = sample(1:N, n)
ech = data[ech,]$P18_LOG


est_moy = mean(ech)
est_tot = sum(ech)
est_stdev = sqrt((1-n/N)*var(ech)/n)

borne_inf = est_moy - 1.96 * est_stdev
borne_sup = est_moy + 1.96 * est_stdev
borne_inf
borne_sup

print('real values:')
tot
avg
stdev

print('estimated values')
est_moy
est_tot
est_stdev

nb_iteration = 1000
vect_est_moyenne = replicate(nb_iteration,
                             mean(data[sample(1:N, n),]$P18_LOG))
biais = mean(vect_est_moyenne) - avg
hist(vect_est_moyenne - avg)

# question 2
variances = tapply(data$P18_LOG, data$TYP_IRIS, var)
n=1000
stdev ** 2
variances
proportions = table(data$TYP_IRIS)/N
eff = round(n*proportions)
n = sum(eff)
eff

echantillons = vector("list", 4)
strate = c('A', 'D', 'H', 'Z')
for (i in 1:length(strate)) {
  donnees_strate = data[data$TYP_IRIS == strate[i],]
  ech = sample(1:nrow(donnees_strate), eff[i])
  echantillon = donnees_strate[ech,]$P18_LOG
  echantillons[[i]] = echantillon
}

vect_moy = sapply(echantillons, mean)
vect_var = sapply(echantillons, var)
est_moy = vect_moy %*% proportions
est_tot = est_moy * N
est_var = sum(proportions**2*(1-eff/(proportions*N))*vect_var/eff)
est_var


# question 4
vec_res_iris = data$P18_RP
vec_log_iris = data$P18_LOG
plot(vec_log_iris, vec_res_iris)

cor(vec_log_iris, vec_res_iris)
