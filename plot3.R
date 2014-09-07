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

    ## plot 3
    windows(width=6) # work for windows platform only to adjust legend
    plot(data$Datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab =  "")
    lines(data$Datetime, data$Sub_metering_2, col = "red")
    lines(data$Datetime, data$Sub_metering_3, col = "blue")
    
    ## add legend
    legend("topright", pch = 151 , col = c("black","red", "blue"),
           legend = names(data[7:9]), cex = 0.8)
    
    
    ## write plot to png
    dev.copy(png, file = "plot3.png", height=480, width = 480)
    dev.off()

    