help("ifelse")

d <- hdv2003
d$minutes.tv <- d$heures.tv * 60

# Conditional Element Selection
d$occupGroup <- ifelse(test = (d$occup == "Exerce une profession"),
                       yes = "actif",
                       no = "inactif")

table(d$occupGroup)

d$occup

d$occupGroup <- ifelse(test = (d$occup == "Exerce une profession" | d$occup == "Chomeur"),
                       yes = "actif",
                       no = "inactif")

table(d$occupGroup)

d$occupGroup <- ifelse(test = (d$occup %in% c("Exerce une profession","Chomeur")),
                       yes = "actif",
                       no = "inactif")

table(d$occupGroup)

# Convert Numeric to Factor
?cut
d$ageGroup <- cut(x = d$age, breaks = c(min(d$age),30,50,max(d$age)) ,
                  include.lowest =  TRUE)

table(d$ageGroup)


