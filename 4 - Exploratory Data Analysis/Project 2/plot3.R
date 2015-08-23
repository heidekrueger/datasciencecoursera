if (!exists('NEI'))
  NEI <- readRDS("summarySCC_PM25.rds")
if (!exists('SCC'))
  SCC <- readRDS("Source_Classification_Code.rds")

require(dplyr)
require(ggplot2)
baltimore <- filter(NEI, fips == '24510')
baltByTypeAndYear <- summarise(group_by(baltimore, year, type), emissions = sum(Emissions))
png('plot3.png')
p <- qplot(year, emissions,
      data = baltByTypeAndYear,
      color = type,
      geom = c("line"),
      ylim = c(0,2500),
      main = 'PM2.5 emissions in Baltimore by type')
p <- p + ylab('PM2.5 Emissions (t)')
print(p)
dev.off()