library(shiny)
library(ggplot2)
library(maps)
library(dplyr)
library(usmap)
library(leaflet)
library(DT)

# Source the data
source("../scripts/map.R")
source("../ethnic_rates.R")

# Read in dataframe
data <- read.csv("../data/cancer_WA.csv")
cr <- read.csv("../data/cancer_by_race.csv")

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
      labs(title = paste(
        "Correlation between Year and Mortality Rate for",
        input$Cancer
      )) +
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
      format(round(coef(linear_mod)["(Intercept)"], 3), nsmall = 3),
      " + ",
      format(round(coef(linear_mod)["year"], 3), nsmall = 3),
      " * Years"
    )
  })
  
  # Get R-squared value from regression line
  output$rsquared <- renderText({
    specific_cancer <- mort_year %>%
      filter(cause_name == input$Cancer)
    linear_mod <- lm(avg ~ year, data = specific_cancer)
    paste0("R-squared: ",
           format(round(summary(linear_mod)$r.squared, 3), nsmall = 3))
  })
  # creates a bar grpah visual for race/ethncity
  output$racePlot <- renderPlot({
    cr %>%
      filter(CancerType == input$type) %>%
      ggplot(aes(
        reorder(Race, -AgeAdjustedRate),
        weight = AgeAdjustedRate,
        fill = Race
      )) +
      geom_bar(color = "black") +
      theme(axis.text.x = element_text(angle = 30, hjust = 1)) +
      xlab("Ethnicity") +
      ylab("Age Adjusted Rate") +
      labs(title = paste0(input$type, " Cancer \nRate per 100,000 people"))
  })
  # Creates a chart using DT
  # Work cited https://rstudio.github.io/DT/shiny.html)
  output$raceHighest <- renderDT(highest, options = list(dom = "t"))
  
  output$wacounties <- renderImage({
    return(list(
    src="../images/countiesMap.gif",
    align = "center",
    height=500,
    width=850,
    alt = "WA Counties"
  ))
  },deleteFile = FALSE)})
                                 

  