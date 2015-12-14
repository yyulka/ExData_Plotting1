
data_full <- read.table(unz("exdata-data-household_power_consumption.zip", 
	"household_power_consumption.txt"), header = TRUE, sep = ";", 
	stringsAsFactors = FALSE)
	
# since the assignment instructions require to include only the code for 
# reading the data I didn't include the code for downloading the zip archive

data <- subset(data_full, data_full$Date %in% c("1/2/2007", "2/2/2007"))

data$Global_active_power <- as.numeric(data$Global_active_power)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data$DateTime <- paste(data$Date, data$Time)

data$DateTime <- as.POSIXct(data$DateTime)

with(data, plot(DateTime, Global_active_power, type = "l", xlab = "", 
ylab = "Global active power (kilowatts)"))

dev.copy(device = png, filename = "Plot2.png")
dev.off()