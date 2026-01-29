# lists, matrices, and data frames
# frania darringer 1/29

# creating a mat from a vector
my_vec <- 1:12

# numbers by row
m <- matrix(data = my_vec, nrow = 4)
m

# numbers by column
m <- matrix(data = my_vec, ncol = 3, byrow = T)
m

# lists
my_list <- list(1:10, matrix(1:8, nrow = 4, byrow = T), letters[1:3], pi)
my_list

# indexing a list
my_list[1]
x <- my_list[[1]] # double brackets for object within list element
str(x)

# indexing into a matrix
my_list[[2]][1,1] # rows, columns

# naming lists
my_list2 <- list(tester = FALSE, little_m = matrix(1:9, nrow = 3))
my_list2

# named objects in lists
my_list2$little_m[2,3]

# looking at an empty place emptying
my_list2$little_m[,1]
my_list2$little_m[1]
my_list2$little_m[2] # no comma, treated as a vector

# unlist
unrolled <- unlist(my_list2) # flattened into named vector
unrolled[1]

# unpacking complex lists
library(ggplot2)

# creating random variables
y_var <- runif(10)
x_var <- runif(10)

# linear regression
my_model <- lm(y_var ~ x_var)
qplot(x=x_var, y=y_var)

print(my_model)

# explore structure
summary(my_model)
str(summary(my_model))
summary(my_model)$coefficients[1,1]
u <- unlist(summary(my_model))
u$coefficients2
u$coefficients8

# data frames
var_a <- 1:12
var_b <- rep(c("A", "B", "C"), 4)
var_c <- runif(12)

df <- data.frame(var_a, var_b, var_c)
str(df)
df$var_a[1]

# appending the data frame
new_data <- list(var_a = 13, var_b = "D", var_c = 0.77)
df2 <- rbind(df, new_data)
df2

head(df2)
tail(df2)
head(df2, 2)

View(df2) # makes it like an excel sheet

# using cbind
new_var <- rnorm(13)
df3 <- cbind(df2, new_var)
head(df3)

char_var <- rep("T", 13)
df3$charV <- char_var
