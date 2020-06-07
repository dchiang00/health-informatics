#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(maps)
library(dplyr)
library(usmap)
library(leaflet)

source("../scripts/map.R")
#source("../scripts/scatterplot.R")

# Read in dataframe
data <- read.csv("../data/cancer_WA.csv")

# Filter to the top 10 causes in terms of mortality rate
top_10_causes <- data %>% 
    filter(cause_name != 'Other neoplasms') %>% 
    group_by(cause_name) %>% 
    summarize(avg = mean(mortality_rate)) %>% 
    arrange(-avg) %>% 
    select(cause_name) %>%
    top_n(10)

# Get the mortality rate in each year of the top 10 causes
mort_year <- data %>% 
    filter(cause_name %in% top_10_causes$cause_name) %>% 
    group_by(cause_name, year) %>% 
    summarize(avg = mean(mortality_rate)) %>% 
    select(cause_name, year, avg)  


shinyServer(function(input, output) {
    
    output$time_lapse <- renderPlot({
        plot_by_year(input$cancer_type)
    })
    
    output$map_both <- renderPlot({
        map_both(cleanse_data(input$year, input$cancer_type))
    })
    
    output$map_male <- renderPlot({
        map_male(cleanse_data(input$year, input$cancer_type))
    })
    
    output$map_female <- renderPlot({
        map_female(cleanse_data(input$year, input$cancer_type))
    })
    
    # Produce scatterplot of mortality rate an years for different cancers
    output$scatterplot <- renderPlot({
        specific_cancer <- mort_year %>% 
            filter(cause_name == input$Cancer)
        ggplot(data = specific_cancer, aes(x = year, y = avg)) +
            geom_point() +
            geom_smooth(method = "lm", se = FALSE) +
            labs(title = paste("Correlation between Year and Mortality Rate for",
                               input$Cancer)) +
            xlab("Year") +
            ylab("Mortality Rate")
    })
    
    # Equation for the regression line
    output$equation <- renderText({
        specific_cancer <- mort_year %>% 
            filter(cause_name == input$Cancer)
        linear_mod <- lm(avg ~ year, data = specific_cancer)
        paste0(
            "Mortality Rate = ",
            format(round(coef(linear_mod)["(Intercept)"], 3), nsmall = 3), " + ",
            format(round(coef(linear_mod)["year"], 3), nsmall = 3), " * Years"
        )
    })
    
    # Get R-squared value from regression line
    output$rsquared <- renderText({
        specific_cancer <- mort_year %>% 
            filter(cause_name == input$Cancer)
        linear_mod <- lm(avg ~ year, data = specific_cancer)
        paste0(
            "R-squared: ",
            format(round(summary(linear_mod)$r.squared, 3), nsmall = 3)
        )
    })
})
