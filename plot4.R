### Load dataset
### Convert column to date class; then, reformat & subset to dates 2007-02-01 and 2007-02-02
power <- read.table(file="./data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
power$Date <- strptime(as.Date(power$Date, format = "%d/%m/%Y"), format = "%Y-%m-%d")
power <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")
### Convert all variables to numeric
power$Global_active_power<- as.numeric(as.character(power$Global_active_power))
power$Sub_metering_1<- as.numeric(as.character(power$Sub_metering_1))
power$Sub_metering_2<- as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_3<- as.numeric(as.character(power$Sub_metering_3))
power$Voltage<- as.numeric(as.character(power$Voltage))
power$Global_reactive_power<- as.numeric(as.character(power$Global_reactive_power))

### Concatenate date & time columns
power$Date_and_time = paste(power$Date, power$Time)
power$Date_and_time <- strptime(power$Date_and_time, '%Y-%m-%d %H:%M:%S')

### Ready parameters - set to 2x2
par(mfrow = c(2, 2),
    mar = c(4, 4, 4, 4),
    cex = .6)

### Construct plots
plot(power$Date_and_time,power$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

plot(power$Date_and_time,power$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(power$Date_and_time, power$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "",
     ylab = "Energy sub metering")
lines(power$Date_and_time, power$Sub_metering_2, col = "red")
lines(power$Date_and_time, power$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1),
       cex = 0.8,
       box.lty = 0)

plot(power$Date_and_time,power$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

# save as png
dev.copy(png, 'plot4.png', width = 480, height = 480)
dev.off()
