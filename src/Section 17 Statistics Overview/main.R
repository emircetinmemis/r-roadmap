# This needs to be done, I have settled this course notes as a project in src folders. If any path problem occurs, comment out or in this line.
try(setwd("src/Section 17 Statistics Overview"), silent = TRUE)

# Importing libraries
library(ggplot2)

# Load the data
winemag_data <- read.csv("data/winemag-data_first150k.csv")

# Set utility functions
get_country_data <- function(country_descriptive) {
  country_wines <- winemag_data[
    winemag_data$country == country_descriptive,
  ]
  return(country_wines)
}
plot_point_distribution <- function(country_descriptive) {
  country_wines <- get_country_data(country_descriptive = country_descriptive)
  
  ggplot(
    data = country_wines,
    aes(
      x = points
    )
  ) +
    geom_density(
      fill = "blue",
      alpha = 0.5
    ) +
    labs(
      title = paste(country_descriptive, "Wine Points Distribution"),
      x = "Points",
      y = "Density"
    )
}

# Lets see what we got over-here
str(winemag_data)

# Lets draw the distribution of the points of a country
plot_point_distribution(country_descriptive = "Portugal")

# This result in a normal distribution type of shape, which means the median and mean are close to each other.
mean(potuguese_wines$points)
median(potuguese_wines$points)

# Lets find the country with the highest result.
country_median_points <- aggregate(
  x = winemag_data$points,
  by = list(winemag_data$country),
  FUN = median
)
# Add the column names
colnames(country_median_points) <- c("country", "median_points")
# Sort the data
country_median_points[
  order(country_median_points$median_points),
]
# Get the country with the highest median points
country <- country_median_points[
  which.max(country_median_points$median_points),
]
# Plot the distribution of the points of the country with the highest median points
plot_point_distribution(country_descriptive = country$country)

# Lets also see the German wines
plot_point_distribution(country_descriptive = "Germany")

# Lets also see the Turkish wines
plot_point_distribution(country_descriptive = "Turkey")

# Lets calculate the mode of the points
occurences <- as.data.frame(table(winemag_data$points))
# The most frequent value
mode <- occurences[
  which.max(occurences$Freq),
  "Var1"
]
mode # This shows that in our data "87" is the most frequent value as a point in all 150k wines.
# Challenge, lets calculate mode for each country
country_modes <- aggregate(
  x = winemag_data$points,
  by = list(winemag_data$country),
  FUN = function(points_vector) {
    points_vector
  }
)

# The points_vector above, usually a numeric vector, lets do a mini practice before moving on.
points_vector <- c(90, 90, 81, 81, 81)
# The mode of the points_vector
occurences <- as.data.frame(table(points_vector))
# The most frequent value
mode <- occurences[
  which.max(occurences$Freq)
  ,
  "points_vector"
]

# Please follow the distribution_comparison.R file for the rest of the code.