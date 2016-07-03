power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
power_test <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]

datentime <- strptime(paste(power_test$Date, power_test$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Global_ap <- as.numeric(power_test$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datentime, Global_ap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()