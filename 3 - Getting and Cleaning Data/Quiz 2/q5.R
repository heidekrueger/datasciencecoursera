path <- 'http://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for'
df <- read.fwf(file = url(path), skip =4 ,width = c(12, 7,4, 9,4, 9,4, 9,4))
sum(df[4])