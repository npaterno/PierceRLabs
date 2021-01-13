obama %>% 
  group_by(poll) %>% 
  summarize(count = n()) %>% 
  mutate(total = sum(count), 
         percent = count/total)