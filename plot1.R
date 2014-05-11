#
# Homework 2
#
print("Begin plot 1")

source("load_data.R")

# Open a graphic device
png(filename="plot1.png", width = 480, height = 480, bg = "transparent")

hist( dataSubset$Global_active_power, 
      col = "red", 
      main = "Global Active Power",  
      xlab = "Global Active Power (kilowatts)")
dev.off()
print("Complete")


