library(ggplot2)

# Reads csv file containing sampled tweets.
data <- read.csv("~/desktop/code/twitter/sampled_sentiment.csv")

# Generates plot of total sentiment vs favorite count.
# ggplot(data, aes(x=trust, y=favorite_count)) + geom_point() + ggtitle("Plot of trust score vs favorite count for sampled data (30,000 tweets).") + xlab("total sentiment score") + ylab("favorite count")

# Calculates the 0.999 and 0.9999 quantiles.
quants <- quantile(data$favorite_count, c(0.999, 0.9999))

# Splits data into 0-0.9, 0.9-0.99, and 0.99-1 quantiles.
data$colors  <- with(data, factor(ifelse(favorite_count < quants[1], 0, 
                                         ifelse(favorite_count < quants[2], 1, 2))))
ggplot(data, aes(x=positive)) + 
  geom_histogram(binwidth=1)+ 
  geom_vline(aes(xintercept=mean(positive)),
  color="blue", size=1) +
  theme_bw() + 
  ggtitle("Frequency distribution of trust scores for sampled data (mean = 0.7258187).") + 
  xlab("trust score") + 
  ylab("frequency")

# Computes the mean and standard deviation in trust scores
mean(data$trust)
sd(data$trust)

# Computes standard deviation and upper and lower bounds for 50% confidence interval of trust score for tweets with retweet count > 0
sd(data[data$retweet_count > 0,]$trust)
quantile(data[data$retweet_count > 0,]$trust, c(0.25, 0.75))

# Computes standard deviation and upper and lower bounds for 50% confidence interval of trust score for tweets with retweet count = 0
sd(data[data$retweet_count == 0,]$trust)
quantile(data[data$retweet_count == 0,]$trust, c(0.25, 0.75))
