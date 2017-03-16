LogGrowthFunction <- function( n = 10, Gens = 20, k = 1000 , r = .05) {
  for( t in seq( 2 , Gens ) ) {
    n[t] <- n[t-1] + ( r * n[t-1] * (k - n[t-1])/k )    #defining the function, variables of which 
    #have been defined in function arguments
  }
  plot(n, main = "Discrete-time Logistic Growth", xlab = "Generations", ylab = "Abundance")     
  #plotting the function with appropriate
  #axis labels
  DataStore <- data.frame(1:length(n), n)
  colnames(DataStore) <- c("Generation" , "Abundance")
  return(DataStore)
  return(n)
  
}
LogGrowthFunction(Gens = 200)
help("data.frame")
LogGrowthFunction()
