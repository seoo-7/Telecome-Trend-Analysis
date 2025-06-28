/*----------------------------------------------------------

Description: Analysis queries on public.telecom_data for key performance metrics.

Sections:
  0. Preview dataset
  1. Rank cities based on combined LTE Accessibility, Retainability, and Network Availability
  2. List areas exceeding overall average Network Availability
  3. Identify top cities with highest VoLTE Accessibility by region and area
*/



/*==================================================================
REQUIREMENT 1: City Performance Ranking by Combined Metrics
DESCRIPTION: Ranks cities based on combined score of LTE Accessibility, 
             LTE Retainability, and Network Availability.
==================================================================*/
WITH city_score AS (
    SELECT 
        city,
        region,
        ROUND(AVG(lte_accessibility),2) AS access,
        ROUND(AVG(lte_retainability),2) AS retain,
        ROUND(AVG(network_availability),2) AS network
    FROM public.telecom_data
    GROUP BY 1, 2  
), 
comined_score AS (
    SELECT 
        city, 
        region,
        access, 
        retain, 
        network,
        (access + retain + network) AS score
    FROM city_score
)
SELECT 
    city,
    region,
    score,
    RANK() OVER(ORDER BY score DESC) AS city_rank
FROM comined_score;

/*==================================================================
REQUIREMENT 2: Area Network Availability Comparison
DESCRIPTION: Compares average Network Availability per area against 
             the overall average, showing areas above average.
==================================================================*/
WITH avg_network_area AS (
    SELECT  
        area,
        ROUND(AVG(network_availability),2) AS avg_network
    FROM public.telecom_data
    GROUP BY area
),
over_all_average AS (
    SELECT 
        ROUND(AVG(network_availability),2) AS over_all_avg
    FROM public.telecom_data
)
SELECT 
    a.area, 
    avg_network,
    over_all_avg
FROM over_all_average o 
CROSS JOIN avg_network_area a
WHERE a.avg_network > o.over_all_avg 
ORDER BY avg_network DESC;

/*==================================================================
REQUIREMENT 3: Regional VoLTE Accessibility Leaders
DESCRIPTION: Identifies top cities with highest VoLTE Accessibility 
             within each region and area.
==================================================================*/
WITH top_cities AS (
    SELECT 
        city, 
        region,
        area,
        MAX(VoLTE_Accessibility) AS high_volte
    FROM public.telecom_data
    GROUP BY 1, 2, 3
) 
SELECT 
    city, 
    region,
    area,
    high_volte,
    ROW_NUMBER() OVER(PARTITION BY region ORDER BY high_volte DESC) AS rank
FROM top_cities;

/*==================================================================
REQUIREMENT 4: High-Performance Regional LTE Metrics
DESCRIPTION: Calculates average LTE metrics for regions with 
             LTE Accessibility > 95%.
==================================================================*/
SELECT 
    Region,
    ROUND(AVG(LTE_Accessibility),2) AS avg_lte_accessibility,
    ROUND(AVG(LTE_Retainability),2) AS avg_lte_retainability,
    ROUND(AVG(LTE_Intra_Frequency_Handover),2) AS avg_lte_intra_handover,
    ROUND(AVG(LTE_Inter_Frequency_Handover),2) AS avg_lte_inter_handover
FROM public.telecom_data
GROUP BY Region
HAVING AVG(LTE_Accessibility) > 95
ORDER BY avg_lte_accessibility DESC;