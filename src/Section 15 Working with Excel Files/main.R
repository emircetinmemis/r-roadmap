# This needs to be done, I have settled this course notes as a project in src folders. If any path problem occurs, comment out or in this line.
try(setwd("src/Section 15 Working with Excel Files"), silent = FALSE)

# Loading libraries
library(readxl)

# Loading Data
crime_data <- read_xls("data/FBI Crime Data.xls")

# Currently, there are several problems, such as the headings starts from 4th row, and column names should be changed with 3. row, there 
# are some notes, Lot's of NAs and etc. We need to convert this to a analysis friendly format.

# Set the column names to proper names
colnames(crime_data) <- crime_data[3,]

# There are several rows, which are not needed, we need to remove them.
# But to be more dynamic, instead of sub-setting, we we build a pipeline, that will accept the rows that starts with a numeric.
crime_data["converted_index"] <- sapply(
  X = crime_data[,1],
  FUN = as.numeric
)

# Filter out the NA's from df
crime_data_filter <- crime_data[
  !is.na(crime_data$converted_index),
]

# Some years have 4 digits and some have 5, lets fix it.
years <- as.numeric(substr(crime_data_filter$Year, start=1, stop=4))

# Lets drop unused columns
remove_col <- c("Year", "converted_index")
crime_data_filter_remove <- crime_data_filter[
  ,
  !colnames(crime_data_filter) %in% remove_col
]

# Lets convert the df to numeric
summary(crime_data_filter)
# All columns are character, we need to convert them to numeric
#as.numeric(crime_data_filter) # Cant use in df's directly.
numeric_crime_data <- sapply(
  X = crime_data_filter_remove,
  FUN = as.numeric
)
summary(numeric_crime_data)

# Lets assign the rows names back
rownames(numeric_crime_data) <- years

# Automating the column selection
rate_crime_data <- numeric_crime_data[
  ,
  grepl( # Gives which columns contain the word "rate"
    pattern = "rate",
    x = colnames(numeric_crime_data)
  )
]
nominal_crime_data <- numeric_crime_data[
  ,
  !grepl( # Gives which columns contain the word "rate"
    pattern = "rate",
    x = colnames(numeric_crime_data)
  )
]

# Lets change the column names again to shown idfference between rule based or hardcoded solution.
# This is how it look to use hardcoded solutions.x
colnames(nominal_crime_data) <- c(
  "Population",
  "Violent Crime",
  "Murder",
  "Robbery",
  "Aggravated Assault",
  "Property Crime",
  "Burglary",
  "Theft",
  "Motor Theft"
)

# Get the mean per crime type, as.data.frame used because r likes to output vectors
means_crime <- as.data.frame(
  sapply(
    X = as.data.frame(nominal_crime_data),
    FUN = mean
  )
)

# Remove unused first row in means, note that as.data.frame again used.
means_crime <- as.data.frame(
  means_crime[2:nrow(means_crime),]
)

# Lets update the column name
colnames(means_crime) <- c("mean_value")

# Give back the rownames
rownames(means_crime) <- c(
  "Violent Crime",
  "Murder",
  "Robbery",
  "Aggravated Assault",
  "Property Crime",
  "Burglary",
  "Theft",
  "Motor Theft"
)

# Lets get the ggplot.
library(ggplot2)

# Now lets do a bar plot to sown means of crimes
ggplot(
  data = (means_crime / 1000000),
  aes(
    x = rownames(means_crime),
    y = mean_value
  )
) + geom_bar(
  stat = "identity",
  fill = "darkred"
) + theme(
  axis.text.x = element_text(
    angle = 90,
    vjust = 0.5,
    hjust = 1
  )
) + labs(
  title = "Median Distrubition for each Crime",
  x = "Crimes",
  y = "Median"
)
