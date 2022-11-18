donnees<-read.csv2("data/base-ic-logement-2018.csv")
str(donnees)
true_var = var(donnees$P18_LOG)
true_moyenne = mean(donnees$P18_LOG)
true_tot = sum(donnees$P18_LOG)
N = length(donnees$P18_LOG)
n = 1000
ech_indexes = sample(1:N, n)
ech = donnees[ech_indexes,]$P18_LOG

est_moyenne = mean(ech)
est_tot = est_moyenne * N
est_var_est_moyenne = (1-n/N)*var(ech)/n

vec_est_moyenne = replicate(10000, mean(donnees[sample(1:N, n),]$P18_LOG))
vect_est_tot = replicate(10000, mean(donnees[sample(1:N, n),]$P18_LOG)*N)

mean(vec_est_moyenne)
mean(vect_est_tot)
var(vec_est_moyenne)


# Q2

pop_Z = donnees[donnees$TYP_IRIS=="Z",]$P18_LOG
pop_H = donnees[donnees$TYP_IRIS=="H",]$P18_LOG
pop_A = donnees[donnees$TYP_IRIS=="A",]$P18_LOG
pop_D = donnees[donnees$TYP_IRIS=="D",]$P18_LOG

z_prop = length(pop_Z) / N
h_prop = length(pop_H) / N
a_prop = length(pop_A) / N
d_prop = length(pop_D) / N

n = 1000
n_z = round(n*z_prop)
n_a = round(n*a_prop)
n_d = round(n*d_prop)
n_h = round(n*h_prop)







