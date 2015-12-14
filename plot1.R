
data_full <- read.table(unz("exdata-data-household_power_consumption.zip", 
	"household_power_consumption.txt"), header = TRUE, sep = ";", 
	stringsAsFactors = FALSE)
# since the assignment instructions require to include only the code 
# for reading the data I didn't include the code for downloading the zip archive

data <- subset(data_full, data_full$Date %in% c("1/2/2007", "2/2/2007"))

data$Global_active_power <- as.numeric(data$Global_active_power)

hist(data$Global_active_power, col = "red", main = "Global active power", 
xlab = "Global active power (kilowatts)")

dev.copy(device = png, filename = "Plot1.png")
dev.off()