library(ggplot2)
library(dplyr)


# Read in data
cre <- read.csv("../data/cancer_by_race.csv")

cr_plot <- ggplot(cre, aes(factor(CancerType), AgeAdjustedRate, fill = Race,
                          text = paste("Cancer: ", CancerType,
                                       "<br>Age Adjusted Rate: ", AgeAdjustedRate,
                                       "<br>Race: ", Race))) + 
  geom_bar(stat="identity", position = "dodge") +
  ggtitle("Cancer Types by Ethnicity") +
  xlab("Cancer Type") +
  ylab("Age Adjusted Rate")


####################################
# creates dataframe of highest new rate of cancer by ethnicty
cancer_type <-c("Brain and Nervous System","Breast Cancer","Colon and Rectum","Esophagus","Prostate","Leukemias","Liver","Non-Hodgkin Lymphoma", "Pancreas", "Lung and Bronchus")
ethnicity <- c("White","White","American Indian","White & American Indian","Black","White","American Indian","American Indian","Black","American Indian")
age_adjusted_rate <- c(7.8,136.9,49.6,5,142.8,15.2,20.1,21.2,15.8,61.5)
highest <- data.frame(cancer_type,ethnicity,age_adjusted_rate)

highest <- highest %>%
  rename("Cancer Type" = cancer_type, "Ethnicity" = ethnicity, "Age Adjusted Rate" =  age_adjusted_rate)