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
            ),
            # Page for scatterplot
            tabPanel(
              "Scatterplot",
              h1("Linear Regression on the Mortality Rate of Cancers"),
              sidebarLayout(
                sidebarPanel(
                  selectInput(
                    inputId = "Cancer",
                    label = "Cancer",
                    choices = c(
                      "Tracheal, bronchus, and lung cancer",
                      "Prostate cancer", 
                      "Pancreatic cancer",
                      "Ovarian cancer", 
                      "Stomach cancer", 
                      "Uterine cancer",
                      "Other pharynx cancer",  
                      "Non-melanoma skin cancer", 
                      "Thyroid cancer",
                      "Testicular cancer"
                    )
                   )
                 ),
                mainPanel(
                  plotOutput("scatterplot"),
                  br(),
                  textOutput("equation"),
                  textOutput("rsquared"),
                  br(),
                  p("This interactive scatterplot analyzes the correlation
                  between years and mortality rate for the different types of
                  cancer. The cancers chosen are the ten highest cancers in
                  terms of mean mortality rate in the United States aggregated
                  from 1980-2014. Depending on which type of cancer is chosen
                  from the dropdown menu, the  graph will show a breakdown of
                  the mortality rate for that particular cancer during each year
                  in the interval. The intercept, coefficient, and R-squared are
                  statistical metrics that are helpful in analyzing the strength
                  of the regression. By observing the relationship between these
                  metrics, the public and healthcare industry can achieve a better
                  understanding of how the mortality rates of different cancers
                  have changed throughout the years.")
                )
               )
            )
        )
    )
)
