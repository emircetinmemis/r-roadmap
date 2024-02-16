cities_population <- c(10000,20000,30000,40000)
#rm(cities_population)

# char_cities_population <- c(10000,20000,30000,"40000") # This will convert all to strings.

melon_weights <- c(1.2, 1.4, 2.4, 3.4)

melon_weights[1]
melon_weights[2:4]
melon_weights[c(1,4)]

melon_weights[1] + melon_weights[2] + melon_weights[3] + melon_weights[4]
sum(melon_weights)

melon_weights/2

sqrt(melon_weights)

exp(melon_weights)

log(melon_weights)

adjusted_weight = c(1.2, 1.2, 1.4, 1.4)
melon_weights * adjusted_weight

new_melon_weights <- c(1.2, 1.4, 2.4, 3.4, 1)
new_melon_weights * adjusted_weight

# Example use case, midterm1, midterm2, final, where grade distribution is 20%, 30%, 50%
grades <- c(72, 63, 80)
grade_distribution <- c(0.2, 0.3, 0.5)
weighted_grades <- grades * grade_distribution
sum(weighted_grades)

# Some methods
mean(grades)
length(grades)
median(grades)
max(grades)
min(grades)
sd(grades)
sort(grades)
sort(grades, decreasing = TRUE)

# Weird usage
melons <- c(1.2, 1.4, 2.4, 3.4, NA)
sum(melons)
sum(melons, na.rm = TRUE) # na.rm means NA-Remove

melons <- c(1.2, 1.4, 2.4, 3.4, Inf)
sum(melons)
sum(melons, na.rm = TRUE) # not working for inf

# comparison operators case

melons = c(1,2, 1.4, 2.4, 3.4)
melons > 2 # This gives a bool vector which can be using for indexing in vectors also
melons[c(FALSE, FALSE, FALSE, TRUE)]
melons[melons > 2]
which(melons > 2) # Gives the index instead of creating a whole bool vector

# names property
countries <- c(10276612, 67545757, 67020000)
names(countries)
names(countries) <- c("Germany", "Turkey", "France")
countries
countries[1]
countries["Germany"]
countries[c("Germany", "Turkey")]
countries > 20000000
names(countries)
which(countries > 20000000)
names(which(countries > 20000000))

# modification
melons <- c(1.2, 1.4, 2.4, 3.4)
melons
melons[1] <- 1.3
melons
melons[2:4] <- c(1.5, 2.5, 3.5)
melons
melons[5] <- 4.5
melons

melons <- c(1.2, 1.4, 2.4, 3.4)
melons[melons<2] <- 2

new_melons <- melons[c(2,4)]
new_melons_expclt <- melons[-c(2,4)]

