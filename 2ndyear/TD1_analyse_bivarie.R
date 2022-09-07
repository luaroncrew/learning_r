# ex 2.2a

boys = c(9.2, 9.6, 9.7, 9.7, 9.8, 10.5, 10.5, 10.5, 11.5, 12.4, 13.2, 13.7)
girls = c(10.4, 10.5, 10.8, 11.1, 11.8, 12.9, 13.2, 13.4, 14.2, 14.5, NA, NA)

distances = data.frame(boys, girls)

risk = 0.05

mean(boys)
confidence_range_boys = c(
  mean(boys) - qnorm(1-risk/2) * sqrt(2.2 / 12),
  mean(boys) + qnorm(1-risk/2) * sqrt(2.2 / 12)
)
confidence_range_girls = c(
  mean(girls, na.rm=TRUE) - qnorm(1-(risk)/2) * sqrt(2.4 / 10),
  mean(girls, na.rm=TRUE) + qnorm(1-(risk)/2) * sqrt(2.4 / 10)
)


# ex 2.2b

mean_difference = mean(boys) - mean(girls, na.rm=TRUE) 

risk = 0.1
difference_confidence_range = c(
  mean_difference - qnorm(1-risk/2)* sqrt((2.2)/12 + (2.4)/10),
  mean_difference + qnorm(1-risk/2)* sqrt((2.2)/12 + (2.4)/10)
)


# ex 2.3c
difference_confidence_range


# ex 3
risk = 0.05
student_test_girls = t.test(girls, conf.level = 1-risk)
student_test_girls$conf.int

student_test_boys = t.test(boys, conf.level = 1-risk)
student_test_boys$conf.int

risk = 0.1
t.test(boys, girls, var.equal = T, conf.level=1-risk)$conf.int


# ex 4
install.packages("EnvStats")
library("EnvStats")

risk = 0.05
varTest(boys, conf.level = 1 - risk)$conf.int
varTest(girls, conf.level = 1 - risk)$conf.int


# ex 5.a
out_of_range = c(
  sum((boys>13)+(boys<11))/length(boys),
  sum((girls>13),na.rm = T)+(girls<11), na.rm = T)/length(girls)
)

# ex 5.c

f1 = 10/12
f2 = 0.7
p = c(f1, f2)
p.diff = -diff(p)
risk = 0.1

confidence_range = c(
  (f1-f2) - qnorm(1-risk/2) * sqrt((f1)*(1-f1)/12 + f2*(1-f2)/10)
  (f1-f2) + qnorm(1-risk/2) * sqrt((f1)*(1-f1)/12 + f2*(1-f2)/10)
)

confidence_range
