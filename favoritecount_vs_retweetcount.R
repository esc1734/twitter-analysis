library(ggplot2)

# Reads csv file containing sampled tweets.
data <- read.csv("~/desktop/code/twitter/sampled_sentiment.csv")

# Generates plot of total sentiment vs retweet count.
# ggplot(data, aes(x=favorite_count, y=retweet_count)) + geom_point() + ggtitle("Plot of favorite_count score vs retweet count for sampled data (30,000 tweets).") + xlab("total sentiment score") + ylab("retweet count")

# Calculates the 0.999 and 0.9999 quantiles.
quants <- quantile(data$retweet_count, c(0.999, 0.9999))

# Splits data into 0-0.9, 0.9-0.99, and 0.99-1 quantiles.
data$colors  <- with(data, factor(ifelse(retweet_count < quants[1], 0, 
                                         ifelse(retweet_count < quants[2], 1, 2))))

ggplot(data, aes(favorite_count, retweet_count)) + 
  geom_point(aes(colour = colors)) +
  scale_colour_manual(values = c("black", "blue", "red"), 
                      labels = c("tweets with retweet count below top 0.1% of sampled tweets", "tweets with retweet count in the top 0.1% of sampled tweets", "tweets with retweet count in the top 0.01%  of sampled tweets")) + 
  theme_bw() + 
  ggtitle("Plot of favorite count vs retweet count for sampled data.") + 
  xlab("favorite count") + 
  ylab("retweet count")
