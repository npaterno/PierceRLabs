# Load Packages
library(tidyverse)
library(openintro)

# Look at data
View(teacher)

# Calculating individual summary statistics
teacher_summary_full <- teacher %>% 
  summarize(mean_total = mean(total),
            sd_total = sd(total),
            var_total = var(total))

# Calculating five number summary
fivenum(teacher$total)

# Pulling out individual values from fivenum()
teacher_fivenum_full <- teacher %>% 
  summarize(min = fivenum(total)[1],
            q1 = fivenum(total)[2],
            md = fivenum(total)[3],
            q3 = fivenum(total)[4],
            max = fivenum(total)[5])

# Based on mean and md, data appears to be skewed left
ggplot(teacher, 
       aes(total))+
  geom_histogram(binwidth = 2000)

# Let's go a bit further
teacher_summary_degree <- teacher %>% 
  group_by(degree) %>% 
  summarize(mean_total = mean(total),
            sd_total = sd(total),
            var_total = var(total))

teacher_fivenum_degree <- teacher %>% 
  group_by(degree) %>% 
  summarize(min = fivenum(total)[1],
            q1 = fivenum(total)[2],
            md = fivenum(total)[3],
            q3 = fivenum(total)[4],
            max = fivenum(total)[5])

teacher_summary_years <- teacher %>% 
  group_by(years) %>% 
  summarize(mean_total = mean(total),
            sd_total = sd(total),
            var_total = var(total))

teacher_fivenum_years <- teacher %>% 
  group_by(years) %>% 
  summarize(min = fivenum(total)[1],
            q1 = fivenum(total)[2],
            md = fivenum(total)[3],
            q3 = fivenum(total)[4],
            max = fivenum(total)[5])

ggplot(teacher, 
       aes(years, total, color = degree))+
  geom_point()

# Assignment: calculate mean, sd, var and individual fivenum for retirement
