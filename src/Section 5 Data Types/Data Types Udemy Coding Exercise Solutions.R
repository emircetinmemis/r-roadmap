# This is our example vector (don't change this)
years <- c(2008,2009,2010,2011,2012,2013, "YEAR")

# Extract the underlying data type of the vector years
# and store it in a variable called type_years
type_years = typeof(years)

# Extract the class data type of the vector years
# and store it in a variable called class_type_years
class_type_years = class(years)

# Test if the vector years is of a numeric class type 
# and store the result in a variable is_numeric
is_numeric  = is.numeric(years)

# Convert the years vector to numeric and store 
# it in a variable called numeric_years
# Remove the last element before conversion
numeric_years  = as.numeric(years[1:(length(years)-1)])

# Convert the years vector to a factor and store
# it in a variable called factor_years
factor_years  = factor(years)

# Convert the years vector to a factor and 
# make it ordinal in ascending order 
# remove the NA with indexers 
ordinal_years  = factor(years[1:length(years)-1], ordered=TRUE, 
                        levels=c(2008,2009,2010,2011,2012,2013))

# Extract the number of levels of ordinal_years
# store it in a variable named number_levels
number_levels  = nlevels(ordinal_years)

# Create a date vector (with class type as date) 
# with the 1st, 2nd and 3rd of March of 2019
# store those values in a variable called
# first_three_days_march 
first_three_days_march = as.Date(c('2019/03/01',
                                   '2019/03/02',
                                   '2019/03/03'))

# Extract the day of the first_three_days_march
# and store it in a vector called days
days = format(first_three_days_march, '%d')