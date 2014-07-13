col <- c("character", "character", rep_len("numeric", 7))
d <- read.csv("data_ok.csv", header = T, colClasses = col, sep = ",")

# Creating time series
d$DateTime <- paste(d$Date, d$Time)
d$DateTime <- as.POSIXct(strptime(d$DateTime, "%Y-%m-%d %T"))

# Weekdays in English
Sys.setlocale(locale = "C")

# plotting
png("plot4.png", height = 480, width = 480)

par(bg = "transparent") # transparent background

# Let's plot in 2 rows with 2 columns
par(mfrow = c(2, 2))

#-------------------------------------------------------------------------------------------------
# Cell 1:1. Global Active Power plot
#-------------------------------------------------------------------------------------------------
# Let's prepare axis...
plot(d$DateTime, d$Global_active_power, pch = NA, xlab = "", 
     ylab = "Global Active Power (kilowatts)")

# ...and draw lines
lines(d$DateTime, d$Global_active_power)

#-------------------------------------------------------------------------------------------------
# Cell 1:2. Voltage plot
#-------------------------------------------------------------------------------------------------
# Let's prepare axis...
plot(d$DateTime, d$Voltage, pch = NA, xlab = "datetime", 
     ylab = "Voltage")

# ...and draw lines
lines(d$DateTime, d$Voltage)

#-------------------------------------------------------------------------------------------------
# Cell 2:1. Submetering plot
#-------------------------------------------------------------------------------------------------
# Let's prepare axis...
plot(d$DateTime, d$Sub_metering_1, pch = NA, xlab = "", 
     ylab = "Energy sub metering")

# ...and draw lines
lines(d$DateTime, d$Sub_metering_1)
lines(d$DateTime, d$Sub_metering_2, col = "red")
lines(d$DateTime, d$Sub_metering_3, col = "blue")

# Let's place a legend
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = c(1, 1, 1),
       col = c("black", "red", "blue"))

#-------------------------------------------------------------------------------------------------
# Cell 2:2. Global reactive power plot
#-------------------------------------------------------------------------------------------------
# Let's prepare axis...
plot(d$DateTime, d$Global_reactive_power, pch = NA, xlab = "datetime", 
     ylab = names(d)[4])

# ...and draw line
lines(d$DateTime, d$Global_reactive_power)

dev.off()