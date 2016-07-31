#### PLOT 4
file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
target_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")


datetime <- strptime(paste(target_data$Date, target_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(target_data$Global_active_power)
globalReactivePower <- as.numeric(target_data$Global_reactive_power)
voltage <- as.numeric(target_data$Voltage)
subMetering1 <- as.numeric(target_data$Sub_metering_1)
subMetering2 <- as.numeric(target_data$Sub_metering_2)
subMetering3 <- as.numeric(target_data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()