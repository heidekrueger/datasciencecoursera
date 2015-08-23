if(!file.exists('data/gdp.csv'))
  download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv',
                destfile = 'data/gdp.csv',
                method= 'curl')
gdp <- read.csv('data/gdp.csv', skip = 5, nrows=228, header = FALSE)[,c(1,2,4,5)]
colnames(gdp) = c("code", 'rank', 'name', 'gdp')
gdp$gdp = as.numeric(gsub(',','',gdp$gdp))
if(!file.exists('data/edu.csv'))
  download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv',
                method = 'curl', destfile = 'data/edu.csv')
edu <- read.csv('data/edu.csv')[,c("CountryCode", "Income.Group")]

merged <- merge(gdp, edu, by.x='code', by.y='CountryCode')
library(dplyr)
merged <- arrange(merged, desc(rank))
#Q4
grouped <- group_by(merged, Income.Group)

summarize(grouped, gdp = mean(gdp, na.rm=TRUE))
#Q5
merged <- mutate(merged, rank.group = cut(merged$rank,5))
table(merged$Inc, merged$rank.g)
