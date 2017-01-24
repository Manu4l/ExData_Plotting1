# Set working directory and load data
setwd("H:/Kurse/DataScience/ExploratoryDataAnalysis")
hpc <- read.table("household_power_consumption.txt", sep = ";", na.strings='?', header = TRUE)

# Load tidyverse
library(tidyverse)

# Combine and change format of date as well as time
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, "%d/%m/%Y %H:%M:%S")
hpc$DateTime <- as.POSIXct(hpc$DateTime)

# Filter first two days of february 2007
hpcShort <- filter(hpc, DateTime >= "2007-02-01 00:00:00" & DateTime < "2007-02-03 00:00:00")


## Create Plot 3
png("plot3.png", width=480, height=480, units="px")

with(hpcShort, {
  plot(hpcShort$Sub_metering_1 ~ hpcShort$DateTime, type = "l", ylab= "Energy sub metering", xlab="")
  lines(hpcShort$Sub_metering_2 ~ hpcShort$DateTime, col="Red")
  lines(hpcShort$Sub_metering_3 ~ hpcShort$DateTime, col="Blue")
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
