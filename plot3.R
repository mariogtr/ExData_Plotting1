##Read in data from 2007-02-01 to 2007-02-02
powerConsumption <- read.table("data/household_power_consumption.txt", skip = 66637, sep = ";", nrows = 2880, na.string = "?", header = TRUE, col.names= c("date", "time", "globalactivepower", "globalreactivepower", "voltage", "globalintensity", "submetering1", "submetering2", "submetering3"))
powerConsumption <- transform(powerConsumption, date = as.Date(date, format = "%d/%m/%Y"), time = as.POSIXlt(paste(date,time, " "), format = "%d/%m/%Y %T"))

## PLOT 3 of submetering by time

png(file = "figure/plot3.png")
par(mfrow = c(1,1), mar = c(3.8, 3.8, 3.8, 3.8), oma = c(1, 1, 2, 1), font.axis = 1, font.lab = 1, cex.lab = 0.8, cex.axis = 0.8)
with(powerConsumption, plot(time, submetering1, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))
points(powerConsumption$time, powerConsumption$submetering1, type = "l", col = "black")
points(powerConsumption$time, powerConsumption$submetering2, type = "l", col = "red")
points(powerConsumption$time, powerConsumption$submetering3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),ncol = 1, lty = 1, cex = 0.9)
title(main = "Plot 3", outer = TRUE, cex.main = 1.5, font.main = 2, adj = 0)
dev.off()
