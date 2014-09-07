    ## Load File
    fh = file("household_power_consumption.txt",open = "r")
    
    # read only required data contains only 2007-02-01 - 2007-02-02
    data <- read.table(sep = ";", na.strings = "?" , text = grep("^[1,2]/2/2007",readLines(fh),value = TRUE))
    
    # add header into table
    header = read.table("household_power_consumption.txt", nrows = 1, sep = ";", stringsAsFactors = FALSE)
    colnames(data) = header
    rm(header)
    
    ## Conversion to datetime
    data$Datetime = paste(data$Date, data$Time)
    data$Datetime = strptime(data$Datetime, "%d/%m/%Y %H:%M:%S")

    ## plot 2
    plot(data$Datetime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab =  "")
    
    ## write plot to png
    dev.copy(png, file = "plot2.png", height=480, width = 480)
    dev.off()