download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="EDA_coursera.zip")
unzip("EDA_coursera.zip")
dataset <- read.table("household_power_consumption.txt", sep=";", dec=".", 
                      header=T, stringsAsFactors = F, na.strings = "?")

data1 <- subset(dataset, Date %in% c("1/2/2007", "2/2/2007"))
data1$Time <- strptime(paste(data1$Date, data1$Time, sep="_"), "%d/%m/%Y_%H:%M:%S")

png(filename="Plot1.png", width = 480, height = 480, unit="px")

with(data1, hist(Global_active_power, breaks=12, col='red'
                 , main="Global active power", xlab="Global active power (kilowatts)"))

dev.off()

