# createTransactionDataCSV.R

#install.packages("Transact")
#require(Transact)

# Mean function 
calculate_mean <- function(numbers) {
  s = sum(numbers)
  N = length(numbers)
  # Calculate the mean
  result = s / N
  return (result)
}

# used for testing function
#x <- c(12,7,3,4.2,18,2,54,-21,8,-5)
#print(calculate_mean(x))

# Median function
calculate_median <-function(numbers) {
  N = length(numbers)
  sort(numbers)
  
  # Fine the median
  if (N %% 2 == 0) {
    # if N is even, convert to int and match position
    m1 = as.integer(N / 2) - 1
    m2 = as.integer((N / 2) + 1) - 1
    median = (numbers[m1] + numbers[m2]) / 2
  } else {
    # Convert to integer, match position
    m = as.integer((N + 1) / 2) - 1
    median = numbers[m]
  }
  
  
  return (median)
}
#x <- c(12,7,3,4.2,18,2,54,-21,8,-5)
#print(calculate_median(x))



  


# Import data into R
mydata = read.csv("C:/Users/nekus/OneDrive/Documents/GitHub/CUNY-SPS-MSDS-2020/CUNY-SPS/R Bridge/Week2/Homework2/Transact.csv")  # read csv file 

#1 Use the summary function to gain an overview of the data set. Then display the mean and median for at least two attributes

transact <- data.frame(mydata)

transact$t1 <- calculate_mean(transact$t1)

transact$t2 <- calculate_median(transact$t2)

View(transact)

#2 Create a new data frame with a subset of the columns and rows. Make sure to rename it.
transactDataset <- data.frame(transact$X , transact$t1, transact$t2 ,transact$time)

View(transactDataset)


names(transactDataset) <- c("Records", "Mean", "Median", "TimeDate")

View(transactDataset) 
