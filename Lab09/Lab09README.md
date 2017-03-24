
#DateDiffFunction
##Finding the mathematical difference between two given dates
###Description
This function is designed to find the mathematical difference, in hours, between two date factors given in the data set 
*Cusack_et_al_random_versus_trail camera_trap_data_Ruaha_2013_14.csv*. This data set records the time and date that an animal was captured on a motion activated camera, as well as other criteria not pertinent to this function. 
The function operates by separating the two elements of a single date factor, that being the date itself and the time of day, and organizing each into its own matrix. Within these matrices they are manipulated to fit the specifications needed for R to process them and for the final calculations to be read entirely in hours, rather than days or minutes.
Within a date matrix the organization of days months and years is reformatted so R may process them. This allows the return of a specific, numeric difference in the number of days between the two reformatted dates given. This output is then converted into hours for consistency. The time matrices handle the conversion of a hour : minute format into a hour fraction format, and then the subtraction of the corresponding matrix. The absolute values of these differences are then totaled to retrieve the final difference in hours.
###Variables
####Pertinent to user
dateone, datetwo = The points in the data matrix the user wishes to find the difference between, respectively. Order does not matter as end total is calculated from absolute values. 
####Pertinent to function
datereformatone
datereformattwo
newdateformat
newdateformat2
daydiff
hourformatone
hourformattwo
totalone
totaltwo
hourdiff
daystohours
endtotaldiff


> Written with [StackEdit](https://stackedit.io/).