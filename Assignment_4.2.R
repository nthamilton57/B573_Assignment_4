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
  print(paste('Range of', col,'-', max(Auto[[col]])-min(Auto[[col]])))
}
# Create a matrix containing the mean and the standard deviation of each column.
means <- apply(Auto, 2, mean)
stdevs <- apply(Auto, 2, sd)
#use rowbind to create a matrix of these values
stats_mat <- rbind(means, stdevs)
print(stats_mat)

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
print("Updated Stats:")
print(stats_mat)