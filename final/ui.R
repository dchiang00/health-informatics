library(shiny)
library(shinythemes)

#page for intro
page_one <- tabPanel(
  "Introduction",
  h1("Introduction"),
  p(
    "In this time amidst the COVID-19 pandemic, we wanted
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
                       and race."
  ),
  fluidRow(
    align = "center",
    imageOutput(outputId = "wacounties")),
    
    h2("Limitations"),
    p(
      "As we researched the health burdens and impact of cancer in Washington State, 
      we realized that there were some limitations to the data that
                     we were analyzing. One of the datasets pertaining to ethnicity and death rates 
                     was incomplete, which limited the different statistics that we could analyze.Additionally, we had to
                     merge multiple different datasets to accomodate for missing data in order to build appropriate insights
                     and analysis. Additionally, some of the datasets were not as updated as we would have liked, which prompted
                     us to look at how the mortality rates have changed over time, and gain a better understanding of how
                     mortality rates might continue to change. We were especially interested in how our analysis would change
                     as cancer data continues to be updated. "
    )
  )




#page for maps
page_two <- tabPanel(
  "Mortality Rate by County",
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
  "Modeling Mortality",
  h1("Linear Regression on the Mortality Rate of Cancer Over Time"),
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
  ),
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
      br()
    )
  )
)


page_five <- tabPanel(
  "Conclusion",
  h2(
    "How do Mortality Rates for Different Cancers Change Depending on the Year?"
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
  ),
  h2("How Well can We Predict how Mortality Rate will Change Over Time?"),
  p(
    "The linear regression model can be analyzed to determine how mortality
    rate will change over time for the different types of cancers. We can analyze
    how well the mortality rate and year is correlated by looking at the r-squared
    value, a number between zero and one. The r-squared is a goodness of fit measure which
    indicates the percentage of the variance in the dependent variable that is explained
    from the independent variable. For cancers with an r-squared value closer to
    one such as stomach, non-melanoma skin, thyroid, and testicular, we see
    that most of the points lie close to the regression line. None of the cancers
    selected have an r-squared value that is close to zero, since these are the
    ten highest cancers in terms of mean mortality rate from 1980-2014. But there
    are cancers such as pancreatic, ovarian, and uterine with r-squared values
    that hover around 0.5, which means that only some of the variance between
    the data points can be explained by the model. The r-squared value provides
    us a useful metric in analyzing how well the data points fit the regression line
    and how much variance exists in the model. We can then examine the general
    trend of the data points and how mortality rate has changed over time."
  ),
  p(
    "By fitting a linear regression model, we can determine how well the
    model fits the data, as well as using the equation to predict the mortality rate
    in the future. The scatterplot is able to explain the behavior of the model by
    examining how the points change over time. Besides using the r-squared value,
    we can use the linear regression line to see how well mortality rate and year
    are correlated for the ten cancers. Roughly half of the cancers have a positive
    correlation with the other half having a negative correlation. For stomach cancer,
    we see that the mortality rate has decreased as time went on, so we can see that
    fewer people have died from stomach cancer recently. However, for cancers such as
    pancreatic cancer, we see that the mortality rate has roughly decreased from
    1980 to 2000, but has increased since then, therefore still yielding a positive
    correlation. While the scatterplot may explain trends in how mortality rate has
    changed over the years from 1980-2014, the data points can still be volatile
    and the regression model may change as more data becomes available."
  ),
  h2("How does Various Cancer Types Affect Different Ethnic Groups?"),
  p(
    "Based on our visualization we can determine that Prostate cancer has the
    highest incidence rate amongst the top 10 cancers in Washington state. In
    addition, African Americans have the highest incidence risk of developing
    Prostate cancer over other ethnicities. African Americans also have the
    highest risk of developing Pancreas cancer as well. Next, we can determine
    that American Indians/Alaskan Natives have the highest risk of developing
    the following cancers: Colon and Rectum, Liver, Non-Hodgkin Lymphoma, Lung
    and Bronchus, and Esophagus. Finally, White people have the highest risk of
    developing cancers, such as Brain and Nervous System, Breast, Leukemias,
    and Esophagus. Also, it was interesting to discover that Asian/Pacific Islanders
    had the lowest cancer incidences in seven out of ten cancer types. Our analysis
    shows that there is a big difference in how someone's ethnicity/race
    can increase or decrease the risk of them developing cancer."
  ),
)


#page for demograpahics
page_four <- tabPanel(
  "Demographics",
  h1("Cancers Sorted by Ethnicity/Race"),
  p(
    "With the existence of so many types of cancers, we wanted to explore if
      a determining factor in the rate of new cancers could be linked to ethnicity/race.
      We believe it helps to understand these statistics, so that you can better determine
      your own personal risk. Therefore, we decided to create a visualization that enables
      the user to select from the top 10 cancer types in Washington State based on the
      year 2014. The interactive bar chart below shows the difference in incidence
      rates for each ethnicity/race in Washington given a type of cancer. Our methodology
      for creating this visualization included merging multiple tables of ethnicity and
      gender data, and using a technique called age adjustment rate to show the rates
      that would exist if the population demographic had the same distribution."
  ),
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
  mainPanel(plotOutput("racePlot")))
)

ui <- navbarPage(
  theme = shinytheme("flatly"),
  "Washington State Cancer Analysis",
  page_one,
  page_two,
  page_three,
  page_four,
  page_five
)