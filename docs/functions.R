# a demo of user defined functions in r
# frania darringer, 2/5/26

# looking at existing functions
sum(3,2) # function
3+2 # rythmetic operator

y <- 3

print(read.table)

# creating a function
adder_subtractor <- function(x = 1, y = 2, z = TRUE){

} # end of function

# name: functionName
# operation: it does some random math depending on the value of z
# inputs: 3 inputs, x, y, z
# outputs: numeric value resulting from addition or subtraction

out <- x+y
return(out)

x <- 3

v <- adder_subtractor(x = 3, y = 4)

if(z == TRUE){
  out <- x + y
}else{
  out <- x - y
}
return(out)

adder_subtractor(x = 7, y = 4, operation = "division")

