# The function makeCacheMatrix is a list of 4 functions to set a matrix, get a matrix, set an inversed matrix and get an inversed matrix

makeCacheMatrix <- function(mtx = matrix()) {
    
    # Define inversed as NULL
    inversed <- NULL

    # Set matrix
    set <- function(mtx_cache) {
        mtx <<- mtx_cache
        inversed <<- NULL
    }

    # Get the damn thing
    get <- function() 
    {
        mtx
    }
    
    # Set inversed matrix
    setinverse <- function(inverse)
    { 
        inversed <<- inverse
    }
    # Get inversed matrix
    getinverse <- function() 
    {
        # return inversed
        inversed
    }
    
    # Shopping list
    list(
            set=set, 
            get=get, 
            setinverse=setinverse, 
            getinverse=getinverse
        )
}

cacheSolve <- function(mtx, ...) {
    # Check if mtx is already in cache
    inversed <- mtx$getinverse()
    if(!is.null(inversed)) {
        print("Matrix is already in cache, using it...")
        return(inversed)
    }
    # Nope, it is not in cache, me doing the leg work
    else
    {
        print ("Matrix is not in cache, solving it first...")
        matrix <- mtx$get()
        inversed <- solve(matrix)
        mtx$setinverse(inversed)
        return(inversed)
    }
    # How is this happening? This should be either in cache or not
    print ("I'm new in R and I duuno why I ended up here? Let's just return NULL...")
    return(NULL)
}

# For testing only, don't try it at home

# first rbind something to create a matrix
x = rbind(c(1, 3), c(3, 1))
# Print x
x

# Make the cached stuff
cache = makeCacheMatrix(x)

# Solve this stuff for two times and compare results
# Expected: first time it's going to solve, second time it's going to use cache

# First time, expected: "Matrix is not in cache"
cacheSolve(cache)

# Second time, expected: "Matrix is already in cache"
cacheSolve(cache)

# Yay!