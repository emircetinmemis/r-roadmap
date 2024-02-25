extract_vowels <- function(word) {
  split_word = strsplit(word, "")[[1]]
  
  empty_vowels = c()
  for (letter in split_word) {
    if (tolower(letter) %in% c('a','e','i','o','u')) {
      empty_vowels = c(empty_vowels, tolower(letter))
    }
  }
  empty_vowels
}
extract_vowels("mAgic")
