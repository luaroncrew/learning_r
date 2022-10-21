# CM ems

# MCAR
poids = c(90, 71, 92, 90, 79, 76, 60)
poids_h = c(92, 79)
poids_f = c(90, 71, 90, 76, 60)

est_moy_mcar = mean(poids)


# MAR
Prephommes = 2/6
Prepfemmes = 5/7

est_moy_mar = 1/13 * (mean(poids_f) * 7 + mean(poids_h) * 6)
est_moy_mar

# imputations
# imputation de la moyenne par genre = MAR
# imputation a partir de la taille
#       - mettre des valeurs plus proches
#       - par regression


