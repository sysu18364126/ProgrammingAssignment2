## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## The function makeCacheMatrix creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  p <- NULL
  set <- function(z){
    x <<- z 
    p <<- NULL
  }
  get <- function() {x}
  setInverse <- function(perse){
    p <<- inverse
  }
  getInverse <- function(){p} ## get the inverse
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)

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
