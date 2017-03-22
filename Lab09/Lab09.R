cameraDataFile <- read.csv(file.choose("Cusack_et_al_random_versus_trail_
                                       camera_trap_data_Ruaha_2013_14"))
    #retrieving file and assigning it to a variable

datfunction <- function( dateone, datetwo ) {
dataputstuff <- matrix( ncol = 3, nrow = 1 )
  dataputstuff[ 1, 1 ] <- as.numeric(substr( x = dateone, start = 1, stop = 2))
    dataputstuff[ 1, 2 ] <- as.numeric(substr( x = dateone, start = 4, stop = 5))
      dataputstuff[ 1, 3 ] <- as.numeric(substr( x = dateone, start = 7, stop = 10))

newdateformat <- paste(dataputstuff[ 1, 3 ], dataputstuff[ 1, 2 ], dataputstuff[ 1, 1 ])
  dataputstuff <- as.Date(as.character(newdateformat), "%Y%m%d")
    print(dataputstuff)
  
dataputstuff2 <- matrix( ncol = 3, nrow = 1 )
  dataputstuff2[ 1, 1 ] <- as.numeric(substr( x = datetwo, start = 1, stop = 2))
    dataputstuff2[ 1, 2 ] <- as.numeric(substr( x = datetwo, start = 4, stop = 5))
      dataputstuff2[ 1, 3 ] <- as.numeric(substr( x = datetwo, start = 7, stop = 10))
    
newdateformat2 <- paste(dataputstuff2[ 1, 3 ], dataputstuff2[ 1, 2 ], dataputstuff2[ 1, 1 ])
  dataputstuff2 <- as.Date(as.character(newdateformat2), "%Y%m%d")
    print(dataputstuff2)
  
daydiff <- difftime(time1 = dataputstuff, time2 = dataputstuff2)

moredataputstuff <- matrix( ncol = 2, nrow = 1 )
  moredataputstuff[ 1, 1 ] <- as.numeric(substr( x = dateone, start = 12, stop = 13))
    moredataputstuff[ 1, 2] <- as.numeric(substr( x = dateone, start = 15, stop = 16))
      moredataputstuff[ 1, 2] <- moredataputstuff[ 1, 2]/60
        totalone <- rowSums(moredataputstuff)
      
moredataputstuff2 <- matrix( ncol = 2, nrow = 1 )
  moredataputstuff2[ 1, 1 ] <- as.numeric(substr( x = datetwo, start = 12, stop = 13))
    moredataputstuff2[ 1, 2] <- as.numeric(substr( x = datetwo, start = 15, stop = 16))
      moredataputstuff2[ 1, 2] <- moredataputstuff2[ 1, 2]/60
        totaltwo <- rowSums(moredataputstuff2)

hourdiff <- totalone - totaltwo     
daystohours <- as.numeric(daydiff) * 24
endtotaldiff <- abs(daystohours) + hourdiff
return(endtotaldiff)
}
datfunction(dateone = cameraDataFile[4, 6], datetwo = cameraDataFile[1300,6])

#put into  a matrix and multiply by however many min sec or hr needed, then add all.