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

#2a, using a for loop to replace na's with zeroes
Zero <- 0
Vector1 <- as.vector(Vector1$x)     #Making the data set a readable vector
for ( i in seq(1:length(Vector1))) {
  if ( is.na(Vector1[i] )) {
    Vector1[i] <- Zero    #replacing the ith element of the vector
  }
}

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
#ANNOTATE
#ANNOTATE
#ANNOTATE
#ANNOTATE
#ANNOTATE
GasYearOne <- which( ( CO2data[ ,"Gas" ]!= Zero ) )
CO2data[ GasYearOne[1], "Year" ]

lowerlimit2 <- 200
upperlimit2 <- 300
subsetindices2 <- which( ( CO2data[ ,"Total" ] > lowerlimit2 & 
                             ( CO2data [ ,"Total" ] < upperlimit2 ) ) )
subset2 <- CO2data[ subsetindices2 , "Year" ]
print( subset2 )
#ANNOTATE
#ANNOTATE
#ANNOTATE
#ANNOTATE
#ANNOTATE
#ANNOTATE


#Lab part 2

totalgenerations <- 1000
initialprey <- 100      #initial prey abundance
initialPredator <- 10     #initial predator abundance
a <- 0.01    #attack rate
r <- 0.02    #growth rate of prey
m <- 0.05    #mortaility rate of predators
k <- 0.01    #conversion constant of prey into predators
time <- rep( Zero , totalgenerations )
nvalues <- rep( Zero , totalgenerations )
pvalues <- rep( Zero , totalgenerations )
n <- initialprey
p <- initialpredator


for ( t in seq( 2 , length(nvalues) ) ) {
  nvalues[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
  n <- nvalues
  
  "pvalues[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])
  p <- pvalues"
}
print(pvalues)
print(nvalues)

n[t] <- n[t-1] + (r * n[t-1]) - (a * n[t-1] * p[t-1])
p[t] <- p[t-1] + (k * a * n[t-1] * p[t-1]) - (m * p[t-1])


