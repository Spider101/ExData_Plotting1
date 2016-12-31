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
png("plot3.png")

#plot the histogram of the variable global active power
instants <- with(powerDataSubset, strptime(paste(as.character(Date), Time), 
                                           "%Y-%m-%d %H:%M:%S"))
with(powerDataSubset, plot(instants, Sub_metering_1, type="l",
                           xlab="", ylab="Energy sub metering"))
with(powerDataSubset, lines(instants, Sub_metering_2, col="red"))
with(powerDataSubset, lines(instants, Sub_metering_3, col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"))

#close the png graphic device
dev.off()
