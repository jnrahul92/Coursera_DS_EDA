data <- read.table(unz("exdata_data_household_power_consumption.zip","household_power_consumption.txt"),
                   sep = ";",header = TRUE)
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data <- subset(data, Date=="2007-02-01" | Date == "2007-02-02")
data$Global_active_power <- as.numeric(data$Global_active_power)
png(filename = "plot1.png",height = 480, width = 480)
hist(data$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()