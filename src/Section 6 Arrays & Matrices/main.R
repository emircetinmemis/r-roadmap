example_array = array(
  data = c(10,14,15,20,21,22,23,25),
  dim = c(2,2,2),
  dimnames = list(
    c("Row 1", "Row 2"),
    c("Col 1", "Col 2"),
    c("Matrix 1", "Matrix 2")
  )
)

example_array
example_array[1,1,1] # 10
example_array[1,1,2] # 21

# Example case, sizes vs prices of house
sizes = c(100, 200, 300, 400)
prices = c(1000, 2000, 3000, 4000)

number_of_houses = length(sizes)

# Instead of defining the array manually, we can use the following function
houses = array(
  data = c(sizes, prices),
  dim = c(number_of_houses,2),
  dimnames = list(
    c(paste("House", 1:number_of_houses)),
    c("Size", "Price")
  )
)

first_house = houses[1,]
first_house

# Example case, multi feature data
age = c(20, 30, 40, 50)
weight = c(60, 70, 80, 90)
height = c(160, 170, 180, 190)
income = c(1000, 2000, 3000, 4000)

number_of_people = length(age)

people = array(
  data = c(age, weight, height, income),
  dim = c(number_of_people,4),
  dimnames = list(
    c(paste("Person", 1:number_of_people)),
    c("Age", "Weight", "Height", "Income")
  )
)
people

first_person = people[1,]
first_person

first_person_age = people[1, "Age"]
first_person_age

first_person_age = people[1, 1]
first_person_age

first_and_second_person = people[1:2,]
first_and_second_person

incomes = people[, "Income"]
incomes

weights_of_second_and_third_person = people[2:3, "Weight"]
weights_of_second_and_third_person

#make_everyone_weight_150
people[, "Weight"] <- 150
people

new_person_data <- c(40, 60, 150, 10000)
names(new_person_data) <- c("Age", "Weight", "Height", "Incomes")
people[5,] <- new_person_data
people

new_person_data <- c(60, 70, 180, 2000)
people <- rbind(people, new_person_data)
people

# Array operations
my_array <- array(
  data = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18),
  dim = c(3,3,2)
)
my_array

my_array[,,1] # First matrix
my_array[,,2] # Second matrix
my_array[1,,] # First row from both matrices
my_array[,1,] # First column from both matrices


my_array[,,1] <- sqrt(my_array[,,1])

# Using dim names
my_array = array(
  data = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18),
  dim = c(3,3,2),
  dimnames = list(
    c("Row 1", "Row 2", "Row 3"),
    c("Col 1", "Col 2", "Col 3"),
    c("Matrix 1", "Matrix 2")
  )
)
my_array

first_row_second_column_first_matrix <- my_array["Row 1", "Col 2", "Matrix 1"]

number_18 <- my_array["Row 3", "Col 3", "Matrix 2"]

dimnames(my_array)

# change the dimnames

# instead of Row 1, Row 2, Row 3, we want to use "Small", "Medium", "Large"
dimnames(my_array)[[1]] <- c("Small", "Medium", "Large")
my_array
# instead of Col 1, Col 2, Col 3, we want to use "Cheap", "Moderate", "Expensive"
dimnames(my_array)[[2]] <- c("Cheap", "Moderate", "Expensive")
my_array
# instead of Matrix 1, Matrix 2, we want to use "Chocolate", "Coffee"
dimnames(my_array)[[3]] <- c("Chocolate", "Coffee")
my_array

medium_cheap_coffe_price <- my_array["Medium", "Cheap", "Coffee"]
medium_cheap_coffe_price

nrow(my_array)
ncol(my_array)

# Delete the medium_cheap_coffe_price
my_array["Medium", "Cheap", "Coffee"] <- NA
my_array

my_array[1,,] # First row from both matrices
my_array[-c(1),,] # All rows except the first row from both matrices

# Delete the "Small" row completely using -c
my_array <- my_array[-c(1),,] # This means -> my_array[1,,] would give all first rows in two matrices or "Smalls"
my_array

# Row wise and column wise combining
my_array_1 = array(1:4, dim = c(2,2))
my_array_2 = array(5:8, dim = c(2,2))
my_array_1
my_array_2

my_c_combined_array = cbind(my_array_1, my_array_2)
my_c_combined_array

my_r_combined_array = rbind(my_array_1, my_array_2)
my_r_combined_array

# Quiz quesation examp??le
country_data = array(
  data = c(200,200,300,340,230,120,540,400),
  dim = c(2,2,2),
  dimnames = list(
    c("France", "UK"),
    c("CPI", "GDP"),
    c("2017", "2018")
  )
)
#how would one efficiently select the CPI from France in 2018?
country_data["France", "CPI", "2018"]

#Suppose we have an array: 
#  array_example = array(1:10, c(2,3,3,4,5,3))
#If we type array_example[,1,,,,] , what would we be extracting? 
array_example = array(1:10, c(2,3,3,4,5,3))
array_example[,1,,,,] # Extracts the first column of the first matrix of the array
array_example

# Suppose we have the following two arrays: 
#   
#   array_1 <- array(c(1,5,20,20), dim=c(4,4))
# array_2 <- array(c(1,5,20,20), dim=c(5,4))
# What happens if we do cbind(array_1, array_2)?
array_1 <- array(c(1,5,20,20), dim=c(4,4))
array_2 <- array(c(1,5,20,20), dim=c(5,4))
cbind(array_1, array_2) # Error, the number of rows are not the same

# Suppose we have the following two arrays: 
#   
#   array_1 <- array(c(1,5,20,20), dim=c(4,4))
# array_2 <- array(c(1,5,20,20), dim=c(5,4))
# What happens if we do rbind(array_1, array_2)?
array_1 <- array(c(1,5,20,20), dim=c(4,4))
array_2 <- array(c(1,5,20,20), dim=c(5,4))
x <- rbind(array_1, array_2) # Error, the number of columns are not the same
x
dim(x)
