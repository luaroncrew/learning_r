# ex 1

# install.packages("tidyverse") before using

library(readxl)
library(dplyr)

# reading excel file and transforming it into a dataframe 
pokemons = as.data.frame(read_excel(path='datasets/pokemon.xlsx', sheet='pokemon'))
class(pokemons)

# number of lines and columns with their types
str(pokemons)
ncol(pokemons)
nrow(pokemons)


# column names
colnames(pokemons)

pokemons$generation = as.factor(pokemons$generation)
pokemons$is_legendary = as.factor(pokemons$is_legendary)
pokemons$type = as.factor(pokemons$type)

# to print all the columns and types w/o using str() 
map(pokemons, class)


# ex 2 

mean(pokemons$weight_kg, na.rm=TRUE)
median(pokemons$weight_kg, na.rm=TRUE)
quantile(pokemons$height_m, na.rm=TRUE)
quantile(pokemons$height_m, na.rm=TRUE, probs=seq(0, 1, 0.1))
weight_var = var(pokemons$weight_kg, na.rm=TRUE)
weight_stdev = sqrt(weight_var)
weight_stdev
weight_var

show_ordered_factor = function(column){
  sort(table(column), decreasing=TRUE)
}
# from purrr package
map(pokemons[, c('generation', 'is_legendary', 'type')], show_ordered_factor)


# EX 3

represent_selection = function(rows=NA, columns=NA){
  if (is.na(rows)){
    rows = 1:dim(pokemons)[1]
  }
  if (is.na(columns)){
    columns = 1:dim(pokemons)[2]
  }
  selection = pokemons[rows, columns]
  print(dim(selection))
  return(selection)
}


represent_selection(NA, c('nom', 'is_legendary'))
represent_selection(c(1:50), c(1:2))
represent_selection(NA, -length(dim(pokemons)[2]))
represent_selection(NA, c(2, 8, 9, 10))
represent_selection(c(20:30, 80:100), NA)

# first pokemon's name
pokemons$nom[order(pokemons$nom)[1]]


fastest_and_strongest = pokemons[order(pokemons$attack, pokemons$speed), ]
fastest_and_strongest$nom[1:10]

sel = represent_selection(pokemons$attack>=150, NA)
sel[order(sel$attack, decreasing=TRUE), ]

represent_selection(pokemons$type %in% c('dragon', 'ghost', 'psychic', 'dark'))

# EX 4
sel = filter(pokemons, attack>150 & type='fire')
sel[order(sel$attack, decreasing=TRUE),]
dim(sel)

sel = filter(pokemons, speed>=100 & speed<=150)
sel[order(sel$speed, decreasing=TRUE), ]
dim(sel)

sel = filter(pokemons, weight_kg>250)
sel

sel = filter(pokemons, height_m = NA)
dim(sel)
sel

sel = pokemons[!is.na(pokemons$height_m),]
sel = sel[!is.na(pokemons$weight_kg), ]
dim(sel)
sel

# EX 5

attacks_by_type = pokemons %>% group_by(type) %>% summarise(avg_attack=mean(attack))
attacks_by_type[order(attacks_by_type$avg_attack, decreasing=TRUE)[1:3], ]


Calculez le nombre de pokemon par type , puis triez par ordre décroissant ces effectifs.
Calculez la médiane de weight_kg par type.
Calculez le nombre de pokemon par type et generation
Calculez la moyenne de chaque critère (weight_kg, height_m, attack, defense et speed) en fonction de chaque type.