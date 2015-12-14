
data_full <- read.table(unz("exdata-data-household_power_consumption.zip", 
	"household_power_consumption.txt"), header = TRUE, sep = ";", 
	stringsAsFactors = FALSE)
data <- subset(data_full, data_full$Date %in% c("1/2/2007", "2/2/2007"))

data$Global_active_power <- as.numeric(data$Global_active_power)

data$Voltage <- as.numeric(data$Voltage)

data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data$DateTime <- paste(data$Date, data$Time)

data$DateTime <- as.POSIXct(data$DateTime)

par(mfrow = c(2,2))

with(data, plot(DateTime, Global_active_power, type = "l", xlab = "", 
ylab = "Global Active Power"))

with(data, plot(DateTime, Voltage, type = "l", xlab = "datetime", 
ylab = "Voltage"))

with(data, plot(DateTime, Sub_metering_1, xlab = "", 
			ylab = "Energy sub metering",  type = "n"))
		
			with(subset(data), points(DateTime, Sub_metering_1, type = "l"))
			with(subset(data), points(DateTime, Sub_metering_2, type = "l", 
			col = "red"))
			with(subset(data), points(DateTime, Sub_metering_3, type = "l", 
			col = "blue"))
			legend("topright", lty = 1, col = c("black", "red", "blue"), 
			legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime", 
ylab = "Global_reactive_power"))
	
dev.copy(device = png, filename = "Plot4.png")
dev.off()
