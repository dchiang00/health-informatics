library(ggplot2)

# Read in data
cr <- read.csv("../data/cancer_by_race.csv")

cr_plot <- ggplot(cr, aes(factor(CancerType), AgeAdjustedRate, fill = Race,
                          text = paste("Cancer: ", CancerType,
                                       "<br>Age Adjusted Rate: ", AgeAdjustedRate,
                                       "<br>Race: ", Race))) + 
  geom_bar(stat="identity", position = "dodge") +
  ggtitle("Cancer Types by Ethnicity") +
  xlab("Cancer Type") +
  ylab("Age Adjusted Rate")