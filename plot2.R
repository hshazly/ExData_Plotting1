#### PLOT 2
file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
target_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")


datetime <- strptime(paste(target_data$Date, target_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(target_data$Global_active_power)

png("plot2.png", width=480, height=480)

plot(datetime, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()