###################################################################################
### class 10-21-15
###################################################################################
Cycler1 <- read.csv( file.choose(), header=TRUE ) #read the file
head (Cycler1) # display six rows of the data

### Changing a wide file into a long file

# grab the cpk1 data
#to get first five columns (since we want all rows we keep the left side blank)
CyclerCPK1 <- Cycler1 [ , 1:5 ]
# to get the first four column & then sixth one(Cpk2)
CyclerCPK2 <- Cycler1 [ , c(1:4,6) ] 
#to get the first four and seventh one (cpk3 column)
CyclerCPK3 <- Cycler1 [  , c(1:4,7)] 
#to get the first 4 and eigth one (cpk4 column)
CyclerCPK4 <- Cycler1 [ , c(1:4,8)] 

#create a time variable for each time
time1 <- rep (1, nrow(Cycler1)) # this repeats 1 so it represents time 1 when we combine
time2 <- rep (2, nrow(Cycler1)) 
time3 <- rep (3, nrow(Cycler1))
time4 <- rep (4, nrow(Cycler1))

# attach the time variables and the vectors created for columns created and store them to a new vector
# add column corresponding to time in each dataset
CyclerCPK1t <- cbind(CyclerCPK1 , time1) #cbinds attach the columns
CyclerCPK2t <- cbind(CyclerCPK2 , time2)
CyclerCPK3t <- cbind(CyclerCPK3 , time3)
CyclerCPK4t <- cbind(CyclerCPK4 , time4)

# rename the columns for the combined data sets 
names ( CyclerCPK1t) <- c( "Subject", "Age", "Gender", "TRT", "CPK", "Time")
names ( CyclerCPK2t) <- c( "Subject", "Age", "Gender", "TRT", "CPK", "Time")
names ( CyclerCPK3t) <- c( "Subject", "Age", "Gender", "TRT", "CPK", "Time")
names ( CyclerCPK4t) <- c( "Subject", "Age", "Gender", "TRT", "CPK", "Time")

#to stack the combined vectors on top of each other
Cycler1Long <- rbind(CyclerCPK1t,CyclerCPK2t, CyclerCPK3t, CyclerCPK4t )

#to create a boxplot of the cpk data
boxplot ( CPK ~ Time, data=Cycler1Long,
          col = c( "red", "blue", "plum", "seagreen"),   #all these measure cpk (1 variable)
          names = c("T1", "T2", "T3", "T4"),
          xlab = "CPK",
          horizontal = TRUE)  #turns it sideways


### change long into wide ###
Cycler1Wide <- cbind( Cycler1Long [ Cycler1Long$Time ==1, 1:5],
                      Cycler1Long [ Cycler1Long$Time ==2, 5],
                      Cycler1Long [ Cycler1Long$Time ==3, 5],
                      Cycler1Long [ Cycler1Long$Time ==4, 5]
)
names (Cycler1Wide) <- c( "Subject", "Age", "Gender", "TRT", "CPK1", "CPK2", "CPK3", "CPK4")