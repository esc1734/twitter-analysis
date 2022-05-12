# Reads csv file containing sampled tweets.
data <- read.csv("~/desktop/code/twitter/sampled_sentiment.csv")

# Generates plot.
ggplot(data, aes(x=scorerow)) + 
  geom_histogram(binwidth=1)+ 
  geom_vline(aes(xintercept=mean(scorerow)),
             color="blue", size=1) +
  theme_bw() + 
  ggtitle("Frequency distribution of total sentiment scores for sampled data (mean = 5.394898).") + 
  xlab("total sentiment score") + 
  ylab("frequency")

# Computes mean of total sentiment scores.
mean(data$scorerow)
sd(data$scorerow)

# Computes standard deviation and upper and lower bounds for 50% confidence interval of trust score for tweets with retweet count > 0
sd(data[data$retweet_count > 0,]$scorerow)
quantile(data[data$retweet_count > 0,]$scorerow, c(0.25, 0.75))

# Computes standard deviation and upper and lower bounds for 50% confidence interval of trust score for tweets with retweet count = 0
sd(data[data$retweet_count == 0,]$scorerow)
quantile(data[data$retweet_count == 0,]$scorerow, c(0.25, 0.75))