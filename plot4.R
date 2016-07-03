power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
power_test <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]

datentime <- strptime(paste(power_test$Date, power_test$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_ap <- as.numeric(power_test$Global_active_power)
submet1 <- as.numeric(power_test$Sub_metering_1)
submet2 <- as.numeric(power_test$Sub_metering_2)
submet3 <- power_test$Sub_metering_3
Global_rxn <- as.numeric(power_test$Global_reactive_power)
volts <- as.numeric(power_test$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(datentime, Global_ap, type="l", xlab="", ylab="Global Active Power")

plot(datentime, volts, xlab="datetime", ylab="Voltage", type="l")

plot(datentime, submet1, xlab="", ylab="Energy Submetering", type="l")
lines(datentime, submet2, col="red" )
lines(datentime, submet3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=2.5, bty="n")

plot(datentime, Global_rxn, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()