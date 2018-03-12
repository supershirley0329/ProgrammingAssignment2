## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {## define the argument with default mode of "matrix"
  m<-null  ## initialize inv as NULL; will hold value of matrix inverse 
  set<- function(y){## define the set function to assign new 
    x <<- y ## value of matrix in parent environment
    m <<- NULL  ## if there is a new matrix, reset inv to NULL
  }
  get <- function() x  ## define the get fucntion - returns value of the matrix argument
  setmatrix <- function(solve) m <<- solve  
  getmatrix <- function() m
  list(set = set, get = get,
       setmatrix = setmatrix,
       getmatrix = getmatrix)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getmatrix()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setmatrix(m)
  m
}
