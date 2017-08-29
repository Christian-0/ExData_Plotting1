# Coursera 'Exploratory Data Analysis
# Assignment Week 1: Plotting

# This script contains the code for Plot 2

# Load the file
raw_data <- read.table("../household_power_consumption/household_power_consumption.txt", sep = ";", skip = 1, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Formatting and subsetting the data
power_cons_data <- raw_data
power_cons_data$Date <- as.Date(power_cons_data$Date, "%d/%m/%Y")
power_cons_data <- subset(power_cons_data, Date>="2007-02-01" & Date<="2007-02-02")

power_cons_data$Time <- as.POSIXct(paste(power_cons_data$Date, power_cons_data$Time), format="%Y-%m-%d %H:%M:%S")
power_cons_data$Global_active_power <- as.numeric(as.character(power_cons_data$Global_active_power))
power_cons_data$Global_reactive_power <- as.numeric(as.character(power_cons_data$Global_reactive_power))
power_cons_data$Voltage <- as.numeric(as.character(power_cons_data$Voltage))
power_cons_data$Global_intensity <- as.numeric(as.character(power_cons_data$Global_intensity))
power_cons_data$Sub_metering_1 <- as.numeric(as.character(power_cons_data$Sub_metering_1))
power_cons_data$Sub_metering_2 <- as.numeric(as.character(power_cons_data$Sub_metering_2))
power_cons_data$Sub_metering_3 <- as.numeric(as.character(power_cons_data$Sub_metering_3))


#Create Plot 2

png("plot2.png", width = 480, height = 480, units = "px")

plot(power_cons_data$Time, power_cons_data$Global_active_power, type="n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(power_cons_data$Time, power_cons_data$Global_active_power)

dev.off()
