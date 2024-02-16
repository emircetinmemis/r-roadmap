# Create a list named math_list with the following elements: 
# an array with 3 dimensions with 2 elements in each one, fed with the data 1:2
# a vector with the elements (3,9,81)
# a matrix with 2 rows and 2 columns with the elements (9,0,9,0)
math_list <- list(
  array = array(1:2, dim = c(2,2,2)),
  vector = c(3,9,81),
  matrix = matrix(c(9,0,9,0), nrow = 2, ncol = 2)
)

# Name the elements on your math_list "ThreeDArray","Vector" and "Matrix"
names(math_list) <- c("ThreeDArray","Vector","Matrix")

#  Add a fourth element to your list - a character element with the text: "I DID IT!"
math_list[4] <- "I DID IT!"

#  Change the name of that fourth element to "String". Keep other names unchanged.
names(math_list)[4] <- "String"

# Check the number of elements in your math_list. Use an R function to do it.
length(math_list)

#  Delete the 'String' element from your list.
math_list[4] <- NULL

# Extract the vector from your list and assign it to the math_vector object.
math_vector <- math_list$Vector

# Convert your math_vector to an array. Keep the name unchanged.
math_vector <- as.array(math_vector)

# Extract the second element from the third dimension of the ThreeDArray - assign it to the new_matrix object.
new_matrix <- math_list$ThreeDArray[,,2]

# Multiply every element of the new_matrix by the second element of the math_vectorobject.
new_matrix <- new_matrix * math_vector[2]
