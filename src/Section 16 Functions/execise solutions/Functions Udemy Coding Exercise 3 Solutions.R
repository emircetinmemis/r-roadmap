extract_by_brand <- function(brand) {
  data(mtcars)
  mtcars$brand = sapply(strsplit(rownames(mtcars), " "), "[", 1)
  mtcars$brand = tolower(mtcars$brand)
  mtcars[mtcars$brand == tolower(brand),]
}