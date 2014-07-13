col <- c("character", "character", rep_len("numeric", 7))
d <- read.csv("data_ok.csv", header = T, colClasses = col, sep = ",")

# Creating time series
d$DateTime <- paste(d$Date, d$Time)
d$DateTime <- as.POSIXct(strptime(d$DateTime, "%Y-%m-%d %T"))

# Weekdays in English
Sys.setlocale(locale = "C")

# playing
png("plot3.png", height = 480, width = 480)
par(bg = "transparent") # transparent background
plot(d$DateTime, d$Sub_metering_1, pch = NA, xlab = "", ylab = "Energy sub metering")
lines(d$DateTime, d$Sub_metering_1)
lines(d$DateTime, d$Sub_metering_2, col = "red")
lines(d$DateTime, d$Sub_metering_3, col = "blue")

# Displaying the legend
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = c(1, 1, 1), col = c("black", "red", "blue"))
dev.off()
