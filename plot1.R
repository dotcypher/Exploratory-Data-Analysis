    ## Load File
    fh = file("household_power_consumption.txt",open = "r")
    
    # read only required data contains only 2007-02-01 - 2007-02-02
    data <- read.table(sep = ";", na.strings = "?" , text = grep("^[1,2]/2/2007",readLines(fh),value = TRUE))
    
    # add header into table
    header = read.table("household_power_consumption.txt", nrows = 1, sep = ";", stringsAsFactors = FALSE)
    colnames(data) = header
    rm(header)
    
    ## plot 1
    hist(xlab = "Global Active Power (kilowatts)", data$Global_active_power, col = "Red", main = "Global Active Power")
    
    ## write plot to png
    dev.copy(png, file = "plot1.png", height=480, width = 480)
    dev.off()