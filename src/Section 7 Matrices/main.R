# They are almos the same with arrays with multiple dimesnsions. The main 
#difference is applying linear algebra type of functions to them.

matrix(
  data = c(1,2,3,4),
  nrow = 10,
  ncol = 4,
)

matrix(
  data = c(1,2,3,4),
  nrow = 10,
  ncol = 4,
  byrow = TRUE
)


my_matrix <- matrix(1:20, nrow = 5, ncol = 4)

# using arrays
example_matrix <- array(
  data=1:4,
  dim=c(10,4)
)

example_matrix2 <- matrix(
  data = c(1,2,3,4),
  nrow = 10,
  ncol = 4,
)

example_matrix2 == example_matrix

# matrix operations

matrix1 <- matrix(1:4, nrow = 2, ncol = 2)
matrix2 <- matrix(200:203, nrow = 2, ncol = 2)

matrix1 * matrix2
matrix1 + matrix2
matrix1 - matrix2
matrix1 / matrix2

# matrix multiplication
matrix1 %*% matrix2

# quiz
cbind(matrix1, matrix2)
rbind(matrix1, matrix2)

x <- cbind(matrix1, matrix2)

# To get
# [
#   [0, 1, 1, 1],
#   [0, 2, 1, 1],
# ]
matrix(
  data = c(0, 1, 1, 1, 0, 2, 1, 1),
  nrow = 2,
  ncol = 4,
  byrow = TRUE
)

matrix_1 <- matrix(1:24, nrow=2, ncol=12)
matrix_2 <- matrix(1:46, nrow=12, ncol=23)
