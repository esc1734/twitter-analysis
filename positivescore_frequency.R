library(ggplot2)

# Reads csv file containing sampled tweets.
data <- read.csv("~/desktop/code/twitter/sampled_sentiment.csv")

ggplot(data, aes(x=positive)) + 
  geom_histogram(binwidth=1)+ 
  geom_vline(aes(xintercept=mean(positive)),
             color="blue", size=1) +
  theme_bw() + 
  ggtitle("Frequency distribution of positive scores for sampled data (mean = 1.369011).") + 
  xlab("positive score") + 
  ylab("frequency")

mean(data$positive)
