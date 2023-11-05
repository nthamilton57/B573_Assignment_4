# Question 1 --------------------------------------------------------------

# Create a vector containing each number between 1 and 50, inclusively.
vec <- c(1:50)
# Use your vector to construct a 5 x 10 matrix.
mat <- matrix(vec, 5, 10)

## use the OR operator to create a logical matrix where it is true if it has a remainder of 1 when dividing by six or if it is divisible by three
mat_log <- mat%%6==1 | mat%%3==0

# Extract the values of the matrix where the logical matrix made in part b.
matrix_values <- mat[mat_log]

#The function should determine if x is odd or even. If x is odd, multiply x by 3 and add 1, otherwise divide x by 2. Repeat this process until the number is 1. The function should return the number of the cycles that the number goes through before reaching 1.
hailstone <- function(x){
  #create a counter initially at 0 that will increase with each cycle
  counter <- 0
  #save the initial x value as y to use in the print out statement
  y <- x
  #special if statement for if x is 1 to start
  if(x==1){
    x <- x*3 + 1
    #increase counter
    counter = counter +1
  }
  #while x isnt one, loop through the processes
  while(x != 1){
    #if x is odd do this
    if(x%%2 !=0){
      x <- x*3 + 1
      #increase counter
      counter = counter +1
    }else{
      #otherwise do this
      x <- x/2
      #increase counter
      counter = counter +1
    }
  }
  #this will return the counter
  return(paste("Number of Cycles for",y, 'is', counter))
  #return(counter)
}
# Apply the function that you created in part d to the values extracted in part c.
print("Number of Cycles for each number:")
sapply(matrix_values, hailstone)