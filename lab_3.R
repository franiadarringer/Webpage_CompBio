# assigning values
x <- 1.1
a <- 2.2
b <- 3.3

# expression 1
z <- x^(a^b)
print(z)

# expression 2
z <- (x^a)^b
print(z)

# expression 3
z <- 3*x^3 + 2*x^2 + 1
print(z)

# vector creation
v1 <- c(seq(1, 8), seq(7, 1))
print(v1)

v2 <- rep(1:5, times = 1:5)
print(v2)

v3 <- rep(5:1, times = 1:5)
v3 <- c(5, rep(4,2), rep(3,3), rep(2,4), rep(1,5))
print(v3)

# question 3
xy <- runif(2, min = 0, max = 1)
x <- xy[1]
y <- xy[2]

r <- sqrt(x^2 + y^2)
theta <- atan2(y, x)

cat("polar coordinates r =", r, ", theta =", theta, "radians\n")

# question 4
queue <- c("sheep", "fox", "owl", "ant")
queue

queue <- c(queue, "serpent")
queue

queue <- queue[-1]
queue

queue <- c("donkey", queue)
queue

queue <- queue[-5]
queue

queue <- queue[-3]
queue

queue <- c(queue, "aphid")
index3 <- 3
index4 <- 4
queue[c(index3, index4)] <- queue[c(index4, index3)]
queue

position <- which(queue == "aphid")
position

# question 5
# create a vector of all of the integers from 
# 1 to 100 that are not divisible by 2, 3, or 7
integers <- 1:100
integers %% 2 == 0
integers %% 3 == 0
integers %% 7 == 0
divide <- (integers %% 2 == 0) | (integers %% 3 == 0) | (integers %% 7 == 0)
divide_new <- !divide
divide_new
integers[divide_new]