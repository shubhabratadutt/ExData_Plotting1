data <- read.table("../../exdata-data-household_power_consumption/household_power_consumption.txt", header = TRUE, 
                   as.is = TRUE, sep = ";", dec = ".", na.strings = c("?", "NA"))
data$Time <- paste(data$Date, data$Time, sep = " ")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%d/%m/%Y %H:%M:%S")
tempDataFrame <- data[data$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]
png(filename="plot1.png", width = 480, height = 480, units = "px")
hist(tempDataFrame$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatt)")
dev.off()