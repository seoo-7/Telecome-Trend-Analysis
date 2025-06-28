-- create database 

create database telecome 	

-- create table 
DROP TABLE IF EXISTS public.telecom_data;

create table public.telecom_data(
  id SERIAL PRIMARY KEY,
    csv_id INTEGER,
    area VARCHAR(50),
    shared_region INTEGER,
    lte_accessibility NUMERIC(10, 8),
    lte_retainability NUMERIC(10, 8),
    lte_intra_frequency_handover NUMERIC(10, 8),
    lte_inter_frequency_handover NUMERIC(10, 8),
    volte_accessibility NUMERIC(10, 8),
    volte_cssr NUMERIC(10, 8),
    network_availability NUMERIC(10, 8),
    time_value TIMESTAMP,
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50)
);
-- load data in this table 

	 truncate table public.telecom_data;

	COPY telecom_data (
    csv_id, area, shared_region, 
    lte_accessibility, lte_retainability, lte_intra_frequency_handover, 
    lte_inter_frequency_handover, volte_accessibility, volte_cssr, 
    network_availability, time_value, country, city, state, postal_code, region
) 
FROM 'D:\power Bi project\Telcome Analysis\DataSet\data_telecom.csv' 
WITH (FORMAT csv, HEADER, DELIMITER ',');