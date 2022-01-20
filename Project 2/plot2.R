NEI <- readRDS(unzip("exdata_data_NEI_data.zip","summarySCC_PM25.rds"))
SCC <- readRDS(unzip("exdata_data_NEI_data.zip","Source_Classification_Code.rds"))

pm_balt <- subset(NEI,fips=="24510")
pm_balt_sum <- tapply(pm_balt$Emissions,pm_balt$year,sum,na.rm = T)

png(filename = "plot2.png",height = 480, width = 480)
rng <- range(pm_balt_sum)
barplot(height = pm_balt_sum,xlab = "Year",ylab = "Total PM2.5 Emission",main = "Emission over the Years in Baltimore",
        ylim = c(0,rng[2]+250))
dev.off()