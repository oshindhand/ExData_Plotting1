######### PLOT 3 ############

#set working directory
directory <- setwd("C:/Users/oshin.dhand/Desktop/coursera/exploratory data anlysis/assignment/data")
getwd()

#import data
allData <-  read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
mydata <- allData[allData$Date %in% c("1/2/2007","2/2/2007") ,]

#convert date to day of week
day <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#create plot
meter1 <- as.numeric(mydata$Sub_metering_1)
meter2 <- as.numeric(mydata$Sub_metering_2)
meter3 <- as.numeric(mydata$Sub_metering_3)
png("plot3.png", width = 480, height = 480)
plot(day, meter1, ylab="Energy sub metering", xlab = "", type="l")
lines(day, meter2, ylab="Energy sub metering", xlab = "", type="l", col="red")
lines(day, meter3, ylab="Energy sub metering", xlab = "", type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1:1:1, col=c("black","red","blue"))
dev.off()