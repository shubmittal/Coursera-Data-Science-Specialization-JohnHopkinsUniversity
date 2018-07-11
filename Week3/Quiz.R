#q1There will be an object called 'iris' in your workspace. In this dataset, what is the mean of 'Sepal.Length' for the species virginica? Please round your answer to the nearest whole number.

tapply(iris$Sepal.Length, iris$Species, mean) # Round off to 7

## setosa versicolor  virginica 
##5.006      5.936      6.588 



#q2: Continuing with the 'iris' dataset from the previous Question, what R code returns a vector of the means of the variables 'Sepal.Length', 'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
 #apply(iris[, 1:4], 2, mean)

#q3: How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.
#with(mtcars, tapply(mpg, cyl, mean))
#tapply(mtcars$mpg, mtcars$cyl, mean)
#sapply(split(mtcars$mpg, mtcars$cyl), mean)


#q4 what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?

tapply(mtcars$hp, mtcars$cyl, mean) #Diff is 127

#q5:debug(ls)
# Execution of 'ls' will suspend at the beginning of the function and you will be in the browser.

