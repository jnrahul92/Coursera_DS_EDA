
NEI <- readRDS(unzip("exdata_data_NEI_data.zip","summarySCC_PM25.rds"))
SCC <- readRDS(unzip("exdata_data_NEI_data.zip","Source_Classification_Code.rds"))

motor_related <- grepl("vehicle",SCC$SCC.Level.Two,ignore.case = TRUE)
mv_scc <- SCC[motor_related,"SCC"]
mv_nei <- subset(NEI,SCC %in% mv_scc)

mv_nei_balt <- subset(mv_nei,fips=="24510")
mv_nei_balt_sum <- tapply(mv_nei_balt$Emissions, mv_nei_balt$year, sum, na.rm=TRUE)

png(filename = "plot5.png",height = 480, width = 480)
barplot(mv_nei_balt_sum,xlab = "Year",ylab = "Total PM2.5 Emission",
        main = "Motor Vehicle Related Emission over the Years in Baltimore",col = "#FE1211")
dev.off()