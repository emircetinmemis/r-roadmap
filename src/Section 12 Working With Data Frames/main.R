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

# Aggregation : We can use aggregate() function to aggregate the data which means similar to group by in SQL,
# we can group the data by a column and apply a function to the groups.

data(mtcars)

# Lets also extract the additional columns needed again.
mtcars$model <- rownames(mtcars)
mtcars$brand <- sapply(X=strsplit(x=mtcars$model, split=" "), FUN="[", n=1)

?aggregate

# check the mean of the horsepower by brand
hp_brands <- aggregate(
  x = mtcars$hp,
  by = list(mtcars$brand),
  FUN = mean
)

colnames(hp_brands) <- c("brand", "mean_hp")

hp_brands[order(hp_brands$mean_hp, decreasing = TRUE),]

# check the mean of the horsepower by gear
hp_gears <- aggregate(
  x = mtcars$hp,
  by = list(mtcars$gear),
  FUN = mean
)

# Merging data frames - Table joining !

# Inner Join : We get the intersection of the two tables
# Full Join : We get the union of the two tables
# Left Join : We get the left table and the intersection of the two tables
# Right Join : We get the right table and the intersection of the two tables

data(mtcars)

# Lets also extract the additional columns needed again.
mtcars$brand <- sapply(X=strsplit(x=rownames(mtcars), split=" "), FUN="[", n=1)

# Add the car model column
mtcars$car_model <- rownames(mtcars)

# Create a origin table also
brands_origin = data.frame(
  brand = c("Mazda", "Toyota", "Fiat", "Volvo", "Skoda"),
  country = c("Japan", "Japan", "Italy", "Sweden", "Czech Republic")
)

# Inner Join
mtcars_origin <- merge(
  x = mtcars,
  y = brands_origin,
  by = "brand"
)

# Left Join
mtcars_origin_left <- merge(
  x = mtcars,
  y = brands_origin,
  by = "brand",
  all.x = TRUE
)

# Right Join
mtcars_origin_right <- merge(
  x = mtcars,
  y = brands_origin,
  by = "brand",
  all.y = TRUE
)

# Full Join
mtcars_origin_full <- merge(
  x = mtcars,
  y = brands_origin,
  by = "brand",
  all = TRUE
)

# Extra, using a sql like methodology.
#install.packages("sqldf")
library(sqldf)

sql_df_example <- sqldf(
  "
  SELECT * FROM mtcars
  WHERE hp > 100 AND wt < 3
  "
)

# Inner Join
sql_df_inner <- sqldf(
  "
  SELECT * FROM mtcars
  INNER JOIN brands_origin
  ON mtcars.brand = brands_origin.brand
  "
)

# Plotting

data(mtcars)

# Scatter plot : We can use scatter plot to see the relationship between two variables
plot(
  x = mtcars$hp,
  y = mtcars$wt,
  xlab = "Horsepower",
  ylab = "Weight",
  main = "Horsepower vs Weight",
  col = "red",
  pch = 4,
  cex = 2,
  lwd = 3
)

# Bar plot : We can use bar plot to see the frequency of a categorical variable
table(mtcars$cyl)
barplot(
  height = table(mtcars$cyl),
  xlab = "Cylinders",
  ylab = "Frequency",
  main = "Frequency of Cylinders",
  col = c("red", "blue", "green"),
  border = "white"
)

# Box plot : We can use box plot to see the distribution of a continuous variable
boxplot(
  hp~gear,
  data = mtcars,
  xlab = "Gears",
  ylab = "Horsepower",
  main = "Horsepower by Gears"
)

# Histogram : We can use histogram to see the distribution of a continuous variable
hist(
  mtcars$hp,
  xlab = "Horsepower",
  ylab = "Frequency",
  main = "Frequency of Horsepower",
  col = "red",
  border = "white"
)

# Moving to ggplot2, easier and more powerful than base R

#install.packages("ggplot2")
library(ggplot2)

?ggplot

ggplot()

ggplot(
  data = mtcars,
  mapping = aes(x = hp)
) + geom_histogram(
  binwidth = 50,
  fill = "red",
  color = "white"
)

ggplot(
  data = mtcars,
  mapping = aes(x = hp, y = wt)
) + geom_point()

