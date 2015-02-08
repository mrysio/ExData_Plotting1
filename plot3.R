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
# Plot 3- construction
png("plot3.png", height = 480, width = 480)

with(data, plot(DateTime,Sub_metering_1,type="l",
                xlab="",ylab="Energy sub metering"))
with(data,lines(DateTime,Sub_metering_2,type="l", col="red"))
with(data,lines(DateTime,Sub_metering_3,type="l", col="blue"))
legend(x="topright", lty=1, col = c("black","red", "blue"),
       legend = c("Sub_metering_1", 
                  "Sub_metering_2",
                  "Sub_metering_3"))

dev.off()


