library(dplyr)
# Reads csv file containing sampled tweets.
data <- read.csv("~/desktop/code/twitter/sampled_sentiment.csv")

sorted <- data %>% 
  arrange(desc(scorerow)) %>% 
  slice(1:20, 28000:28005)
print(sorted)
# Saves tweets with top 20 total sentiment scores as csv file.
write.csv(sorted,"~/desktop/code/twitter/top_totalsentiment.csv", row.names = FALSE)