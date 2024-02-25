# Functions
mean(c(10,20,30,40))

function() {}

greetings <- function() {
  print("Hello World !")
}
greetings()

greetings <- function(name) {
  print(paste("Hello", name))
}
greetings(name = "John")

custom_mean <- function(x) {
  sum(x) / length(x)
}
custom_mean(c(10,20,30,40))

# Note that, the final object of the function automatically returned, but we should use return keyword to return a value, it is a good practice
return_test <- function(x) {
  return(x)
}
a <- return_test(10)

# Arguments of functions
custom_mean_args <- function(my_vector) {
  sum <- sum(my_vector)
  length <- length(my_vector)
  return(sum / length)
}
custom_mean_args()
custom_mean_args(c(10,20,30,40))

# A good practice, adding default values to the arguments and specifying the type of the arguments
some_function <- function(a = 1, b = 2, c = 3) {
  return(a + b + c)
}
some_function()
some_function(10)
some_function(10, 20)
some_function(10, 20, 30)

# Control flow, for loops
custom_mean_with_loop <- function(my_vector) {
  sum <- 0
  for (i in my_vector) {
    sum <- sum + i
  }
  return(sum / length(my_vector))
}
custom_mean_with_loop(c(10,20,30,40))

# Control flow, if else
custom_mean_with_if_else <- function(my_vector) {
  if (length(my_vector) == 0) {
    return(0)
  } 
  else if (is.numeric(my_vector) == FALSE) {
    return(NA)
  }
  else {
    sum <- 0
    for (i in my_vector) {
      sum <- sum + i
    }
    return(sum / length(my_vector))
  }
}
custom_mean_with_if_else(c(10,20,30,40))
custom_mean_with_if_else(c(10,20,30,"40"))
custom_mean_with_if_else(c())

# Control flow, while loops
custom_mean_with_while <- function(my_vector) {
  sum <- 0
  i <- 1
  while (i <= length(my_vector)) {
    sum <- sum + my_vector[i]
    i <- i + 1
  }
  return(sum / length(my_vector))
}
custom_mean_with_while(c(10,20,30,40))

# For the next, please follow usecase.R to continue reading.
