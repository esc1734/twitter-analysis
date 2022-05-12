library(dplyr)
# Reads csv file containing sampled tweets.
data <- read.csv("~/desktop/code/twitter/sampled_sentiment.csv")

sorted <- data %>% 
  arrange(desc(retweet_count)) %>% 
  slice(1:20)

# Saves tweets with top 20 retweet counts as csv file.
write.csv(sorted,"~/desktop/code/twitter/top_retweetcounts.csv", row.names = FALSE)