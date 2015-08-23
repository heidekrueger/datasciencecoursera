if (!exists('NEI'))
  NEI <- readRDS("summarySCC_PM25.rds")
if (!exists('SCC'))
  SCC <- readRDS("Source_Classification_Code.rds")

require(dplyr)
baltimore <- filter(NEI, fips == '24510')
baltimoreByYear <- summarise(group_by(baltimore, year), sum(Emissions))
png('plot2.png')
barplot(baltimoreByYear$sum/1e3,
        names.arg = emissionsByYear$year,
        xlab = 'Year',
        ylab = 'PM2.5 Emissions (thousands of tons)',
        main = 'PM2.5 Emissions in Baltimore City')
dev.off()