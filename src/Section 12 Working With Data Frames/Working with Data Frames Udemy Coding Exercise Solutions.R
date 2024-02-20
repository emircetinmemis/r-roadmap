# Load the swiss dataset from R - don't forget
# that you don't need to assign it to a variable
# as it is an internal dataset from R
data(swiss)

# Extract dimensions of the dataframe and store
# it in a variable called dim_seiss
dim_swiss = dim(swiss)

# Create a column in the swiss dataframe
# with the rownames of the table
# called municipality
swiss$municipality = rownames(swiss)

# Filter rows on the swiss dataset with 
# agriculture less than 10 and store the 
# result in a dataframe called low_agriculture
low_agriculture = swiss[swiss$Agriculture < 10,]

# Extract the rows of the dataframe that have S
# the column Education with the values 6, 8 and
# 10 - store them in a data frame called 
# education_levels 
education_levels = swiss[swiss$Education %in% c(6,8,10),]

# Extract the rows of the dataframe that have 
# education higher than 10 and catholic less than or equal 
# to 50 - store the rows in a filter_3 named object
filter_3 = swiss[swiss$Education > 10 & swiss$Catholic <= 50,]

# Check the mean of the first 6 variables in the swiss dataset
# Hint: Use one of the apply family functions!

mean_swiss <- sapply(swiss[,1:6], mean)

# Sort the dataframe swiss by the column Infant.mortality 
# in a descending order - store it in a dataframe called 
# sorted_swiss
sorted_swiss <- swiss[order(-swiss$Infant.Mortality),]

# Create a new dataframe with two columns
# that maps the municipality 
# to it's canton with the data:
# municipality = c('ValdeTravers','Boudry','Sion','Orbe','Lavaux')
# canton = c('Neuchatel','Neuchatel','Valais','Vaud','Vaud')

# Store the resulting object in a data frame called cantons
cantons <- data.frame(
  municipality = c('ValdeTravers','Boudry','Sion','Orbe','Lavaux'),
  canton = c('Neuchatel','Neuchatel','Valais','Vaud','Vaud')
)

# Perform a left merge between cantons and the swiss dataset 
# and store the resulting object in a left_swiss named object

# Hint: you can use the municipality to connect both datasets!

left_swiss = merge(x=swiss, y=cantons, by='municipality', all.x=TRUE)

# Perform an inner merge between cantons and the swiss dataset 
# and store the resulting object in a inner_swiss named object

inner_swiss = merge(x=swiss, y=cantons, by='municipality')

# Check the maximum value of Education by Canton 
# Hint: Use the aggregate function!

# Store the object in a max_education_canton

max_education_canton = aggregate(
  x = inner_swiss$Education,
  by= list(inner_swiss$canton),
  FUN=max
)
