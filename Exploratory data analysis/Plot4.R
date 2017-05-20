library(dplyr)

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="EDA_coursera.zip")
unzip("EDA_coursera.zip")
dataset <- read.table("household_power_consumption.txt", sep=";", dec=".", 
                      header=T, stringsAsFactors = F, na.strings = "?")

data4 <- subset(dataset, Date %in% c("1/2/2007", "2/2/2007"))
data4$Time <- strptime(paste(data4$Date, data4$Time, sep="_"), "%d/%m/%Y_%H:%M:%S")

png(filename="Plot4.png", width = 480, height = 480, unit="px")

par(mfrow=c(2,2))
plot(data4$Time , data4$Global_active_power , type="l", xlab="", ylab="Global active power")
plot(data4$Time , data4$Voltage , type="l", xlab="datetime", ylab="Voltage")

plot(data4$Time, data4$Sub_metering_1 , type="l", xlab="", ylab="Energy sub-metering")
lines(data4$Time, data4$Sub_metering_2, col='red')
lines(data4$Time, data4$Sub_metering_3, col='blue')
legend("topright", pch=rep("-",3), col=c("black", "blue","red"), 
       legend= c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

plot(data4$Time , data4$Global_reactive_power , type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

