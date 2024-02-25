# This needs to be done, I have settled this course notes as a project in src folders. If any path problem occurs, comment out or in this line.
try(setwd("src/Section 16 Functions"), silent = TRUE)

# Importing libraries
library(ggplot2)

# Loading Data
walmart_data <- read.csv("data/walmart_data.csv")

# A function to plot the sales of a department in a store
plot_store_department <- function(store_id, department_id) {
  walmart_filter <- walmart_data[
    walmart_data$Store == store_id & walmart_data$Dept == department_id
    ,
  ]
  
  plot <- ggplot(
    data = walmart_filter,
    aes(
      x = as.Date(Date),
      y = Weekly_Sales,
      #group = Dept, color = as.factor(Dept)
      group = 1  
    )
  ) + geom_line(
  ) + geom_point(
  ) + labs(
    title = paste("Total Sales of Department", department_id, "of Store", store_id),
    x = "Date",
    y = "Total Sales"
  ) + scale_color_discrete(
    name = "Department"
  )
  
  return(plot)
}
# Test the function
plot_store_department(1, 5)
plot_store_department(1, 16)
plot_store_department(1, 19)

# A function to plot the sales of a store
plot_store <- function(store_id) {
  walmart_filter <- walmart_data[
    walmart_data$Store == store_id
    ,
  ]
  
  plot <- ggplot(
    data = walmart_filter,
    aes(
      x = as.Date(Date),
      y = Weekly_Sales,
      group = Dept, color = as.factor(Dept)
    )
  ) + geom_line(
  ) + geom_point(
  ) + labs(
    title = paste("Total Sales of Store", store_id),
    x = "Date",
    y = "Total Sales"
  ) + scale_color_discrete(
    name = "Department"
  )
  
  return(plot)
}
# Test the function
plot_store(3)

# Lets create dynamic department.
plot_store_department <- function(store_id, department_id) {
  
  # Check if department_id is a vector
  if (is.vector(department_id)) {
    walmart_filter <- walmart_data[
      walmart_data$Store == store_id & walmart_data$Dept %in% department_id
      ,
    ]
    
    aes <- aes(
      x = as.Date(Date),
      y = Weekly_Sales,
      group = Dept, color = as.factor(Dept)
    )
    
  } else {
    walmart_filter <- walmart_data[
      walmart_data$Store == store_id & walmart_data$Dept == department_id
      ,
    ]
    
    aes <- aes(
      x = as.Date(Date),
      y = Weekly_Sales,
      group = 1
    )
  }
  
  plot <- ggplot(
    data = walmart_filter,
    aes
  ) + geom_line(
  ) + geom_point(
  ) + labs(
    title = paste("Total Sales of Department", department_id, "of Store", store_id),
    x = "Date",
    y = "Total Sales"
  ) + scale_color_discrete(
    name = "Department"
  )
  
  return(plot)
}
# Test the function
plot_store_department(1, c(5, 16, 19))
plot_store_department(1, 5)
