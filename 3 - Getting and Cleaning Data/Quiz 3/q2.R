if (!file.exists('data/jeff.jpg'))
  download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg',
                , destfile='data/jeff.jpg', method = 'curl')
library('jpeg')

jeff <- readJPEG('data/jeff.jpg', native=TRUE)
cat(quantile(jeff, probs=seq(0,1,.1))[c(4,9)])