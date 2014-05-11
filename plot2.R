#
# Homework 2
#
print("Begin plot 2")

source("load_data.R")

# Create new variable for time series
dataSubset$DateTime <- paste(dataSubset$Date, dataSubset$Time)
dataSubset$DateTime <- as.POSIXct(strptime(dataSubset$DateTime, "%Y-%m-%d %T"))

# Open a graphic device
png("plot2.png", height = 480, width = 480, bg = "transparent")

plot(dataSubset$DateTime, dataSubset$Global_active_power, pch = NA, xlab = "", ylab = "Global Active Power (kilowatts)")
lines(dataSubset$DateTime, dataSubset$Global_active_power)

dev.off()
print("Complete")