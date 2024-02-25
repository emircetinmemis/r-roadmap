# This needs to be done, I have settled this course notes as a project in src folders. If any path problem occurs, comment out or in this line.
try(setwd("src/Section 17 Statistics Overview"), silent = TRUE)

# Importing libraries
library(ggplot2)

# Load the data
winemag_data <- read.csv("data/winemag-data_first150k.csv")

# Lets get the data
windsor_treaty <- winemag_data[
  winemag_data$country %in% c("Portugal", "England"),
]

# Lets plot the box plot
ggplot(
  data = windsor_treaty,
  aes(
    x = points,
    fill = country
  )
) + geom_density(alpha = 0.5)

ggplot(
  data = windsor_treaty,
  aes(
    x = country,
    y = points,
    fill = country
  )
) + geom_boxplot()
