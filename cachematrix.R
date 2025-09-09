## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

inv <- NULL  # Initialize the inverse as NULL

    # Function to set the matrix
    set <- function(y) {
        x <<- y
        inv <<- NULL  # Reset the inverse cache when the matrix is changed
    }

    # Function to get the matrix
    get <- function() x

    # Function to set the inverse
    setInverse <- function(inverse) inv <<- inverse

    # Function to get the cached inverse
    getInverse <- function() inv

    # Return a list of all the above functions
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)

        
        
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
         inv <- x$getInverse()  # Retrieve cached inverse if it exists

    if (!is.null(inv)) {
        message("getting cached inverse")
        return(inv)
    }

    # Otherwise, compute the inverse
    mat <- x$get()
    inv <- solve(mat, ...)  # Compute the inverse
    x$setInverse(inv)       # Cache the inverse
    inv
        
}
