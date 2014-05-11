#
# Homework 4
#
print("Begin plot 4")

source("load_data.R")

# Create new variable for time series
dataSubset$DateTime <- paste(dataSubset$Date, dataSubset$Time)
dataSubset$DateTime <- as.POSIXct(strptime(dataSubset$DateTime, "%Y-%m-%d %T"))

# Open a graphic device
png("plot4.png", height = 480, width = 480, bg = "transparent")

# Create plotting grid(2x2)
par(mfrow = c(2, 2))

# Cell 1.1
# Global Active Power
plot(dataSubset$DateTime, dataSubset$Global_active_power,  ylab = "Global Active Power (kilowatts)", xlab = "",  pch = NA )
lines(dataSubset$DateTime, dataSubset$Global_active_power)

# Cell 1.2 
# Voltage 
plot(dataSubset$DateTime, dataSubset$Voltage, ylab = "Voltage", xlab = "datetime" , pch = NA)
lines(dataSubset$DateTime, dataSubset$Voltage)

# Cell 2.1
# Sub metering
plot(dataSubset$DateTime, dataSubset$Sub_metering_1, ylab = "Energy sub metering",  xlab = "", pch = NA )

lines(dataSubset$DateTime, dataSubset$Sub_metering_1, col = "black")
lines(dataSubset$DateTime, dataSubset$Sub_metering_2, col = "red")
lines(dataSubset$DateTime, dataSubset$Sub_metering_3, col = "blue")

legend("topright",  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = c(1, 1, 1), col = c("black", "red", "blue"))

# Cell 2.2
# Global reactive power
plot(dataSubset$DateTime, dataSubset$Global_reactive_power, ylab = names(dataSubset)[4], pch = NA, xlab = "datetime")
lines(dataSubset$DateTime, dataSubset$Global_reactive_power)

dev.off()

print("Complete")