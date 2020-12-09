# Load Packages
library(tidyverse)
library(openintro)

# View data 
View(speed_gender_height)

plot_data <- speed_gender_height %>% 
  na.omit()

ggplot(plot_data,
       aes(height))+
  geom_histogram()

ggplot(plot_data,
       aes(height))+
  geom_freqpoly()

ggplot(plot_data,
       aes(height))+
  geom_density()

# Assignment, repeat for speed