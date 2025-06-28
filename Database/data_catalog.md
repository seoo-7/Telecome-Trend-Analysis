## Data Catalog: `public.telecom_data`

This table stores daily telecom network performance metrics across various geographic regions.

| Column Name                       | Data Type            | Description                                                                                                                                            |
|-----------------------------------|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| **id**                            | SERIAL (PK)          | Surrogate primary key for each record.                                                                                                                 |
| **csv_id**                        | INTEGER              | Original row identifier from the source CSV file.                                                                                                      |
| **area**                          | VARCHAR(50)          | Name or code of the network area or cell sector.                                                                                                       |
| **shared_region**                 | INTEGER              | Numeric code representing a shared region grouping.                                                                                                    |
| **lte_accessibility**             | NUMERIC(10,8)        | The percentage of successful attempts by devices to connect to the 4G/LTE network. High values indicate strong user access to high-speed mobile internet. |
| **lte_retainability**             | NUMERIC(10,8)        | The network’s ability to maintain active LTE connections without unexpected drops. High values mean fewer call drops or buffering events.              |
| **lte_intra_frequency_handover**  | NUMERIC(10,8)        | Success rate when a device switches between cell towers on the same frequency band, important for seamless mobility in uniform-frequency areas.        |
| **lte_inter_frequency_handover**  | NUMERIC(10,8)        | Success rate when a device switches between cell towers on different frequency bands, critical for handovers across varied coverage zones.             |
| **volte_accessibility**           | NUMERIC(10,8)        | Percentage of times devices successfully access VoLTE (voice over LTE) when placing a call. Indicates voice coverage quality on 4G networks.           |
| **volte_cssr**                    | NUMERIC(10,8)        | VoLTE Call Setup Success Rate: percentage of VoLTE call setups that complete successfully. Directly impacts voice experience.                         |
| **network_availability**          | NUMERIC(10,8)        | Percentage uptime of the telecom network—i.e., the proportion of time services are operational without outage.                                         |
| **time_value**                    | TIMESTAMP            | Timestamp of the measurement, indicating the date (and optionally time) for each KPI record.                                                           |
| **country**                       | VARCHAR(100)         | Country in which the measurement was recorded (e.g., "USA").                                                                                          |
| **city**                          | VARCHAR(100)         | City name for the KPI measurement.                                                                                                                     |
| **state**                         | VARCHAR(100)         | State or province where the city is located.                                                                                                           |
| **postal_code**                   | VARCHAR(20)          | Postal code corresponding to the measurement location.                                                                                                 |
| **region**                        | VARCHAR(50)          | Named region grouping (e.g., "Northeast", "Midwest").                                                                                               |
