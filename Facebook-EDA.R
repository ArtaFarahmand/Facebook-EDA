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
