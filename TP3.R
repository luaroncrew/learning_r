results = read.csv('datasets/students_results.csv', sep=';')

# EX 1
nrow(results)
ncol(results)

colnames(results)
str(results)

results[, c('Groupe.TP', 'Groupe.TD')] = lapply(results[, c('Groupe.TP', 'Groupe.TD')], as.factor)
str(results)

# EX 2
results$TOTAL_QUIZ = results$QUIZ1 + results$QUIZ2
str(results)

results$AVG_QUIZ = results$TOTAL_QUIZ/2

hist(results$TOTAL_QUIZ)

# replacing comas by points
results$TP4 = gsub(',', '.', results$TP4)
results$TP2 = gsub(',', '.', results$TP2)
results$TP1 = gsub(',', '.', results$TP1)

# making floats of values
results$TP4 = as.double(results$TP4)
results$TP2 = as.double(results$TP2)
results$TP1 = as.double(results$TP1)

quantile(x=results$TP4, seq(0, 1, 0.1), na.rm = TRUE)

over_15 = nrow(results[results$TP4 > 15, ])
pie(c(over_15, nrow(results)-over_15), labels=c('>15', '<=15'))

table(results$Groupe.TP)




