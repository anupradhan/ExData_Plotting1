## code for plot 4

data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
datetime<-as.POSIXct(strptime(paste(data[,1], data[,2], sep=","), "%d/%m/%Y,%H:%M:%S"))
data <- cbind(datetime, data)
neededData <- data[which(data$datetime > as.POSIXct("2007-02-01") & data$datetime < as.POSIXct("2007-02-03")),]

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2), mai = c(0.25, 1, 1.2, 0.7))
with (neededData, {
    plot(datetime,as.numeric(as.character(Global_active_power)), type="l", ylab="Global Active Power", xlab="")
    
    plot(datetime,as.numeric(as.character(Voltage)), type="l", ylab="Voltage", xlab="datetime")
    
    plot(neededData$datetime,as.numeric(as.character(neededData$Sub_metering_1)), type="l", ylab="Energy sub metering", xlab="")
    lines(neededData$datetime,as.numeric(as.character(neededData$Sub_metering_2)), col="red")
    lines(neededData$datetime,as.numeric(as.character(neededData$Sub_metering_3)), col="blue")
    legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
    
    plot(datetime,as.numeric(as.character(Global_reactive_power)), type="l", ylab="Global_reactive_power", xlab="datetime")
    
})
dev.off()