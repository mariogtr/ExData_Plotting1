## Density Plot

png(file = "figure/plot2.png")

par(mfrow = c(1,1), mar = c(4, 4, 4, 4), oma = c(0, 1, 2, 1), font.axis = 1, font.lab = 1, cex.lab = 0.8, cex.axis = 0.8)
with(power, plot(time, globalactivepower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
title(main = "Plot 2", outer = TRUE, cex.main = 1.5, font.main = 2, adj = 0)
dev.off()