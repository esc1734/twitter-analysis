library(dplyr)
# Reads csv file containing sampled tweets.
data <- read.csv("~/desktop/code/twitter/sampled_sentiment.csv")

sorted <- data %>% 
  arrange(desc(favorite_count)) %>% 
  slice(1:20)
print(sorted)
# Saves tweets with top 20 favorite counts as csv file.
write.csv(sorted,"~/desktop/code/twitter/top_favoritecounts.csv", row.names = FALSE)