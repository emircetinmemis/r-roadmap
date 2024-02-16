set.seed(1)
sizes <- rnorm(100, 3000, 400)
prices <- 100000 + 50 * sizes + rnorm(100, 0, 10000)

plot(sizes, prices, xlab = "Size", ylab = "Price", main = "Prices vs Sizes of Houses")

bias <- 0.5
weight <- 50

gradient <- function(sizes, prices, weight, bias) {
  n <- length(sizes)
  grad_w <- -2/n * sum(sizes * (prices - (weight * sizes + bias)))
  grad_b <- -2/n * sum(prices - (weight * sizes + bias))
  return(c(grad_w, grad_b))
}

loss <- function(sizes, prices, weight, bias) {
  n <- length(sizes)
  return(1/n * sum((prices - (weight * sizes + bias))^2))
}

gradient_descent <- function(sizes, prices, weight, bias, learning_rate, num_iterations) {
  for (i in 1:num_iterations) {
    grad <- gradient(sizes, prices, weight, bias)
    weight <- weight - learning_rate * grad[1]
    bias <- bias - learning_rate * grad[2]
    if (i %% 100 == 0) {
      cat("Iteration: ", i, " Loss: ", loss(sizes, prices, weight, bias), "\n")
    }
  }
  return(c(weight, bias))
}

weight_bias <- gradient_descent(sizes, prices, 0, 0, 0.0000001, 1000)

abline(weight_bias[2], weight_bias[1], col = "blue")