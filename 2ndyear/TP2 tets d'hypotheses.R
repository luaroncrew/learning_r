install.packages('openxlsx')
library(openxlsx)
commandes = read.xlsx('data/practical 2.xlsx', rowNames=TRUE, colNames=TRUE)

# H0 the variables are independent
# H1 the variables are statistically linked

test = chisq.test(commandes)
test$p.value # very low so the variables are dependent
test$expected

# p-value is low and lower than 5% so we reject H0

# ex 2: test of homogenity

populations = read.xlsx('data/practical 2.xlsx', 2, rowNames=TRUE, colNames=TRUE)

populations
test = chisq.test(populations$Sample.1, populations$Sample.2)
test

# p-value is 23.9% so we accept the H0: the populations in the sample and 
# the real one are the same

# H0 theoretical and the sample's distributions
# ex 2: 
freq = populations$Population/sum(populations$Population)

test = chisq.test(populations$Sample.1, p=freq)

test$p.value

# p-value is 0.004 so we reject the H0


# EX3 
populations = read.xlsx('data/practical 2.xlsx', 3,)

chisq.test(populations[,1:2])




