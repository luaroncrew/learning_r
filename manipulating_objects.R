# object manipulations

# list : can stock objects of different types
trash_can = list('Paris', c(12, 13, 14), TRUE, 91, 'and so', matrix(1:15, nrow=3))
# giving the names to elements
names(trash_can) = c('capital', 'car numbers', 'status', 'region', 'idk', 'neo is in')
trash_can['capital'] # >>> Paris
trash_can$capital # >>> Paris
trash_can$status = FALSE # rewriting values
trash_can$countries = c('France', 'USA', 'UK', 'Russia')


# creation of little matrix
matr <- matrix(data = c('France', 'Russia', 'Paris', 'Moscow', 'Salut', 'Privet'), nrow = 2,
                          dimnames =  list(c("ligne1","ligne2"),
                                           c("country","city","hello")))

# get first line
matr[1,]

# get second column
matr[,2]

# print everything except 1st line and third column
matr[-1, -3]

# La classe d’objet data.frame partage les mêmes propriétés 
# que la classe matrix pour l’indexation. Un data frame c’est 
# une collection de vecteurs de même taille stockés dans un objet
# à deux dimensions. Autrement dit, dans un data frame, chaque colonne est
# un vecteur avec son propre type 
# (numeric, character, factor, logical, date, etc.). 
# Dans cette partie nous allons voir comment manipuler un data.frame 
# sans utiliser le package dplyr.

dfmatrinx = as.data.frame(matr)

# boolean indexing
cars = c('toyota', 'mazda', 'ford')
cars[c(TRUE, FALSE, TRUE)] # >>> "toyota" "ford"  


