
## **Determining Competition Among Plankton in Freshwater Reservoirs Via Analysis of Species Abundance Data**  
By John Rosol

#### Purpose of the analysis
This analysis is being done with the purpose of discovering if there is a competitive relationship between any species of plankton in freshwater lake ecosystems. Such information can be useful when considering the introduction or removal of bacteria or other, associated species to and from the ecosystems they inhabit.  
  
**ex.**  
This plot shows the relationship between *Daphnia Pulex* and *Nauplii* in Lake Poway. The relationship between the two species appears to be clustered, indicating they have little affect on each other, but there are several data points with a high abundance of *Daphnia* and a respectively low abundance of *Nauplii*, suggesting competition. This analysis will determine if the relationship between these two species, and all others involved in the study, have a competitive relationship, as possibly indicated by the *Daphnia* data points, or if the relationship is neutral, as possibly indicated by the cluster.  

![poway](https://raw.githubusercontent.com/joro8425/CompBioLabsAndHomework/master/Project/Poway.png)  

##### Hypothesis:
There is competition between plankton within freshwater lake ecosystems.  
##### Prediction:
This analysis will produce statistically significant, negative r-values indicating an inverse relationship between species, and thus competition.  
  
#### Data Used
The study this data was taken from was one focused on discovering the impact fresh water reservoirs have on carbon cycling. The scientists involved did so by  looking at affects of lake characteristics on plankton/bacterial biomass and how that biomass affects the amount of CO2 released into the atmosphere or stored within the lake ecosystem. This process involved the sampling of 12 different types of plankton bacteria from 3 different lakes, Poway, Miramar and Murray, and counting their abundance along with measurements of the lake's physical characteristics (pH, salinity, dissolved O2, depth, temperature, etc.) and the sizes of each of the bacteria sampled. The specific data set used in this analysis is a table listing the abundance of each bacteria sampled, with the sample date and lake the sample was taken from also listed. This table is comprised of 146 rows of 18 measurement columns.  
  
#### Variables and Definitions  
**alpha**: The chosen level of significance for p, equal to 5% or 0.05.  
**cor()**: Runs a Pearson Correlation test between all possible relationships within a matrix and returns Pearson Correlation Coefficients (r-values) for each relationship in the from of a new matrix.  
**corr.test()**: Uses *cor()* to find correlations within a matrix, then uses a t-test on each individual correlation to determine significance values and confidence intervals.  
**Matrices**: There are a total of nine matrices created from this project. 
 * projectabundancedata: This is the object name given to the original plankton abundance data set from Adamczyk EM and Shurin JB.
 * wholeabundancedata: Because the numbers in projectabundancedata are fraction counts of whole samples, as indicated by the column 'fraction_of_sample_counted', wholeabundancedata is the table of all estimated total abundance counts.  
**ex.**  
in projectabundancedata: fraction_of_sample_counted = 64, nauplii = 30
in wholeabundancedata: nauplii = 1920 (30 x 64)
 * poway/miramar/murraydata: These are the tables of each individual lake's bacteria abundance data. All numbers stored come from wholeabundancedata.
 * rvalues: Within the function. The table with all r-values calculated from *cor()* on input *(lake)*.
 * negativervalues: Within the function. Table of all negative r-values from the r-values table.
 * pvalues: Within the function. The table with all p-values calculated from *corr.test()* on input (lake).
 * significantvalues: Within the function. Table of all values above alpha from the p-values table.  
  
#### The 'competitionfinder' Function
The purpose of this function is to parse a given data set, *(lake)*, and create four matrices from which competition can be determined. It does so by taking the input data set and finding r-values through *cor()* and saving these values to matrix 'rvalues'. Negative r-values are then parsed, using for loops and if statements to find any value below zero, into their own matrix, 'negativervalues'. *corr.test* is used to calculate p-values of all previously calculated r-values. The results are stored in matrix 'pvalues'. 'pvalues' is then parsed in a similar fashion to 'rvalues', in which for loops and if statements parse through the matrix to find any value less than or equal to 0.05, the chosen level of significance, and store it in the matrix 'significantvalues'. For loops and if statements are then used to determine if 'significantvalues' and 'negativervalues' share any data cells. If they do, it means that a negative r-value has a significant p-value. If this condition is met, both values are printed. If no conditions are met the statement "No Correlation" is printed.  
  
#### End Results
No negative r-values, indicating inverse relationships, had a p-value at or below 0.05 in any data set explored here. These results suggest that there is no competition between the bacteria species sampled, and thus the hypothesis is false.    
  
  
> Written with [StackEdit](https://stackedit.io/).  

>Data Citation:  
Adamczyk EM, Shurin JB (2015) Seasonal changes in plankton food web structure and carbon dioxide flux from Southern California reservoirs. PLOS ONE 10(10): e0140464. http://dx.doi.org/10.1371/journal.pone.0140464  

>Dryad Citation:  
Adamczyk EM, Shurin JB (2015) Data from: Seasonal changes in plankton food web structure and carbon dioxide flux from Southern California reservoirs. Dryad Digital Repository. http://dx.doi.org/10.5061/dryad.6tn4h
