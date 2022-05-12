library(ggplot2)

# Reads csv file containing sampled tweets.
data <- read.csv("~/desktop/code/twitter/sampled_sentiment.csv")

# Calculates the 0.999 and 0.9999 quantiles.
quants <- quantile(data$retweet_count, c(0.999, 0.9999))

# Splits data into 0-0.9, 0.9-0.99, and 0.99-1 quantiles.
data$colors  <- with(data, factor(ifelse(retweet_count < quants[1], 0, 
                                        ifelse(retweet_count < quants[2], 1, 2))))

ggplot(data, aes(trust, retweet_count)) + 
  geom_point(aes(colour = colors)) +
  scale_colour_manual(values = c("black", "blue", "red"), 
                      labels = c("tweets with retweet count below top 0.1% of sampled tweets", "tweets with retweet count in the top 0.1% of sampled tweets", "tweets with retweet count in the top 0.01%  of sampled tweets")) + 
  theme_bw() + 
  ggtitle("Plot of trust score vs retweet count for sampled data.") + 
  xlab("trust score") + 
  ylab("retweet count")

# Computes average trust score for tweets with retweet count in top 0.1%.
score <- 0;
denom <- 0;
for(i in 1:length(data$trust)){
  if(data$retweet_count[i] >= quants[1])
  {
    score <- score + data$trust[i];
    denom <- denom + 1;
  }
}
print(score/denom)

# Computes average trust score for tweets with positive retweet count.
score <- 0;
denom <- 0;
for(i in 1:length(data$trust)){
  if(data$retweet_count[i] > 0)
  {
    score <- score + data$trust[i];
    denom <- denom + 1;
  }
}
print(score/denom)

# Computes average trust score for tweets with retweet count of 0.
score <- 0;
denom <- 0;
for(i in 1:length(data$trust)){
  if(data$retweet_count[i] == 0)
  {
    score <- score + data$trust[i];
    denom <- denom + 1;
  }
}
print(score/denom)
