#reads all the data from the dataset
allData <-read.csv2("household_power_consumption.txt", na.strings="?",  stringsAsFactors=FALSE)
#subsets the Global Active power for 2 days
globalActivePower <- allData[(allData$Date== "1/2/2007" | allData$Date=="2/2/2007"), 3]
globalActivePower <- as.numeric(globalActivePower)
#creates the histogram
png("plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(globalActivePower, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()