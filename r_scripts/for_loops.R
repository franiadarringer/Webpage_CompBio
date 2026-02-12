# for loops
# frania darringer, 2/10

# creating a basic for loop
for (i in 1:5) {
  cat("stuck in a loop", "\n")
  cat(3+2, "\n")
  cat(runif(1), "\n")
}

my_dogs <- c("chow", "akita", "malamute", "husky", "samoyed")

for (i in 1:length(my_dogs)){
  cat("i =", i, "my_dogs[i] =", my_dogs[i], "\n")
}

# tip 1
# don't do things in a loop that you don't need to
for(i in seq_along(my_dogs)){
  my_dogs[i] <- toupper(my_dogs[i])
}
my_dogs

tolower(my_dogs)

# tip 2
# don't change dimensions in the loop
my_dat <- runif(1)
for(i in 2:10){
  temp <- runif(1)
  my_dat <- c(my_dat, temp)
  cat("loop number=", i, my_dat[i], "\n")
}

# tip 3
# don't write a loop if you can vectorize it
my_dat <- 1:10
for (i in seq_along(my_dat)){
  my_dat[i] <- my_dat[i] + my_dat[i]^2
  cat("loop number=", i, "vector element =", my_dat[i], "\n")
}

# tip 4
# remember the difference between i and z[i]

# tip 5
# don't have to loop through everything

# parameter space of the log growth model with for loop
log_growth <- function(N0, r, K, tfinal, tstep) {
  time <- seq(from = 0, to = tfinal, by = tstep)
  n_t <- K / (1 + ((K - N0) / N0) * exp(-r * time))
  output <- data.frame(
    time = time,
    population = n_t
  )
  return(output)
}

result <- log_growth(
  N0 = 10,
  r = 0.1,
  K = 100,
  tfinal = 50,
  tstep = 0.1
)

r_vec <- seq(0, 1, by=0.05)
container_vec <- rep(NA, length(r_vec))

for (i in seq_along(r_vec)){
  temp_df <- log_growth(r = r_vec[i])
  max_n <- (temp_df$population)
  container_vec[i] <- max_n
}






