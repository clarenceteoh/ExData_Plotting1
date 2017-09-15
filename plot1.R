dataset <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
dataset$Date <- as.Date(dataset$Date,  "%d/%m/%Y" )

subdata <- subset(dataset, (dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02"))

png("plot1.png", width=480, height=480, units="px")
hist(subdata$Global_active_power, xlim=c(0,6), col = "red", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power")
dev.off()
