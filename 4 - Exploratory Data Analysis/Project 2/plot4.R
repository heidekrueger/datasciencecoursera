require(dplyr)
require(ggplot2)

if (!exists('NEI'))
  NEI <- readRDS("summarySCC_PM25.rds")
if (!exists('SCC'))
  SCC <- readRDS("Source_Classification_Code.rds")

SCC.coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE) &
                  grepl("comb", SCC$Short.Name, ignore.case = TRUE), ]
SCC.identifiers <- as.character(SCC.coal$SCC)

NEI$SCC <- as.character(NEI$SCC)
NEI.coal <- NEI[NEI$SCC %in% SCC.identifiers, ]

coalByYear <- summarise(group_by(NEI.coal, year), emissions = sum(Emissions))

png('plot4.png')
p <- ggplot(data = coalByYear, aes(x=year, y=emissions/1000)) +
  geom_line() + xlab('Year') +
  ylab('Emissions (kilotons)') + ylim(0, 600) +
  ggtitle('Coal Combustion Emissions (U.S.)')
print(p)
dev.off()