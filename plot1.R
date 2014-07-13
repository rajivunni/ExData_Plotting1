##################################################################################################
#  The used data are in the period between 2007-02-01 and 2007-02-02.                            #
#  They were extracted and stored in the 'data' data frame using following commands:             #
#  rm(list=ls())                                                                                 #
#  col  <- c("character", "character", rep_len("numeric", 7))                                    #
#  d0 <- read.table("household_power_consumption.txt", header = T, colClasses = col,             #
#            sep = ";", na.strings = "?")                                                        #
#  d0$Date <- as.Date(d0$Date, "%d/%m/%Y")                                                       #
#  d <- subset(d0, d0$Date >= '2007-02-01' & d0$Date <= '2007-02-02')                            #
#  write.csv(d, "data_ok.csv", row.names = F)                                                    #
#  rm(d0,col)                                                                                    #
##################################################################################################

# I used this data...
col  <- c("character", "character", rep_len("numeric", 7))
d <- read.csv("data_ok.csv", header = T, colClasses = col, sep = ",")

png("plot1.png", height = 480, width = 480)

# Let's write a histogram on the device
hist(d$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()