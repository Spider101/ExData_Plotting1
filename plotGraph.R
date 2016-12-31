###############################################################################

## Coursera - Exploratory Data Analysis Course
## Author - Abhimanyu Banerjee
## Date Created - 12/29/2016

## File Description:

###############################################################################

## Setup

#clean the workspace
rm(list = ls())

#using data.table_1.10.0 and dplyr
require("data.table")
require("dplyr")

#create data directory if it doesn't already exist
dir.create("data")
dataUrl <- paste("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2F", 
             "household_power_consumption.zip", collapse="", sep="")
dataZipPath <- "./data/house_hold_power_consumption.zip"
download.file(dataUrl, dataZipPath)
dataPath <- unzip(dataZipPath, exdir = "./data")
householdPowerData <- fread(dataPath, sep=";", na.strings=c("NA", "?"))
householdPowerData$Date <- as.Date(householdPowerData$Date, "%d/%m/%Y")
powerDataSubset <- householdPowerData %>% 
    filter(Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))