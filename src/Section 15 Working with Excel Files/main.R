# This needs to be done, I have settled this course notes as a project in src folders. If any path problem occurs, comment out or in this line.
try(setwd("src/Section 15 Working with Excel Files"), silent = FALSE)

# Loading Data
data <- read.csv("data/FBI Crime Data.xls")
