power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
power_test <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]

datentime <- strptime(paste(power_test$Date, power_test$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_ap <- as.numeric(power_test$Global_active_power)
submet1 <- as.numeric(power_test$Sub_metering_1)
submet2 <- as.numeric(power_test$Sub_metering_2)
submet3 <- power_test$Sub_metering_3

png("plot3.png", width=480, height=480)
plot(datentime, submet1, xlab="", ylab="Energy Submetering", type="l")
lines(datentime, submet2, col="red" )
lines(datentime, submet3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()