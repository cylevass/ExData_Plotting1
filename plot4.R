# Importation of the data
mydata <- read.csv(file = "./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
temps <- strptime(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")
mydata$Date <- temps

# Selection of the 2 days
mysub <- subset(x = mydata, as.Date(Date) == "2007-02-01" | as.Date(Date) == "2007-02-02")

#Conversion in numerics to avoid problems
mysub$Global_active_power <- as.numeric(mysub$Global_active_power)
mysub$Sub_metering_1 <- as.numeric(mysub$Sub_metering_1)
mysub$Sub_metering_2 <- as.numeric(mysub$Sub_metering_2)
mysub$Sub_metering_3 <- as.numeric(mysub$Sub_metering_3)
mysub$Voltage <- as.numeric(mysub$Voltage)
mysub$Global_reactive_power <- as.numeric(mysub$Global_reactive_power)

# Preparing the 4 plots frame
par(mfcol=c(2,2),mar=c(4,4,2,1))

# Plot 1
plot(x = mysub$Date, y = mysub$Global_active_power, main = "", xlab ="", ylab = "Global Active Power", type = "n")
lines(x = mysub$Date, y = mysub$Global_active_power)

# Plot 2
plot(x = mysub$Date, y = mysub$Sub_metering_1, main = "", xlab ="", ylab = "Energy sub metering", type = "n")
lines(x = mysub$Date, y = mysub$Sub_metering_1, col ="black")
lines(x = mysub$Date, y = mysub$Sub_metering_2, col ="red")
lines(x = mysub$Date, y = mysub$Sub_metering_3, col ="blue")
legend("topright", lwd = c(1,1,1), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", inset = 0)

# Plot 3
plot(x = mysub$Date, y = mysub$Voltage, main = "", xlab ="datetime", ylab = "Voltage", type = "n")
lines(x = mysub$Date, y = mysub$Voltage)

# Plot 4
plot(x = mysub$Date, y = mysub$Global_reactive_power, main = "", xlab ="datetime", ylab = "Global_reactive_power", type = "n")
lines(x = mysub$Date, y = mysub$Global_reactive_power)

# Export of the plot
dev.copy(device = png, file = "plot4.png", width=480, height=480,units="px")
dev.off()
