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

# Modification & Creating new columns

data(mtcars)

mtcars$hp
mtcars$wt

# Add it as a new column

mtcars$hp_per_wt <- mtcars$hp / mtcars$wt
# or
mtcars <- cbind(mtcars, hp_per_wt_second = mtcars$hp / mtcars$wt)
# or
mtcars[,"hp_per_wt_third"] <- mtcars$hp / mtcars$wt

# lets reset
data(mtcars)

mtcars[,"hp_per_wt_third"] <- mtcars[,"hp"] / mtcars[,"wt"]

mtcars$hp_squared <- mtcars$hp**2

# transfer row names to column names
data(mtcars)

mtcars$model <- rownames(mtcars)
rownames(mtcars) <- NULL

# make model column the first column | note this is only for test.
data(mtcars)
models <- rownames(mtcars)
rownames(mtcars) <- NULL
mtcars <- cbind(models, mtcars)

# before moving on lets take a look at applying family property to a data, then we will continue.
# !!!
# PLEASE LOOK AT APPLY.R FILE FOR APPLY PRACTICE
# !!!

# Now as we learned aplly, we will use sapply to create a new column
data(mtcars)

mtcars$model <- rownames(mtcars)

# Normally, it would go like this
models <- strsplit(x=mtcars$model, split=" ")

models[[1]][1]
models[[2]][1]
models[[3]][1]

# But we can do this
brands <- sapply(models, function(x) {x[1]})
# or use "[" with n=1, which means take the first element of the list
sapply(models, "[", n=1) # But I prefer the first one, it is more readable.

# Lets do a fresh example now, the above one was just a practice.
data(mtcars)

# Get an external object to work on
car_definition <- rownames(mtcars)

# Extract the brands
brands <- sapply(
  X = car_definition,
  FUN = function(current_car_definition) {
    definitives <- strsplit(x = current_car_definition, split = " ")
    definitives[[1]][1]
  }
)

# Extract the models
models <- sapply(
  X = car_definition,
  FUN = function(current_car_definition) {
    definitives <- strsplit(x = current_car_definition, split = " ")
    definitives[[1]][-1]
  }
)

# This is a good practice.
brands <- as.factor(brands)
models <- as.factor(models)

# Delete the old row names
rownames(mtcars) <- NULL

# Add the new columns
mtcars$brand <- brands
mtcars$model <- models


# Aggregation and sorting

# Aggregation : We can use aggregate() function to aggregate the data which means
# we can group the data by a column and apply a function to the groups.

# Lets group the data by the number of cylinders and calculate the mean of the
# horse power and weight of the cars in each group.

data(mtcars)

# Group by the number of cylinders
cyl_grouped <- aggregate(
  x = mtcars[,c("hp", "wt")],
  by = list(mtcars$cyl),
  FUN = mean
)
