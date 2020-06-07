library(shiny)
require(knitr)
library(xtable)
library(DT)

#source the data
source("../ethnic_rates.R")

#filter_cr <-filter_cancer_type("cancer_by_race")



shinyServer(function(input, output) { 
  
cr <- read.csv("../data/cancer_by_race.csv")

output$racePlot <- renderPlot({
  cr %>%
    filter(CancerType == input$type) %>%
    ggplot(aes(reorder(Race,-AgeAdjustedRate), weight= AgeAdjustedRate, fill = Race)) +
    geom_bar(color="black") +
    theme(axis.text.x = element_text(angle = 30, hjust = 1))+
    xlab("Ethnicity") +
    ylab("Age Adjusted Rate") +
    labs(title = paste0(input$type," Cancer \n Rate per 100,000 people"))
    
})

# output$topCancerRace <- renderPlot({
#   cr %>% 
#     filter(CancerType %in% c("Female Breast","Colon and Rectum","Lung and Bronchus")) %>%
#   ggplot(aes(factor(CancerType), AgeAdjustedRate, fill = Race,
#                             text = paste("Cancer: ", CancerType,
#                                          "<br>Age Adjusted Rate: ", AgeAdjustedRate,
#                                          "<br>Race: ", Race))) + 
#     geom_bar(stat="identity", position = "dodge",color ="black") +
#     ggtitle("Top 3 Cancer Types by Ethnicity") +
#     xlab("Cancer Type") +
#     ylab("Age Adjusted Rate")
# 
# })

output$raceHighest <- renderDT(
  #xt <- xtable(highest)
  #names(xt) <-c("Cancer Type","Ethnicity", "Age Adjusted Rate")
  #xtable(highest, col.names = c("Cancer Type","Ethnicity", "Age Adjusted Rate"))
  
  #knitr::kable(highest, col.names = c("Cancer Type","Ethnicity", "Age Adjusted Rate"))
  
  highest,options = list(dom = "t")
  # work cited
  #https://rstudio.github.io/DT/shiny.html
  


    )


})





