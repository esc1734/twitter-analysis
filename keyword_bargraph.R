# Reads csv file containing sampled tweets.
data <- read.csv("~/desktop/code/twitter/sampled_sentiment.csv")

# Generate plot showing number of tweets with each keyword.
ggplot(data.frame(data$category), aes(x=data$category, fill=data$category)) +
  geom_bar()+
  xlab("Keyword")+
  ylab("Total number of sampled tweets.") +
  ggtitle("Keyword distribution in sampled tweets.") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1))