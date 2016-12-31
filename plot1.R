###############################################################################

## Coursera - Exploratory Data Analysis Course
## Author - Abhimanyu Banerjee
## Date Created - 12/29/2016

## File Description: This is a script that opens a png graphics device and plots
## a histogram of the variable 'Global_active_power' from the dataset in 
## question. The plot is then saved as 'plot1.png' and the graphics device is 
## closed. Note: if the dataframe containing the records needed for plotting is 
## not present in the current environment, it sources a helper script 'plotGraph.R'
## to setup the necessary environment.

###############################################################################

#set up data dir and other basic variables if they don't exist already
if (!exists("powerDataSubset")){
    if(file.exists("plotGraph.R")){
        source("plotGraph.R")
    }
    else{
        stop("plotGraph.R is a dependent file. Please download it to run this file")
    }
}

#open a png graphic device (default dimension are 480x480)
png("plot1.png")

#plot the histogram of the variable global active power
with(powerDataSubset, hist(Global_active_power, col = "red", 
                           xlab = "Global Active Power (kilowatts)", 
                           ylab = "Frequency",
                           main = "Global Active Power"))

#close the png graphic device
dev.off()
