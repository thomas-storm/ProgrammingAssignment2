## cachematrix contains two functions: makeCacheMatrix() and cacheSolve()
## makeCacheMatrix() creates an R object that stores a matrix and its inverse
## cacheResolve requires a matrix as argument from makeCacheMatrix() and calculates the inverse of the matrix
## Helpful resource: https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-breakingDownMakeVector.md
## Explains the vector example for this exercise very well

## Create R object to store a matrix and provide environment

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## Retrieve cached matrix and inverse, or calculate inverse if not cached

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
        
}
