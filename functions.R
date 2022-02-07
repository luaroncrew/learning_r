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


# help function
?mean


# function defining
imc = function(weight, heigth=1.73){
  result = weight/(heigth^2)
  return(result)
}

class(imc)
imc(weight=63)


