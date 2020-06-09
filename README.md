# Washington State Cancer Analysis
## David Chiang, Nancy Liu, Roy Mosby, Jeff Tu
## 5/1/2020

## Project Description

View our final interactive web application at https://dchiang00.shinyapps.io/Washington-State-Cancer-Analysis/

View our initial exploratory data analysis at https://dchiang00.github.io/health-informatics/eda/

**What is the purpose of your research project?**
Our goal is to raise awareness and educate ourselves on the potential health burdens that cancer can bring to people, while specifically focusing on how deadly different types of cancer can be. 

**What other research has been done in this area? Make sure to include 3+ links to related works, as well as a summary of what that work has discovered.**

This first research article aims to characterize the disease burden amongs surviors of cancers having the higest incidene in the US. In addition, the article has discovered that cancer is a substantial economic burden because of the high medical cost. Also, breast cancer has the highest incidence among women and prostate cancer among men. Survivors of cancer expressed a higher presence of pain and sadness.

*Source:* Iadeluca L, Mardekian J, Chander P, Hopps M, Makinson GT. The burden of selected cancers in the US: health behaviors and health care resource utilization. Cancer Manag Res. 2017;9:721‐730. Published 2017 Nov 28. doi:10.2147/CMAR.S143148. Retrieved from URL: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5713681/

This second article provides an overiew of female breast cancer in the United States and includes data on incidence, mortality, and survival. It was discovered that the probability to develop breast cancer amongst women increases by age.In addition it was discovered non hispanic white women had the overall highest incidence rate of breast cancer. However, African-American women ages 40 to 50 have a higher incidence of breast cancer than white women.

*Source:* DeSantis, C. E., Ma, J., Sauer, A. G., Newman, L. A., & Jemal, A. (2017, October 3). Breast cancer statistics, 2017, racial disparity in mortality by state. Retrieved from URL: https://acsjournals.onlinelibrary.wiley.com/doi/10.3322/caac.21412 

The final research study addresses estimates of cancer burden on countries across the world. Using health metrics like DALYs, YLDs, and YLLs, the study focuses on how deadly cancer can be, as well as how specific types of cancer are more deadly than others. The health burdens of different cancers are weighed against others using different metrics in order to raise awareness about cancer prevention and treatment.

*Source:* Fitzmaurice, C., Naghavi, M., & Murray, C. J. L. (2015, May 28). The Global Burden of Cancer 2013. Retrieved from URL: http://www.healthdata.org/research-article/global-burden-cancer-2013

## Target Audience

**Who is your target audience?  Depending on the domain of your data, there may be a variety of audiences interested in using the dataset. You should hone in on one of these audiences.**

Our target audience consists of people who do not have a lot of background knowledge in the prevalence and effects of cancer and would like to learn more about it. There are certain types of cancer that are more prominent which people know about such as lung and breast cancer, and we hope to raise awareness for less common cancers. Not everyone starts off knowing about the different types of cancer and its effects, so we hope to fill in their gap of knowledge through our project.

**What should your audience learn from your resource? Please consider specific questions that your project can answer using the data you have identified (that are related to the overarching purpose).**

The audience will learn about the symptoms and prevalence of different types of cancer in the United States. Through our project, we hope to provide a resource that will educate people who may not be familiar with the symptoms and effects of cancer. Our project will include statistics regarding the number of people affected across certain age groups by cancer and analyze the prevalence of different types of cancer over time and possibly by region.

## Data
**What is the dataset you'll be working with?  Please include background on who collected the data, where you accessed it, and any additional information we should know about how this data came to be. You must find at least two data sources at this stage.**

This data set includes information from 1980 to 2014 about 29 different cancers, the mortality rates for type and sex at the county level for all states in the US. This data was compiled by IMHE by utilizing data from death records from the National Center for Health Statistics, and population counts from the US Census Bureau, NCHS and Human Mortality Database to estimating prevalence. 

*Source:* http://ghdx.healthdata.org/record/ihme-data/united-states-cancer-mortality-rates-county-1980-2014 

This data set includes information about cancer statistics from American cancer society, including information about mortality rates for different types of cancers. The datasets cover information about cancer prevalence among different genders, states, and types of cancer.

*Source:* https://cancerstatisticscenter.cancer.org/?_ga=2.29605755.553987007.1588388715-1714849727.1588388715#!/

## Technical Description
**What will be the format of your final product (Shiny app, HTML page, compiled .Rmd file, etc)?**

Our final product will be in the form of a Shiny application.

**Do you anticipate any specific data collection / data management challenges?**

Because of the multitude of different types of cancers, we could be working with a high volume of data, which would require us to figure out what we really need from the data. In general, the data we are looking at is very focused; for example, one set is primarily focused solely on the prevalence rate rather while another set is solely focused on a different aspect. We may have to reshape the data as needed in case we wanted to show a specific health metric/realization from this data.

**What new technical skills will need to learn in order to complete your project?**

With the dataset from IMHE, if we were interested in seeing how the prevalence of a specific cancer differs by location or region, we might be interested in learning how to create visualizations that incorporate maps. It would also be useful to learn about different types of visualizations and how we can use them to help communicate our findings.

**What major challenges do you anticipate?**

There may be major challenges in figuring out how to utilize the data as well as trying to cleanse and filter the data. Because we have such a wide range of data to look at, we might be overwhelmed with trying to figure out the necessary details. The column names are also fairly specific to health, so we will need to figure out what the columns really mean and what the values actually represent. Other challenges may include not finding full datasets that we can utilize alongside our already existing data.
