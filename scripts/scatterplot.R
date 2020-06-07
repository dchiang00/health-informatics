library(dplyr)
library(ggplot2)

# Read in dataframe
data <- read.csv("../data/cancer_WA.csv")

# Filter to the top 10 causes in terms of mortality rate
top_10_causes <- data %>% 
  filter(cause_name != 'Other neoplasms') %>% 
  group_by(cause_name) %>% 
  summarize(avg = mean(mortality_rate)) %>% 
  arrange(-avg) %>% 
  select(cause_name) %>%
  top_n(10)

# Get the mortality rate in each year of the top 10 causes
mort_year <- data %>% 
  filter(cause_name %in% top_10_causes$cause_name) %>% 
  group_by(cause_name, year) %>% 
  summarize(avg = mean(mortality_rate)) %>% 
  select(cause_name, year, avg)  

# Function to take in any of the top 10 cancers and creates a scatterplot
# along with linear regression line
scatterplot_cancer <- function(cancer) {
  data <- read.csv("../data/cancer_WA.csv")
  
  # Filter to the top 10 causes in terms of mortality rate
  top_10_causes <- data %>% 
    filter(cause_name != 'Other neoplasms') %>% 
    group_by(cause_name) %>% 
    summarize(avg = mean(mortality_rate)) %>% 
    arrange(-avg) %>% 
    select(cause_name) %>%
    top_n(10)
  
  # Get the mortality rate in each year of the top 10 causes
  mort_year <- data %>% 
    filter(cause_name %in% top_10_causes$cause_name) %>% 
    group_by(cause_name, year) %>% 
    summarize(avg = mean(mortality_rate)) %>% 
    select(cause_name, year, avg)  
  
  specific_cancer <- mort_year %>% 
    filter(cause_name == cancer)
  
  ggplot(data = specific_cancer, aes(x = year, y = avg)) +
    geom_path() +
    geom_point() +
    geom_smooth(method = "lm", se = FALSE)
}

# Test function
test <- scatterplot_cancer("Prostate cancer")

test <- mort_year %>% 
  filter(cause_name == 'Prostate cancer')

# Linear Regression Analysis
fit <- lm(avg ~ year, data = test)
format(round(summary(fit)$r.squared, 2), nsmall = 2)