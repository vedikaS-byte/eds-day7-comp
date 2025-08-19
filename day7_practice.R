# cleaning environment
rm(list = ls())

# attach packages
library(tidyverse)
library(palmerpenguins)
library(lubridate)

# data wrangling 
# only include at frisco and dream islands
colnames(penguins)
str(penguins)
levels(factor(penguins$island))
penguins_subset <- penguins %>% filter(island %in% c("Biscoe", "Dream")) %>% select(-year, -sex) %>% mutate(body_mass_kg = (body_mass_g/1000)) %>% rename(location = island) 

# limit to only adelie
?na.omit
penguins %>% filter(species == "Adelie") %>%  na.omit() %>% 
# # remove any observations where flipper_length = NA
  # group the data by sex
group_by(sex) %>% 
summarize(mean_flipper_length = mean(flipper_length_mm, na.rm = T), sd_flipper_length = sd(flipper_length_mm, na.rm = T), num_count = n())






