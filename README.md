# 🚗 Final Analysis Report – Traffic Accident Deaths in Espírito Santo (2024)

📊 **Subtitle:** Analysis of Deaths from Traffic Accidents in Espírito Santo – SIM 2024  
📅 **Date Range:** January to August 2024  
🧠 **Project:** Final work of Module 2 – Data Analysis Training for Health Management (ICEPi)

---

## 🧾 Introduction

This project analyzes deaths caused by **traffic accidents** in Espírito Santo, based on data from the **Mortality Information System (SIM)** for the year 2024. It aims to:

- Identify victim profiles 🧍‍♂️🧍‍♀️  
- Understand mortality patterns 🧩  
- Support prevention strategies and public policies 🚦🏥

> ⚠️ Traffic accidents are a major public health issue in Brazil, often affecting young and economically active individuals.

---

## 🛠️ Methodology

🔍 **Data Source:** SIM (January–August 2024)  
🧮 **Tools:** R language + libraries (`ggplot2`, `dplyr`, `plotly`, `geobr`, etc.)  
📥 **Process:**

1. **Data Cleaning & Filtering** (Espírito Santo + ICD-10: V01–V89)  
2. **Exploratory Analysis** (victim age, civil status, location)  
3. **Visualizations** (line charts, treemaps, pie charts, maps)  
4. **Interpretation** based on public health literature 📚

---

## 📈 Main Visual Insights

### 📅 Deaths by Month  
Line chart shows trends throughout the year. Seasonal peaks may help guide prevention efforts.

### 💍 Deaths by Civil Status  
Treemap reveals victim distribution by marital status — useful for sociological insights.

### 📍 Location of Deaths  
Pie chart shows where deaths occurred (hospital, public road, etc.). Most road deaths suggest **lack of medical assistance**.

### 🏥 Medical Assistance  
Shows whether victims received help. Cross-referenced with place of death to reveal assistance gaps.

### 🗺️ Deaths by Municipality  
A **thematic map** identifies high-risk regions within Espírito Santo. Helps focus public policy geographically.

---

## 💡 Key Takeaways

- 🚨 **High Severity & Lack of Assistance**: Many deaths occurred in public places with no medical support.  
- 🧭 **Regional Focus Needed**: Some municipalities show disproportionately high accident mortality.  
- 🧩 **Data-Driven Prevention**: Findings support the need for awareness campaigns, infrastructure improvements, and better emergency response.

---

## 🧑‍💻 Tech Stack

- `R` 🐍  
- Libraries: `ggplot2`, `plotly`, `dplyr`, `geobr`, `lubridate`  
- Data Source: OpenDataSUS (SIM)  
- Output: Quarto (.qmd) rendered to HTML 📄

---

## 📬 Authors & Credits

Developed as part of the **ICEPi Health Data Training**.  
Report written and coded by [Your Name Here].
