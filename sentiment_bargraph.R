library(ggplot2)

# Reads csv file containing sampled tweets.
data <- read.csv("~/desktop/code/twitter/sampled_sentiment.csv")

# Create data
plotdata <- data.frame(
  sentiment=c("Anger","Anticipation","Disgust","Fear","Joy", "Sadness", "Surprise", "Trust", "Negative", 
         "Positive") ,  
  value=c(sum(data$anger), sum(data$anticipation), sum(data$disgust), sum(data$fear), sum(data$joy), sum(data$sadness), sum(data$surprise), sum(data$trust), sum(data$negative), sum(data$positive)
))

# Make bar graph
ggplot(plotdata, aes(x=sentiment, y=value, fill=sentiment)) + 
  geom_bar(stat = "identity", width=0.2) +
  ylab("Total number of words with indicated sentiment") +
  ggtitle("Total number of words with each sentiment in sampled tweets.") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  geom_bar(stat = "identity") 

# Compute ratio between positive and negative tweets
sum(data$positive)/sum(data$negative)