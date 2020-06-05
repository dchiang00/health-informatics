library(shiny)
require(knitr)

#source the data
#source("../ethnic_rates.R")

#filter_cr <-filter_cancer_type("cancer_by_race")



shinyServer(function(input, output) { 
  
cr <- read.csv("../data/cancer_by_race.csv")

output$racePlot <- renderPlot({
  cr %>%
    filter(CancerType == input$type) %>%
    ggplot(aes(x= Race, weight= AgeAdjustedRate)) +
    geom_bar() +
    theme(axis.text.x = element_text(angle = 30, hjust = 1))+
    xlab("Ethnicity") +
    ylab("Age Adjusted Rate") +
    labs(title = paste0(input$type," Cancer in Washington State"))
    
  
  
  #ggplot(cancer_ethnicity) +
   # aes(x = CancerType, weight = AgeAdjustedRate) +
    #geom_bar(fill = "#0c4c8a") +
   # theme_minimal()
  
})

})