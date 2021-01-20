# Install package

install.packages('ggplot2')
library('ggplot2')

install.packages('ggthemes', dependencies = TRUE)
library(ggthemes)

# Identify the file path for the dataset

getwd()

# List existing dataset files

list.files()

# Load facebook data into R

fb = read.csv('dataset/pseudo_facebook.tsv', sep='\t')

# Initial data exploration

names(fb)
head(fb)
dim(fb)
summary(fb)

# Draw histogram based on date of brith

ggplot(aes(x = dob_day), data = fb) +
  geom_histogram(bandwidth = 1) + 
  scale_x_continuous(breaks = 1:31)

# Faceting dob_month

ggplot(data = fb, aes(x = dob_day)) +
  geom_histogram(bandwith = 1) +
  scale_x_continuous(breaks = 1:31) +
  facet_wrap(~dob_month)

# Faceting gender

ggplot(data = fb, aes(x = dob_day)) +
  geom_histogram(bandwith = 1) +
  scale_x_continuous(breaks = 1:31) +
  facet_wrap(~gender)

# Faceting dob_month and gender

ggplot(data = fb, aes(x = dob_day)) +
  geom_histogram(bandwith = 1) +
  scale_x_continuous(breaks = 1:31) +
  facet_wrap(dob_month~gender)

# Facebook friend count 

ggplot(aes(x = friend_count), data = fb) + 
  geom_histogram() + 
  scale_x_continuous(limits = c(0,1000))

# Adjusting the bin width

ggplot(aes(x = friend_count), data = fb) +
  geom_histogram(binwidth = 100) +
  scale_x_continuous(limits = c(0,1000), breaks = seq(0, 1000, 50)) +
  facet_wrap(~gender)

# Adjusting the the bin width and removing NA

ggplot(aes(x = friend_count), data = subset(fb, !is.na(gender))) +
  geom_histogram(binwidth = 100) +
  scale_x_continuous(limits = c(0,1000), breaks = seq(0, 1000, 50)) +
  facet_wrap(~gender)

# Statistics by gender

table(fb$gender)
by(fb$friend_count, fb$gender, summary)

# Tenure

ggplot(aes(x = tenure), data = fb) +
  geom_histogram(binwidth = 30, color = 'black', fill = '#099DD9')

# Tenure by year

ggplot(aes(x = tenure / 365), data = fb) + 
  geom_histogram(binwidth = 0.25, color = 'black', fill = '#F79420') +
  xlab('Number of Years Using Facebook') +
  ylab('Number of Users in Sample')

# Number of likes on the web solution

by(fb$www_likes, fb$gender, sum)
