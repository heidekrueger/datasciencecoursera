require(dplyr)
require(ggplot2)

if (!exists('NEI'))
  NEI <- readRDS("summarySCC_PM25.rds")
if (!exists('SCC'))
  SCC <- readRDS("Source_Classification_Code.rds")


SCC.motor <- SCC[grep("motor", SCC$Short.Name, ignore.case = TRUE), ]
SCC.identifiers <- as.character(SCC.motor$SCC)

#Sorry for the variable names, couldn't resist :)
baLAtimore <- filter(NEI, fips %in% c('24510', '06037'))
baLAtimore$SCC <- as.character(baLAtimore$SCC)
baLAtimotor <- filter(baLAtimore, SCC %in% SCC.identifiers)


motorByYear <- summarise(group_by(baLAtimotor, year, fips), emissions = sum(Emissions))
motorByYear$city <- as.factor(motorByYear$fips)
levels(motorByYear$city) <- c("LA county", "Baltimore city")

png('plot6.png')
p <- qplot(data = motorByYear, x=year, y=emissions, color = city, geom = 'line', main = 'Motor Emissions in Baltimore and LA')
print(p)
dev.off()