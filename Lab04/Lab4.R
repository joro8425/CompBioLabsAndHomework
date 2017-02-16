#Lab part 1
#Lab step 1, printing hi ten times
for ( i in 1:10) {
  print("hi")
}

#lab step 2
allowance <- 5
gum <- (2*1.34)
piggybank <- 10
for ( j in seq(1,8)) {
  moneytotal <- (piggybank + allowance - gum)
  print(moneytotal)
  piggybank <- moneytotal
}

#lab step 3
initialpopulation <- 2000
rateofdecline <- .95
for ( y in seq(1,7)) {
  populationdecline <- initialpopulation*rateofdecline
  print(populationdecline)
  initialpopulation <- populationdecline
}

#lab step 4
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
#Lab step 1a
rep(0, 18)

#lab step 1b
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

#lab step 1c
makeitone <- rep(0,18)
makeitone[1] <- 1
print(makeitone)

#lab step 1d
for ( p in seq(2,18)) {
  makeitone[p] <- (1 + (2 * makeitone[p-1]) )
}
print(makeitone)

#lab step 2
Fibonacci <- rep(1,20)
for ( f in seq(3,20)) {
  Fibonacci[f] <- (Fibonacci[f-1] + Fibonacci[f-2])
}
print(Fibonacci)

#lab step 3
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

#lab step 4
help(setwd)
setwd(~/Documents/CompBio/CompBioGithub/CompBioLabsandHomework/Lab04)
getwd()
