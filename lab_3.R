# Load Packages
library(tidyverse)
library(ggthemes)
library(openintro)

# Look at data
View(epa2012)

# Simplify data
plot_data <- epa2012 %>% 
  select(c(mfr_name, no_cylinders, city_mpg, hwy_mpg, comb_mpg))

# Base plots of a histogram, boxplot and scatterplot
ggplot(data = plot_data, 
       mapping = aes(x = comb_mpg))+
  geom_histogram()

ggplot(data = plot_data, 
       mapping = aes(x = comb_mpg))+
  geom_boxplot()

ggplot(data = plot_data,
       mapping = aes(x = no_cylinders, y = comb_mpg))+
  geom_point()

# Make the histogram "publication ready" 
ggplot(data = plot_data, 
       mapping = aes(x = comb_mpg))+
  geom_histogram(binwidth = 5, 
                 color = "black",
                 fill = "cadetblue",
                 na.rm = TRUE)+
  labs(
    title = "Gas Mileage for Model Year 2012",
    subtitle = "Combined City/Highway",
    x = "Gas Mileage (mpg)",
    y = "Number of Cars",
    caption = "Source: Fueleconomy.gov, Shared MPG Estimates"
  )+
  theme_economist()

# Assignment: Make the boxplot and scatterplot "publication ready"