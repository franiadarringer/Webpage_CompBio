# hardy-weinberg equilibrium
# function: hardy-weinburg
# inputs: p - allele frequency of dominant allele
# outputs: q (recessive) - frequencies of the 3 genotypes (fAA, fAB, fBB)

hardy_weinburg <- function(p = runif(1)){
  q <- 1 - p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
out_vec <- signif(c(q=q, p=p, AA=fAA, BB=fBB, AB=fAB), digits = 3)

return(out_vec)
}

hardy_weinburg(p = 0.3)

# global vs local parameters
my_func <- function(a=3, b=4){
  z <- a+b
  return(z)
}

my_func()

# passing global variables properly
my_func_2 <- function(first, second){
  z <- first + second
  return(z)

}

my_bad_func <- function(a=3){
  z <- a+b
  return(z)
}

# regression function
# function: fit_linear
# purpose: fits a simple lin reg
# inputs: numeric vector or predictos x and response y
# out: slope & p-value
fit_linear <- function(x=runif(20), y=runif(20)){
  my_mod <- lm(y~x)
  my_out <- c(slope=summary(my_mod)$coefficients[2,1],
  p_value=summary(my_mod)$coefficients[2,4])

  plot(x=x, y=y)
  return(my_out)
}
fit_linear()

# 