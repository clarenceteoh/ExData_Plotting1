dataset <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
dataset$DateTime <- with(dataset, paste(Date,Time,sep='-'))

dataset$Date <- as.Date(dataset$Date,  "%d/%m/%Y" )
dataset$DateTime <- strptime(dataset$DateTime, format = "%d/%m/%Y-%H:%M:%S")

subdata <- subset(dataset, (dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02"))
subdata[,7] <- as.numeric(levels(subdata[,7]))[subdata[,7]]
subdata[,8] <- as.numeric(levels(subdata[,8]))[subdata[,8]]

png("plot3.png", width=480, height=480, units="px")
plot(subdata$DateTime, subdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subdata$DateTime, subdata$Sub_metering_2, type = "l", col = "red")
lines(subdata$DateTime, subdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd = 1)
dev.off()