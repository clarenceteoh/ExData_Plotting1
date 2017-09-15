dataset <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
dataset$DateTime <- with(dataset, paste(Date,Time,sep='-'))

dataset$Date <- as.Date(dataset$Date,  "%d/%m/%Y" )
dataset$DateTime <- strptime(dataset$DateTime, format = "%d/%m/%Y-%H:%M:%S")

subdata <- subset(dataset, (dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02"))
subdata[,3] <- as.numeric(levels(subdata[,3]))[subdata[,3]]
subdata[,4] <- as.numeric(levels(subdata[,4]))[subdata[,4]]
subdata[,5] <- as.numeric(levels(subdata[,5]))[subdata[,5]]
subdata[,7] <- as.numeric(levels(subdata[,7]))[subdata[,7]]
subdata[,8] <- as.numeric(levels(subdata[,8]))[subdata[,8]]

png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
plot(subdata$DateTime, subdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(subdata$DateTime, subdata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(subdata$DateTime, subdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subdata$DateTime, subdata$Sub_metering_2, type = "l", col = "red")
lines(subdata$DateTime, subdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd = 1)

plot(subdata$DateTime, subdata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()