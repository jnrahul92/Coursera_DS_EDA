
NEI <- readRDS(unzip("exdata_data_NEI_data.zip","summarySCC_PM25.rds"))
SCC <- readRDS(unzip("exdata_data_NEI_data.zip","Source_Classification_Code.rds"))

combustion_related <- grepl("comb",SCC[,"SCC.Level.One"],ignore.case = TRUE)
coal_related <- grepl("coal",SCC[,"SCC.Level.Four"],ignore.case = TRUE)
coal_combust_scc <- SCC[combustion_related&coal_related,"SCC"]
coal_combust_NEI <- subset(NEI,SCC %in% coal_combust_scc)

coal_combust_NEI_sum <- tapply(coal_combust_NEI$Emissions,coal_combust_NEI$year,sum,na.rm=TRUE)

png(filename = "plot4.png",height = 480, width = 480)
barplot(coal_combust_NEI_sum,xlab = "Year",ylab = "Total PM2.5 Emission",
        main = "Coal Combustion related Emission over the Years",col = "#D03407")
dev.off()