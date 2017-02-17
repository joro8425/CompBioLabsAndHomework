#Lab part 1
#Lab step 1, printing hi ten times
for ( i in 1:10) {
  print("hi")
}

#lab step 2, using calculations in a vector
allowance <- 5
gum <- (2*1.34)
piggybank <- 10
for ( j in seq(1,8)) {
  moneytotal <- (piggybank + allowance - gum)
  print(moneytotal)
  piggybank <- moneytotal
}

#lab step 3, creating a population change vector
initialpopulation <- 2000
rateofdecline <- .95
for ( y in seq(1,7)) {
  populationdecline <- initialpopulation*rateofdecline
  print(populationdecline)
  initialpopulation <- populationdecline
}

#lab step 4, creating a carrying capacity equation vector
k <- 10000
r <- 0.8
n <- 2500
equation <- n
for ( t in seq(2,12)) {
  equation[t] <- n[t-1] + ( r * n[t-1] * (k - n[t-1])/k )
  n <- equation
}
print(equation)

#LAB PART 2
#Lab step 1a, creating a vector of 0s
rep(0, 18)

#lab step 1b, adding three to all integers in a vector
for ( l in seq(1,18) ) {
  addingthrees <- rep(3 * (1:18))
}
print(addingthrees)

#or

addingthreesagain <- rep(1,18)
for ( l in seq(1,18) ) {
  addingthreesagain[l] <- (3 * l)
}
print(addingthreesagain)

#lab step 1c, altering a single point in a vector
makeitone <- rep(0,18)
makeitone[1] <- 1
print(makeitone)

#lab step 1d, altering the string of numbers in a vector
for ( p in seq(2,18)) {
  makeitone[p] <- (1 + (2 * makeitone[p-1]) )
}
print(makeitone)

#lab step 2, creating a fibonacci sequence vector
Fibonacci <- rep(1,20)
for ( f in seq(3,20)) {
  Fibonacci[f] <- (Fibonacci[f-1] + Fibonacci[f-2])
}
print(Fibonacci)

#lab step 3, creting a plot of carrying capacity data
k <- 10000
r <- 0.8
n <- 2500
equation <- n
for ( t in seq(2,12)) {
  equation[t] <- n[t-1] + ( r * n[t-1] * (k - n[t-1])/k )
  n <- equation
}
print(equation)

#making the plot
time <- seq(1,12)
abundance <- equation
plot(time, abundance, main = "Lab 04 Plot", xlab = "Time", ylab = "Abundance")

#lab step 4a, accessing the csv
getwd()
setwd("/Users/rekna/Documents/CompBio/CompBioGithub/CompBioLabsAndHomework/Lab04")
read.csv(file = "CO2_data_cut_paste.csv")
matrix <- read.csv(file = "CO2_data_cut_paste.csv")
nCol <- ncol(matrix)
nRow <- nrow(matrix)

#lab step 4b, calculating percent change in the matrix
for ( q in 2:nCol ) {
  for ( m in 2:nRow ) {
    matrix[ m, q ] <- (matrix[m,q]/matrix[m-1,q])
  }
}
print(matrix)

#lab step 4c, writing the csv
write.csv(x = matrix, file = "YearlyPercentChangesInCO2.csv")
