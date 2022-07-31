## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# makeCacheMatrix is a function that returns a list of functions.
# This function creates a special "matrix" object that can cache its inverse. 
# The following functions are contained within:
# 1) setMatrix: set the value of a matrix
# 2) getMatrix: get the value of a matrix
# 3) cacheInverse: get the cached value (inverse of the matrix)
# 4) getInverse: get the cached value (inverse of the matrix)

makeCacheMatrix <- function(x = numeric()) {
        
           cache <- NULL
        
        # store a matrix
        setMatrix <- function(newValue) {
                x <<- newValue
                cache <<- NULL
        }

        # returns the stored matrix
        getMatrix <- function() {
                x
        }

        # cache the given argument 
        cacheInverse <- function(solve) {
                cache <<- solve
        }

        # get the cached value
        getInverse <- function() {
                cache
        }
        
        # return a list
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


# The following function calculates the inverse of the matrix created with makeCacheMatrix

cacheSolve <- function(y, ...) {
        # get the cached value
        inverse <- y$getInverse()
        # if a cached value exists return it
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        # or else get the matrix, calculate the inverse and store it in the cache
        data <- y$getMatrix()
        inverse <- solve(data)
        y$cacheInverse(inverse)
        
        # return the inverse
        inverse
}
