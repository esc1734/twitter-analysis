library(ggplot2)

# Reads csv file containing sampled tweets.
data <- read.csv("~/desktop/code/twitter/sampled_sentiment.csv")

ggplot(data, aes(x=negative)) + 
  geom_histogram(binwidth=1)+ 
  geom_vline(aes(xintercept=mean(negative)),
             color="blue", size=1) +
  theme_bw() + 
  ggtitle("Frequency distribution of negative scores for sampled data (mean = 0.6395381).") + 
  xlab("negative score") + 
  ylab("frequency")

mean(data$negative)
