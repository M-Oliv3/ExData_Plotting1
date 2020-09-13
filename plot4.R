lines<-grepl("^1.2.2007|^2.2.2007",readLines("household_power_consumption.txt"))


household_power<-read.table("household_power_consumption.txt",header=TRUE,
                            sep=";",na.strings = "?")[lines, ]


household_power$Date<-strptime(household_power$Date, "%d/%m/%Y")

Date<-paste(household_power$Date, household_power$Time)
household_power$Time <- strptime(Date, format = "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(household_power, {
        plot(x = Time, y = Global_active_power,
             type = "l", xlab = "",ylab = "Global Active Power (kilowatts)")
        
        plot(x = Time, y =Voltage,
             type = "l", xlab = "datetime",ylab = "Voltage")
        
        plot(x = household_power$Time, y = household_power$Sub_metering_1,
             type = "l", xlab = "",ylab = "Energy sub metering")
        lines(x=household_power$Time, y = household_power$Sub_metering_2, type="l", col = "red")
        lines(x=household_power$Time, y = household_power$Sub_metering_3, type="l", col = "blue")
        legend("topright", lty = 1, col = c("black", "red", "blue"), 
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        plot(x = Time, y =household_power$Global_reactive_power,
             type = "l", xlab = "datetime",ylab = "Global_reactive_power")
})


dev.off() 
