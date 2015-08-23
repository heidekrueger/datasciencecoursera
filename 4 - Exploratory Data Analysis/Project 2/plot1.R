if (!exists('NEI'))
  NEI <- readRDS("summarySCC_PM25.rds")
if (!exists('SCC'))
  SCC <- readRDS("Source_Classification_Code.rds")

require(dplyr)
emissionsByYear <- summarise(group_by(NEI, year), sum(Emissions))
png('plot1.png')
barplot(emissionsByYear$sum/1e6,
        names.arg = emissionsByYear$year,
        xlab = 'Year',
        ylab = 'PM2.5 Emissions (million tons)',
        main = 'Trend in PM2.5 Emissions')
dev.off()
