# THIS FILE SHOULD BE READ AFTER MAIN, BECAUSE THIS FILE IS REFERENCED IN THAT.

# for this purpose we will use a new data set called "iris" which is a built-in data set in R.

data(iris) # Even its built-in, let load it like this instead of accessing directly

summary(iris)

?apply
apply(
  X=iris, 
  MARGIN=2, 
  FUN=mean
)
# we cant use like this because the species colum includes a chracter and it coerces to character all other columns and mean not applied.
apply(
  X=iris[,1:4], 
  MARGIN=2, 
  FUN=mean
)

?lapply
lapply(
  X=iris,
  FUN=mean
)
lapply(
  X=iris[,1:4],
  FUN=max
) # lapply turns elements to factors so characters and numerical stuff not happening. Again to enable it directy remove chacrters



# !!!!!!!!!!!!!!!!!!! the main use cases of applies, se below
sum(iris[,1])
sum(iris[,2])
sum(iris[,3])
sum(iris[,4])

# or apply the same function to those columns like this
apply(
  X=iris[,1:4],
  MARGIN=2,
  FUN=sum
)
lapply(
  X=iris[,1:4],
  FUN=sum
)

# l apply returns a list and sapply tries returns a simplified version of the object which means it tries to return a vector.
x = lapply( # This gives a list of sqrt for each column
  X=iris[,1:2],
  FUN=sqrt
)
y = sapply( # This gives a vector of sqrt for first column
  X=iris[,1:2],
  FUN=sqrt
)
x[1]