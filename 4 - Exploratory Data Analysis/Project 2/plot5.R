require(dplyr)
require(ggplot2)

if (!exists('NEI'))
  NEI <- readRDS("summarySCC_PM25.rds")
if (!exists('SCC'))
  SCC <- readRDS("Source_Classification_Code.rds")


SCC.motor <- SCC[grep("motor", SCC$Short.Name, ignore.case = TRUE), ]
SCC.identifiers <- as.character(SCC.motor$SCC)

baltimore <- filter(NEI, fips == '24510')
baltimore$SCC <- as.character(baltimore$SCC)
#Sorry for the variable names, couldn't resist :)
baltimotor <- filter(baltimore, SCC %in% SCC.identifiers)


motorByYear <- summarise(group_by(baltimotor, year), emissions = sum(Emissions))

png('plot5.png')
p <- ggplot(data = motorByYear, aes(x=year, y=emissions)) +
  geom_line() + xlab('Year') +
  ylab('Emissions (tons)') + 
  ggtitle('Motor Emissions (Baltimore City)')
print(p)
dev.off()