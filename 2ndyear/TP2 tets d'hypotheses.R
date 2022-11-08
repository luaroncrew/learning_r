install.packages('openxlsx')
library(openxlsx)
commandes = read.xlsx('data/practical 2.xlsx', rowNames=TRUE, colNames=TRUE)

# H0 the variables are independent
# H1 the variables are statistically linked

test = chisq.test(commandes)
test$p.value # very low so the variables are dependent
test$expected

# p-value is low and lower than 5% so we reject H0

