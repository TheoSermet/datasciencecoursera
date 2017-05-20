download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="EDA_coursera.zip")
unzip("EDA_coursera.zip")
dataset <- read.table("household_power_consumption.txt", sep=";", dec=".", 
                      header=T, stringsAsFactors = F, na.strings = "?")

data3 <- subset(dataset, Date %in% c("1/2/2007", "2/2/2007"))
data3$Time <- strptime(paste(data3$Date, data3$Time, sep="_"), "%d/%m/%Y_%H:%M:%S")

png(filename="Plot3.png", width = 480, height = 480, unit="px")

plot(data3$Time, data3$Sub_metering_1 , type="l", xlab="", ylab="Energy sub-metering")
lines(data3$Time, data3$Sub_metering_2, col='red')
lines(data3$Time, data3$Sub_metering_3, col='blue')
legend("topright", pch=rep("-",3), col=c("black", "blue","red"), 
       legend= c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), pt.cex = 1, cex=1)

dev.off()

