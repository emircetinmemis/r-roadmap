vector = c(1, 2, "3")
typeof(vector)
# all elements are coerced to character because of the presence of a character 
#element, and because vectors can only contain elements of the same type
# the coercion is done in the order logical < integer < numeric < complex < character
# imagine you have a bottle of water, and a cup of water. Both are fullled %50.
#  b b
#  b b  c c
#  bbb  ccc
# If you pour from cup to bottle (cup < bottle), it works nothing happens.
# If you pour from bottle to cup (bottle > cup), it works, but you lose some water.
# Thats why this coercion is done in this order. The requirement of coercion is
# comes from the structure of vector.

vector[1] + vector[2]

list = list(1, 2, "3")
typeof(list)

list[[1]] + list[[2]]

multiobject <- list(
  1L, 
  2.2, 
  "3", 
  c(1, 2, 3),
  array(1:12, c(3, 4)),
  matrix(1:12, nrow = 3, ncol = 4),
  data.frame(x = 1:3, y = c("a", "b", "c")),
  TRUE
)
names(multiobject) <- c("my_integer", "my_double", "my_character", "my_vector", "my_array", "my_matrix", "my_dataframe", "my_logical")
length(multiobject)

#- or -

multiobject <- list(
  my_integer = 1L,
  my_double = 2.2,
  my_character = "3",
  my_vector = c(1, 2, 3),
  my_array = array(1:12, c(3, 4)),
  my_matrix = matrix(1:12, nrow = 3, ncol = 4),
  my_dataframe = data.frame(x = 1:3, y = c("a", "b", "c")),
  TRUE,
  "Emir"
)

# Access

multiobject <- list(
  "Vector" = c(1, 2, 3),
  "Array" = array(1:4, c(2,2)),
  "Boolean" = TRUE
)

multiobject[1] # This is not the right acces case for lists !
# lets test it
multiobject[1][1] # We should be given the first element but we are noit getting it.

# we should use double grand for list cases
multiobject[[1]]
multiobject[[1]][1]

multiobject[["Vector"]]

multiobject[[c(1,2)]]

# DO NOT FORGET, FOR LISTS USE DOUBLE SQUARE BRACKETS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!

multiobject$Vector[1] # This is also a way to access the elements of the list

# Modifications

example_list <- list(
  c("a", "b", "c", "d"),
  array(1:10, c(2, 5)),
  test = c(1, 2, 3)
)

example_list[3] <- c(1, 2, 3) # This will raise an warning an only assign "num 1" to the third element of the list not a vector as ve tried.
# With only one single bracket we again acces to list level not object itself !
example_list[[3]] <- c(1, 2, 3)

example_list[[10]] <- c(1, 2, 3) # Rest of the undifned elements will be filled with nulls here.

# Deletion

# we have been using rm for vectors for example and assigning na to columns in data frames
# in lists, we have to use NULL to delete an element
example_list[9] <- NULL
# or
example_list$test <- NULL # keep in my that the dollar sign only works with names !

# Combination

list1 <- list(c(1, 2), "A")
list2 <- list(c(10, 11), matrix(1:10, nrow=5, ncol=2))

merged_list = c(list1, list2)
