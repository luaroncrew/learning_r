init_data = read.csv2('data/dep69.csv')
str(init_data)
N = nrow(init_data)

# calculating the actual total, mean and stdev2
total = sum(init_data$Pop_totale)
avg = mean(init_data$Pop_totale)
stdev = sd(init_data$Pop_totale)


# question 1
ech_indx = sample(1:N, 27)
ech = init_data[ech_indx,]$Pop_total


est_avg = mean(ech)
est_tot = sum(ech)
est_var = (1-27/275)*var(ech)/n


est_vec = replicate(10000, init_data[sample(1:N, 27),]$Pop_total)
biais = mean(est_vec) - avg
hist(est_vec-avg)


# question 2

p = 0.1
vect_alea = runif(N)
ech_idx = (vect_alea < p)
ech_bernou = init_data[ech_idx,]$Pop_total
length(ech_bernou)
est_ech_mean = mean(ech_bernou)
stdev_ech = sd(ech_bernou)
hist(abs(ech_bernou - avg))


# question 3

install.packages('sampling')
library(sampling)
ech = inclusionprobabilities((init_data$Code.canton==0)*3+1, 27)
ech = UPsystematic(ech)
head(ech)
sum(ech)
