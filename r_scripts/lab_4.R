# frania darringer, lab 4, 2/4/26

# question 1
# assign a random integer 
n_dims <- sample(3:10, 1)
n_dims

# create a vector of consecutive integers
vec <- 1:(n_dims^2)
vec

# shuffle
vec_shuffle <- sample(vec)
vec_shuffle

# square matrix
mat <- matrix(vec_shuffle, nrow = n_dims, ncol = n_dims)
mat

# transpose the matrix
t_mat <- t(mat)
t_mat

# calculate sum and mean of the first row and last row
first_row_sum <- sum(mat[1, ])
first_row_mean <- mean(mat[1, ])
last_row_sum <- sum(mat[n_dims, ])
last_row_mean <- mean(mat[n_dims, ])
first_row_sum
first_row_mean 
last_row_sum 
last_row_mean 

# use eigen function
eig <- eigen(mat)
print(eig$values)
print(eig$vectors)

# check the type of eigenvalues/vectors
print(paste(typeof(eig$values)))
print(paste(typeof(eig$vectors)))

# question 2
# create the original list
my_list <- list(
  my_matrix = matrix(runif(16), nrow = 4, ncol = 4),               
  my_logical = runif(100) > 0.5,                                  
  my_letters = sample(letters, 26)                        
)

# create new list with specific elements
new_list <- list(
  my_matrix_element = my_list$my_matrix[2,2],  
  my_logical_element = my_list$my_logical[2],  
  my_letter_element = my_list$my_letters[2] 
)

# check underlying data types
typeof(new_list$my_matrix_element)   
typeof(new_list$my_logical_element)  
typeof(new_list$my_letter_element)   

# combine elements into single atomic vector
combined_vector <- c(new_list$my_matrix_element,
                     new_list$my_logical_element,
                     new_list$my_letter_element)

# check data type of  combined vector
typeof(combined_vector)

# question 3
# data frame
df <- data.frame(
  my_unis = runif(26, 0, 10),            
  my_letters = sample(LETTERS, 26) 
)

# replace random rows in my_unis with na
df$my_unis[sample(1:26, 4)] <- NA

# which rows have missing values in my_unis
which(is.na(df$my_unis))

# re order data frame
df <- df[order(df$my_letters), ]

# calculate the column mean for my_unis
mean(df$my_unis, na.rm = TRUE)
