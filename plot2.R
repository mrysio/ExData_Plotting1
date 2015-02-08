# Reading data household_power_consumtion 
# within two days: 2007-02-01 and 2007-02-02
data <- read.table("household_power_consumption.txt",
                   header= TRUE, 
                   sep=";",
                   na.strings= "?",
                   col.names = c("Date",
                                 "Time",
                                 "Global_active_power",
                                 "Global_reactive_power",
                                 "Voltage",
                                 "Global_intensity",
                                 "Sub_metering_1",
                                 "Sub_metering_2",
                                 "Sub_metering_3"
                   ),
                   colClasses = c("character",
                                  "character",
                                  "numeric",
                                  "numeric",
                                  "numeric",
                                  "numeric",
                                  "numeric",
                                  "numeric",
                                  "numeric"
                   ),
                   skip = 66637,
                   nrows = 2880)

# Adding new variable DateTime 
# in order to convert Date and Time variables to Date/Time class
data <- transform(data, DateTime=strptime(paste(data$Date, data$Time),
                                          format="%d/%m/%Y %H:%M:%S"))

##########################################################################
# Plot 2- construction
png("plot2.png", height = 480, width = 480)

plot(data$DateTime, data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
     
dev.off()