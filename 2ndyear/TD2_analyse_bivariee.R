# TD 2 analyse bivariee

# ------- ex 1.1

n = 2918
avg = 25.23
avg_obs = 26.2
n_obs = 30

# ------ ex 1.2

# H0 - avg_obs = avg
# H1 - avg_obs != avg

risk = 0.05
obs = c(8, 17, 5, 7, 42, 2, 10, 48, 15, 22, 20,
       37, 3, 47, 50, 25, 28, 31, 45, 34, 34, 22, 40, 7, 44, 33, 25, 48, 12, 25)

# ----- ex 1.3

# p value =  2 * P(Xbarren >= avg)
# we reject the H0 if the p-value is lower than risk
stdev = 10
p_value = 2*(1 - pnorm(avg_obs, avg, sd=stdev/sqrt(n_obs)))
# so we don't reject the H0 as the p-value = 0.6 > risk

install.packages('pwr')
library('pwr')
help(pwr.norm.test)

# the probability of the rejection of H0 when it's true is the test power
test_power = pwr.norm.test(
  (avg - avg_obs)/stdev,
  n=n_obs,
  sig.level=risk,
  power=NULL,
  alternative='two.sided'
  )
# the chance to reject the H0 when it's true is 0.097 for the n we have

n_to_have_power_gt_80 = pwr.norm.test(
  (avg - avg_obs)/stdev,
  n=NULL,
  sig.level=risk,
  power=0.8,
  alternative='two.sided'
)

# so the minimal n to reject the H0 when it's true with 80% chance is 835

# ------- ex 1.4
t.test(x=obs, mu=avg)
# p-value > 5% so we don't reject the H0

test_power = pwr.t.test(
  (avg - avg_obs)/stdev,
  n=n_obs,
  sig.level=risk,
  power=NULL,
  alternative='two.sided'
)

n_to_have_power_gt_80 = pwr.t.test(
  (avg - avg_obs)/stdev,
  n=NULL,
  sig.level=risk,
  power=0.8,
  alternative='two.sided'
)


# ------- ex 2
n_obs = 10
avg = 10
avg_obs = 9.27
stdev_obs = 2.56
# H0: avg_obs < avg

help(t.test)
p_value = 1 - pt(abs(avg_obs - avg) / (stdev_obs / sqrt(n_obs)), n_obs - 1)
# p-value > risk so we don't reject the H0

# ----------- ex 3
n_obs = 500
avg = 69800
avg_obs = 68750
stdev_obs = 10350
# H0: avg_obs < avg

help(t.test)
p_value = 2*(1 - pt(abs(avg_obs - avg) / (stdev_obs / sqrt(n_obs)), n_obs - 1))
# p-value < risk so we reject the H0

# ----------- ex 4
n_obs = 400
p = 0.95
p_obs = 0.91
# H0 p > p_obs
# H1 p < p_obs
help("prop.test")
prop.test(365, 400, p, alternative='less', correct=F)
               