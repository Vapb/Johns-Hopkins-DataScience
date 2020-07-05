## Data Types

############## VECTORS

x <- c(0.5,0.6)
x <- c(TRUE , FALSE)
x <- c('a','B','c')
x <- 0:3

x <- vector("numeric", length = 7)

############# Mixing objects

x1 <- c('a',45)
x1 <- c('b',4,6,7)
x1 <- c(T,F,2)

#############  Classes

x2 <- c(0,1,0)
class(x2)

x3 <- as.logical(x2)
print(x3)

x3 <- as.character(x2)
print(x3)

x2 <- c('a','b','c')
x3 <- as.integer(x2)
print(x3)

############# Lists

x4 <- list('a',21,T,0+2)

# Subsetting
# [ return same class
# [[ Extract Elements
# $ on list with name



############# Matrix

m <- matrix(1:6 ,nrow = 2, ncol = 3)

dim(m) 
attributes(m)

m2 <- 1:10
dim(m2) <- c(2,5)

a <- 1:5
b <- 6:10

m3 <- cbind(a,b) # Collum
m3 <- rbind(a,b) # Row

######### Factors

y <- factor(c('a1','b2','c3','b2','a1','a1','c3'))
table(y)


########## Missing 

y1 <- c(1,2,3,NA,'a','b')
is.na(y1)
is.nan(y1)

y2 <- c(NaN,NA,3,1,2)
is.na(y2)
is.nan(y2)


########## Data Frame

x <- data.frame(a = 1:5, b = 6:10, c = c(T,F,T,F,T))
nrow(x)
ncol(x)

### Names

x <- c(1:3)
names(x)
names(x) <- c('a','b','c')

#### Subseting  

a <- c(1,2,3,4,5,6)
b <- a[a > 2]
c <- a[a >= 4]
d <- a[1:2]
a[a>4] <- 10

a <- list(foo = 1:4, bar = 'hello')
a[1]
a['foo']
a[[1]][[2]]


x <- matrix(1:6,2,3)
y <- x[1,2]

### Remove NAN

x <- c(1,2,NaN,4,NA,6)
nulls <- is.na(x)
y <- x[!nulls]

a <- c(4,NA,6,7,NA)
b <- c(8,NA,2,4,NA)
good <- complete.cases(a,b)
a[good]
b[good]
