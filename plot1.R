
## determine memory required for reading in file
##memory required = no. of column * no. of rows * 8 bytes/numeric

# If your data's stored in a csv file, you could first read in a subset of the file and calculate the memory usage in bytes with the object.size function. 
# Then, you could compute the total number of lines in the file with the wc command-line utility and use the line count to scale the memory usage of your 
# subset to get an estimate of the total usage:
library(gdata)
top.size <- object.size(read.table("data/household_power_consumption.txt", nrow=1000))
lines <- as.numeric(gsub("[^0-9]", "", system("wc -l data/household_power_consumption.txt", intern=T)))
size.estimate <- lines / 1000 * top.size
humanReadable(size.estimate) ##converts to kb,mb or gb

##Read in data from 2007-02-01 to 2007-02-02
powerConsumption <- read.table("data/household_power_consumption.txt", skip = 66637, sep = ";", nrows = 2880, na.string = "?", header = TRUE, col.names= c("date", "time", "globalactivepower", "globalreactivepower", "voltage", "globalintensity", "submetering1", "submetering2", "submetering3"))
powerConsumption <- transform(powerConsumption, date = as.Date(date, format = "%d/%m/%Y"), time = as.POSIXlt(paste(date,time, " "), format = "%d/%m/%Y %T"))

## PLOT 1 of histogram of global active power
png(file = "figure/plot1.png")
par(mfrow = c(1,1), mar = c(4, 4, 4, 4), oma = c(0, 1, 2, 1), font.axis = 1, font.lab = 1)
with(powerConsumption, hist(globalactivepower, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
title(main = "Plot 1", outer = TRUE, cex.main = 1.5, font.main = 2, adj = 0)
dev.off()