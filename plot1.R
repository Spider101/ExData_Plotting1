###############################################################################

## Coursera - Exploratory Data Analysis Course
## Author - Abhimanyu Banerjee
## Date Created - 12/29/2016

## File Description:

###############################################################################

#set up data dir and other basic variables if they don't exist already
if (!file.exists("data")){
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
