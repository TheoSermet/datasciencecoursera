download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="EDA_coursera.zip")
unzip("EDA_coursera.zip")
dataset <- read.table("household_power_consumption.txt", sep=";", dec=".", 
                      header=T, stringsAsFactors = F, na.strings = "?")

data2 <- subset(dataset, Date %in% c("1/2/2007", "2/2/2007"))
data2$Time <- strptime(paste(data2$Date, data2$Time, sep="_"), "%d/%m/%Y_%H:%M:%S")

png(filename="Plot2.png", width = 480, height = 480, unit="px")

plot(data2$Time , data2$Global_active_power , type="l", xlab="", ylab="Global active power (kilowatts)")

dev.off()

