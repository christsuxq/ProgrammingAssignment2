## The functions makeCacheMatrix and cacheSolve will be used to create an object that
## can calculate the inverse of a matrix and cache it.

## Create an function that stores a matrix and caches its inverse.

makeCacheMatrix <- function(x = matrix()) {
 matrix_inverse<- NULL
 set <- function(y){
 x <<- y
 matrix_inverse<<-NULL
 }
 get <- function() x
 setInverse <- function(inverse) matrix_inverse <<- inverse
 getInverse <- function() matrix_inverse
 list(set = set, get = get, setInverse = setInverse, getInverse =getInverse)
}


## Create a function that computes the inverse of the matrix or retrieve the inverse 
## from the cache if it has been calculated.

## Usage example:
## mtrx = matrix(1:9, nrow =3, nrow = 3)
## mtrx_Cache = makeCacheMatrix(mtrx)
## cacheSolve(mtrx_Cache) # new matrix without cache
## cacheSolve(mtrx_Cache) # Cache is used and computing time saved

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInverse()
 if(!is.null(m)){
 message("getting cached data")
 return(m)
 }
 data <- x$get()
 m <-solve(data, ...)
 x$setInverse(m)
 m
}
