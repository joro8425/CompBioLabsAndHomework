#Final Project

#WRITE MARKDOWN FILE EXPLAINING PROCESS AND FINAL RESULTS
#ANNOTATE THE SHIT OUT OF THIS BITCH


#setting proper working directory
getwd()
setwd("/Users/rekna/Documents/CompBio/CompBioGithub/CompBioLabsAndHomework/Project")
install.packages("psych",dependencies=TRUE)
library("psych")

#setting all data sets to variables
projectabundancedata <- read.csv(file.choose("Adamczyk_zooplankton_abundance_PLOSdata.csv"))

P <- which( projectabundancedata[ , 1 ] == "Poway")
Mi <- which( projectabundancedata[ , 1 ] == "Miramar")
Mu <- which( projectabundancedata[ , 1 ] == "Murray")
abundancerows <- nrow(projectabundancedata)
wholeabundancedata <- as.matrix(projectabundancedata[ 1:abundancerows , 6:18])
powaydata <- as.matrix(projectabundancedata[ 1:length(P) , 6:18])
miramardata <- as.matrix(projectabundancedata[ 1:length(Mi) , 6:18])
murraydata <- as.matrix(projectabundancedata[ 1:length(Mu) , 6:18])


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
#setting the abundance data to the total sample numbers by 
#multiplying each species count by the "fraction of sample counted" collumn

myiterator <- 1
for( a in 1:abundancerows) {
  if( projectabundancedata[ a , 1 ] == "Poway") {
    powaydata[ myiterator , ] <- wholeabundancedata[ a , ]
    myiterator <- myiterator + 1
  }
}

myiterator <- 1
for( b in 1:abundancerows) {
  if( projectabundancedata[ b , 1 ] == "Miramar") {
    miramardata[ myiterator , ] <- wholeabundancedata[ b , ]
    myiterator <- myiterator + 1
  }
}

myiterator <- 1
for( c in 1:abundancerows) {
  if( projectabundancedata[ c , 1 ] == "Murray") {
    murraydata[ myiterator , ] <- wholeabundancedata[ c , ]
    myiterator <- myiterator + 1
  }
}

# function for computing and printing all bacteria with competitive relationship
competitionfinder <- function( lake ) {
  
  rvalues <<- cor(lake)
  alpha <- .05
  mybool <<- 0
  nRow <- nrow(rvalues)
  nCol <- ncol(rvalues)
  negativervalues <<- matrix(nrow = nRow, ncol = nCol)
  rownames( negativervalues ) <<- rownames( rvalues )
  colnames( negativervalues) <<- colnames( rvalues )
  pvalues <<- matrix(nrow = nRow, ncol = nCol)
  significantvalues <<- matrix(nrow = nRow, ncol = nCol) #must assign column values, 
  
  
  
  corrtest <- corr.test(lake)
  pvalues <<- round(corrtest$p, 8)

  for( r in 1:nRow) {
    for( c in 1:nCol) {
      if( rvalues[ r , c ] < 0 ) {
        negativervalues[ r , c ] <<- rvalues[ r , c ]
      }
    }
  }

  for( l in 1:nRow) {
    for( m in 1:nCol) {
      if( pvalues[ l , m ] <= alpha ){
        significantvalues[ l , m ] <<- pvalues[ l , m ]
      }
    }
  }
  
  rownames( significantvalues ) <<- rownames( rvalues )
  colnames( significantvalues) <<- colnames( rvalues )
  
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
  { print("No Competition")}
  }
competitionfinder( lake = miramardata)

