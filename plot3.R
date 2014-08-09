if( ! exists("usage") ){
    source("twoday_usage.R")
    usage <- get_twoday_powerusage()
}

# Set line-width (so that legend will show lines)
par(lwd=3)

# Create new graphics device for the third plot
png("plot3.png")


plot(c(usage$DateTime,usage$DateTime,usage$DateTime),
     c(usage$Sub_metering_1,usage$Sub_metering_2,usage$Sub_metering_3),
     ylab="Energy sub metering",        # y-axis title
     xlab="",                           # No title for x-axis
     ylim=c(0,25),                      # Make enough room in y to allow for the legend
     type="n"                           # Don't draw it yet
)
lines(usage$DateTime,usage$Sub_metering_1,col="black")
lines(usage$DateTime,usage$Sub_metering_2,col="red")
lines(usage$DateTime,usage$Sub_metering_3,col="blue")
legend("topright",
       col=c("black","red","blue"),
       legend=c("Sub metering 1","Sub metering 2", "Sub metering 3"),
       lty=c(1)
)
dev.off()
