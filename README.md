# 🚗 Final Analysis Report – Traffic Accident Deaths in Espírito Santo (2024)
In-depth analysis of traffic accident fatalities in Espírito Santo based on SIM data, aiming to identify patterns and inform public policy.

## 📊 Subtitle
Analysis of Deaths from Traffic Accidents in Espírito Santo – SIM 2024

## 📅 Date Range
January to August 2024

## 🧾 Introduction

This project analyzes deaths caused by traffic accidents in Espírito Santo, Brazil, using data from the Mortality Information System (SIM) for 2024. It aims to:

*   Identify victim profiles 🧍‍♂️🧍‍♀️ (age groups, marital status, etc.)
*   Understand mortality patterns 🧩 (location, time of year, assistance received)
*   Support evidence-based prevention strategies and public policies 🚦🏥

⚠️ Traffic accidents are a major public health issue in Brazil, disproportionately affecting young and economically active individuals.

## 🛠️ Methodology

*   🔍 **Data Source:** SIM (Mortality Information System, January–August 2024).  Data accessed via OpenDataSUS.
*   🧮 **Tools:** R programming language with key libraries:
    *   `ggplot2`: For creating visually appealing static plots.
    *   `dplyr`:  For data manipulation and wrangling.
    *   `plotly`:  For interactive visualizations.
    *   `geobr`:  For accessing Brazilian geospatial data.
    *   `lubridate`: For handling date and time data.
*   📥 **Process:**
    1.  **Data Cleaning & Filtering:** Subsetted the SIM data to include only records from Espírito Santo and those with ICD-10 codes V01–V89 (indicating transport accidents). Handled missing values and inconsistencies.
    2.  **Exploratory Data Analysis (EDA):**  Examined distributions of key variables such as victim age, civil status, municipality of death, and location of death.
    3.  **Visualizations:** Created a series of visualizations to highlight key trends and patterns:
        *   Line chart of deaths by month to identify seasonal trends.
        *   Treemap of deaths by marital status to understand demographic factors.
        *   Pie chart showing the distribution of deaths by location (hospital, public road, etc.).
        *   Analysis of medical assistance received, cross-referencing with the place of death.
        *   Thematic map of deaths by municipality to identify high-risk regions.
    4.  **Interpretation:**  Drew conclusions based on the visual insights and contextualized findings with relevant public health literature 📚.

## 📈 Main Visual Insights

*   📅 **Deaths by Month**

    Line chart illustrating the number of deaths per month.  Identifies potential seasonal peaks that could inform targeted prevention efforts.  For example, are there more accidents during holiday months?
*   💍 **Deaths by Civil Status**

    Treemap visualizing the distribution of victims by marital status. Provides insights into potential sociological factors contributing to accident mortality.  Are single individuals more likely to be involved?
*   📍 **Location of Deaths**

    Pie chart showing the proportion of deaths occurring in different locations (e.g., hospital, public road, home). A high percentage of deaths on public roads may indicate a lack of timely medical assistance.
*   🏥 **Medical Assistance**

    Analysis of whether victims received medical assistance before death.  Cross-referenced with the location of death to highlight gaps in emergency response.  Are victims dying on the scene due to a lack of rapid intervention?
*   🗺️ **Deaths by Municipality**

    A choropleth map highlighting municipalities with the highest rates of traffic accident mortality. Helps prioritize public policy interventions geographically. Which specific regions require more resources?

## 💡 Key Takeaways

*   🚨 **High Severity & Lack of Assistance:**  A significant proportion of deaths occur in public places without immediate medical support, suggesting a need for improved emergency response systems.
*   🧭 **Regional Focus Needed:**  Certain municipalities exhibit disproportionately high accident mortality rates, indicating the need for targeted interventions.
*   🧩 **Data-Driven Prevention:**  The findings support the need for increased awareness campaigns, infrastructure improvements (safer roads), and enhanced emergency medical services.

## 🧑‍💻 Tech Stack

*   R 🐍 (version >= 4.0)
*   Key Libraries:
    *   ggplot2 (version >= 3.3)
    *   plotly (version >= 4.9)
    *   dplyr (version >= 1.0)
    *   geobr (version >= 1.3)
    *   lubridate (version >= 1.7)
*   Data Source: OpenDataSUS (SIM - Sistema de Informações sobre Mortalidade)
*   Output: Quarto (.qmd) document rendered to HTML 📄.  The Quarto file allows for reproducible research and easy updating of the analysis.

## 📬 Authors & Credits

Developed as a final project for Module 2 of the ICEPi Health Data Analysis Training.

Report written and coded by João Vitor Galimberti Contarato.  Special thanks to the ICEPi instructors for their guidance.

## 🔗 Relevant Links

*   [Link to Deployed HTML Report (GitHub Pages or similar)] - *If applicable*
*   [Link to OpenDataSUS SIM Data](http://www2.datasus.gov.br/DATASUS/index.php?area=0205&id=6937) - *Example Link*
