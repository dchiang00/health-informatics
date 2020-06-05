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

})
