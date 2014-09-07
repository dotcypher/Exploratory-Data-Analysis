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

    
    ## prepare 4 plots
    par(mfrow = c(2,2), mar = c(4,4,1,1), oma = c(4,0,0,0))
    
    ## plot 4.1
    plot(data$Datetime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab =  "")
    
    ## plot 4.2
    plot(data$Datetime, data$Voltage, type = "l", ylab = "Voltage", xlab =  "datetime")
    
    ## plot 4.3
    plot(data$Datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab =  "")
    lines(data$Datetime, data$Sub_metering_2, col = "red")
    lines(data$Datetime, data$Sub_metering_3, col = "blue")
    
    ## add legend & remove border
    legend("topright", pch = 151, cex = 0.8 , col = c("black","red", "blue"), legend = names(data[7:9]), bty = "n")
    
    ## plot 4.4
    plot(data$Datetime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab =  "datetime")
    
    
        
    ## write plot to png
    dev.copy(png, file = "plot4.png", height=480, width = 480)
    dev.off()