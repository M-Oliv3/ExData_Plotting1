lines<-grepl("^1.2.2007|^2.2.2007",readLines("household_power_consumption.txt"))


household_power<-read.table("household_power_consumption.txt",header=TRUE,
                            sep=";",na.strings = "?")[lines, ]


household_power$Date<-strptime(household_power$Date, "%d/%m/%Y")


hist(household_power$Global_active_power,xlab="Global Active Power (kilowatts)",
     col="red",
     main = "Global Active Power")


dev.copy(png, file = "plot1.png",width=480, height=480)
dev.off() 
