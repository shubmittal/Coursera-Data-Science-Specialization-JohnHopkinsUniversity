# Q1 cube <- function(x, n) {
#   x^3
# } Answer 27


#q2:  warning in following because 'x' is a vector of length 10 and 'if' can only test a single logical statement.

# x <- 1:10
# if(x > 5) {
#   x <- 0
# }

#q3  10
f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}


#q4: y will 10

x <- 5
y <- if(x < 3) {
  NA
} else {
  10
}

#q5: 'f' is free variable as it is neither defined in the function definition nor in the arguments.

#q6: What is an environment in R? a collection of symbol/value pairs

#q7: The R language uses what type of scoping rule for resolving free variables? LExical scoping

#q8: How are free variables in R functions resolved?
  #The values of free variables are searched for in the environment in which the function was defined


#q9: What is one of the consequences of the scoping rules used in R : All objects must be stored in memory


#q10In R, what is the parent frame? : It is the environment in which a function was called