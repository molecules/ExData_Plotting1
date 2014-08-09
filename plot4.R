if( ! exists("usage") ){
    source("twoday_usage.R")
    usage <- get_twoday_powerusage()
}

# Create new graphics device for the fourth plot
png("plot4.png")

# Set line-width (so that legend will show lines)
par(lwd=1)

# Set up device to display four plots (filling columns first)
par(mfcol=c(2,2))

# Top left plot (Global_active_power time series)
plot(usage$DateTime,usage$Global_active_power,type="n",ylab="Global Active Power",xlab="")
lines(usage$DateTime,usage$Global_active_power,col="black")

# Bottom left plot (Sub metering time series)
plot(c(usage$DateTime,usage$DateTime,usage$DateTime),                   # x values
     c(usage$Sub_metering_1,usage$Sub_metering_2,usage$Sub_metering_3), # y values
     ylab="Energy sub metering",        # y-axis title
     xlab="",                           # No title for x-axis
     ylim=c(0,30),                      # Make enough room in y to allow for the legend
     type="n"                           # Don't draw it yet
)

lines(usage$DateTime,usage$Sub_metering_1,col="black")      # Draw sub metering 1
lines(usage$DateTime,usage$Sub_metering_2,col="red")        # Draw sub metering 2
lines(usage$DateTime,usage$Sub_metering_3,col="blue")       # Draw sub metering 3

# Draw legend
legend("topright",                      # Position of legend
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
       lty=c(1),    # Show data lines in legend
       bty="n"      # Don't show a box around the legend
)

# Top right plot (Time series for Voltage)
plot(usage$DateTime,usage$Voltage,type="n",ylab="Voltage",xlab="datetime")
lines(usage$DateTime,usage$Voltage,col="black")

# Bottom right plot (Time series for Global_reactive_power)
plot(usage$DateTime,usage$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(usage$DateTime,usage$Global_reactive_power,col="black")

dev.off()
