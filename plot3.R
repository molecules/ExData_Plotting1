if( ! exists("usage") ){
    source("twoday_usage.R")
    usage <- get_twoday_powerusage()
}

# Create new graphics device for the third plot
png("plot3.png")

# Set line-width (so that legend will show lines)
par(lwd=3)

plot(c(usage$DateTime,usage$DateTime,usage$DateTime),
     c(usage$Sub_metering_1,usage$Sub_metering_2,usage$Sub_metering_3),
     ylab="Energy sub metering",        # y-axis title
     xlab="",                           # No title for x-axis
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
