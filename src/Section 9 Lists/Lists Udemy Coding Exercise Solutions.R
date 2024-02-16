# Create a list with 3 elements: 
# - a character with the element "John"
# - a vector with the values 100, 250, 300, 25
# - a matrix with the values (1,1,0,0) with 
# two rows and two cols

# store the returning object in an object 
# called customer

customer = list("John", c(100,250,300,25), matrix(c(1,1,0,0),nrow=2,ncol=2))

# Add a fourth element to our list customer 
# the value 2015

customer[[4]] <- 2015

# Add names to our list elements 
# The names of our elements should be: 
# "Name", "Balance", "Products", "Opening Date"

names(customer) = c("Name","Balance","Products","Opening Date")

# Change the customer last Balance value to 10
# Change the customer object itself

customer[[2]][4] <- 10

# Store the products matrix in an object called
# products 

products <- customer[['Products']]

# Create a new customer (a list) with two 
# elements - a character with "Anne"
# and a vector with c(400, 232, 294, 593)

# name the object new_customer and give names
# to the list elements with name "Name_2" and "Balance_2"

new_customer = list(
  "Name_2" = "Anne",
  "Balance_2" = c(400, 232, 294, 593)
)


# Join the two lists in a new list called 
# final_list 

final_list = c(customer, new_customer)