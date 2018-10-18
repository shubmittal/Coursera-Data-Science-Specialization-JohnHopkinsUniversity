#q1 : R was developed by statisticians working at : The University of Auckland. Remeber its a dialect of S

#q2: The def of free sofware does not include: 
#The freedom to prevent users from using the software for undesirable purposes.
#The freedom to sell the software for any price.
#The freedom to restrict access to the source code for the software.

#q3 : Identify non atomic data types: Table, list, matrix, array,  data frame.

#q4:If I execute the expression x <- 4 in R, what is the class of the object `x' as determined by the `class()' function? Numeric

#q5 What is the class of the object defined by x <- c(4, TRUE)?  Numeric

#q6: If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression cbind(x, y)? 3*2 Matrix

#q7: A key property of vectors in R is that: elements of a vector all must be of the same class

#q8: Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[1]] give me? Select all that apply: a numeric vector containing the element "2"., a numeric vector of length 1.

#q9: Suppose I have a vector x <- 1:4 and a vector y <- 2. What is produced by the expression x + y?: a numeric vector with elements 3, 4, 5, 6.

#q10: Suppose I have a vector x <- c(3, 5, 1, 10, 12, 6) and I want to set all elements of this vector that are less than 6 to be equal to zero. What R code achieves this? Select all that apply.
#x[x %in% 1:5] <- 0
#x[x < 6] <- 0
#x[x <= 5] <- 0


weather <- read.csv("/home/shubhra/Documents/AllCodeBase/Coursera:RProgramming/Week1/quiz1_data/hw1_data.csv")

#q11column names

colnames(weather) #"Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day"  

#q12 First 2 recrods

head(weather,2)
#Ozone Solar.R Wind Temp Month Day
#1    41     190  7.4   67     5   1
#2    36     118  8.0   72     5   2


#q13 num of observations
dim(weather) #153


#q14: last 2 rows

weather[152:153,]

#   Ozone Solar.R Wind Temp Month Day
#152    18     131  8.0   76     9  29
# 153    20     223 11.5   68     9  30

#Q15: Ozone in 47th row

weather[47, "Ozone"] #21


#q16: Missing Ozone values

sum(is.na(weather[,"Ozone"]))


#q17: mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation

ozone <- weather[,"Ozone"]
mean(ozone, na.rm = TRUE) #42.12

#q18 subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset

colMeans(subset(weather, Ozone>31 & Temp>90), na.rm = TRUE) # Solar.R mean = 212.8


#q19What is the mean of "Temp" when "Month" is equal to 6
colMeans(subset(weather, Month==6), na.rm = TRUE) # Temp mean = 79.1

#q20 What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?

q_20 = subset(weather, Month==5)

q_20[order(q_20$Ozone)] #115



