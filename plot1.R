#### PLOT 1
file <- "household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
target_data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

global_active_power <- as.numeric(target_data$Global_active_power)

png("plot1.png", width=480, height=480)
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()



