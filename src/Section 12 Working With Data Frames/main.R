# Filtering joining sorting and modifying data as real world examples.
# We will also start loading and downloading real big data sets now.
data() # Shows the available data sets.

# Lets select "mtcars - Motor Trend Car Road Tests" from the list
data(mtcars)
# This is an specific use case, we do not have to assign it to a variable, 
# we can use it directly. Because with data() we actually loaded it.
mtcars

# We can use ? for this prepared data by using its metadata
?mtcars

dim(mtcars) # 32 rows and 11 columns
nrow(mtcars) # 32
ncol(mtcars) # 11

?head()
head(mtcars, 1) # First 1 rows
tail(mtcars, 1) # Last 1 rows

str(mtcars2) # Structure of the data set

brands <- rownames(mtcars)
chracteristics <- colnames(mtcars)

summary(mtcars) # Summary of the data set

mtcars[mtcars$hp == max(mtcars$hp),]
mtcars[which.max(mtcars$hp),]

# Filtering

# We have 4 6 and 8 cylinder cars, lets filter them to see only 4, then 6 and 8

data(mtcars)

mtcars$cyl # all_cyclinders
mtcars$cyl == 4
mtcars$cyl == 6
mtcars$cyl == 8

# mtcars[R,C] by writing to R part we can modify and call rows, lets do that, 
# this is so similar that we have excluded columns to delete them previously 
# such as countries[,-c(4)] # This would delete the 4th column, from all rows 
# because all rows selected.

mtcars[mtcars$cyl == 8,] # All 8 cylinder cars
mtcars[(mtcars$cyl == 8 | mtcars$cyl == 6),] # All 8 or 6 cylinder cars
mtcars[(mtcars$cyl == 6 & mtcars$gear == 3),] # All 6 cylinder cars with 3 gears
mtcars[mtcars$cyl != 4,] # All cars except 4 cylinder cars
mtcars[(mtcars$cyl == 8 & mtcars$hp > 300),] # All 8 cylinder cars with more than 300 hp

# when need to add more and more conditions, we should be using vectors.
cyc_list <- c(4, 6)
mtcars[mtcars$cyl %in% cyc_list,] # All 4 or 6 cylinder cars

# Creating new columns