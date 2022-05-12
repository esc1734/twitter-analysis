library(ggplot2)

# Reads csv file containing sampled tweets.
data <- read.csv("~/desktop/code/twitter/sampled_sentiment.csv")

# Calculates the 0.999 and 0.9999 quantiles.
quants <- quantile(data$favorite_count, c(0.999, 0.9999))

# Splits data into 0-0.9, 0.9-0.99, and 0.99-1 quantiles.
data$colors  <- with(data, factor(ifelse(favorite_count < quants[1], 0, 
                                         ifelse(favorite_count < quants[2], 1, 2))))

ggplot(data, aes(trust, favorite_count)) + 
  geom_point(aes(colour = colors)) +
  scale_colour_manual(values = c("black", "blue", "red"), 
                      labels = c("tweets with favorite count below top 0.1% of sampled tweets", "tweets with favorite count in the top 0.1% of sampled tweets", "tweets with favorite count in the top 0.01%  of sampled tweets")) + 
  theme_bw() + 
  ggtitle("Plot of trust score vs favorite count for sampled data.") + 
  xlab("trust score") + 
  ylab("favorite count")

