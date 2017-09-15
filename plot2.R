dataset <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
dataset$DateTime <- with(dataset, paste(Date,Time,sep='-'))

dataset$Date <- as.Date(dataset$Date,  "%d/%m/%Y" )
dataset$DateTime <- strptime(dataset$DateTime, format = "%d/%m/%Y-%H:%M:%S")

subdata <- subset(dataset, (dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02"))
subdata[,3] <- as.numeric(levels(subdata[,3]))[subdata[,3]]

png("plot2.png", width=480, height=480, units="px")
plot(subdata$DateTime, subdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
