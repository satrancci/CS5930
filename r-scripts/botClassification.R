# I used the tweetbotornot() package for bot classification: https://tweetbotornot.mikewk.com/index.html

# Before loading those packages make sure that they have been installed. If not, install them using  install.packages() command.

library(tweetbotornot)
library(tidyverse)
library(rtweet) # https://rtweet.info/ 

# Then, authorize rtweet's app using your developer tokens provided by Twitter.


token <- create_token(
  app = "", # app's name
  consumer_key = "",
  consumer_secret = "",
  access_token = "",
  access_secret = "")

# See if token was created successfully

get_token()

# Set your working directory

setwd("")

## Script 1 - iterating over rows in a column that contains Twitter usernames that we want to classify

data <- read_csv("data.csv", col_names = F)
head(data) # check whether data was loaded correctly
dim(data) # check dimensionality of the dataset


output <- 'output.txt' # create a txt file that we will be writing to

for (i in 1:length(data[[1]])) {
  
  result <- try(tweetbotornot(data[[i,1]]), silent = F)
  
  if (startsWith(result[[1]],"Error") || startsWith(result[[1]],"34 - Sorry")) {  # exceptions could have been handled better, of course.
    next
  }
  
  name <- try(result[[1]], silent = F)
  prob <- try(round(result[[3]],4), silent = F)
  cat(paste(name,",",prob,'\n'),
      file = output, 
      append = T)
  Sys.sleep(30) # can be anything else (in seconds). just making sure that we will not run into Twitter API's limit.
}


## Script 2 - reading from a character vector of Twitter usernames that we want to classify


names <- # paste your vector here of form c("a", "b", "c")


output <- 'output.txt'

for (i in 1:length(names)) { 
  
  result <- try(tweetbotornot(names[i]), silent = F)
  
  if (startsWith(result[[1]],"Error")) {
    next
  }
  
  name <- try(result[[1]], silent = F)
  prob <- try(round(result[[3]],4), silent = F)
  cat(paste(name,",",prob,'\n'),
      file = output, 
      append = T)
  Sys.sleep(30)
}

