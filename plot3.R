# Importation of the data
mydata <- read.csv(file = "./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
temps <- strptime(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")
mydata$Date <- temps

# Selection of the 2 days
mysub <- subset(x = mydata, as.Date(Date) == "2007-02-01" | as.Date(Date) == "2007-02-02")

#Conversion in numerics to avoid problems
mysub$Sub_metering_1 <- as.numeric(mysub$Sub_metering_1)
mysub$Sub_metering_2 <- as.numeric(mysub$Sub_metering_2)
mysub$Sub_metering_3 <- as.numeric(mysub$Sub_metering_3)

# Plot
plot(x = mysub$Date, y = mysub$Sub_metering_1, main = "", xlab ="", ylab = "Energy sub metering", type = "n")
lines(x = mysub$Date, y = mysub$Sub_metering_1, col ="black")
lines(x = mysub$Date, y = mysub$Sub_metering_2, col ="red")
lines(x = mysub$Date, y = mysub$Sub_metering_3, col ="blue")
legend("topright", lwd = c(1,1,1), col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))



# Export of the plot
dev.copy(device = png, file = "plot3.png")
dev.off()
