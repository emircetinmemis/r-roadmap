# Implement a square_it function that takes a numeric vector and squares each 
# element. Return "Not a numeric vector!" if the vector has any other types. 
# For now, assume that only vectors will be used as input.
square_it <- function(numeric_vector) {
  if (is.numeric(numeric_vector)) {
    return(numeric_vector^2)
  } else {
    return("Not a numeric vector!")
  }
}
square_it(c(1,2,3,4,5))
square_it(c(1,2,3,4,5, "a"))

# Implement a function that extracts the vowels (a,e,i,o,u) from any word and 
# stores them in a vector called list_of_vowels - Name your function extract_vowels.
# Add the vowel even if it is in upper case.
extract_vowels <- function(word) {
  target_vowels <- data.frame(
    lower = c("a", "e", "i", "o", "u"),
    upper = c("A", "E", "I", "O", "U")
  )
  condition <- function(character) {
    return(character %in% target_vowels$lower | character %in% target_vowels$upper)
  }
  word_vowels <- strsplit(x = word, split = "")
  condition_vector <- as.vector(
    sapply(
      X = strsplit(x = word, split = ""),
      FUN = condition
    )
  )
  extracted_vowels <- tolower(unlist(word_vowels)[condition_vector])
  return(extracted_vowels)
}
extract_vowels("mAgic")

# Welcome to this coding exercise! Here, we are going to mix the concept of functions and working with data at the same time.
#   Load the mtcars data and extract only the subset of cars by a given car brand.
#   Load the mtcars inside the function.
#   During your function also create a new column on the table called brand with the brand of the car - the brand should contain the brand of the car in lower case.
#   Use car brand as an argument of your function and name your function extract_by_brand .
# Extra detail: Your code should return the same if the argument of the function is "Toyota" or "toyota".
extract_by_brand <- function(brand) {
  data(mtcars)
  mtcars$brand = sapply(strsplit(rownames(mtcars), " "), "[", 1)
  mtcars$brand = tolower(mtcars$brand)
  mtcars[mtcars$brand == tolower(brand),]
}
extract_by_brand("Toyota")
extract_by_brand("toyota")
