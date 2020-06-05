library(shiny)
library(shinythemes)
library(plotly)


page_one <- tabPanel("Cancer by Ethnicty/Race", # label for the tab in the navbar
                       sidebarLayout(
                         sidebarPanel(
                           selectInput("type", label = h3("Cancer Type"), 
                                       choices = list("Brain and Nervous System" = "Brain and Other Nervous System", "Breast Cancer" = "Female Breast", "Colon and Rectum" = "Colon and Rectum", "Esophagus" = "Esophagus", "Prostate"= "Prostate",
                                                      "Leukemias" = "Leukemias", "Liver" = "Liver and Intrahepatic Bile Duct", "Non-Hodgkin Lymphoma" = "Non-Hodgkin Lymphoma", "Pancreas" = "Pancreas",
                                                      "Ovary" = "Ovary", "Testis" = "Testis", "Thyroid" = "Thyroid", "Lung and Bronchus" = "Lung and Bronchus"), 
                                       selected = "Female Breast"),
                          
                         ),
                           
                
                         mainPanel(
                           plotOutput("racePlot")
                         )))




ui <- navbarPage(theme = shinytheme("flatly"),
                 "title place holder",
                 page_one)
