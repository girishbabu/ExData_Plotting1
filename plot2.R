## Coursera - Exploratory Data Analysis - Plotting Assignment 1
##
## Author: Girish Babu
## Date: 09-August-2014
##
## plot2.R - This generates plot2.png

## Get the file from the URL specified & save it to exdata_plotting.zip
dest_filename = "exdata_plotting1.zip"

retval = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
         destfile = dest_filename, method = "curl")

## Read file contents into a data frame
df.power = read.csv(unz(filename, "household_power_consumption.txt"), header=T,
           sep=";", stringsAsFactors=F, na.strings="?",
           colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric","numeric", "numeric", "numeric"))

## Subset data betwen 2007-02-01 and 2007-02-02
df.power$timestamp = strptime(paste(df.power$Date, df.power$Time),
                              format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
df.power = df.power[df.power$timestamp >= startDate & df.power$timestamp <= endDate, ]

## Create plot & save it to plot2.png
png(filename="plot2.png", width=480, height=480)
plot(df.power$timestamp, df.power$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()