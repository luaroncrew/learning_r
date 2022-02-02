# math operators
a = 2 + 2
b = 5 - 7
c = 4 * 12
d = -10 / 3
e = 5^2


# qiuzz 04908491

# definig variables
result <- (a + b + e + c - d)
print(result)


# str objects
dog <- "chien"
print(dog)
print(typeof(dog))


# vectors
usual_vector = c(1, 2, 435, 43265, 123) # all the values have the same type
print(usual_vector)
print(typeof(usual_vector))
print(class(usual_vector))


# operations on vectors
vec = c(1, 2, 3, 4, 5)
print(vec^2) # works like map functions on python
print(vec + 20)
print(vec / 123)


# vector out of srings
animals = c("dog", "cat", "bear")
print(animals)
print(class(animals))


# list(range()) function in R
arr = 1:10
print(arr)
print(class(arr))
print(typeof(arr))


# value out of vector
animals = c("dog", "cat", "bear")
print(animals[0]) # this gives the data type
print(animals[1])
print(animals[2])

numbers = 1:10
print(numbers[0]) # same for list(range()) alternative


# some fun with vectors
cities = c("Moscow", "Paris", "London", "New York", "Nice", "Rome")
destinations = 2:4
print(cities[destinations])


# logical vector
numbers = c(1, 1, 1, 0, 0, 0, 1, 1, 0)
bools = numbers > 0 # like map function on python
print(bools)
print(class(bools))


# some validation methods
numeric_vec = c(1, 2, 3)
character_vec = c("France", "Russia", "India")
print(is.logical(c(is.numeric(numeric_vec),is.character(character_vec))))


# list(map(str, <object>)) function
vec_of_numbers = c(1, 2, 3, 3123)
vec_of_strs = as.character(vec_of_numbers)
print(vec_of_strs)
print(class(vec_of_strs))


# factors (something like enum but not exactly enum) or levels
vehicles = c("Mazda", "Toyota", "Ford")
factor_ve <- as.factor(vehicles)
print(class(factor_ve))
print(factor_ve)
factor_ve[1] <- "Nissan" # non mutable
vehicles[1] <- "Nissan" # mutable
print(vehicles)





