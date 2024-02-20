# Working directory: It is the directory where the main.R file is located.
getwd()
setwd("D:/Projects/r-roadmap")

file_path <- "src/Section 13 Loading From External/test/test.txt"
readLines(file_path)

setwd("D:/Projects/r-roadmap/src/Section 13 Loading From External")
file_path <- "test/test.txt"
readLines(file_path)

# Loading CSV
example_data <- read.csv(
  file = "test/example_data.csv"
)

# Loading Excel
library(readxl)
example_data_excel <- read_excel(
  path = "test/example_data.xlsx"
)
# or
library(xlsx)
example_data_excel <- read.xlsx(
  file = "test/example_data.xlsx",
  sheetIndex = 1
)

# Connection to databases
# Please look at the database.R file for this.
