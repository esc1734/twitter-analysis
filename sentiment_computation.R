set.seed(111)
library(ggplot2)
library(dplyr)
library(igraph)
library(tm)
library(qdap)
library(qdapRegex)
library(magrittr)
library(topicmodels)
library(syuzhet)

# Reads csv file containing one day's tweets.
day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-02-03.csv")
# samples 1000 tweets without replacement from loaded csv file.
sampled_data <- sample_n(day_data, 10, replace = FALSE)

# Reads and randomly samples 1000 tweets without replacement from each randomly selected day, appends sampled tweets to "sampled_data" dataframe.
day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-02-16.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-03-09.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-03-14.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-05-01.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-05-30.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-06-04.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-06-07.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-06-29.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-07-17.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-08-20.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-08-25.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-08-29.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-09-02.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-09-14.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-09-22.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-10-11.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-10-23.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-10-29.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-11-02.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-11-08.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-11-14.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-11-24.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-12-09.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2019-12-28.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2020-01-08.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2020-01-19.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2020-02-05.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2020-02-19.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

day_data <- read.csv("~/desktop/code/twitter/twitter_data/all_data_2020-02-29.csv")
sampled_data <- rbind(sampled_data, sample_n(day_data, 1000, replace = FALSE))

# Copies text only into new matrix
text <- sampled_data$text

# Copies text only into new matrix
text <- sampled_data$text

# Remove urls.
text <- rm_twitter_url(text)

# Remove special characters, punctuation, and numbers.
text  <- gsub("[^A-Za-z]"," " , text)

# Perform sentiment analysis for tweets. The "get_nrc_sentiment" function implements Saif Mohammad’s NRC emotion lexicon, which is a list of words and their associations with two sentiments (negative and positive) and eight emotions (anger, fear, anticipation, trust, surprise, sadness, joy, and disgust). The function returns a data frame in which each row represents a sentence from the text. The columns represent each of the sentiments/emotions. The figures represent the scores for the respective sentences and sentiments/emotions.
sent.value <- get_nrc_sentiment(text)
print(sent.value)

# Calculate the sum of scores.
scorerow <- rowSums(sent.value[,])

# Creates new matrix with sentiment scores added to original text matrix.
text_scored <- cbind(sampled_data, sent.value, scorerow)

# Convert the scores to a data frame.
score_df <- data.frame(scorecol)

# Convert the row names into a "sentiment" column and combine it with the scores.
sent.scorecol <- cbind(sentiment = row.names(score_df), 
                       score_df, row.names = NULL)

# Saves sampled tweets with computed sentiment scores as csv file.
write.csv(text_scored,"~/desktop/code/twitter/sampled_sentiment.csv", row.names = FALSE)