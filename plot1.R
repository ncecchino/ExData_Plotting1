power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
power_test <- power[power$Date %in% c("1/2/2007", "2/2/2007"),]

Global_ap <- as.numeric(power_test$Global_active_power)
png("plot1.png", width=480, height=480)
hist(Global_ap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
