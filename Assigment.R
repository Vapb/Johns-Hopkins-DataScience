## MakeCachematrix

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y){
        x <<- y
        Inv <<- NULL
    }
    get <- function() {x}
    setinv <- function(inverse) {inv <<- inverse}
    getinv <- function() {inv}
    list(set = set, get = get, setinv = setinv, getinv = getinv)
    
}


## Cachesolve

cacheSolve <- function(x, ...) {
    inv <- x$getinv()
    if (!is.null(inv)){
        message("getting cached data")
        return(m)
    }
    m <- x$get()
    inv <- solve(m)
    x$setinv(inv)
    return(inv)
    
}


# TESTING

m <- matrix(nrow = 2,ncol = 2, data = 1:4)
mk <- makeCacheMatrix()
mk$set(m)
mk$get()
mk$getinv()
cacheSolve(mk)
