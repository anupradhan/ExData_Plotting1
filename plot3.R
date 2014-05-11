## code for plot 3

data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
datetime<-as.POSIXct(strptime(paste(data[,1], data[,2], sep=","), "%d/%m/%Y,%H:%M:%S"))
data <- cbind(datetime, data)
neededData <- data[which(data$datetime > as.POSIXct("2007-02-01") & data$datetime < as.POSIXct("2007-02-03")),]

png("plot3.png", width=480, height=480)
plot(neededData$datetime,as.numeric(as.character(neededData$Sub_metering_1)), type="l", ylab="Energy sub metering", xlab="")
lines(neededData$datetime,as.numeric(as.character(neededData$Sub_metering_2)), col="red")
lines(neededData$datetime,as.numeric(as.character(neededData$Sub_metering_3)), col="blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()