library(shiny)
library(ggplot2)
library(maps)
library(dplyr)
library(usmap)
library(leaflet)
library(shinythemes)
library(DT)


#page for intro
page_one <- tabPanel("Introduction",
                     h1("Introduction"),
                     p("In this time amidst the COVID-19 pandemic, we wanted
                       to educate ourselves and others about the health burdens
                       that diseases can bring to people. We wanted to focus our
                       analysis specifically on cancer, which is currently the 
                       leading cause of death in the United States. Through our 
                       research and analysis of cancer data in Washington, we hope 
                       to create awareness for other people who want to understand 
                       more about the different ways that cancer affects people 
                       in Washington State. We will be examining how cancer mortality
                       rates differ by county, the correlation between mortality 
                       rates and time, and the relationship between mortality rates 
                       and race."),
                     mainPanel(
                      align = "right",
                     imageOutput(outputId = "wacounties"))
)


#page for maps
page_two <- tabPanel(
  "Maps",
  h1("Cancers Sorted by County"),
  p(
    "The selected cancers come from the top cancers in Washington state
    based on the year 2014. After selecting a cancer from the drop down,
    the first chart will give an overview of the selected cancer and
    how its mortality rate has changed over time. The interactive maps
    show the difference in mortality rates for each county in Washington
    given a type of cancer and the year. By observing general trends
    over the years and by location, the public and healthcare industry
    can visualize how certain counties may have a higher mortality
    rate than others."
  ),
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

# Page for scatterplot
page_three <- tabPanel(
  "Scatterplot",
  h1("Linear Regression on the Mortality Rate of Cancer Over Time"),
  sidebarLayout(
    sidebarPanel(selectInput(
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
    )),
    mainPanel(
      plotOutput("scatterplot"),
      br(),
      textOutput("equation"),
      textOutput("rsquared"),
      br(),
      p(
        "This interactive scatterplot analyzes the correlation
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
        have changed throughout the years."
      )
      )
      )
      )


page_five <- tabPanel(
  "Conclusions",
  h1("Analysis"),
  h2(
    "How do mortality rates for different cancers change depending on the year?"
  ),
  p(
    "From the visualizations, we can see that the trends for
    each county are similar to the general trends that occur
    in Washington state as a whole. As the mortality rate
    for a specific cancer decreases in Washington state, the
    mortality rates also follow a similar trend within the
    individual counties. It is worth noting that specific
    counties have a mortality rate than other counties, and
    during the years 1980 to 2014, the counties with the higher
    mortality rates continue to have higher mortality rates as the years
    progress. This trend also occurs across all sorted sexes, where the
    mortality rates will remain consistent across the years. It is difficult
    to see if there is an exact correlation between the mortality rates of
    a specific cancer and the county that we are analyzing."
  ),
  p(
    "The counties Gray Harbor, Adams, and San Juan most notably stand out
    across the different types of cancer because those counties are on the
    extremes of having high mortality rates or low mortality rates compared
    to the rest of the counties. Generally, there are some splits where
    the western side of the state has a higher mortality than the eastern
    side of the state. The difference in mortality rates by county could be
    attributed to geographical location and the difference in lifestyle
    habits, access to care, population of the county, or resources
    available to the people of the county."
  )
  )


#page for demograpahics 
  page_four <- tabPanel(
    "Demographics",
    h1("How does various cancer types affect different ethnic groups"),
    # label for the tab in the navbar
    sidebarLayout(sidebarPanel(
      selectInput(
        "type",
        label = h3("Cancer Type"),
        choices = list(
          "Brain and Nervous System" = "Brain and Other Nervous System",
          "Breast Cancer" = "Female Breast",
          "Colon and Rectum" = "Colon and Rectum",
          "Esophagus" = "Esophagus",
          "Prostate" = "Prostate",
          "Leukemias" = "Leukemias",
          "Liver" = "Liver and Intrahepatic Bile Duct",
          "Non-Hodgkin Lymphoma" = "Non-Hodgkin Lymphoma",
          "Pancreas" = "Pancreas",
          "Lung and Bronchus" = "Lung and Bronchus"
        ),
        selected = "Female Breast"
      )
      
    ),
    
    mainPanel(plotOutput("racePlot"))),
    
    h2("Background", align = "center"),
    p(
      "With the existence of so many types of cancers. We wanted to explore if a determining factor in the rate of new
      cancers could be linked to race/ethnicity. Therefore we decided to create a visualization that enables the user to select from
      the top 10 cancer types in Washington State. With the state having an uneven demogrpahic, we used a technique called
      age adjustment rate, which is used to show the rates that would exist if the population demographic had the same distrubtion.",
      align = "center"
    ),
    h2("Results", align = "center"),
    p(
      "The chart below shows the top cancer types and the ethnicty that has the highest age adjusted rate associated with the type of cancer.
      Based on our visualization we can determine that prostate cancer has the highest incidence rate. This could be due to the fact the american population(baby-bommers) are
      reaching older age(Older men are at higher risk). In additon, We can see that prostate cancer has the highest age adjusted rate for African Amercian men. This could be
      caused by genetics and they should probably be screened for prostrate cancer more proactively  ",
      align = "center"
    ),
    mainPanel(DTOutput("raceHighest"))
  )




  
ui <- navbarPage(theme = shinytheme("flatly"),
                 "Cancer Analysis",
                 page_one,
                 page_two,
                 page_three,
                 page_four,
                 page_five)
