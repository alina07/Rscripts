#Read the csv file 
#Calculate the minimun, maximum, range and standard deviation of the columns in the dataset
#Calculate the zscore for one of the coulmn
#Make a histogram 
#Make a boxplot and scatterplot
#add a regression line 

defect2 <- read.csv( file.choose(), header=TRUE ) #to read the csv file
names (defect2) #  display names of the column for dataset
#names of the file were Rate, Line adn Defects
head(defect2) # display first six rows of the data

# to grab a specific column form file use $.
defect2$Rate
mean (defect2$Defects) #got the mean of the specific column
sd(defect2$Defects)  #to calculate the standard deviation
summary(defect2) # gives 6 number summary for all columns in the file (min, 1st quad, median, mean, 3rd quad, max)
min (defect2$Defects) #get the minimum of each column
min (defect2) #get the minimum for each column in the whole dataset
range (defect2$Defects) #finds the max and min not the range
max (defect2$Defects) - min (defect2$Defects) # finds the range

# store some quantities into variables 
meandefects1 <- mean (defect2$Defects)
sddefects1 <- sd(defect2$Defects)
Zdefects1 <- ( defect2$Defects- meandefects1 )/sddefects1 #got the z score

hist( Zdefects1, #makes a histogram for z 
      xlab = "standardized defects", # changes the x label
      main = "histogram of standardized defects" # changes the top label
)

boxplot(Defects ~ Rate, data = defect2) 
boxplot(Defects ~ Line, data = defect2,
        col = "steelblue1", # specify the color of boxplot
        xlab = "Line", # label the x axis
        ylab = "# of Defects", #label the y axis
        main = "Defects by Line")  #title of the boxplot

hist( defect2$Defects,
      col = heat.colors(20))

plot( defect2$Rate, defect2$Defects,  #makes a scatterplot (x variable first then y)
      xlab = "Rate",
      ylab = "# of Defects",
      main = "Defects by Rate",
      pch = 23,     # tells which symbol to use in the plot
      col = "blue",    #changes the outline of the data point
      bg = "lightblue")   #changes the inside colors of the points

#add a regression line (y variable goes first and then x)
abline ( lm( defect2$Defects ~ defect2$Rate), 
         lty = 2, #changes the line to a dotted line
         lwd = 3,     #makes it wider
         col = "firebrick" ) 
abline( h = mean(defect2$Defects),  # reates a horizontal line at the mean
        lty = 3,
        lwd = 0.5,
        col = "gray59")

abline( v = mean(defect2$Rate),   #creates a verticle line at the mean
        lty = 3,
        lwd = 0.5,
        col = "gray59")
points (30,100)  #adds a random point on the plot