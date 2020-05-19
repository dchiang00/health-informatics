library(ggplot2)
library(dplyr)
library(tidyr)

# Read in data
wa_cancer <- read.csv("data/cancer_WA.csv") 

# Finding counties with the 10 highest mortality rates in WA
grouped_data <- wa_cancer %>%
  select(location_id, location_name, mortality_rate) %>%
  group_by(location_name) %>%
  summarize(Mortality_Rate = mean(mortality_rate)) %>%
  arrange(-Mortality_Rate) %>%
  top_n(10)

# Creating visualization
top_10_counties <- ggplot(grouped_data, fill = location_name) +
  geom_col(aes(x = location_name, y = Mortality_Rate, fill = location_name), 
           position = 'dodge') + 
  labs(title = "Counties with the Highest Mean Mortality Rates in WA", x = "County",
       y = "Mortality Rate", fill = "County Name")
  
