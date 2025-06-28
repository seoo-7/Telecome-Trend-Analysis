# Telecom Trend Dashboard 🚀

## Project Overview 🌐
This project delivers end-to-end telecom network performance insights through **SQL-based analysis** and an **interactive Power BI dashboard**. We leveraged SQL scripts to prepare, clean, and aggregate raw KPI data, then built dynamic visualizations in Power BI to enable executive-level decision making and operational monitoring.

---

## SQL Analysis 🛠️
- **Preview Dataset**: Initial exploration of `public.telecom_data` to verify record counts, data types, and null value checks using `SELECT * LIMIT 10` queries. 📊
- **City Performance Ranking**: Created a combined performance score by summing normalized `LTE_Accessibility`, `LTE_Retainability`, and `Network_Availability`, then ranked cities in descending order to identify top and bottom performers. 🏅
- **Areas Exceeding Average Availability**: Filtered areas (network cells) where `Network_Availability` surpasses the overall average, listing them for potential best-practice benchmarking. 📈
- **Top VoLTE Accessibility by Region & Area**: Aggregated `VoLTE_Accessibility` rates, grouped by `Region` and `Area`, to find the highest-performing city–area combinations in voice connectivity. 🎤
- **High-Performance Regional LTE Metrics**: Calculated average LTE metrics (`Accessibility`, `Retainability`, `Intra/Inter-Frequency Handover Success`) for regions where `LTE_Accessibility` > 95%, ordering results to spotlight top regions. 🌟

---

## Dashboard Overview (Power BI) 📊
### KPI Summary Cards 💡
- **Average Network Availability** ✅
- **Average Call Setup Success Rate** 📞
- **Average LTE Session Retainability** 🔄
- **Average LTE Network Accessibility** 📶  
Designed for an at-a-glance health check of network performance, these cards update dynamically with fresh data loads.

### Key Visualizations 📈
1. **Regional Distribution Across States** 🗺️  
2. **VoLTE CSSR Distribution by Region** 🎧  
3. **Regional Distribution of 4G VoLTE Accessibility Over Time** ⏱️  
4. **Cities with Strongest & Weakest LTE Signals** 📊  
5. **Cross vs. Same Frequency Handover Health**⚡️  
6. **Network Reliability Over Time: Daily & Monthly View** 📆  
Each visual provides both high-level summaries and drill-down capabilities for deeper analysis.

---

## Data Source 📂
- **Table**: `public.telecom_data` (daily KPIs by city, state, region)  
- **Columns**: lte_accessibility, lte_retainability, intra/inter-frequency handover rates, volte_accessibility, volte_cssr, network_availability, timestamp, geographic fields 🌍

---

## Tools & Technologies 🛠️
- **SQL** (PostgreSQL): Data cleansing, aggregation, and advanced window functions 🐘
- **Power BI**: Data modeling, DAX-free measures, and interactive visualization 📈
- **Power Query**: Calendar table creation and data transformation 🔄



