# len function
countries = c("Russia", "England", "Ireland", "France")
print(length(countries))


# math functions
surfaces = c(15, 321, 1, 45, 69, 4555)
max(surfaces)
min(surfaces)
mean(surfaces)
sum(surfaces)
range(surfaces) # returns min and max values
class(range(surfaces))


# None values
populations = c(123, 432, NA, 123123)
mean(populations, na.rm=TRUE) # exclude None values from calculations


# function defining