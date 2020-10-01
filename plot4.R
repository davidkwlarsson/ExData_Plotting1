
# Read the csv file
hpc <- read.csv("household_power_consumption.txt", sep = ";")


# Assign NA to ?
hpc[hpc == '?'] <- NA

# Change format of dates and filter
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc <- hpc[hpc$Date >= as.Date("2007-02-01") & hpc$Date <= as.Date("2007-02-02"),]

# Add date with time
hpc$posix <- as.POSIXct(strptime(paste(hpc$Date, hpc$Time, sep = " "),
                                 format = "%Y-%m-%d %H:%M:%S"))

#Convert to numeric and Plot Global Active Power
hpc$Sub_metering_1 <- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2 <- as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3 <- as.numeric(hpc$Sub_metering_3)

png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2,2))

#first plot
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
plot(hpc$posix, hpc$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


plot(hpc$posix, hpc$Sub_metering_1,
     type = "l", xlab = "", ylab = "Energy sub metering")
lines(hpc$posix, hpc$Sub_metering_2, col = "red")
lines(hpc$posix, hpc$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("darkgrey","red", "blue"), lty = 1)

hpc$Voltage <- as.numeric(hpc$Voltage)
plot(hpc$posix, hpc$Voltage, type = 'l',
     xlab= "date time", ylab = "Voltage")

hpc$Global_reactive_power <- as.numeric(hpc$Global_reactive_power)
plot(hpc$posix,hpc$Global_reactive_power, type = 'l'
     , xlab = "date time", ylab = "Global_reactive_power")



dev.off() 
