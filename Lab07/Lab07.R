#Lab07
#Problem #1, making a fibonacci function
FibReturn <- function( n = 3 ) {
  if( n < 0)
    return( "bro dats a negative.")     #Bonus 2, returning a message if negative values
                                          #are inputted
  Fibonacci <- rep( 1 , n )
  if( n < 3) {      #Bonus 1, returning numbers of n below 3
    for( d in 0:n)
      Fibonacci[d] <- 1
    return(Fibonacci)
  }
  for ( f in seq( 3 , length(Fibonacci)) ) {
    Fibonacci[f] <- Fibonacci[f-1] + Fibonacci[f-2]
  }
  return(Fibonacci)
}

FibReturn(-1)
FibReturn(2)
FibReturn(10)


#Problem #2, writing a function for a discrete-time logistic growth model
LogGrowthFunction <- function( n = 10, Gens = 20, k = 1000 , r = .05) {
  for( t in seq( 2 , Gens ) ) {
    n[t] <- n[t-1] + ( r * n[t-1] * (k - n[t-1])/k )
  }
  plot(n, xlab = "Generations", ylab = "Abundance")
  return(n)
}
LogGrowthFunction(Gens = 200)




#Problem #3, converting matrices

SimpleMatrix <- matrix( c(0,1,1,1,0,0,1,0,0), ncol = 3, nrow = 3)
getwd()
setwd("/Users/rekna/Documents/CompBio/CompBioGithub/CompBioLabsAndHomework/Lab07")
Matrix <- read.csv("LargeAdjacencyMatrix.csv")

TransformMatrixPairwise <- function( SqMatrix ) {
  nRows <- nrow(SqMatrix)
  nCols <- ncol(SqMatrix)
  value <- 1
  zero <- 0
  m <- 0
  PairwiseCols <- 3
  CurrentPairwise <- 1
  for (q in 1:nRows) {
    for (f in 1:nCols) {
      if (SqMatrix[q,f] != zero) {
        m <- ( m + 1 )
      }
    }
  }
  PairwiseMatrix <- matrix( ncol = PairwiseCols, nrow = m)
  for (j in 1:nRows) {
    for (i in 1:nCols) {
      if (SqMatrix[j,i] != zero) {
        PairwiseMatrix[ CurrentPairwise , 1 ] <- j
        PairwiseMatrix[ CurrentPairwise , 2 ] <- i
        PairwiseMatrix[ CurrentPairwise , 3 ] <- value
        CurrentPairwise <- ( CurrentPairwise + 1 )
      }
    }
  }
  return(PairwiseMatrix)
}

TransformMatrixPairwise( SqMatrix = Matrix )
