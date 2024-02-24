# Data Frame we will use:
messy_df <- data.frame(
  ba=c("Portugal","Spain","Italy","France",NA, "countries"),
  ba=c(10, 10.4, 10.2, "14", NA, "indicator_1"),
  ba=c(122, 231, 123, 333, NA, "indicator_2"),
  ba=c(45, 44, 44, 24, NA, "index_1"),
  ba=c(23, 21, 23, 44, NA, "index_2")
)

# 1. Select the last row of the data frame and store it in a variable called headings.
# Convert that object into a matrix to lose the metadata regarding the data frame and
# then use c() to convert it into a vector. hint: your function should look like
# c(as.matrix(something goes in here))
headings = c(as.matrix(tail(messy_df, 1)))

# 2. Assign the headings to the data frame col names
colnames(messy_df) = headings

# 3. Remove the null value rows from your data frame. Rewrite the messy_df object.
?complete.cases
messy_df = messy_df[complete.cases(messy_df),]

# 4. Remove the rows that had the headings from your data frame. Rewrite the messy_df object
messy_df = messy_df[-nrow(messy_df),]

# 5. Assign the countries column to the row names of the data frame - drop the 
# countries variable afterwards.
rownames(messy_df) = messy_df$countries
messy_df$countries <- NULL

# 6. Create two different data frames, indicators and indexes. The first takes the
# first two columns of the data set. The second takes the last two columns of the data set
# Bonus: Try to automate your pipeline using 'grepl'
indicators = messy_df[
  ,
  grepl("indicator", colnames(messy_df))  # In short this gives a Boolean matrix, 
                                          # TRUE  TRUE FALSE FALSE, and the ones 
                                          # with true is selected from rows, because 
                                          # this is the right side of "," in sub-setting
]
indexes = messy_df[
  ,
  grepl("index", colnames(messy_df))
]
