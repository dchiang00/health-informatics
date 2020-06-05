library(dplyr)

# read in datasets
brain_nervous <-read.csv("./data_ethnicity/BrainNervousSystem.csv")
breast <- read.csv("./data_ethnicity/BreastCancer.csv")
colon_rectum <- read.csv("./data_ethnicity/ColonAndRectum.csv")
esophageal <- read.csv("./data_ethnicity/Esophageal.csv")
prostate <- read.csv("./data_ethnicity/Prostate.csv")
leukemias <- read.csv("./data_ethnicity/Leukemias.csv")
liver <- read.csv("./data_ethnicity/Liver.csv")
non_hodgkin <- read.csv("./data_ethnicity/Non-HodgkinLymphoma.csv")
pancreatic <- read.csv("./data_ethnicity/Pancreatic.csv")
ovary<- read.csv("./data_ethnicity/Ovary.csv")
testis <- read.csv("./data_ethnicity/Testis.csv")
thyroid <- read.csv("./data_ethnicity/Thyroid.csv")
lung <- read.csv("./data_ethnicity/LungandBronchus.csv")

# check for data type of datasets
sapply(brain_nervous, class)


#merge dataframes
cancer_ethnicity <- do.call("rbind",list(brain_nervous,breast,colon_rectum,esophageal,prostate,leukemias,
                                         liver,non_hodgkin,pancreatic,ovary,testis,thyroid,lung))


#filter only columns we need 
cancer_ethnicity <- cancer_ethnicity %>%
  select(-c("Area","Year","Sex","Population","CaseCount"))

# convert into factor
cancer_ethnicity$CancerType <- as.factor(cancer_ethnicity$CancerType)
cancer_ethnicity$Race <- as.factor(cancer_ethnicity$Race)


# write new dataframe to csv file
write.csv(cancer_ethnicity, "cancer_by_race.csv")


#sapply(cancer_ethnicity, class)











