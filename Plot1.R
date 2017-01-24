# Set working directory and load data
setwd("H:/Kurse/DataScience/ExploratoryDataAnalysis")
hpc <- read.table("household_power_consumption.txt", sep = ";", na.strings='?', header = TRUE)

# Load tidyverse
library(tidyverse)

# Change column Date to date format
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")

# Filter first two days of february 2007
hpcShort <- filter(hpc, Date >= "2007-02-01" & Date < "2007-02-03")

# Create first plot and save as png
png("plot1.png", width=480, height=480, units="px")
hist(hpcShort$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
