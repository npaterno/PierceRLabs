# Load Packages
library(tidyverse)
library(infer)

# Load Data
piracy <-read_csv("piracy.csv")

# View Data 
view(piracy) #View our data set

# We'll conduct a t-test to determine if there is a difference in money received
# by Democrats and republicans, regardless of where the money came from

summary_data <- piracy %>%  #First, we need to calculate the total amount of money received
  mutate(money_pro = replace_na(money_pro, 0), #This line and the next replace NA values with $0
         money_con = replace_na(money_con,0),
         money_total = money_pro+money_con) %>% #This creates our new variable
  select(-c(money_pro, money_con)) %>%  #We can also drop the individual money variables
  filter(party!= "I") #removes the Independent party

#Run Hypothesis Test for money_pro
t_test(summary_data, #choose the data frame
       formula = money_total~party, #define the relationship/variables for testing
       order = c("D","R"), #choose an order for the mean difference to be calculated
       mu = 0, #define the null hypothesis
       alternative = "two.sided", #define the alternative hypothesis
       var.equal = TRUE, #assume the populations have equal variance
       conf_int = TRUE, #will calculate a confidence interval for the mean difference as part of the test
       conf_level = 0.99) #defines the confidence/significance level

# From the output, we can conclude there is a difference. Based on the interval is appears that Democrats
# Received more money in relation to the anti-piracy legislation.

# Assignment: Choose one political party and determine if they received more money from the pro or con group.