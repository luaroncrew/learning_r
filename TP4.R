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


