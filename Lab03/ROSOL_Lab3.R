#lab step three
#x is = to bags of chips
X <- 5
#y is = to number of guests
Y <- 8
#lab step 5 
#z = average consumption rate of guests
Z <- 0.4
#lab step 7 -> remaining chips
X - ((Y + 1) * Z)


#LAB PART 2
#movie ranking vectors
Self <- c(7, 6, 5, 1, 2, 3, 4)
Penny <- c(5, 7, 6, 3, 1, 2, 4)
Jenny <- c(4, 3, 2, 7, 6, 5, 1)
Lenny <- c(1, 7, 3, 4, 6, 5, 2)
Stewie <- c(6, 7, 5, 4, 3, 1, 2)
#lab step 9
PennyIV <- Penny[4] 
#lab step 10, concentrating all rankings
Rankings <- cbind(Jenny, Penny, Lenny, Self, Stewie)
#lab step 11, str test of objects
str(Rankings) #Rankings has both rows and collumns, and has dimension name attributes for both. It is numeric.
str(Penny) #Penny has only one row and this row is not allowed an attributed a dimension name. It is numeric.
str(PennyIV) #PennyIV is a single numeric value.
#lab step 12, creating a data frame
#both of the following inputs yield the same output
data.frame(Rankings)
as.data.frame(Rankings)
#Rankings is listed as a double, whereas dataframeone is a list. dataframeone has been assigned title 
  #attributes for both the rows and collumns, whereas Rankings only has collumn names. Both file types 
  #have equal dimensions, 7:5, and are only two dimensional.
#testing the characteristics of dataframeone and Rankings
dataframeone <- data.frame(Rankings)
dataframetwo <- as.data.frame(Rankings)
dim(dataframeone)
dim(Rankings)
str(dataframeone)
str(Rankings)
all(Rankings == dataframeone)
typeof(dataframeone)
typeof(Rankings)
#lab step 14, creating Star Wars episode titles
Episodes <- c("I", "II", "III", "IV", "V", "VI", "VII")
#lab step 15, assigning row names to data sets
row.names(dataframeone) <- Episodes
row.names(Rankings) <- Episodes


#LAB PART 3
#lab step 16, accessing data on a data frame/matrix
Rankings[3,]
dataframeone[,4]
dataframeone["V",]
dataframeone["II", "Penny"]
#accessing a range of rows
dataframeone[4:6,] #":" will create/access a vector within the original vector
dataframeone[c(2, 5, 7),] # must use c() to access multiple
dataframeone[c(4, 6), c("Penny", "Jenny", "Stewie")]
#lab step 23, swapping two variables
dataframeone[c(2, 5), 3]
L2 <- dataframeone[2, 3]
dataframeone[2, 3] <- dataframeone[5, 3]
dataframeone[5, 3] <- L2
dataframeone[c(2, 5), 3]
#Nailed it! (with a lot of help, but still nailed it!)
#lab step 24
Rankings["III", "Penny"]
Rankings[3, 2]
dataframeone["III", "Penny"]
dataframeone[3, 2]
#Swaping the variables back
dataframeone[c("II", "V"), "Lenny"]
L5 <- dataframeone["V", "Lenny"]
dataframeone["V", "Lenny"] <- dataframeone["II", "Lenny"]
dataframeone["II", "Lenny"] <- L5
dataframeone[c("II", "V"), "Lenny"]
#lab step 25, swapping with one last method
dataframeone$Lenny[c(2, 5)]
lastswap <- dataframeone$Lenny[2]
dataframeone$Lenny[2] <- dataframeone$Lenny[5]
dataframeone$Lenny[5] <- lastswap
dataframeone$Lenny[c(2, 5)]
