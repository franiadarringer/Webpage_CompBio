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
z + x # will recycle first value
