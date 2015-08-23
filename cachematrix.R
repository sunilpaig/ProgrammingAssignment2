## This function basically inverses a matrix and saves it


makeCacheMatrix <- function(x = matrix()) {
  ch <- NULL
  setMatrix <- function(newone) {
    x <<- newone
    ch <<- NULL
  }
  getMatrix <- function() {
    x
  }
  cacheInverse <- function(solve) {
    ch <<- solve
  }
  getInverse <- function() {
    ch
  }
  
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}

## In case nothing has been changed, the inverse of the matrix is retrived from the chache

cacheSolve <- function(x, ...) {
   inverse <- x$getInverse()
  if(!is.null(inverse)) {
    return(inverse)
  }
  data <- x$getMatrix()
  inverse <- solve(data)
  x$cacheInverse(inverse)
  inverse     
}
