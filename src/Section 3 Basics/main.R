# Some calculations
1+2
100-50.6

# Common cases
(10/10)/(5/5)
exp(0)*20
sqrt(9)
exp(sqrt(9))

# Example of objects, Vector, Matrix, List & DataFrame

# Vector uses c()
ages <- c(19, 19, 20, 22, 24)
ages[0]
ages2 = c(19, 19, 20, 22, 24)
ages * 2
ages + ages2
ages * ages2
sqrt(ages)
sum(ages)
mean(ages)
ages < 20
ages == 19
ages > 20 & ages == 19
ages > 20 | ages == 19

sum(c(1,2,3,4/0))
sum(c(1,2,3,sqrt(-1)))
sum(c(1,2,3,NA))
sum(c(1,2,3,NA), na.rm = TRUE)


# Addition
add <- function(a, b) {
  a + b
}

# Subtraction
subtract <- function(a, b) {
  a - b
}

# Multiplication
multiplication <- function(a, b) {
  a * b
}

# Division
division <- function(a, b) {
  a / b
}

x <- 10
y <- 5

add(x, y)
subtract(x, y)
multiplication(x, y)
division(x, y)

# built ins
sqrt(9)
exp(0)
log(10)

(log(1)*10)
(sqrt(9)*10)/10

?sqrt

sqrt(85)
(15 / (10**2))
(215 + log(100))
