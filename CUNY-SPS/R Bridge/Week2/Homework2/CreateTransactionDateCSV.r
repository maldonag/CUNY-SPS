# createTransactionDataCSV.R

#install.packages("Transact")
#require(Transact)

mydata = read.csv("C:/Users/nekus/OneDrive/Documents/GitHub/CUNY-SPS-MSDS-2020/CUNY-SPS/R Bridge/Week2/Homework2/Transact.csv")  # read csv file 

# Data Summary
transact <- data.frame(mydata)
View(transact)

transact <-transact$time
View(transact)
