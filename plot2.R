# Loading data...
col <- c("character", "character", rep_len("numeric", 7))
d <- read.csv("data_ok.csv", header = T, colClasses = col, sep = ",")

# Creating a new variable for time series
d$DateTime <- paste(d$Date, d$Time)
d$DateTime <- as.POSIXct(strptime(d$DateTime, "%Y-%m-%d %T"))

# Displaying names of weekdays
Sys.setlocale(locale = "C")

png("plot2.png", height = 480, width = 480)
par(bg = "transparent") # transparent background
plot(d$DateTime, d$Global_active_power, pch = NA, xlab = "", 
     ylab = "Global Active Power (kilowatts)")
lines(d$DateTime, d$Global_active_power)
dev.off()