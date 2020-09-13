lines<-grepl("^1.2.2007|^2.2.2007",readLines("household_power_consumption.txt"))


household_power<-read.table("household_power_consumption.txt",header=TRUE,
                            sep=";",na.strings = "?")[lines, ]


household_power$Date<-strptime(household_power$Date, "%d/%m/%Y")

Date<-paste(household_power$Date, household_power$Time)
household_power$Time <- strptime(Date, format = "%Y-%m-%d %H:%M:%S")

plot(x = household_power$Time, y = household_power$Sub_metering_1,
     type = "l", xlab = "",ylab = "Energy sub metering")
lines(x=household_power$Time, y = household_power$Sub_metering_2, type="l", col = "red")
lines(x=household_power$Time, y = household_power$Sub_metering_3, type="l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png",width=480, height=480)
dev.off() 
