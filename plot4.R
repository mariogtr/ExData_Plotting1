##Read in data from 2007-02-01 to 2007-02-02
powerConsumption <- read.table("data/household_power_consumption.txt", skip = 66637, sep = ";", nrows = 2880, na.string = "?", header = TRUE, col.names= c("date", "time", "globalactivepower", "globalreactivepower", "voltage", "globalintensity", "submetering1", "submetering2", "submetering3"))
powerConsumption <- transform(powerConsumption, date = as.Date(date, format = "%d/%m/%Y"), time = as.POSIXlt(paste(date,time, " "), format = "%d/%m/%Y %T"))

## PLOT 4 of 2x2 matrix of plots

png(file = "figure/plot4.png")
par(mfrow = c(2,2), mar = c(4.5, 4, 1, 2.5), oma = c(0, 0, 1.9, 0), font.axis = 1, font.lab = 1, cex.lab = 0.8, cex.axis = 0.8)
with(power, plot(time, globalactivepower, type = "l", xlab = "", ylab = "Global Active Power"))
with(power, plot(time, voltage, type = "l", xlab = "", ylab = "Voltage"))
with(power, plot(time, submetering1, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))
points(power$time, power$submetering1, type = "l", col = "black")
points(power$time, power$submetering2, type = "l", col = "red")
points(power$time, power$submetering3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),ncol = 1, lty = 1, cex = 0.9)
with(power, plot(time, globalreactivepower, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
title(main = "Plot 4", outer = TRUE, cex.main = 1.5, font.main = 2, adj = 0)
dev.off()
