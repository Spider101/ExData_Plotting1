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
png("plot4.png")

#set grid parameters through par function
par(mfrow=c(2,2))

#calculate the time instants by combining the date and time variables
instants <- with(powerDataSubset, strptime(paste(as.character(Date), Time), 
                                           "%Y-%m-%d %H:%M:%S"))

#plot 1: plot global active power across time instants
with(powerDataSubset, plot(instants, Global_active_power, type = "l", 
                           xlab="", ylab="Global Active Power"))

#plot 2: plot voltage across time instants
with(powerDataSubset, plot(instants, Voltage, type = "l", 
                           xlab="datetime", ylab="Voltage"))

#plot 3: plot the different sub metering energies across time instants
with(powerDataSubset, plot(instants, Sub_metering_1, type="l",
                           xlab="", ylab="Energy sub metering"))
with(powerDataSubset, lines(instants, Sub_metering_2, col="red"))
with(powerDataSubset, lines(instants, Sub_metering_3, col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, col=c("black", "red", "blue"), bty="n")

#plot 4: plot global reactive power across time instants
with(powerDataSubset, plot(instants, Global_reactive_power, type = "l", 
                           xlab="datetime"))

#close the png graphic device
dev.off()
