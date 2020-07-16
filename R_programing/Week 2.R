
##### IF/ELsE

x <- 5

if (x > 3) {
    print(paste('X is Larger than 3, The value of X is ', toString(x) ))
} else if (x == 3) {
    print('X is equal to 3')
} else {
    print(paste('X is Smaller than 3, The value of x is ',toString(x)))
}

##### FOR 

x <- c(2,5,3,9,8,11,6)
y <- matrix(1:6, 2,3)


for (i in seq_along(x)) {
    print(i)
}

#### While

count <- 0

while (count < 10) {
    print(count)
    count <- count + 1
} 

##### FUnctions

add2 <- function(a,b) {
    a + b  # Or Return(a+b)
} 

above <- function(a,n) {
    cond <- a > n # Logical stament
    a[cond]
}

colmean <- function(ma) {
    result <- list()
    for (col_ma in seq_len(ncol(ma))){
        colmean_value <- 0
        for(row_ma in seq_len(nrow(ma))){
            colmean_value <- colmean_value + ma[row_ma,col_ma]
            print(ma[row_ma,col_ma])
        }
        result <- append(result,(colmean_value)/nrow(ma))
    }
    return(result)
}

###### 
