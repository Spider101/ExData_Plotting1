###############################################################################

## Coursera - Exploratory Data Analysis Course
## Author - Abhimanyu Banerjee
## Date Created - 12/29/2016

## File Description:

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
png("plot2.png")

#plot the histogram of the variable global active power
instants <- with(powerDataSubset, strptime(paste(as.character(Date), Time), 
                                           "%Y-%m-%d %H:%M:%S"))
with(powerDataSubset, plot(instants, Global_active_power, type = "l", 
                           xlab="", ylab="Global Active Power (kilowatts)"))

#close the png graphic device
dev.off()
