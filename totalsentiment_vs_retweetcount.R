library(ggplot2)

# Reads csv file containing sampled tweets.
data <- read.csv("~/desktop/code/twitter/sampled_sentiment.csv")

# Calculates the 0.999 and 0.9999 quantiles.
quants <- quantile(data$retweet_count, c(0.999, 0.9999))

# Splits data into 0-0.9, 0.9-0.99, and 0.99-1 quantiles.
data$colors  <- with(data, factor(ifelse(retweet_count < quants[1], 0, 
                                      ifelse(retweet_count < quants[2], 1, 2))))

ggplot(data, aes(scorerow, retweet_count)) + 
  geom_point(aes(colour = colors)) +
  scale_colour_manual(values = c("black", "blue", "red"), 
  labels = c("tweets with retweet count below top 0.1% of sampled tweets", "tweets with retweet count in the top 0.1% of sampled tweets", "tweets with retweet count in the top 0.01%  of sampled tweets")) + 
  theme_bw() + 
  ggtitle("Plot of total sentiment score vs retweet count for sampled data.") + 
  xlab("total sentiment score") + 
  ylab("retweet count")

# Estimates the proportion of tweets with 0 retweets.
ecdf_data <- ecdf(data$retweet_count);
quant <- ecdf_data(0);
print(quant)

# Computes average sentiment score for tweets with positive retweet count.
score <- 0;
denom <- 0;
for(i in 1:length(data$retweet_count)){
  if(data$retweet_count[i] > 0)
  {
    score <- score + data$scorerow[i];
    denom <- denom + 1;
  }
}
print(score/denom)

# Computes average sentiment score for tweets with retweet count of 0.
score <- 0;
denom <- 0;
for(i in 1:length(data$retweet_count)){
  if(data$retweet_count[i] <= 0)
  {
    score <- score + data$scorerow[i];
    denom <- denom + 1;
  }
}
print(score/denom)

# Computes average sentiment score for tweets with retweet count in top 0.1%.
score <- 0;
denom <- 0;
for(i in 1:length(data$retweet_count)){
  if(data$retweet_count[i] > quants[1])
  {
    score <- score + data$scorerow[i];
    denom <- denom + 1;
  }
}
print(score/denom)
