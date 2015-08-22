#download the data, if it doesn't exist locally
if (!file.exists('data/ss06hid.csv'))
  download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv ',
              , destfile='data/ss06hid.csv', method = 'curl')

data <- read.csv('data/ss06hid.csv')
agricultureLogical <- data$ACR==3 & data$AGS == 6
which(agricultureLogical)