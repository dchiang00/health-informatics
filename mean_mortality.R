library(ggplot2)
library(dplyr)
library(tidyr)

# Read in data
data <- read.csv("../data/cancer_WA.csv")

#####################################################################
# filter out neoplasms
data <- data %>% 
  filter(cause_name != "Neoplasms") # neoplasms refer to tissue group or cancer
# find top ten highest mortality rates in 2014
df <- data %>% 
  filter(location_id == 570,
         year == 2014,
         sex == "Both") %>% 
  arrange(-mortality_rate) %>% 
  top_n(10)

# find the id of the causes
df$cause_id
x <- c(426, 441, 429, 456, 438, 487, 485, 417, 477, 411)

years <- c(1980:2014)
names <- df$cause_name
# initialize a matrix : row = year, col = cancer
m <- matrix(NA, nrow=length(years), ncol=10)
data <- data %>% 
  filter(location_id != 570)
# for loop to calculate means for each type of cancer for each year
for (i in 1:10) {
  data_by_cause <- data %>%
    filter(cause_id == as.numeric(x[i])) # filter by different causes
  for (j in 1:35) {
    data_c_y <- data_by_cause %>% 
      filter(year == as.numeric(years[j]))
    m[j,i] <- as.numeric(mean(data_c_y$mortality_rate)) # insert values into matrix
  }
}
# turn into dataframe
cancer_year <- as.data.frame(m)
# rename the columns
names(cancer_year) <- names
cc <- cancer_year %>% 
  mutate("year" = seq(1980, 2014, 1))
# View(cc)

year_mortality <- ggplot(cc, aes(x = year)) +
  scale_colour_manual(name = "Cancer Type",
                      values = c(`Tracheal, bronchus, and lung` ="aquamarine",
                                 `Colon and rectum` = "magenta", 
                                 `Breast` = "salmon",
                                 `Pancreatic` = "green",
                                 `Prostate` = "skyblue",
                                 `Leukemia` = "blue",
                                 `Non-Hodgkin lymphoma` = "purple",
                                 `Liver` = "orchid",
                                 `Brain and nervous system` = "red",
                                 `Esophageal` = "orange")) + 
  geom_line(aes(y = `Tracheal, bronchus, and lung cancer`, color = "Tracheal, bronchus, and lung")) +
  geom_line(aes(y = `Colon and rectum cancer`, color = "Colon and rectum")) +
  geom_line(aes(y = `Breast cancer`, color = "Breast")) +
  geom_line(aes(y = `Pancreatic cancer`, color = "Pancreatic")) +
  geom_line(aes(y = `Prostate cancer`, color = "Prostate")) +
  geom_line(aes(y = `Leukemia`, color = "Leukemia")) +
  geom_line(aes(y = `Non-Hodgkin lymphoma`, color = "Non-Hodgkin lymphoma")) +
  geom_line(aes(y = `Liver cancer`, color = "Liver")) +
  geom_line(aes(y = `Brain and nervous system cancer`, color = "Brain and nervous system")) +
  geom_line(aes(y = `Esophageal cancer`, color = "Esophageal")) + 
  xlab("Year") + 
  ylab("Mean Mortality Rate") +
  ggtitle("Mean Mortality Rates by Year")




