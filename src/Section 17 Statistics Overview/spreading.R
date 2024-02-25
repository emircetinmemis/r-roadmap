# This needs to be done, I have settled this course notes as a project in src folders. If any path problem occurs, comment out or in this line.
try(setwd("src/Section 17 Statistics Overview"), silent = TRUE)

# Importing libraries
library(ggplot2)

# Load the data
winemag_data <- read.csv("data/winemag-data_first150k.csv")

# Lets get the data
iberian_data <- winemag_data[
  winemag_data$country %in% c("Spain", "Portugal"),
]

# Lets compare the distribution of the points
ggplot(
  data = iberian_data,
  aes(
    x = points,
    fill=country
  )
) +
  geom_density(
    alpha = 0.5
  ) +
  labs(
    title = "Distribution of Points for Iberian Wines",
    x = "Points",
    y = "Density"
  ) +
  theme_minimal()

# Lets see the variance
aggregate(
  x = iberian_data$points,
  by = list(iberian_data$country),
  FUN = var
)

# Lets see the standard deviation
aggregate(
  x = iberian_data$points,
  by = list(iberian_data$country),
  FUN = sd
)

# Please move to boxPlots.R to continue.