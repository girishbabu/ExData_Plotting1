## Coursera - Exploratory Data Analysis - Plotting Assignment 1
##
## Author: Girish Babu
## Date: 09-August-2014
##
## plot1.R - This generates plot1.png

## Get the file from the URL specified & save it to exdata_plotting.zip
dest_filename = "exdata_plotting1.zip"

retval = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
	 destfile = dest_filename, method = "curl")

## Read file contents into a data frame
df.power = read.csv(unz(filename, "household_power_consumption.txt"), header=T,
	   sep=";", stringsAsFactors=F, na.strings="?",
	   colClasses=c("character", "character", "numeric",
	   "numeric", "numeric", "numeric",
	   "numeric", "numeric", "numeric"))

## Subset data betwen 2007-02-01 and 2007-02-02
df.power$Date = as.Date(df.power$Date, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
df.power = df.power[df.power$Date >= startDate & df.power$Date <= endDate, ]

## Create plot & save it to plot1.png
png(filename="plot1.png", width=480, height=480)
hist(df.power$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()