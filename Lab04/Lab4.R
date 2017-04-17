#Lab part 1
#Lab step 1, printing hi ten times
for ( i in 1:10) {    #creating a for loop to print the output 'hi' the desired number of times
  print("hi")
}

#lab step 2, using calculations in a vector
allowance <- 5      #defining vairables, allowance as amount gained every iteration
gum <- (2*1.34)     #gum is how much spent each iteration. One 'stick' is valued at 1.34, 
                      #and the problem calls for two purchases, thus 2 X 1.34.
piggybank <- 10     #starting quantity
for ( j in seq(1,8)) {    #running a for loop for 8 iterations of following equation
  moneytotal <- (piggybank + allowance - gum)
  print(moneytotal)
  piggybank <- moneytotal
}

#lab step 3, creating a population change vector
initialpopulation <- 2000     #chosen initial population value for a population change problem
rateofdecline <- .95    #chosen rate of decline, also read as -.05
for ( y in seq(1,7)) {
  populationdecline <- initialpopulation*rateofdecline    #equation for population change
  print(populationdecline)
  initialpopulation <- populationdecline
}

#lab step 4, creating a carrying capacity equation vector
k <- 10000    #carrying capacity of the population
r <- 0.8    #population rate of increase
n <- 2500     #original population size
gens <- 12
for ( t in seq( 2, gens ) ) {
  n[t] <- n[t-1] + ( r * n[t-1] * ( k - n[t-1]) / k )
}
print(n)      #printing vector of population sizes at postition [t]

#LAB PART 2
#Lab step 1a, creating a vector of 0s
rep(0, 18)

#lab step 1b, adding three to all integers in a vector
addingthrees <- rep(1,18)
for ( l in seq(1,18) ) {
  addingthrees[l] <- (3 * l)    #adds three to each iteration
}
print(addingthrees)

#lab step 1c, altering a single point in a vector
makeitone <- rep(0,18)    #creating a vector of 0s
makeitone[1] <- 1     #defining iterated location for desired change
print(makeitone)

#lab step 1d, altering the string of numbers in a vector
for ( p in seq(2,18)) {     #using previously created vector we now modify each 
                              #iteration using a for loop. 
  makeitone[p] <- (1 + (2 * makeitone[p-1]) )     #desired modification/equation to 
                                                    #be added to vector
}
print(makeitone)

#lab step 2, creating a fibonacci sequence vector
Fibonacci <- rep(1,20)      #creting new vector
for ( f in seq(3,20)) {     #creating a for loop to apply the fibonacci equation to 
                              #each iteration of the vector
  Fibonacci[f] <- (Fibonacci[f-1] + Fibonacci[f-2])
}
print(Fibonacci)

#lab step 3, creting a plot of carrying capacity data
k <- 10000    #carrying capacity of the population
r <- 0.8    #population rate of increase
n <- 2500     #original population size
gens <- 12
for ( t in seq( 2, gens ) ) {
  n[t] <- n[t-1] + ( r * n[t-1] * ( k - n[t-1]) / k )
}
print(n)      #printing vector of population sizes at postition [t]

#making the plot
time <- seq(1,12)     #variable to define length of x axis
abundance <- n      #assigning a more appropriate name to the variable
plot(time, abundance, main = "Lab 04 Plot", xlab = "Time", ylab = "Abundance") 
    #line 82 defines the parameters for the plot

getwd()
setwd("/Users/rekna/Documents/CompBio/CompBioGithub/CompBioLabsAndHomework/Lab04")
read.csv(file = "CO2_data_cut_paste.csv")
lab4matrix <- read.csv(file = "CO2_data_cut_paste.csv")

    #lines 85-88 invove retrieving and storing a .csv file

nCol <- ncol(lab4matrix)    #defining the parameters of the matrix into variables
nRow <- nrow(lab4matrix)
percentchangevalues <- lab4matrix

#lab step 4b, calculating percent change in the matrix
for ( q in 2:nCol ) {     #using a for loop to divide every entry by its previous entry
                            #in order to determine % change betweeen points
  for ( m in 2:nRow ) {
    percentchangevalues[ m , q ] <- ( percentchangevalues[ m , q] / percentchangevalues[ m - 1 , q] )
  }
}
print(percentchangevalues)

#lab step 4c, writing the csv
write.csv(x = percentchangevalues, file = "YearlyPercentChangesInCO2.csv") #writing new data 
    #to a new .csv file
