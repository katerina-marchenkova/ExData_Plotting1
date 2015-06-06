#reads all the data from the dataset
allData <-read.csv2("household_power_consumption.txt", na.strings="?",  stringsAsFactors=FALSE)

#subsets the Global Active power for 2 days
globalActivePowerByTime <- allData[(allData$Date== "1/2/2007" | allData$Date=="2/2/2007"), c(1,2,3)]
globalActivePowerByTime[, 3] <- as.numeric(globalActivePowerByTime[, 3])
globalActivePowerByTime$DateTime <- paste(globalActivePowerByTime$Date, globalActivePowerByTime$Time)
globalActivePowerByTime$DateTime <- strptime(globalActivePowerByTime$DateTime, format="%d/%m/%Y%H:%M:%S", tz="UTC")

#creates the plot
png("plot2.png", width = 480, height = 480, units = "px")
plot(globalActivePowerByTime$DateTime, globalActivePowerByTime$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()