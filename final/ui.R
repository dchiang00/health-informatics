#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
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

# Define UI for application that draws a histogram
shinyUI(
    fluidPage(
        navbarPage(
            "Final",
            
            tabPanel(
                "Maps",
                h1("Cancers Sorted by County"),
                sidebarLayout(
                    sidebarPanel(
                            selectInput(
                                inputId = "cancer_type",
                                label = "Type of Cancer",
                                choices = list(
                                    "Tracheal, Bronchus, and Lung" = 426, 
                                    "Colon and Rectum" = 441, 
                                    "Breast" = 429,
                                    "Pancreatic" = 456,
                                    "Prostate" = 438, 
                                    "Leukemia" = 487, 
                                    "Non-Hodgkin Lymphoma" = 485, 
                                    "Liver" = 417,
                                    "Brain and Nervous System" = 477, 
                                    "Esophageal" = 411
                                )
                            ),
                            sliderInput(
                                inputId = "year",
                                label = "Year",
                                min = 1980,
                                max = 2014,
                                value = 2000, 
                                sep = ""
                            )
                    ),
            
                    # Show a plot of the generated distribution
                    mainPanel(
                        plotOutput("time_lapse"),
                        plotOutput("map_both"),
                        plotOutput("map_male"),
                        plotOutput("map_female")
                        
                    )
                )
            )
        )
    )
)
