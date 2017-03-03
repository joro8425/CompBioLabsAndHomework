#Lab07
#Problem #1, making a fibonacci function
FibReturn <- function( n = 3 ) {
  Fibonacci <- rep( 1 , n )
  for ( f in seq( 3 , length(Fibonacci)) ) {
    Fibonacci[f] <- Fibonacci[f-1] + Fibonacci[f-2]
  }
return(Fibonacci)
}
#Edit for bonus 1
#Edit for bonus 2


#Problem #2, writing a function for a discrete-time logistic growth model
LogGrowthFunction <- function( n = 10, Gens = 20, k = 1000 , r = .05) {
  for( t in seq( 2 , Gens ) ) {
    n[t] <- n[t-1] + ( r * n[t-1] * (k - n[t-1])/k )
  }
  plot(n, xlab = "Generations", ylab = "Abundance")
  return(n)
}
LogGrowthFunction()




#Problem #3, converting matrices
#matrix one has position based data (i,j relationship) while matrix two lists all
  #relationships that occured in matrix 1 (row i and column j interacted = value 1)

SimpleMatrix <- matrix( c(0,1,1,1,0,0,1,0,0), ncol = 3, nrow = 3)

TransformMatrixPairwise <- function( SqMatrix ) {
  #making it a data fram will be easier, each collumn as object
  SqMatrix( nrow = nRows, ncol = nCols )
  for (i in 1:nCols) {
    for (j in 1:nRows) {
      if (SqMatrix [i,j] ! = 0) {
        
        #value = value, in if statement
      }
    }
  }
}

TransformMatrixPairwise( SqMatrix = SimpleMatrix)

