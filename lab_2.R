# Load packages
library(tidyverse)

# Variables, Types and Arithmetic 
x <- 12

typeof(x)
typeof("x")

x+5
x/24
"x"+5

x_2 <- c(12, 10, 8, 6, 4, 2)

typeof(x_2)

x_2+5
x_2/24

y <- x_2+5

# Data Frames
name <- c("Jim", "Peggy", "Kyla", "Nick", "Alex", "Tori", "Belinda", "Nathan", "Kelsey", "Tommy")

relationship <- c("dad", "mom", "sister", "me", "brother", "sister", "wife", "son", "sister-in-law", "brother-in-law")

age <- c(58, 58, 36, 33, 31, 29, 34, 2, 32, 29)

family <- data.frame(name, age, relationship)

head(family)

# Wrangling Data
example_data <- openintro::gov_poll

head(example_data)

unique(example_data$poll)
unique(example_data$eval)

# Filter Obama
obama <- example_data %>% 
  filter(eval == "Obama")

# Count Number and Percent of approval
obama %>% 
  group_by(poll) %>% 
  summarize(count = n()) %>% 
  mutate(total = sum(count), 
         percent = count/total)

# Assignment: Duplicate for Dem and Rep
