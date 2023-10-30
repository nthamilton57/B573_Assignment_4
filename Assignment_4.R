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
  return(counter)
}
# Apply the function that you created in part d to the values extracted in part c.
sapply(matrix_values, hailstone)


# Question 2 --------------------------------------------------------------


# Install the ISLR library and load the Auto dataset.
#way to install the package if you do not have it currently.
if(!'ISLR' %in% installed.packages()[,1]){
  install.packages('ISLR')
}
library(ISLR)
#load in Auto data
data(Auto)
# Remove qualitative data columns from the data using the subset function to remove the name column
Auto <- subset(Auto, select = -c(name))
# Write a loop that will iterate through the columns and print the range of each quantitative variable.
for(col in names(Auto)){
  #for each column, subtract the min from the max (could use range function too) and print the value
  print(max(Auto[[col]])-min(Auto[[col]]))
}
# Create a matrix containing the mean and the standard deviation of each column.
means <- apply(Auto, 2, mean)
stdevs <- apply(Auto, 2, sd)
#use rowbind to create a matrix of these values
stats_mat <- rbind(means, stdevs)

# Identify rows that have less than the mean amount of mpg. Remove those rows from the dataset.
#create a vector of mpg values from Auto
mpg <- Auto$mpg
#create a logical vector based on if each mpg value is less than the average
mpg_less <- mpg > stats_mat[1,1]
#subset the Auto dataframe based on this logical vector
Auto <- Auto[mpg_less,]

# Recalculate the mean and standard deviation of each column now that values with below average mpg have been removed.
means <- apply(Auto, 2, mean)
stdevs <- apply(Auto, 2, sd)
#use rowbind to recreate the matrix of the values
stats_mat <- rbind(means, stdevs)


# Question 3 --------------------------------------------------------------


# In both R and Python, it is easy to create vectors and matrices. However, it is a little bit easier in R as its not necessary to rely on external libraries 
# like NumPy. Additionally, the syntax in R and Python is slightly different such that R is more compact where it can create vectors and matrices easier such as 
# creating the vector through 'vec <- 1:50'. Additionally, it is easier to go about doing statistics on the dataframes and matrices in R as we dont need external 
# libraries like NumPy and Pandas. However, I think python is a little easier to interpret and is easier to read becuase it is not so compact. For example, loops 
# in R can begin to seem a little messy while loops in Python appear cleaner. Overall, for tasks like the ones in this assignment, I prefer R as it is easier to 
# go about manipulating dataframes and matrices as well as doing statistics on them. However, I like python as it has more capabilities like machine learning.

