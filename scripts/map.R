library(ggplot2)
library(maps)
library(dplyr)
library(usmap)

data <- read.csv("../data/cancer_WA.csv")
#####################################################################################

# a = year, b = cancer code
cleanse_data <- function(a, b) {
  data <- read.csv("../data/cancer_WA.csv")
  a <- as.numeric(a)
  b <- as.numeric(b)
  # filter to only include only specific year and cancer
  data %>%
    rename(fips = FIPS) %>% 
    filter(year == a,
           cause_id == b,
           fips != 53)
}

#####################################################################################

# maps by sex
map_both <- function(df) {
  # select data
  d_both <- df %>% filter(sex == "Both")
  # plot map
  plot_usmap(data = d_both, values = "mortality_rate", include = "WA") +
    scale_fill_continuous(low = "white", high = "purple", name = "Mortality Rate") +
    labs(title = "Mortality Rate for Both Sexes") +
    theme(legend.position = "right") 
}

map_male <- function(df) {
  # select male
  d_m <- df %>% filter(sex == "Male")
  # plot map 
  plot_usmap(data = d_m, values = "mortality_rate", include = "WA") +
    scale_fill_continuous(low = "white", high = "blue", name = "Mortality Rate") +
    labs(title = "Mortality Rate for Males") +
    theme(legend.position = "right")
}

map_female <- function(df) {
  # select female
  d_f <- df %>% filter(sex == "Female")
  # plot map 
  plot_usmap(data = d_f, values = "mortality_rate", include = "WA") +
    scale_fill_continuous(low = "white", high = "red", name = "Mortality Rate") +
    labs(title = "Mortality Rate for Females") +
    theme(legend.position = "right")
}

#####################################################################################

# plot by cause for all years 1980-2014
plot_by_year <- function(b) {
  data <- read.csv("../data/cancer_WA.csv")
  # filter to only include WA number and cancer
  wa <- data %>%
    rename(fips = FIPS) %>% 
    filter(cause_id == b,
           fips == 53)
  both <- wa %>% 
    filter(sex == "Both")
  mm <- wa %>% 
    filter(sex == "Male")
  fm <- wa %>% 
    filter(sex == "Female")
  
  # plot for cancers over the year
  ggplot() +
    geom_line(data = both, mapping = aes(x = year, y = mortality_rate, color = "Both")) +
    geom_line(data = mm, mapping = aes(x = year, y = mortality_rate, color = "Male")) +
    geom_line(data = fm, mapping = aes(x = year, y = mortality_rate, color = "Female")) +
    scale_colour_manual(name = "Sex",
                        values = c(Both = "purple",
                                   Male = "blue",
                                   Female = "red")) +
    labs(title = paste("Mortality Rate for", wa$cause_name, "in Washington")) +
    xlab("Year") +
    ylab("Mortality Rate")
}
