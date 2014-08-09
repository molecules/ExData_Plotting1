# This script provides a function for getting and preprocessing the required
# two-day usage data. If the data file is not found in the current directory,
# it will be downloaded and unzipped first.

get_twoday_powerusage <- function() {
    if(!  file.exists("household_power_consumption.txt")){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile="housepower.zip",method="wget")
        system("unzip housepower.zip")
    }

    ## Read in the table (I tried fread from data.table, but it didn't seem to handle using "?" as NA)
    powerusage <- read.table("household_power_consumption.txt",header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings=c("?"),sep=";")

    # Convert to "standard" date format
    powerusage$Date <- as.Date(powerusage$Date,format="%m/%d/%Y")

    # Create boolean vector indicating which data points to use 
    firstday_selection  <- powerusage$Date == "2007-02-01" 
    secondday_selection <- powerusage$Date == "2007-02-02"
    bothday_selection <- firstday_selection | secondday_selection 

    # Convert NA's to FALSE for the selection
    bothday_selection[ is.na(bothday_selection) ] <- FALSE
    
    # Create dataframe that contains only the selected dates
    twoday_usage <- powerusage[ bothday_selection, ]

    # Create new DateTime column that contains both date and time to use for plotting
    twoday_usage$DateTime <- paste(twoday_usage$Date, twoday_usage$Time)
    twoday_usage$DateTime <- strptime(twoday_usage$DateTime, format="%Y-%m-%d %H:%M:%S")

    return(twoday_usage)
}
