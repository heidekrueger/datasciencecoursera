corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  source('complete.R')
  nums <- complete(directory)
  ids <- nums$id[nums$nobs >= threshold]
  
  
  file_list <- list.files(directory, full.names = TRUE)
  cors <- numeric(length(ids))
  if (length(ids)== 0) {return (cors)}
  for (i in 1:length(ids)){
    df <- read.csv(file_list[ids[i]])
    good <- !is.na(df$sulf) & !is.na(df$nit)
    cors[i] <- cor(df$sulf[good], df$nit[good])   
  }
  cors
}