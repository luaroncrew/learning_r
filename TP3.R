# results taken from GITHUB !!!
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

# representation TP4
over_15 = nrow(results[results$TP4 > 15, ])
pie(c(over_15, nrow(results)-over_15), labels=c('>15', '<=15'))


group_dist = table(results$Groupe.TP)

# beautiful pie chart with double labels
updated_lbls = paste(names(group_dist),'\n students:', group_dist, sep=' ')
pie(group_dist, labels=updated_lbls)


students_per_sex = table(results$Genre)
barplot(students_per_sex)


# EX 3
quiz_tot_h = results[results$Genre == 'H',]$TOTAL_QUIZ
quiz_tot_f = results[results$Genre == 'F',]$TOTAL_QUIZ

dist_quiz_h = quantile(quiz_tot_h, probs = seq(0,1,0.125), na.rm = TRUE)
dist_quiz_f = quantile(quiz_tot_f, probs = seq(0,1,0.125), na.rm = TRUE)

plot(dist_quiz_f, type='o')
lines(dist_quiz_h, type='o')

hist(quiz_tot_h, prob = TRUE, main = "Histogram of quizz points H with density curve F")
lines(density(dist_quiz_f), col = 4, lwd = 2)


mean(quiz_tot_f, na.rm=TRUE)
mean(quiz_tot_h, na.rm=TRUE)


stdevs = c()
means = c()

for (group in list(1, 2, 3, 4)) {
  print(group)
  marks = results[results$Groupe.TP == group,]$TOTAL_QUIZ
  stdevs = append(stdevs, sd(marks, na.rm=TRUE))
  means = append(means, mean(marks, na.rm=TRUE))
}


# double data series barplot of stdevs and average for quiz per TP group
barplot(rbind(stdevs,means),
        col=c("orange","yellow"),
        beside = TRUE,
        legend.text = c('stdev', 'avg'),
        names.arg = c('TP1', 'TP2', 'TP3', 'TP4'))



# top 5 students
best_scores = head(results[order(results$TOTAL_QUIZ, decreasing=TRUE),], 5)
barplot(best_scores$TOTAL_QUIZ, names.arg=best_scores$ID_etudiant)


# top 3 students of TP1 seems hardcoded w/o dplyr
top3tp1 = head(results[order(results$TOTAL_QUIZ, decreasing=TRUE), ][results$Groupe.TP == 1, ],3)


# EX 4
help('cor')

data(iris)

cor(x=iris$Sepal.Length, y=iris$Sepal.Width)

# install.packages('corrplot') before it didnt work on my computer btw...
library(corrplot)
cormatrix = cor(iris[ , -5])
corrplot(corrmatrix)
# TP4-TP2 are most correlated

