# Importation of the data
mydata <- read.csv(file = "./household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
temps <- strptime(paste(mydata$Date, mydata$Time), format="%d/%m/%Y %H:%M:%S")
mydata$Date <- temps

# Selection of the 2 days
mysub <- subset(x = mydata, as.Date(Date) == "2007-02-01" | as.Date(Date) == "2007-02-02")

#Conversion in numerics to avoid problems
mysub$Global_active_power <- as.numeric(mysub$Global_active_power)

# Plot
plot(x = mysub$Date, y = mysub$Global_active_power, main = "", xlab ="", ylab = "Global Active Power (kilowatts)", type = "n")
lines(x = mysub$Date, y = mysub$Global_active_power)


# Export of the plot
dev.copy(device = png, file = "plot2.png")
dev.off()
