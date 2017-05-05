#Setting proper working directory
getwd()
setwd("/Users/rekna/Documents/CompBio/CompBioGithub/CompBioLabsAndHomework/Project")

#Installing and loading additional R packages
install.packages("psych",dependencies=TRUE)
library("psych")

#Setting the data to an object
projectabundancedata <- read.csv(file.choose("Adamczyk_zooplankton_abundance_PLOSdata.csv"))

#Determining the number of rows within the project data set that indicate samples 
  #were taken from the specified lake
P <- which( projectabundancedata[ , 1 ] == "Poway")
Mi <- which( projectabundancedata[ , 1 ] == "Miramar")
Mu <- which( projectabundancedata[ , 1 ] == "Murray")

#Creating mblank matrices for each lake, so as to later sperate the data, and creating the 
  #'wholeabundancedata' matrix base (see MD doc)
abundancerows <- nrow(projectabundancedata)
wholeabundancedata <- as.matrix(projectabundancedata[ 1:abundancerows , 6:18])
powaydata <- as.matrix(projectabundancedata[ 1:length(P) , 6:18])
miramardata <- as.matrix(projectabundancedata[ 1:length(Mi) , 6:18])
murraydata <- as.matrix(projectabundancedata[ 1:length(Mu) , 6:18])

#Setting the abundance data to the total sample numbers by 
  #multiplying each species count by the "fraction of sample counted" collumn
for( r in 1:abundancerows) { 
  wholeabundancedata[ r , 1 ] <- projectabundancedata[ r , 4 ] * projectabundancedata[ r , 6 ]
  wholeabundancedata[ r , 2 ] <- projectabundancedata[ r , 4 ] * projectabundancedata[ r , 7 ]
  wholeabundancedata[ r , 3 ] <- projectabundancedata[ r , 4 ] * projectabundancedata[ r , 8 ]
  wholeabundancedata[ r , 4 ] <- projectabundancedata[ r , 4 ] * projectabundancedata[ r , 9 ]
  wholeabundancedata[ r , 5 ] <- projectabundancedata[ r , 4 ] * projectabundancedata[ r , 10 ]
  wholeabundancedata[ r , 6 ] <- projectabundancedata[ r , 4 ] * projectabundancedata[ r , 11 ]
  wholeabundancedata[ r , 7 ] <- projectabundancedata[ r , 4 ] * projectabundancedata[ r , 12 ]
  wholeabundancedata[ r , 8 ] <- projectabundancedata[ r , 4 ] * projectabundancedata[ r , 13 ]
  wholeabundancedata[ r , 9 ] <- projectabundancedata[ r , 4 ] * projectabundancedata[ r , 14 ]
  wholeabundancedata[ r , 10 ] <- projectabundancedata[ r , 4 ] * projectabundancedata[ r , 15 ]
  wholeabundancedata[ r , 11 ] <- projectabundancedata[ r , 4 ] * projectabundancedata[ r , 16 ]
  wholeabundancedata[ r , 12 ] <- projectabundancedata[ r , 4 ] * projectabundancedata[ r , 17 ]
  wholeabundancedata[ r , 13 ] <- projectabundancedata[ r , 4 ] * projectabundancedata[ r , 18 ]
}

#Seperating all 'Poway' lake data rows from the project data and putting them into their 
  #own  matirx
myiterator <- 1
for( a in 1:abundancerows) {
  if( projectabundancedata[ a , 1 ] == "Poway") {
    powaydata[ myiterator , ] <- wholeabundancedata[ a , ]
    myiterator <- myiterator + 1
  }
}

#Seperating all 'Miramar' lake data rows from the project data and putting them into their 
#own  matirx
myiterator <- 1
for( b in 1:abundancerows) {
  if( projectabundancedata[ b , 1 ] == "Miramar") {
    miramardata[ myiterator , ] <- wholeabundancedata[ b , ]
    myiterator <- myiterator + 1
  }
}

#Seperating all 'Murray' lake data rows from the project data and putting them into their 
#own  matirx
myiterator <- 1
for( c in 1:abundancerows) {
  if( projectabundancedata[ c , 1 ] == "Murray") {
    murraydata[ myiterator , ] <- wholeabundancedata[ c , ]
    myiterator <- myiterator + 1
  }
}

#Function for computing and printing all bacteria with competitive relationship
competitionfinder <- function( lake ) {
  
  #Setting all variables to be used in the function
  rvalues <<- cor(lake) #Correlation test run between all species within given lake matrix. 
    #Creates new matrix with species relationships displayed as r-values.
  alpha <- .05    #Alpha value used for later comparison with p-values
  mybool <- 0
  nRow <- nrow(rvalues)
  nCol <- ncol(rvalues)
  negativervalues <<- matrix(nrow = nRow, ncol = nCol)
  rownames( negativervalues ) <<- rownames( rvalues ) 
  colnames( negativervalues) <<- colnames( rvalues ) #Setting 'negativervalues' matrix columns
    #and rows to species names
  pvalues <<- matrix(nrow = nRow, ncol = nCol)
  significantvalues <<- matrix(nrow = nRow, ncol = nCol) #must assign column values, 
  
  
  
  corrtest <- corr.test(lake)   #corr.test is run (as defined in the MD doc) on the lake data 
    #to produce multiple matrices of statistical correlation data
  pvalues <<- round(corrtest$p, 8)  #A matrix is created by extracting the p-value matrix from
    #corrtest (object name of corr.test run on lake data)

  #Creating a matrix of only the inverse relationships (negative r-values) and saving 
    #it to the global environment
  for( r in 1:nRow) {
    for( c in 1:nCol) {
      if( rvalues[ r , c ] < 0 ) {
        negativervalues[ r , c ] <<- rvalues[ r , c ]
      }
    }
  }

  #Creating a matrix of only the p-values less than or equal to alpha (those that are 
    #statistically significant) and saving it to the global environment
  for( l in 1:nRow) {
    for( m in 1:nCol) {
      if( pvalues[ l , m ] <= alpha ){
        significantvalues[ l , m ] <<- pvalues[ l , m ]
      }
    }
  }
  
  rownames( significantvalues ) <<- rownames( rvalues )
  colnames( significantvalues) <<- colnames( rvalues )  #Setting 'significantvalues' matrix columns
  #and rows to species names
  
  #For loops check both 'negativervalues' and 'significantvalues' matrices to determine if any 
    #inverse relationships match with significant p-values, which would suggest competition, and 
    #print any such matched values
  for( q in 1:nRow){
    for( t in 1:nCol){ 
      if((!is.na(significantvalues[ q , t ])) 
          & 
          (!is.na(negativervalues[ q , t ]))) {
        print(significantvalues[ q , t ])
        print(negativervalues[ q , t ])
        mybool <<- 1
      }
    }
  }
  
  if( mybool == 0)
  { print("No Competition")}  #If no matches are found then no inverse relationships are 
    #statistically significant, thus 'No Competition' returned
  }
competitionfinder( lake = wholeabundancedata) #Function being run on all populations of plankton,
  #not lake specific



