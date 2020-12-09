# Load Packages
library(tidyverse)
library(openintro)

# View data
View(speed_gender_height)

# Remove na values
plot_data <- speed_gender_height %>% 
  na.omit()

# Plot and calculate to confirm data is normal
ggplot(plot_data, 
       aes(speed))+
  geom_histogram()

plot_data %>% summarize(mean(speed))
plot_data %>% summarize(fivenum(speed)[3])

# Calculate probabilities

#P(x>100)
pnorm(100, 
      mean = mean(plot_data$speed),
      sd = sd(plot_data$speed), 
      lower.tail = FALSE)
# There is a 34.02% probability of randomly choosing 
# a person who has driven at speeds greater than
# 100 mph

#P(x<60)
pnorm(60, 
      mean = mean(plot_data$speed),
      sd = sd(plot_data$speed),
      lower.tail = TRUE)
# There is an 8.54% probability of randomly choosing
# a person who has driven no faster than 60 mph

# P(60<x<70)
pnorm(70, 
      mean = mean(plot_data$speed),
      sd = sd(plot_data$speed),
      lower.tail = TRUE) -
  pnorm(60, 
        mean = mean(plot_data$speed),
        sd = sd(plot_data$speed),
        lower.tail = TRUE)
# There is a 9.23% probability of randomly choosing
# a person who has driven no faster than  60-70 mph

# Assignment: filter the data to only male or only
# female and recalculate the probabilities. 

# Is the gender you selected more or less likely 
# to drive at these speeds than the general population?