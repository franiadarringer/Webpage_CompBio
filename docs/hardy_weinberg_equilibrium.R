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

