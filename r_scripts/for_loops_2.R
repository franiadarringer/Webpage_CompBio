# create a random walk function
# name: ran_walk
# purpose: conducts a random walk
# input: times = number of time steps
#        n1 = initial pop size
#        lamda = finite rate of increase
#        noise_sd = 10
# output: vector n with population size > 0 until extinction

library(ggplot2)
ran_walk <- function(times=100, n1=50, lamda=1, noise_sd=10){
  n <- rep(NA, times) # create our output vector
  n[1] <- n1 # initialize init pop size
  noise <- rnorm(n=100, mean=0, sd=noise_sd)

  for (i in 1:(times-1)){
    n[i+1] <- lamda*n[i] + noise[i]
    if(n[i+1]<= 0){
      n[i+1] <- NA
      cat("population extinction at time", i+1, "\n")
      break
    }
  }
  return(n)
}

x <- ran_walk()
print(x)

qplot(x=1:100, y=ran_walk(), geom="line")

# no noise, not so random walk
qplot(x=1:100, y=ran_walk(noise_sd=0), geom="line")

# no noise, and adjust lamda
qplot(x=1:100, y=ran_walk(lamda=0.92, noise_sd=0), geom="line")

# add some stochasistisy back, make lamda > 1
qplot(x=1:100, y=ran_walk(lamda=1.11, noise_sd=2), geom="line")

