lines<-grepl("^1.2.2007|^2.2.2007",readLines("household_power_consumption.txt"))


household_power<-read.table("household_power_consumption.txt",header=TRUE,
                            sep=";",na.strings = "?")[lines, ]


household_power$Date<-strptime(household_power$Date, "%d/%m/%Y")

Date<-paste(household_power$Date, household_power$Time)
household_power$Time <- strptime(Date, format = "%Y-%m-%d %H:%M:%S")

plot(x = household_power$Time, y = household_power$Global_active_power,
     type = "l", xlab = "",ylab = "Global Active Power (kilowatts)")


dev.copy(png, file = "plot2.png",width=480, height=480)
dev.off() 
