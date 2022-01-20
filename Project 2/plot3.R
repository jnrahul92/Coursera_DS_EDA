library(ggplot2)

NEI <- readRDS(unzip("exdata_data_NEI_data.zip","summarySCC_PM25.rds"))
SCC <- readRDS(unzip("exdata_data_NEI_data.zip","Source_Classification_Code.rds"))

pm_balt <- subset(NEI,fips=="24510")

png(filename = "plot3.png",height = 480, width = 480)
g<- ggplot(data = pm_balt,aes(factor(year),Emissions,fill = type))
g + geom_bar(stat = 'identity') + theme_light() + guides(fill=F)+ facet_grid(.~type,scales = "free",space = "free") + 
    labs(x = "Year",y = "Total PM2.5 Emission",
         title = "Total PM2.5 Emission across the Years in Baltimore by Source Type")
dev.off()