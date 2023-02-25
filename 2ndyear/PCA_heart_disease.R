library(FactoMineR)
heart_disease = read.csv('data/Heart_disease_details.csv')
pca = PCA(heart_disease[,c(3, 4, 5, 6, 9, 10, 14, 27)])
