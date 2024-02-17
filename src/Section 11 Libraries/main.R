# First install the library to environment. From R directly.

install.packages("tidyverse") # This includes lots of stuff and ggplot is also 
#one of them, for now I will use this because it is written to renv automatically.

install.packages("ggplot2")
install.packages("xlsx")

# for any other library you can use search on google -> read excel file in R

# How to load installed libraries or their functions ?
ggplot() # will give an error because we did not load the library yet.
library(ggplot2)
ggplot() # will work now.
