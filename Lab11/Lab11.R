#Problem A, Meet the Binomial Distrobution
#A1, testing binomials
rbinom(n = 1, size = 10, prob = 0.5) # simulating 10 coin flips (1 time)
rbinom(n = 8, size = 10, prob = 0.5) # simulating 10 coin flips (8 times)
#Output represents the number of tails flipped for each 10 flip trial

#A2, testing number of vaccinated people who contract the flu
rbinom(n = 1, size = 20, prob = .15)

#A3, testing number of unvaccinated people who contract the flu
rbinom(n = 1, size = 20, prob = .4)

#A4, running multiple trials of A2 and A3
{
  vaccinated <- rbinom(n = 30, size = 20, prob = .15)
  unvaccinated <- rbinom(n = 30, size = 20, prob = .4)
  hist(vaccinated)
  hist(unvaccinated)
}

#A5, simulating allele distribution in a population
rbinom(n = 1, size = 500, prob = .55)

#A6, determining allele frequency in a populaiton
trials <- 1
populationsize <- 500
probability <- .55
for( i in seq(1,1000)) {
  alleleAfreq[i] <- rbinom( n = trials, size = populationsize, prob = probability)
  probability <- alleleAfreq[i]/populationsize
}
print(alleleAfreq[1000])

#A7, plotting the allele frequency in a population
plot(alleleAfreq, xlab = "Generations", ylab = "Frequency of A Allele", main = "Plot of Allele A Frequency")

#A8, a lot of stuff



#Problem B, Sampling
#B1, creating random order of four factors
siblings = c("Blair", "Frankie", "Kim", "Morgan") #Our four factors
sample(x = siblings, size = 4)

#B2, making sample of fair dice rolls
dicesides <- c(1:6)
rolls <- 13
fairdicerolls <- sample(x = dicesides, size = rolls, replace = T)
hist(fairdicerolls)

#B3, making sample of biased dice rolls
rolls <- 14
biaseddicesides <- c(1:6, 6)
biaseddicerolls <- sample(x = biaseddicesides, size = rolls, replace = T)
hist(biaseddicerolls)

#B4, matrix things and such