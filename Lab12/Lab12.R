#this R doc is to be used for work on Lab 12

DiscreteTime <- function( n = 10, Gens = 100, k = 100 , r = .1) {
  for( t in seq( 1 , Gens ) ) {
    n[t + 1] <- n[t] + r * n[t] * (k - n[t])/k
  }
  plot(n, main = "Discrete-time Logistic Growth", xlab = "Generations", ylab = "Abundance")     
}

DiscreteTime()