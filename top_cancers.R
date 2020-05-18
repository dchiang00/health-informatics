library(ggplot2)

# Read in data regarding top 10 cancers in WA
df <- read.csv("../data/top_ten_WA.csv")

# Create bar chart of top 10 cancers in WA by mortality rate
top_10_cancers <- ggplot(df, aes(reorder(cause_name, -mx), mx,
                         fill=cause_name, text = paste("Cancer: ",
                              cause_name, "<br>Mortality Rate: ", mx))) +
  geom_bar(stat = "identity", position = 'dodge') +
  labs(title = "Top 10 Cancers in Washington State by Mortality Rate", x = "Cancer",
       y = "Mortality Rate", fill = 'Cancer Type') +
  theme(axis.text.x = element_text(size = 12)) +
  coord_flip()