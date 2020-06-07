library(shiny)
library(shinythemes)
library(plotly)
library(DT)



page_one <- tabPanel("Demographics", # label for the tab in the navbar
                       sidebarLayout(
                         sidebarPanel(
                           selectInput("type", label = h3("Cancer Type"), 
                                       choices = list("Brain and Nervous System" = "Brain and Other Nervous System", "Breast Cancer" = "Female Breast", "Colon and Rectum" = "Colon and Rectum", "Esophagus" = "Esophagus", "Prostate"= "Prostate",
                                                      "Leukemias" = "Leukemias", "Liver" = "Liver and Intrahepatic Bile Duct", "Non-Hodgkin Lymphoma" = "Non-Hodgkin Lymphoma", "Pancreas" = "Pancreas",
                                                       "Lung and Bronchus" = "Lung and Bronchus"), 
                                       selected = "Female Breast"),
                          
                         ),
                           
                
                         mainPanel(
                           plotOutput("racePlot")
                         )),
                     
                     h2("Research Question",align = "center"),
                     p("How does various cancer types affect different ethnic groups", align = "center" ),
                     h2("Background", align = "center"),
                     p("With the existence of so many types of cancers. We wanted to explore if a determining factor in the rate of new
                       cancers could be linked to race/ethnicity. Therefore we decided to create a visualization that enables the user to select from 
                       the top 10 cancer types in Washington State. With the state having an uneven demogrpahic, we used a technique called
                       age adjustment rate, which is used to show the rates that would exist if the population demographic had the same distrubtion.", align = "center"),
                     h2("Results", align = "center"),
                     p("The chart below shows the top cancer types and the ethnicty that has the highest age adjusted rate associated with the type of cancer. 
                       Based on our visualization we can determine that prostate cancer has the highest incidence rate. This could be due to the fact the american population(baby-bommers) are 
                       reaching older age(Older men are at higher risk). In additon, We can see that prostate cancer has the highest age adjusted rate for African Amercian men. This could be 
                       caused by genetics and they should probably be screened for prostrate cancer more proactively  ",align ="center"),
                     mainPanel(
                       DTOutput("raceHighest")
               
                     ))








ui <- navbarPage(theme = shinytheme("flatly"),
                 "title place holder",
                 page_one)
