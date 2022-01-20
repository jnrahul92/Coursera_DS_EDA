library(ggplot2)

NEI <- readRDS(unzip("exdata_data_NEI_data.zip","summarySCC_PM25.rds"))
SCC <- readRDS(unzip("exdata_data_NEI_data.zip","Source_Classification_Code.rds"))

data_df <- subset(NEI, fips == "06037" | fips == "24510")
data_df$city <- ifelse(data_df$fips=="06037","Los Angeles","Baltimore")

motor_related <- grepl("vehicle",SCC$SCC.Level.Two,ignore.case = TRUE)
mv_scc <- SCC[motor_related,"SCC"]
df_mv <- subset(data_df,SCC %in% mv_scc)

png(filename = "plot6.png",height = 480, width = 480)
g <- ggplot(data = df_mv, aes(factor(year),Emissions,fill=city))
g + geom_bar(stat = "identity") + theme_light() + guides(fill = F) + facet_grid(.~city) +
    labs(x = "Year",y = "Total PM2.5 Emission",
         title = "Total Motor Vehicle Related PM2.5 Emission across the Years")
dev.off()