# TP 4

# ex 1
converter_v1 <- function(brutto){
  return(brutto*0.8)
}

print(converter_v1(100))

converter_v2 <- function(brutto, cad){
  if(cad){
    modif = 0.75
  } else {
    modif = 0.78
  }
  return(brutto*modif)
}

print(converter_v2(100, cad=TRUE))


converter_v3 <- function(){
  sal_input = as.numeric(readline(prompt = 'salary?'));
  cad_input = as.logical(readline(prompt = 'cadre?'));
  return(converter_v2(sal_input, cad_input));
}
converter_v3()


# ex 2

get_sjr = function(brutto){
  return(brutto/731)
}

get_allocation = function(brutto){
  sjr = get_sjr(brutto)
  MIN_ren = 29.56
  MAX_ren = 256.96
  result_a = sjr*0.57
  result_b = sjr*0.404 + 12.12
  result = max(c(result_a, result_b))
  if(result < MIN_ren){
    result = MIN_ren
  }
  if(result > MAX_ren){
    result = MAX_ren
  }
  sjr_trfrm = result - sjr*0.03
  return(sjr_trfrm*30)
}


summ = get_allocation(36550)
summ

# ex 3

attach(mtcars)
library(tidyverse)
library(ggplot2)


df = mtcars

quantiquanti = function(var_a, var_b){
  values_a = df[,var_a]
  values_b = df[,var_b]
  plot(values_a, values_b)
  return(cor(values_a, values_b))
}

quantiquanti('mpg', 'hp')

qualiquali = function(var_a, var_b){
  values_a = df[,var_a]
  values_b = df[,var_b]
  
  library(ggplot2)
  barplt <- ggplot(data=df, aes(x=values_a, y=values_b, fill=values_b)) + geom_bar(stat='identity')
  print(barplt)
}
qualiquali('gear', 'cyl')

QualiQuanti <- function(variable1,variable2){
  return(boxplot(variable1 ~ variable2))  
}

QualiQuanti(df$mpg,df$cyl)


df$hp<-as.factor(df$hp)
str(df)
lien2Variables <- function(variable1,variable2){
  if (is.numeric(variable1) & is.numeric(variable2))
  {
    return(quantiQuanti(variable1,variable2))
  }
  if (!is.numeric(variable1) & is.numeric(variable2))
  {
    return(QualiQuanti(variable1,variable2))
  }
  if (!is.numeric(variable1) & !is.numeric(variable2))
  {
    return(qualiQuali(variable1,variable2))
  }
  
}


sample(x = c("Pierre","Feuille","Ciseaux"), size = 1, replace = TRUE)

Game <- function(){
  choix_ordi=sample(x = c("Pierre","Feuille","Ciseaux"), size = 1, replace = TRUE)
  print(choix_ordi)
  {
    saisie_user <- readline(prompt =
                              "Pierre, Feuille ou Ciseaux ?") ;
    
  }
  if (choix_ordi==saisie_user)
  {
    print("Egalit?")
    return("Egalit?")
  }
  if (choix_ordi=="Pierre"&saisie_user=="Feuille")
  {
    print("Gagn?")
    return(TRUE)
  }
  if (choix_ordi=="Pierre"&saisie_user=="Ciseaux")
  {
    print("Perdu")
    return(FALSE)
  }
  if (choix_ordi=="Ciseaux"&saisie_user=="Pierre")
  {
    print("Gagn?")
    return(TRUE)
  }
  if (choix_ordi=="Ciseaux"&saisie_user=="Feuille")
  {
    print("Perdu")
    return(FALSE)
  }
  if (choix_ordi=="Feuille"&saisie_user=="Pierre")
  {
    print("Perdu")
    return(FALSE)
  }
  if (choix_ordi=="Feuille"&saisie_user=="Ciseaux")
  {
    print("Gagn?")
    return(TRUE)
  }
}

Game()

cpt_ordi <- 0
cpt_user <- 0
while((cpt_ordi<3) |(cpt_user<3)){
  print(cpt_ordi)
  print(cpt_user)
  result_game <- Game()
  if(result_game==TRUE)
  {
    cpt_user=cpt_user+1
  }
  if(result_game==FALSE)
  {
    cpt_ordi=cpt_ordi+1
  }
  if(result_game=="Egalit?")
  {
    cpt_ordi=cpt_ordi
    cpt_user=cpt_user
  }
  
}
#Exercice 5 : Trouver le bon nombre

nombre_recherche <- sample(x = 0:100)
essai <- 0 
trouve=FALSE
while(essai<8 & trouve==FALSE){
  {
    saisie_user <- readline(prompt =
                              "Saisir un entier entre 0 et 100") ;
    
  }
  essai=essai+1
  print(essai)
  if(saisie_user==nombre_recherche)
  {
    print("VOUS AVEZ GAGNE")
    trouve=TRUE
    
  }
  if(saisie_user>nombre_recherche)
  {
    print("C'est moins")
    
  }
  if(saisie_user<nombre_recherche)
  {
    print("C'est plus")
    
  }
  
}
