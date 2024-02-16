# Task 1
kids_ages <- c(12, 11, 12, 13, 14, 13, 12, 10, 12, 12, 14, 13)
mean(kids_ages)
median(kids_ages)
subset_ages <- 11 < kids_ages | kids_ages > 13

# Task 2
kids_ages <- c(12, 11, 12, 13, 14, 13, 12, 10, 12, 12, 14, 13)
names(kids_ages) <- c("John", "Rachel", "Joe", "Anne", "Theresa", "Samuel", "Marcus", "Andrew", "Kate", "Jane", "Martha", "David")
subset <- kids_ages[c("Rachel", "Anne")]
kids_ages[5] <- 13
under_12_names <- names(kids_ages[kids_ages < 12])

product_pricing <- c(5.6, 11.2, 4.5, 0.25, 1, 23)
half_price <- product_pricing / 2

promotion <- product_pricing
promotion[c(1, 3, 5)] <- promotion[c(1, 3, 5)] * c(0.8, 0.6, 0.5)

squared_prices <- sqrt(product_pricing)

subset <- product_pricing[1:3]

maximum_price_of_product_pricing <- max(product_pricing)

number_of_products <- length(product_pricing)

transform_price <- (product_pricing + 5) / product_pricing

