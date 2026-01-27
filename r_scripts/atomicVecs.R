# this is a document describing vectors in r
# january 22nd, 2026
# frania darringer

# --------------------------------------------
# start of script

x <- 5
print(x)

plant_height <- 3 # snake case
plantHeight <- 3 # camel case

# 1d atomic vec
z <- c(3.2, 5, 5, 6)
print(z)
typeof(z)

z <- c(c(3.2, 3), c(3, 5))
print(z)
is.numeric(z)

# character strings
t <- "perch"
print(t)

t <- c("perch", "bass", "trout")
print(t)

t <- c("this is a 'character' string", "this is another")
t[2]
typeof(t)

# logical/boolean
z <- c(TRUE, FALSE, TRUE)
is.logical(z)
typeof(z)
mean(z)

# vector properties
z <- c(1.1, 1.2, 3, 4.4)
typeof(z) # gives type
as.character(z) # as. coerces variable
is.numeric(z) # is. gives logical

t <- c(1, 2, "3", 4)
length(t)

# random number generator
z <- runif(5)
names(z)
print(z)
names(z) <- c("A", "B", "C", "D", "E")

# special data types
z <- c(3.2, 3, 3, NA)
print(z)
typeof(z)
length(z)
typeof(z[4])
sum(z)
sum(z, na.rm=T)

z <- 1/0
print(z)

# vectorization
z <- c(10, 20, 30)
z / 3

y <- c(1, 2, 3)
z + y

# recycling
x <- c(1, 2)

# atomic vecs pt. 2, jan 27
z <- vector(mode = "numeric", length = 0)
print(z)

# dynamic creation
z <- c(z, 5)
print(z)

# predefined length
z <- rep(0, 100)
length(z)

z <- rep(NA, 100)
print(z)

typeof(z)

z[1] <- "Vermont"
head(z)
typeof(z)

my_vector <- runif(100)
my_names <- paste("Species", seq(1:length(my_vector)), sep='')
print(my_names)
names(my_vector) <- my_names
head(my_vector)
str(my_vector)

# using rep func
rep(0.5, 6)
rep(x = 0.5, times = 6)

my_vec <- c(1, 2, 3)
rep(x = my_vec, times = 2)
rep(x = my_vec, times = 2, each = 2)

# sequencing vectors
seq(from = 2, to = 4)
x <- seq(from = 2, to = 4, length = 7)
my_vec <- 1:length(x)
my_vec

seq_along(my_vec)

# the params
runif(n = 3, min = 100, max = 101)
set.seed(123)
runif(n = 1, min = 0, max = 1)

# normal distributions
out <- rnorm(n = 10, mean = 100, sd = 30)
hist(out)

# random sampling
long_vec <- seq_len(10)
sample(x = long_vec, size = 10, replace = F)

# weighted sampling from a vec
weights <- c(rep(20, 5), rep(100, 5))
sample(x=long_vec, replace=TRUE, prob=weights)
weights <- c(rep(50, 5), rep(50, 5))
sample(x=long_vec, replace=TRUE, prob=weights)

# logical operators
# ! not
# & and (vector)
# | or (vector)

x <- 1:5
y <- c(1:3, 7, 7)
x == 5 & y == 7
x == 1 | y == 7
x == 2 # x equals
x != 2 # x does not equal
xor(x==3, y==3) 

# missing values
set.seed(90)
z <- runif(10)
z < 0.5
z[z < 0.5]

which(z < 0.5)
z[which(z < 0.5)]
zd <- c(z, NA, NA)
zd[zd < 0.5]

# dropping NAs with which to index
zd[which(zd < 0.5)]