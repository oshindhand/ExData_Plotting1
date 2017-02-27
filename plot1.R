######### PLOT 1 ############

#set working directory
directory <- setwd("C:/Users/oshin.dhand/Desktop/coursera/exploratory data anlysis/assignment/data")
getwd()

#import data
allData <-  read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
mydata <- allData[allData$Date %in% c("1/2/2007","2/2/2007") ,]

#create plot
globalpower <- as.numeric(mydata$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(globalpower, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

  