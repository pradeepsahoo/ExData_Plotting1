## Program for Plot #2

## Set directory path
dir <- "C:/pradeep_sahoo_jda/JH-Data-Science-Course/working_dir/Exploratory_Data_Analysis/assignment1"
setwd(dir) 

## Getting full dataset and loading the data
## When loading the dataset into R, please consider the following:
## The dataset has 2,075,259 rows and 9 columns. 
## First calculate a rough estimate of how much memory the dataset 
## will require in memory before reading into R. 
## Make sure your computer has enough memory (most modern 
## computers should be fine).

## We will only be using data from the dates 2007-02-01 and 2007-02-02. 
## One alternative is to read the data from just those dates rather than 
## reading in the entire dataset and subsetting to those dates.

## You may find it useful to convert the Date and Time variables to 
## Date/Time classes in R using the strptime() and as.Date() functions.

## Note that in this dataset missing values are coded as ?.

file <- "household_power_consumption.txt"
data_all <- read.csv(  file
                       , header=TRUE
                       , sep=';'
                       , quote='\"'
                       , na.strings="?"
                       , nrows=2075259
                       , check.names=FALSE
                       , stringsAsFactors=FALSE
                       , comment.char=""
)
head(data_all)
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## remove object full dataset, as we have already subset for this exercise
rm(data_all)
head(data)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)


## Graph the Plot 2
plot(data$Global_active_power~data$Datetime
     , type="l"
     , ylab="Global Active Power (in kilowatts)"
     , xlab="Days"
     , col="blue"
    )

## Saving to a file format
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
