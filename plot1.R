### Load dataset
### Convert column to date class; then, reformat & subset to dates 2007-02-01 and 2007-02-02
power <- read.table(file="./data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
power$Date <- strptime(as.Date(power$Date, format = "%d/%m/%Y"), format = "%Y-%m-%d")
power <- subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

## Construct Plot 1

power$Global_active_power<- as.numeric(as.character(power$Global_active_power))
hist(power$Global_active_power,
     col = "red",
     breaks = 12,
     ylim = c(0, 1200),
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")

# save as png
dev.copy(png, 'plot1.png', width = 480, height = 480)
dev.off()
