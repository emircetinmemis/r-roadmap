# This needs to be done, I have settled this course notes as a project in src folders. If any path problem occurs, comment out or in this line.
try(setwd("src/Section 14 Real-World Walmart Data Analysis"), silent = TRUE)

# Loading Data
walmart_data <- read.csv("data/walmart_data.csv")
walmart_features <- read.csv("data/walmart_features.csv")

summary(walmart_data) # Show min, 1st Qu, Median, Mean, 3rd Qu, Max values of each column
str(walmart_data) # Show the type of each column

n_rows <- nrow(walmart_data) # Number of rows
n_cols <- ncol(walmart_data) # Number of columns

head(walmart_data) # Show first 6 data

rows_per_store <- table(walmart_data$Store) # Count of each store, for example 1/10244 2/10238 3/10272 ... Means that, there are 10244 rows for store 1

rows_per_store <- as.data.frame(rows_per_store) # Convert to data frame

as.character(rows_per_store[which.max(rows_per_store$Freq),"Var1"]) # Store with max rows

# Sum the sales per store, for example store 1 has 222402809 sales
# then rename the columns as store_number and total_sales
sum_by_store <- aggregate(
  x=walmart_data$Weekly_Sales,
  by=list(walmart_data$Store),
  FUN=sum
)
colnames(sum_by_store) <- c("store_number", "total_sales")

# Sort the stores by total sales, successful stores will be at the top
sum_by_store_sorted <- sum_by_store[order(sum_by_store$total_sales, decreasing = TRUE),]

# Plot a bar plot where the plot informs about the total sales per store
barplot(
  sum_by_store_sorted$total_sales, 
  names.arg=sum_by_store$store_number,
  xlab="Store Identifier", 
  ylab="Total Sales", 
  main="Sales comparison of Stores"
)

# Remove the unused variable
rm(sum_by_store_sorted)

# Compute the mean of every column, be careful with the NA values
sapply(
  X = walmart_features,
  FUN = mean,
  na.rm = TRUE
)

# Create a new column in Walmart features called standardized_CPI by subtracting the mean and diving by the standard deviation.
walmart_features$standardized_cpi <- (
  (walmart_features$CPI - mean(walmart_features$CPI, na.rm=TRUE))
  /
  (sd(walmart_features$CPI, na.rm=TRUE))

  )

# Lets produce a line plot for sales of store "selected" for every department of it.
selected_store_id <- 1
selected_store <- walmart_data[walmart_data$Store == selected_store_id,]
selected_store_total <- aggregate(
  x = selected_store$Weekly_Sales,
  by = list(selected_store$Date),
  FUN = sum
)
colnames(selected_store_total) <- c("Date", "Total_Sales")
plot(
  x = as.factor(selected_store_total$Date), # Sometimes error happens in new r versions, so I converted to factor
  y = selected_store_total$Total_Sales,
  type = "l",
  xlab = "Date",
  ylab = "Total Sales",
  main = "Total Sales of Selected Store"
)
lines(
  x = as.factor(selected_store_total$Date),
  y = selected_store_total$Total_Sales,
  col = "red"
)

# Lets use ggplot2 to produce a better line plot for sales of store "selected" for every department of it.
library(ggplot2)
ggplot(
  data = selected_store_total,
  aes(
    x = as.Date(Date),
    y = Total_Sales,
    group = 1
  )
) + geom_line(
) + geom_point(
) + labs(
  title = "Total Sales of Selected Store",
  x = "Date",
  y = "Total Sales"
)

# Last practice, lets plot the sales of the store "selected" for the top 5 departments of it.
selected_store_id <- 2
selected_store <- walmart_data[walmart_data$Store == selected_store_id,]
sales_by_department <- aggregate(
  x = selected_store$Weekly_Sales,
  by = list(selected_store$Dept),
  FUN = sum
)
colnames(sales_by_department) <- c("Department", "Total_Sales")
sales_by_department <- sales_by_department[order(sales_by_department$Total_Sales, decreasing = TRUE), "Department"]
top_5_departments <- head(sales_by_department, 5)
top_5_department_sales <- selected_store[selected_store$Dept %in% top_5_departments,]
library(ggplot2)
ggplot(
  data = top_5_department_sales,
  aes(
    x = as.Date(Date),
    y = Weekly_Sales,
    group = Dept,
    color = as.factor(Dept)
  )
) + geom_line(
) + geom_point(
) + labs(
  title = "Total Sales of Top 5 Departments of Selected Store",
  x = "Date",
  y = "Total Sales"
) + scale_color_discrete(
  name = "Department"
)
