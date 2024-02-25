# This needs to be done, I have settled this course notes as a project in src folders. If any path problem occurs, comment out or in this line.
try(setwd("src/Section 17 Statistics Overview"), silent = TRUE)

# Importing libraries
library(ggplot2)

# Load the data
winemag_data <- read.csv("data/winemag-data_first150k.csv")
