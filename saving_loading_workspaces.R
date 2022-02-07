# csv files reading
help("read.csv")


getwd() # bash pwd

setwd(getwd()) # bash cd

# reading csv
dataset <- read.csv('datasets/Titanic.csv')

# reading xlsx files
library(readxl)
just_another_set <- read_excel(path='datasets/pokemon.xlsx', sheet='pokemon')


library(feather)
# feather package
write_feather(just_another_set, path='datasets.csv')


# just exporting files
write.csv(just_another_set, file='datasets/test_dataset_export.csv')


# saving files
save(... = d, file = "fichier.RData") # not completed

# there is a way to save a current workspace
save.image(file='10febworkspace.Rdata')

# to load the workspace again:
load(file='10febworkspace.Rdata')