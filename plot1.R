
# Read the csv file
hpc <- read.csv("household_power_consumption.txt", sep = ";")


# Assign NA to ?
hpc[hpc == '?'] <- NA

# Change format of dates and filter
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc <- hpc[hpc$Date >= as.Date("2007-02-01") & hpc$Date <= as.Date("2007-02-02"),]

#Convert to numeric and Plot Global Active Power

hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(hpc$Global_active_power, main = "Global Active Power",
     col = "red", xlab = "Global Active Power (kilowatts)")
dev.off()