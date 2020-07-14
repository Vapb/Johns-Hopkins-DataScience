library(datasets)
data(iris)
?iris
mean(iris$Sepal.Length)

# Mean virginica Length
virginica <- iris[iris$Species == 'virginica',]
mean(virginica$Sepal.Length)

apply(iris[,1:4],2,mean)


library(datasets)
data(mtcars)

# average miles per gallon (mpg) by number of cylinders in the car (cyl)
tapply(mtcars$cyl, mtcars$mpg, mean) # Nah
mean(mtcars$cyl, mtcars$mpg) # Nah
with(mtcars, tapply(mpg,cyl,mean)) # TRUE
lapply(mtcars,mean) # Nah
tapply(mtcars$mpg, mtcars$cyl, mean) # True
sapply(split(mtcars$mpg,mtcars$cyl),mean) # True
apply(mtcars,2,mean)# Nah
spline(mtcars,mtcars$cyl)# nah
sapply(mtcars,cyl,mean) # Nah

# Absolute diference 
new <- tapply(mtcars$hp, mtcars$cyl, mean)
new