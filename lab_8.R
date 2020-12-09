# Load Packages
library(tidyverse)
library(palmerpenguins)

# View Data
View(penguins)

# Basic plot to check
ggplot(penguins, 
       aes(flipper_length_mm, body_mass_g))+
  geom_point()

plot_data <- penguins %>% 
  select(flipper_length_mm, body_mass_g) %>% 
  na.omit()

# Check correlation
cor(plot_data$body_mass_g,plot_data$flipper_length_mm)

# Overlay model

ggplot(plot_data, 
       aes(flipper_length_mm, body_mass_g))+
  geom_point()+
  geom_smooth(method = "lm",
              se = FALSE)

# Build model 
mass_mod <- lm(body_mass_g ~ flipper_length_mm, data = plot_data) 

# Build function to predict with model
pred <- function(model, value){
  return(model$coefficients[1]+value*model$coefficients[2])
}

pred(mass_mod, 200)

# Assignment: Try to predict body mass from bill length