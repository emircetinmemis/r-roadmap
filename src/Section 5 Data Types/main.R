text_var = "name"

num = 1
num2 = 1.4

num = 1L
num2 = as.integer(1)

as.numeric()
as.integer()
as.character()
as.logical()

is.numeric(1)
class("w")
class(1)

number = 1
class(number)
typeof(number)

my_date = as.Date("2001-11-10")

word = "newspaper"
class(word)

numeric_vector = c(1, 2, 3, 4, 5)
typeof(numeric_vector)
class(numeric_vector)

# conversions
num = 1
as.character(num)
as.logical(num)
numeric_vector = c(1, 2, 3, 4, 5)
as.character(numeric_vector)

years = c(2010, 2011, 2012, 2013, "Not Defined")
updated = as.numeric(years)
updated

logical_vector = c(TRUE, FALSE, TRUE)
as.numeric(logical_vector)

# FACTORS -> Have distinct values and are used to represent categorical

labels <- c("Asia", "Oceania", "Antartica", "Europe", "Africa", "Europe", "North America", "South America", "Africa")

factor_labels = factor(labels)

nlevels(factor_labels)

altitude_levels = c("High", "Low", "Medium", "Low", "High", "Low")
altitude_Factor = factor(altitude_levels, order=TRUE, levels=c("Low", "Medium", "High"))
as.integer(altitude_Factor)

# DATES

dates = as.Date(c("2010-01-01", "2010-01-02", "2010-01-03"))
as.Date(c("10.11.01"), format="%d.%m.%y")
as.Date(c("10.11.2001"), format="%d.%m.%Y")

start_date = as.Date("22.01.2024", format="%d.%m.%Y")
end_date = as.Date("16.02.2024", format="%d.%m.%Y")

days <- as.numeric(format(start_date, "%d"))








