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


## Create Plot 2
png("plot2.png", width=480, height=480, units="px")
plot(hpcShort$Global_active_power ~ hpcShort$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
