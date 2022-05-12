library(dplyr)
# Reads csv file containing sampled tweets.
data <- read.csv("~/desktop/code/twitter/sampled_sentiment.csv")

sorted <- data %>% 
  arrange(desc(negative)) %>% 
  slice(1:20)
print(sorted)
# Saves tweets with top 20 negative scores as csv file.
write.csv(sorted,"~/desktop/code/twitter/top_negativescore.csv", row.names = FALSE)