#reads all the data from the dataset
allData <-read.csv2("household_power_consumption.txt", na.strings="?",  stringsAsFactors=FALSE)

#subsets the Global Active power for 2 days
data <- allData[(allData$Date== "1/2/2007" | allData$Date=="2/2/2007"), ]
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage  <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, format="%d/%m/%Y%H:%M:%S", tz="UTC")

#creates the plot
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, type="l",ylab="Global Active Power", xlab="")
plot(data$DateTime, data$Voltage, type="l",ylab="Voltage", xlab="datetime")
plot(data$DateTime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty="solid", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
plot(data$DateTime, data$Global_reactive_power, type="l",ylab="Global_reactive_power", xlab="datetime")
dev.off()