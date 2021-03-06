###############################################################################

## Coursera - Exploratory Data Analysis Course
## Author - Abhimanyu Banerjee
## Date Created - 12/29/2016

## File Description: This is a script that sets up the environment for the other
## plotting scripts. It checks if the data directory exists, if not it creates
## the directory, downloads the UCI Electric Power Consumption dataset and unzips
## it. It then reads the resulting text file into a dataframe and subsets out the
## records from '2007-02-01' to '2007-02-02' to another dataframe which is used
## by the other plotting scripts.

###############################################################################

## Setup

#clean the workspace
rm(list = ls())

#using data.table_1.10.0 and dplyr_0.5.0
require("data.table")
require("dplyr")

dataUrl <- paste("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2F", 
                 "household_power_consumption.zip", collapse="", sep="")
dataZipPath <- "./data/house_hold_power_consumption.zip"

#create data directory if it doesn't already exist
if(!file.exists("data")){
    dir.create("data")    
    download.file(dataUrl, dataZipPath)
    unzip(dataZipPath, exdir = "./data")
}

match <- grep(".txt", dir("./data"))
if(length(match) == 0){
    stop(paste("Error: Something went wrong with unzipping the dataset!",
    "Please delete the data directory created by this script and try again"))
}

dataPath <- dir("./data", full.names = T)[match]   
householdPowerData <- fread(dataPath, sep=";", na.strings=c("NA", "?"))
householdPowerData$Date <- as.Date(householdPowerData$Date, "%d/%m/%Y")
powerDataSubset <- householdPowerData %>% 
    filter(Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))