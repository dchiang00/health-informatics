# read in data
data <- read.csv("WA_cancer.csv")
# View(data)
# see the different types of cancer
unique(data$cause_name)
# use data from 2014 as a starting point to find top ten cancers
most_recent <- data %>% 
  filter(location_id == 570) %>% # look only at the whole of WA state
  filter(year_id == "2014") %>% # look at most recent year
  filter(cause_name != "Neoplasms") %>% # neoplasms refer to tissue group or cancer
  filter(sex == "Both") %>% 
  arrange(-mx) %>% 
  top_n(10)

# 1 Tracheal, bronchus, and lung cancer
# 2	Colon and rectum cancer
# 3	Breast cancer
# 4	Pancreatic cancer
# 5	Prostate cancer
# 6	Leukemia
# 7	Non-Hodgkin lymphoma
# 8	Liver cancer
# 9	Brain and nervous system cancer
# 10	Esophageal cancer

data <- data %>% 
  rename("mortality_rate" = "mx", "year" = "year_id")
write.csv(data, "cancer_WA.csv")
