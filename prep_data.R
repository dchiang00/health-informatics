library(dplyr)

# Read in datasets
data_bc <- read.csv("data/data_ethnicity/BreatCancerRace.csv")
data_rc <- read.csv("data/data_ethnicity/ColonandRectCancerRace.csv")
data_lc <- read.csv("data/data_ethnicity/lungCancerRace.csv")

# Check for data type
sapply(data_bc, class)
sapply(data_rc, class)
sapply(data_lc, class)

# Filter only columns we need 
data_bc <- data_bc %>%
  select(-c("Area","Year","Sex","Population","CaseCount"))

data_rc <- data_rc %>%
  select(-c("Area","Year","Sex","Population","CaseCount")) 

data_lc <- data_lc %>%
  select(-c("Area","Year","Sex","Population","CaseCount"))

# Merge data sets 
combine1 <- merge(data_bc,data_rc,all=TRUE)
combine2 <- merge(combine1,data_lc,all=TRUE)

# Write new dataframe to csv file
write.csv(combine2, "cancer_by_race.csv")