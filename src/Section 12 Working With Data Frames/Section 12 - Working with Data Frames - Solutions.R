# Exercise 1 
data(longley)

# Exercise 2 
head(longley,5)

# Exercise 3
str(longley)

# Exercise 4
summary(longley)

# Exercise 5
mean_unemployment = summary(longley)[4,3]

# Exercise 6
mean_unemployment = strsplit(mean_unemployment, ":")[[1]][2]

# Exercise 7
mean_unemployment = as.numeric(mean_unemployment)

# Exercise 8
mean_unemployment_df = mean(longley$Unemployed)

# Exercise 9 
mean_unemployment==mean_unemployment_df

# Exercise 10
as.integer(mean_unemployment) == as.integer(mean_unemployment_df)

# Exercise 11 
columns = colnames(longley)

# Exercise 12 
longley$gnp_per_capita = longley$GNP/longley$Population

# Exercise 13 
gnp_median = apply(longley, 2, FUN=median)['GNP']

# Exercise 14
population_sd = sapply(longley, sd)['Population']
