data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
datetime<-as.POSIXct(strptime(paste(data[,1], data[,2], sep=","), "%d/%m/%Y,%H:%M:%S"))
data <- cbind(datetime, data)
neededData <- data[which(data$datetime > as.POSIXct("2007-02-01") & data$datetime < as.POSIXct("2007-02-03")),]

## code for plot 1
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(neededData$Global_active_power)), col="red", freq=TRUE, main="Global Active Power", xlab = "Global Active Power (kilowatts)")
#dev.copy(png, file="plot1.png", height = 480, width = 480)
dev.off()