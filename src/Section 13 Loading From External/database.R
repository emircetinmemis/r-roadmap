# Install required packages
install.packages(c("DBI","RODBC","odbc","dplyr","dbplyr"))

# Import required libraries
library(DBI)
library(RODBC)
library(odbc)
library(dplyr)
library(dbplyr)

# Check a list of unique databse drivers on my system
sort(unique(odbc::odbcListDrivers()[[1]]))

# Connect RSudio to MySQL database
conn <- dbConnect(
  RMySQL::MySQL(),
  dbname = "reqression_demo",
  host = "localhost",
  port = 3306,
  user = "root",
  password = "Ee67456133140"
)

# Check the connection
conn

# List all the tables in the database
dbListTables(conn)

# Read the table from the database
one_variable_table <- dbReadTable(conn, "one_variable")

# Execute a query on the database
result <- dbGetQuery(
  conn,
  "
  SELECT * FROM one_variable
  "
)

# Take a glimpse of the data
glimpse(one_variable_table)
glimpse(result)

# Close the connection
dbDisconnect(conn)

