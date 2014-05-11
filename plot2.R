## Code for plot 2
data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE)
datetime<-as.POSIXct(strptime(paste(data[,1], data[,2], sep=","), "%d/%m/%Y,%H:%M:%S"))
data <- cbind(datetime, data)
neededData <- data[which(data$datetime > as.POSIXct("2007-02-01") & data$datetime < as.POSIXct("2007-02-03")),]

png("plot2.png", width=480, height=480)
plot(neededData$datetime,as.numeric(as.character(neededData$Global_active_power)), type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()