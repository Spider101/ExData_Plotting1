###############################################################################

## Coursera - Exploratory Data Analysis Course
## Author - Abhimanyu Banerjee
## Date Created - 12/29/2016

## File Description: This is a script that opens a png graphics device and plots
## the three sub metering variables against the time instants the observations 
## were made and includes a legend for the three lines on the plot. These time 
## instants are computed by pasting the 'Date' and 'Time' of the dataset in 
## question and converting the combination to a Date object. The plot is then 
## saved as 'plot3.png' and the graphics device is closed.
## Note: if the dataframe containing the records needed for plotting is not 
## present in the current environment, it sources a helper script 'plotGraph.R'
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
