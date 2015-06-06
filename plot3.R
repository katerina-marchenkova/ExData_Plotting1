#reads all the data from the dataset
allData <-read.csv2("household_power_consumption.txt", na.strings="?",  stringsAsFactors=FALSE)

#subsets the Global Active power for 2 days
subMetering <- allData[(allData$Date== "1/2/2007" | allData$Date=="2/2/2007"), c(1,2,7,8,9)]
subMetering[, 3] <- as.numeric(subMetering[, 3])
subMetering[, 4] <- as.numeric(subMetering[, 4])
subMetering[, 5] <- as.numeric(subMetering[, 5])
subMetering$DateTime <- paste(subMetering$Date, subMetering$Time)
subMetering$DateTime <- strptime(subMetering$DateTime, format="%d/%m/%Y%H:%M:%S", tz="UTC")

#creates the plot
png("plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(subMetering$DateTime, subMetering$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(subMetering$DateTime, subMetering$Sub_metering_2, col="red")
lines(subMetering$DateTime, subMetering$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty="solid", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()