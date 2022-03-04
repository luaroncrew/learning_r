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

