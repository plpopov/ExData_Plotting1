#
# Homework 3
#
print("Begin plot 3")

source("load_data.R")

# Create new variable for time series
dataSubset$DateTime <- paste(dataSubset$Date, dataSubset$Time)
dataSubset$DateTime <- as.POSIXct(strptime(dataSubset$DateTime, "%Y-%m-%d %T"))

# Open a graphic device
png("plot3.png", height = 480, width = 480, bg = "transparent")

# Prepare axis
plot(dataSubset$DateTime, dataSubset$Sub_metering_1, pch = NA, xlab = "", ylab = "Energy sub metering")

# Draw lines
lines(dataSubset$DateTime, dataSubset$Sub_metering_1, col = "black")
lines(dataSubset$DateTime, dataSubset$Sub_metering_2, col = "red")
lines(dataSubset$DateTime, dataSubset$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = c(1, 1, 1),
       col = c("black", "red", "blue"))
dev.off() 
print("Complete")