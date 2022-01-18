data <- read.table(unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt"),
                   sep = ";",header = TRUE)
data <- subset(data, Date %in% c("1/2/2007" , "2/2/2007"))
data$DateTime <- strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
png(filename = "plot4.png",height = 480, width = 480)
par(mfrow=c(2,2))
with(data, plot(DateTime,Global_active_power,
                type = "l",
                xlab = "",
                ylab = "Global Active Power"))
with(data,plot(DateTime,Voltage,type = "l",xlab="datetime",ylab="Voltage"))
plot(data$DateTime,data$Sub_metering_1,type = "l",xlab = "",ylab = "Energy Sub Metering")
lines(data$DateTime,data$Sub_metering_2,col = "red")
lines(data$DateTime,data$Sub_metering_3,col = "blue")
legend("topright",lty=1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2"
                                                                 ,"Sub_metering_3"),bty = "n")
with(data,plot(DateTime,Global_reactive_power,type = "l",xlab="datetime",ylab="Global_reactive_power"))
dev.off()