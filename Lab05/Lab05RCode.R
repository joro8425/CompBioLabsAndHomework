#Lab part 1:practice some simple conditionals
#Question 1
x <- 7     #assigning random numerical value to variable x for the 
           #purposes of the conditional to follow
if ( x > 5) {
  print("Is pretty big, yo.")
}

#Question 2
getwd()
setwd("/Users/rekna/Documents/CompBio/CompBioGithub/CompBioLabsAndHomework/Lab05")
read.csv("Vector1.csv")     #Impoting the vector
Vector1 <- read.csv("Vector1.csv")     #assigning the imported vector to a variable

#Replacing negative values with NAs
Vector1 <- as.vector(Vector1$x)     #Making the data set a readable vector
Vector1[995]
for ( i in seq(1:length(Vector1))) {
  if ( (Vector1[i] < 0 )) {
    Vector1[i] <- NA    #replacing the ith element of the vector
  }
}
Vector1[995]

#2a, using a for loop to replace na's with zeroes (did on accident, decided to keep it)
Zero <- 0
Vector1 <- as.vector(Vector1$x)     #Making the data set a readable vector
for ( i in seq(1:length(Vector1))) {
  if ( is.na(Vector1[i] )) {
    Vector1[i] <- Zero    #replacing the ith element of the vector
  }
}
Vector1[995]

#2b, using a which conditional to replace na's with zeroes
NAvalues <- which( is.na(Vector1) )      #Identifying all na's within the dataset using $which
Vector1[NAvalues] <- Zero     #setting all identified values to zero

#2c, subsetting a range in the data set
lowerlimit <- 50    #setting boundry variables for the subset
upperlimit <- 100
SubsetIndices <- which( Vector1 > lowerlimit & Vector1 < upperlimit)     #setting boundry indices
Subset1 <- Vector1[SubsetIndices]     #creating the subset

#Question 3
setwd("/Users/rekna/Documents/CompBio/CompBioGithub/CompBioLabsAndHomework/Lab04")
read.csv("CO2_data_cut_paste.csv")
CO2data <- read.csv("CO2_data_cut_paste.csv")     #reading in and assigning the CO2 data

#3a, finding year in which gas emissions began
GasYearOne <- which( ( CO2data[ ,"Gas" ]!= Zero ) )    #Defining the search frame in the matrix
      #and searching for values not equal to 0
CO2data[ GasYearOne[1], "Year" ]     #finding the first value in which the value is not equal to 0

#3b, finding total emission values in a range
lowerlimit2 <- 200    #Defining the lower limit of the range, in million metric tons of carbon
upperlimit2 <- 300    #Defining the upper limit of the range, in million metric tons of carbon
subsetindices2 <- which( ( CO2data[ ,"Total" ] > lowerlimit2 & 
                             ( CO2data [ ,"Total" ] < upperlimit2 ) ) )    #Searching matrix for 
      #the values between the ranges and indexing them
subset2 <- CO2data[ subsetindices2 , "Year" ]    #creating a dataset of all indexed values with 
        #appropriate year value
print( subset2 )     #Displaying created dataset



#Lab part 2: Loops + conditionals + biology
#Defining variables and vectors
totalgenerations <- 1000
initialprey <- 100      #initial prey abundance
initialpredator <- 10     #initial predator abundance
a <- 0.01    #attack rate
r <- 0.02    #growth rate of prey
m <- 0.05    #mortaility rate of predators
k <- 0.01    #conversion constant of prey into predators
time <- rep( Zero , totalgenerations )
n <- initialprey
p <- initialpredator
nvalues <- n
pvalues <- p

#Writing the for loops
for ( t in seq( 2 , length(time) ) ) {
  nvalues[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
  pvalues[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
  n <- nvalues
  p <- pvalues
}
print(nvalues)
print(pvalues)