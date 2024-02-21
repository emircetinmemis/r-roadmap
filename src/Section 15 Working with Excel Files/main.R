# This needs to be done, I have settled this course notes as a project in src folders. If any path problem occurs, comment out or in this line.
try(setwd("src/Section 15 Working with Excel Files"), silent = FALSE)

# Loading libraries
library(readxl)

# Loading Data
crime_data <- read_xls("data/FBI Crime Data.xls")

# Currently, there are several problems, such as the headings starts from 4th row, and column names should be changed with 3. row, there 
# are some notes, Lot's of NAs and etc. We need to convert this to a analysis friendly format.

