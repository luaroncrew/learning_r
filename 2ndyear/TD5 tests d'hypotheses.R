prices = c(60, 199, 360, 400, 381, 379, 590, 435, 680, 1100)
rooms = c(1, 2, 2, 3, 4, 3, 3, 4, 4, 6)
surfaces = c(18, 47, 67, 85, 93, 102, 109, 120, 163, 223)

shapiro.test(prices)
shapiro.test(rooms)
shapiro.test(surfaces)

# pearson correlation test 
cor.test(prices, rooms)
# p-value is 0.0000... so we reject H0 - variables are finally correlated

cor.test(prices, surfaces)
# same



# EX 2

# h0 : avg av == avg ap, H1: avg av > avg ap

sujet = c(1:10)
avant = c(15, 18, 17, 20, 21, 18, 17, 15, 19, 16)
apres = c(12, 16, 17, 18, 17, 15, 18, 14, 16, 18)

# alternative=greater to do a unilateral test where mean1 gt mean2
t.test(avant, apres, alternative="greater", paired=T)
dbar = mean(avant-apres)
n = 10
sn = ((n/(n-1))*sd(avant-apres))
tn = dbar / sn / sqrt(length(sujet)) 

qt(0.025, n-1)
tn

cars = mtcars
shapiro.test(mtcars$mpg)
shapiro.test(mtcars$wt)
shapiro.test(mtcars$qsec)
shapiro.test(log(mtcars$hp))
shapiro.test(log(mtcars$disp))

arrests = USArrests
