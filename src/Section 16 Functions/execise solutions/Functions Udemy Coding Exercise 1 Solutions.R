square_it <- function (vector) {
  if (class(vector) != 'numeric') {
    "Not a numeric vector!"
  }
  else {
    vector**2
  }
}