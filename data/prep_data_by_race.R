library(dplyr)

# read in datasets new cancer rates
brain_nervous <-read.csv("./data_ethnicity/new/BrainNervousSystem.csv")
breast <- read.csv("./data_ethnicity/new/BreastCancer.csv")
colon_rectum <- read.csv("./data_ethnicity/new/ColonAndRectum.csv")
esophageal <- read.csv("./data_ethnicity/new/Esophageal.csv")
prostate <- read.csv("./data_ethnicity/new/Prostate.csv")
leukemias <- read.csv("./data_ethnicity/new/Leukemias.csv")
liver <- read.csv("./data_ethnicity/new/Liver.csv")
non_hodgkin <- read.csv("./data_ethnicity/new/Non-HodgkinLymphoma.csv")
pancreatic <- read.csv("./data_ethnicity/new/Pancreatic.csv")
lung <- read.csv("./data_ethnicity/new/LungandBronchus.csv")






# check for data type of datasets
sapply(brain_nervous, class)


#merge dataframes
cancer_ethnicity <- do.call("rbind",list(brain_nervous,breast,colon_rectum,esophageal,prostate,leukemias,
                                         liver,non_hodgkin,pancreatic,lung))


#filter only columns we need 
cancer_ethnicity <- cancer_ethnicity %>%
  select(-c("Area","Year","Sex","Population"))

cancer_ethnicity$Race [cancer_ethnicity$Race == "American Indian/Alaska Native"] <- "American Indian"

# convert into factor
cancer_ethnicity$CancerType <- as.factor(cancer_ethnicity$CancerType)
cancer_ethnicity$Race <- as.factor(cancer_ethnicity$Race)


# write new dataframe to csv file
write.csv(cancer_ethnicity, "cancer_by_race.csv")


#sapply(cancer_ethnicity, class)


############# testing ################
















