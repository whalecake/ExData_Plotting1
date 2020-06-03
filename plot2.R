### Load dataset
### Convert column to date class; then, reformat & subset to dates 2007-02-01 and 2007-02-02
power <- read.table(file="./data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
power$Date <- strptime(as.Date(power$Date, format = "%d/%m/%Y"), format = "%Y-%m-%d")
power <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")
### Convert global active power variable to numeric
power$Global_active_power<- as.numeric(as.character(power$Global_active_power))

### Concatenate date & time columns
power$Date_and_time = paste(power$Date, power$Time)
power$Date_and_time <- strptime(power$Date_and_time, '%Y-%m-%d %H:%M:%S')

## Construct Plot 2
plot(power$Date_and_time,power$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# save as png
dev.copy(png, 'plot2.png', width = 480, height = 480)
dev.off()
