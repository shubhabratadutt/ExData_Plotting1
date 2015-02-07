data <- read.table("../../exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, 
                   as.is = TRUE, sep = ";", dec = ".", na.strings = c("?", "NA"))
data$Time <- paste(data$Date, data$Time, sep = " ")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%d/%m/%Y %H:%M:%S")
tempDataFrame <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
png(filename="plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
with(tempDataFrame, {
  plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Gobal Active Power")
  plot(Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  lines(Time, Sub_metering_1)
  lines(Time, Sub_metering_2, col = "red")
  lines(Time, Sub_metering_3, col = "blue")
  legend("topright", bty = "n", lwd=2, col = c("black", "red", "blue"), 
         legend = c("Sub-metering_1","Sub-metering_2","Sub-metering_3"))
  plot(Time, Global_reactive_power, type = "l", xlab = "datetime")
})
dev.off()