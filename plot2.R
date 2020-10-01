
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
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

png(file = "plot2.png", width = 480, height = 480, units = "px")

plot(hpc$posix, hpc$Global_active_power,
          type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off() 
