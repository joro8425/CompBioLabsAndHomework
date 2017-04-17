cameraDataFile <- read.csv(file.choose("Cusack_et_al_random_versus_trail_
                                       camera_trap_data_Ruaha_2013_14"))
    #Retrieving file and assigning it to a variable.

DateDiffFunction <- function( dateone, datetwo ) {    #Creating function name and arguments.
datereformatone <- matrix( ncol = 3, nrow = 1 )    #Preallocating matrix.
  datereformatone[ 1, 1 ] <- as.numeric(substr( x = dateone, start = 1, stop = 2))
    datereformatone[ 1, 2 ] <- as.numeric(substr( x = dateone, start = 4, stop = 5))
      datereformatone[ 1, 3 ] <- as.numeric(substr( x = dateone, start = 7, stop = 10))
  #This section of the function seperates the date aspect of the factor from the time aspect
      #and places day, month and year into its own slot within a preallocated matrix. This
      #is done so that the position of each data point may be manipulated to fit the
      #needs of R date reading functions.

newdateformat <- paste(datereformatone[ 1, 3 ], datereformatone[ 1, 2 ], datereformatone[ 1, 1 ])
  datereformatone <- as.Date(as.character(newdateformat), "%Y%m%d")
  #Here the format of the date is changed from day/month/year into year/month/day, a format that
    #R is able to recognize in functions, such as $difftime and $diff.Date.
  
datereformattwo <- matrix( ncol = 3, nrow = 1 )
  datereformattwo[ 1, 1 ] <- as.numeric(substr( x = datetwo, start = 1, stop = 2))
    datereformattwo[ 1, 2 ] <- as.numeric(substr( x = datetwo, start = 4, stop = 5))
      datereformattwo[ 1, 3 ] <- as.numeric(substr( x = datetwo, start = 7, stop = 10))
  #This section performs the same action as the first section on the second date givin in
      #the argument of the function.
    
newdateformat2 <- paste(datereformattwo[ 1, 3 ], datereformattwo[ 1, 2 ], datereformattwo[ 1, 1 ])
  datereformattwo <- as.Date(as.character(newdateformat2), "%Y%m%d")
  #The reformatting of the second date argument.
  
daydiff <- difftime(time1 = datereformatone, time2 = datereformattwo)
  #Using the R standard function $difftime the number of days difference betweeen the two
    #dates given is calculated.

hourformatone <- matrix( ncol = 2, nrow = 1 )    #Preallocating matrix.
  hourformatone[ 1, 1 ] <- as.numeric(substr( x = dateone, start = 12, stop = 13))
    hourformatone[ 1, 2] <- as.numeric(substr( x = dateone, start = 15, stop = 16))
      hourformatone[ 1, 2] <- hourformatone[ 1, 2]/60    #converting minutes to an hour fraction.
        totalone <- rowSums(hourformatone)
  #Similar to the method used in seperating the date factor this section seperates the time stamp
      #string aspect of the factor and places hours and minutes into their own slots within 
      #a preallocated matrix. Minutes are then converted into hours and the two rows are 
      #added together.
      
hourformattwo <- matrix( ncol = 2, nrow = 1 )
  hourformattwo[ 1, 1 ] <- as.numeric(substr( x = datetwo, start = 12, stop = 13))
    hourformattwo[ 1, 2] <- as.numeric(substr( x = datetwo, start = 15, stop = 16))
      hourformattwo[ 1, 2] <- hourformattwo[ 1, 2]/60
        totaltwo <- rowSums(hourformattwo)
  #The same process as described above for the second date argument. 

hourdiff <- totalone - totaltwo
  #The totals of the rows for each time stamp argument are
    #subtracted to determine the difference in hours between the two date stamps.
daystohours <- as.numeric(daydiff) * 24
  #Converting the days calculated from $difftime to hours.
endtotaldiff <- abs(daystohours) + abs(hourdiff)
  #Adding all final total differences, in the consistent form of hours, together.
return(endtotaldiff)
}
DateDiffFunction(dateone = cameraDataFile[1300,6] , datetwo =  cameraDataFile[4, 6])
  #Test