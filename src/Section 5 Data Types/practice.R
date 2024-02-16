# Create a vector called boolean_vec, length=8, with TRUE on the first 5 positions and FALSE on the last 3.
boolean_vec = c(TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE)
# Convert your boolean_vec to 1's and 0's and store it in an object called numeric_vec.
numeric_vector = as.numeric(boolean_vec)
# Test if your numeric_vec is a numeric using the R testing function.
is.numeric(numeric_vector)
# Convert your numeric_vec to character and store it in an object called char_vec.
char_vector = as.character(numeric_vector)
# Assign the fifth element on numeric_vec to the character "5".
numeric_vector[5] = "5"
# Call class on the numeric_vec .
class(numeric_vector)
# Check if the class of numeric_vec is equal to the class of char_vec.
class(numeric_vector) == class(char_vector)
