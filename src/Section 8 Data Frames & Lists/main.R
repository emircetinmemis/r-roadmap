# Data frames

# Has rows and columns
# Has nrow, ncol and dim properties similar to matrices
# Every column has to be of the same type
# Main differencei matrices vectors and arrays looking for same data type for 
#all elements, but data frames & lists can have different types of data for each column.

countries <- data.frame(
  country = c("Portugal", "France", "UK"),
  population = c(10280000, 66990000, 66650000),
  EU = c(TRUE, TRUE, FALSE)
)

countries2 <- data.frame(
  population = c(10280000, 66990000, 66650000),
  EU = c(TRUE, TRUE, FALSE),
  row.names = c("Portugal", "France", "UK")
)
countries2

countries2["Portugal",]
countries2[,"population"]

str(countries2)
summary(countries2)

# R Lists

# So flexible and can even have names. Shortly includes all different types of 
#objects including data frames arrays int str etc anything.

multi_type <- list(
  "Portugal",
  10280000,
  TRUE
)
multi_type[[1]]

# Note that, for adding names this could be used -> 'names(list) <- c("name1", "name2", "name3")',
#but we can directly use the names as paremeter such that "SomeName=". or SomeName = c("name1", "name2", "name3")

multi_object <- list(
  "Vector" = c(1, 2, 3),
  Matrix = matrix(
    c(1, 2, 3, 4),
    nrow = 2,
    ncol=2
  ),
  List = list(
    "Portugal",
    10280000,
    TRUE
  )
)
multi_object$Vector
multi_object[["Vector"]]
multi_object[[1]]

element_on_first_row_second_column_on_matrix_on_list <- multi_object[["Matrix"]][1, 2]
element_on_first_row_second_column_on_matrix_on_list <- multi_object$Matrix[1, 2]

# Starting the practice session

ecm_favorites <- data.frame(
  object = c("Samoyed", "Monster", "Forza Horizon 5"),
  type = c("Dog", "Device", "Game"),
  enjoyment = c(10, 9, 10),
  last_used = c(as.Date("3.02.2024", format = "%d.%m.%Y"), as.Date("16.02.2025", format = "%d.%m.%Y"), as.Date("16.02.2024", format = "%d.%m.%Y"))
)

countries <- data.frame(
  population = c(10280000, 66990000, 66650000),
  EU = c(TRUE, TRUE, FALSE),
  row.names = c("Portugal", "France", "UK"),
  stringsAsFactors = FALSE
)
str(countries)
summary(countries)
# As seen below data frames are just 2 dimensional arrays with names for rows and columns.
countries
portugal_population <- countries["Portugal",1]
portugal_population <- countries["Portugal","population"]
portugal_and_france_population <- countries[c("Portugal", "France"),1]

countries
new_portugalk_population <- countries["Portugal",1] * 2
countries["Portugal",1] <- new_portugalk_population
countries
countries["Portugal",1] <- countries["Portugal",1] * 2
countries

# Expandadtions

countries <- data.frame(
  population = c(10280000, 66990000, 66650000),
  EU = c(TRUE, TRUE, FALSE),
  row.names = c("Portugal", "France", "UK"),
  stringsAsFactors = TRUE
)
str(countries)

turkey_data <- data.frame(
  population = 82003882,
  EU = TRUE,
  row.names = "Turkey (IRMAGININNN AKKKKISINA OOLLUUURUUMMMM TURKIYEMMM <3) (AS BAYRAKLARI AS)"
)

countries <- rbind(countries, turkey_data)

# lets add an antire new column
taharet <- c(FALSE, FALSE, FALSE, TRUE)

countries <- cbind(countries, taharet)

# taharet situation of all countries
countries[, "taharet"]

str(countries)
summary(countries)

# lets remove turkey
countries <- countries[-4,]

# lets remove the taharet column
countries[,"taharet"] <- NULL
