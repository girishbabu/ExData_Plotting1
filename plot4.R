## Coursera - Exploratory Data Analysis - Plotting Assignment 1
##
## Author: Girish Babu
## Date: 09-August-2014
##
## plot4.R - This generates plot4.png

## Get the file from the URL specified & save it to exdata_plotting.zip
dest_filename = "exdata_plotting1.zip"

retval = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
         destfile = dest_filename, method = "curl")

## Read file contents into a data frame
df.power = read.csv(unz(filename, "household_power_consumption.txt"), header=T,
           sep=";", stringsAsFactors=F, na.strings="?",
           colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## Subset data betwen 2007-02-01 and 2007-02-02
df.power$timestamp = strptime(paste(df.power$Date, df.power$Time),
                              format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
df.power = df.power[df.power$timestamp >= startDate & df.power$timestamp <= endDate, ]

## Create plot & save it to plot4.png
png(filename="plot4.png", width=480, height=480)

# Set a 4 plot canvas & generate each plot
par(mfcol=c(2,2))

plot(df.power$timestamp, df.power$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(df.power$timestamp, df.power$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(df.power$timestamp, df.power$Sub_metering_2, col="red")
lines(df.power$timestamp, df.power$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=par("lwd"), bty="n")

plot(df.power$timestamp, df.power$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(df.power$timestamp, df.power$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()