# Telecom Trend Dashboard 🚀

## Project Overview 🌐
This project delivers end-to-end telecom network performance insights through **SQL-based analysis** and an **interactive Power BI dashboard**. We leveraged SQL scripts to prepare, clean, and aggregate raw KPI data, then built dynamic visualizations in Power BI to enable executive-level decision making and operational monitoring.

---

## SQL Analysis 🛠️

### SQL Analysis 🛠️
We performed comprehensive telecom network analysis using SQL CTEs (Common Table Expressions) for modular, readable queries:

1. **City Performance Benchmarking**  
   - Used 2 CTEs: 
     - `city_score` to calculate metric averages
     - `comined_score` to create performance score
   - Applied `RANK()` window function for final ranking

2. **Network Availability Comparison**  
   - Created 2 CTEs:
     - `avg_network_area` for per-area averages
     - `over_all_average` for network-wide baseline
   - Used `CROSS JOIN` to compare areas against baseline

3. **Regional VoLTE Leadership**  
   - Built CTE `top_cities` to find peak VoLTE per city
   - Applied `ROW_NUMBER()` with partitioning for regional ranking

4. **High-Performance LTE Regions**  
   - Used direct aggregation with `HAVING` clause
   - Filtered regions with >95% LTE Accessibility
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



