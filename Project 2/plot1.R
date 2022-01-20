NEI <- readRDS(unzip("exdata_data_NEI_data.zip","summarySCC_PM25.rds"))
SCC <- readRDS(unzip("exdata_data_NEI_data.zip","Source_Classification_Code.rds"))

pm_us <- tapply(NEI$Emissions,NEI$year,sum,na.rm = T)

png(filename = "plot1.png",height = 480, width = 480)
barplot(height = pm_us,xlab = "Year",ylab = "Total PM2.5 Emission",main = "Emission over the Years")
dev.off()