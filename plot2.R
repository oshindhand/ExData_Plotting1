######### PLOT 2 ############

#set working directory
directory <- setwd("C:/Users/oshin.dhand/Desktop/coursera/exploratory data anlysis/assignment/data")
getwd()

#import data
allData <-  read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
mydata <- allData[allData$Date %in% c("1/2/2007","2/2/2007") ,]

#change date/time classes
day <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#create plot
globalpower <- as.numeric(mydata$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(day, globalpower, ylab="Global Active Power (kilowatts)", xlab = "", type="l")
dev.off()