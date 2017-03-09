#Lab07
#Problem #1, making a function that calculates and returns an input number of a fibonacci sequence
FibReturn <- function( n = 3 ) {
  if( n < 0)
    return( "bro dats a negative.")     #Bonus 2, returning a message if negative values
                                          #are inputted
  Fibonacci <- rep( 1 , n )
  if( n < 3) {      #Bonus 1, this if statement is for returning numbers if n is below 3
    for( d in 0:n)
      Fibonacci[d] <- 1
    return(Fibonacci)
  }
  for ( f in seq( 3 , length(Fibonacci)) ) {        #defining the function
    Fibonacci[f] <- Fibonacci[f-1] + Fibonacci[f-2]
  }
  return(Fibonacci)
}

FibReturn(-1)     #testing all code parameters
FibReturn(2)
FibReturn(10)


#Problem #2, writing a function for a discrete-time logistic growth model
LogGrowthFunction <- function( n = 10, Gens = 20, k = 1000 , r = .05) {
  for( t in seq( 2 , Gens ) ) {
    n[t] <- n[t-1] + ( r * n[t-1] * (k - n[t-1])/k )    #defining the function, variables of which 
                                                           #have been defined in function arguments
  }
  plot(n, main = "Discrete-time Logistic Growth", xlab = "Generations", ylab = "Abundance")     
            #plotting the function with appropriate
               #axis labels
  return(n)
}
LogGrowthFunction(Gens = 200)




#Problem #3, converting matrices
getwd()
setwd("/Users/rekna/Documents/CompBio/CompBioGithub/CompBioLabsAndHomework/Lab07")
Matrix <- read.csv("LargeAdjacencyMatrix.csv")      #setting up a test matrix

TransformMatrixPairwise <- function( SqMatrix ) {
  nRows <- nrow(SqMatrix)         #defining all necesary variables and eliminating 'magic' numbers
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
      } #creating a for loop to run through original matrix and find all 
           #nonzero elements in order to define the parameters of the new 
           #matrix (number of nonzero elements in first matrix = number of 
           #rows in pairwise matrix)
    }
  }
  PairwiseMatrix <- matrix( ncol = PairwiseCols, nrow = m)
  for (j in 1:nRows) {
    for (i in 1:nCols) {
      if (SqMatrix[j,i] != zero) {
        PairwiseMatrix[ CurrentPairwise , 1 ] <- j    #inputting row values into new matrix
        PairwiseMatrix[ CurrentPairwise , 2 ] <- i    #inputting collumn values into new matrix
        PairwiseMatrix[ CurrentPairwise , 3 ] <- value    #creating third collumn
        CurrentPairwise <- ( CurrentPairwise + 1 )    #moving the inputs down the rows so as to 
                                                        #avoid repeatedly overwriting the data 
                                                        #in the first row
      }
    }
  }
  colnames(PairwiseMatrix) <- c("Row", "Column", "Value")
  return(PairwiseMatrix)
}

TransformMatrixPairwise( SqMatrix = Matrix )    #using test matrix created above as input
