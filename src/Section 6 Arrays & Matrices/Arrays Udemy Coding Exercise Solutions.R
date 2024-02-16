# Create a 4 dimensional array based on the vector 
# 1:4 and with 3, 4, 5 and 2 elements on each dimension,
# by this order
# save the array on a multidim named object
multidim <- array(1:4, dim = c(3,4,5,2))
array(1:4, dim = c(3,4,5,2))
# Save the vector with the number of dimensions 
# of our array in a dimensions_n object
dimensions_n = dim(multidim)

# Remove the second element of the fourth 
# dimension and store the resulting array in 
# a three_dim named object
three_dim = multidim[,,,-c(2)]

# Remove the third, fourth and fifth elements 
# of the third dimension of the three_dim
# object, write the object in an array 
# named three_dim_2
three_dim_2  = three_dim[,,-c(3,4,5)]

# Apply the logarithm to the last column 
# of the multi dimensional array 
# hint: remember that columns are in the second
# dimensions! 
# modify our three_dim_2 array 
three_dim_2[,4,]  = log(three_dim_2[,4,])

# Raise every element of the first row of 
# our three_dim_2 array to the power of 5 
# rewrite the three_dim_2 object
three_dim_2[1,,]  = three_dim_2[1,,]**5

# Assign the following dimension names to 
# our three_dim_2 vector: 
# Dimension 1 : 'Player 1','Player 2','Player 3'
# Dimension 2: 'Dexterity','Strength','Intelligence','Speed'
# Dimension 3: "House Stark", "House Lannister"
dimnames(three_dim_2) <- list(c('Player 1','Player 2','Player 3'),
                              c('Dexterity','Strength','Intelligence','Speed'),
                              c("House Stark", "House Lannister"))

# Store the Intelligence of Player 3 from House Lannister 
# on a variable called player_3_lan_int
player_3_lan_int  = three_dim_2['Player 3','Intelligence','House Lannister']

# Create an array with the values c('A','B','C','D') in 
# a 2 by 2 dimensional format and an
# an array with the values c('E','F','G','H') in 
# a 2 by 2 format
# Store them in a alpha_1 and alpha_2 variables, 
# respectively 
alpha_1 = array(c('A','B','C','D'), dim=c(2,2))
alpha_2 = array(c('E','F','G','H'), dim=c(2,2))

# Combine alpha_1 and alpha_2, row wise and store
# the resulting object in a combined_alpha named
# object
combined_alpha = rbind(alpha_1, alpha_2)
