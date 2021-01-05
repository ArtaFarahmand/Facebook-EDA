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

