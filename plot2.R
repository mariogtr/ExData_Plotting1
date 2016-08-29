##Read in data from 2007-02-01 to 2007-02-02
powerConsumption <- read.table("data/household_power_consumption.txt", skip = 66637, sep = ";", nrows = 2880, na.string = "?", header = TRUE, col.names= c("date", "time", "globalactivepower", "globalreactivepower", "voltage", "globalintensity", "submetering1", "submetering2", "submetering3"))
powerConsumption <- transform(powerConsumption, date = as.Date(date, format = "%d/%m/%Y"), time = as.POSIXlt(paste(date,time, " "), format = "%d/%m/%Y %T"))


## PLOT 2 of global active power by time

png(file = "figure/plot2.png")
par(mfrow = c(1,1), mar = c(4, 4, 4, 4), oma = c(0, 1, 2, 1), font.axis = 1, font.lab = 1, cex.lab = 0.8, cex.axis = 0.8)
with(powerConsumption, plot(time, globalactivepower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
title(main = "Plot 2", outer = TRUE, cex.main = 1.5, font.main = 2, adj = 0)
dev.off()