data <- read.table(unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt"),
                   sep = ";",header = TRUE)
data <- subset(data, Date %in% c("1/2/2007" , "2/2/2007"))
data$DateTime <- strptime(paste(data$Date,data$Time),format = "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
png(filename = "plot2.png",height = 480, width = 480)
with(data, plot(DateTime,Global_active_power,
                type = "l",
                xlab = "",
                ylab = "Global Active Power (kilowatts)",
                lwd = 2))
dev.off()