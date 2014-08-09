if( ! exists("usage") ){
    source("twoday_usage.R")
    usage <- get_twoday_powerusage()
}

png("plot2.png")
plot(usage$DateTime,usage$Global_active_power,type="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(usage$DateTime,usage$Global_active_power,col="black")
dev.off()
