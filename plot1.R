if( ! exists("usage") ){
    source("twoday_usage.R")
    usage <- get_twoday_powerusage()
}

png("plot1.png")
hist(usage$Global_active_power,xlab="Global Active Power (kilowatts)",col="Red",main="Global Active Power")
dev.off()
