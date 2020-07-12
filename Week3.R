########## Lapply

x <- list(c(3,5,6),1:5,c('a','b'))
y <- lapply(x, mean)

####### APPLY

x <- matrix(1:10, nrow = 2, ncol = 5)
apply(x,2, mean) # col level
apply(x,1, mean) # row level

apply(x, 1,quantile, c(0.25,0.75))


############ Mapply 

x <- mapply(rep,1:4, 4:1)
y <- list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))


############## Split

x <- c(1:10)
y <- c(1:2)

split(x, y)

# dataframe split
m <- split(airquality, airquality$Month)
lapply(m, function(x)  colMeans(x[,c('Ozone','Solar.R','Wind','Temp')], na.rm = TRUE))
sapply(m, function(x)  colMeans(x[,c('Ozone','Solar.R','Wind','Temp')], na.rm = TRUE))


