######### PLOT 4 ############

#set working directory
directory <- setwd("C:/Users/oshin.dhand/Desktop/coursera/exploratory data anlysis/assignment/data")
getwd()

#import data
allData <-  read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
mydata <- allData[allData$Date %in% c("1/2/2007","2/2/2007") ,]

#convert date to day of week
day <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#create plot
png("plot4.png", width = 480, height = 480)
globalpower <- as.numeric(mydata$Global_active_power)
volts <- as.numeric(mydata$Voltage)
meter1 <- as.numeric(mydata$Sub_metering_1)
meter2 <- as.numeric(mydata$Sub_metering_2)
meter3 <- as.numeric(mydata$Sub_metering_3)
react <- as.numeric(mydata$Global_reactive_power)

par(mfrow=c(2,2))

#create plot 1
plot(day, globalpower, ylab="Global Active Power (kilowatts)", xlab = "", type="l")

#create plot 2
plot(day, volts, ylab="Voltage", xlab = "datetime", type="l")

#create plot 3
plot(day, meter1, ylab="Energy sub metering", xlab = "", type="l")
lines(day, meter2, ylab="Energy sub metering", xlab = "", type="l", col="red")
lines(day, meter3, ylab="Energy sub metering", xlab = "", type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty=1:1:1, col=c("black","red","blue"))

#create plot 4
plot(day, react, ylab="Global_reactive_power", xlab = "datetime", type="l")

dev.off()

