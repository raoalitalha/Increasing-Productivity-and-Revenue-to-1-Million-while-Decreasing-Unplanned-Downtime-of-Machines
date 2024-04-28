-- Counting the total number of rows in the table "Machine_Downtime"
SELECT 
	count(*)
FROM
	machine_downtime
-----
-- Counting the total number of 'Columns' in the table "Machine_Downtime"
SELECT count(*)
FROM information_schema.columns
WHERE table_name = 'machine_downtime';

------------------------	

	
	
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
 WHERE table_name = 'machine_downtime';
 The data shows that there are 16 Feattures(columns) in the table. 1 is date column. Three are text or varchar. 10 columns are float or integer or numeric

---------------------------
--Checking is there is any duplicate rows in the dataset
SELECT 
	DISTINCT COUNT (*)
FROM
	machine_downtime

---------------
--Counting the total number of 'Years' data in the 'table'
SELECT COUNT(DISTINCT EXTRACT(YEAR FROM Date)) AS total_years
FROM machine_downtime;

-------------
--Counting the total number of 'Months' data in the 'table'

SELECT COUNT(DISTINCT EXTRACT(MONTH FROM Date)) AS total_months
FROM machine_downtime;	

--------------------------
-- Counting the number of months in each year
SELECT EXTRACT(YEAR FROM Date) AS year,
       COUNT(DISTINCT EXTRACT(MONTH FROM Date)) AS months_in_year,
	   Count(EXTRACT(DAY FROM DATE)) AS days_in_year
FROM machine_downtime
GROUP BY EXTRACT(YEAR FROM Date)
ORDER BY year;

-- Calculating the total months across all years
SELECT SUM(months_in_year) AS total_months
FROM (
    SELECT EXTRACT(YEAR FROM Date) AS year,
           COUNT(DISTINCT EXTRACT(MONTH FROM Date)) AS months_in_year
    FROM machine_downtime
    GROUP BY EXTRACT(YEAR FROM Date)
) AS subquery;

	
	

-- Now we will run statistical analysis on all the Numerical values "columns" first , The goal is to find the following:
-- 1 . Min Value
-- 2 . Max Value
-- 3 . Average /Mean
-- 4 . Sum
-- 5 . Standard Deviation
-- 6 . Variance
-- 7 . Median
-- 8 . Mode

SELECT
    COUNT(*) AS count,
    MIN(Hydraulic_Pressure) AS min_Hydraulic_Pressure,
    MAX(Hydraulic_Pressure) AS max_Hydraulic_Pressure,
    AVG(Hydraulic_Pressure) AS avg_Hydraulic_Pressure,
    SUM(Hydraulic_Pressure) AS sum_Hydraulic_Pressure,
    STDDEV(Hydraulic_Pressure) AS stddev_Hydraulic_Pressure,
    VARIANCE(Hydraulic_Pressure) AS variance_Hydraulic_Pressure,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Hydraulic_Pressure) AS median_Hydraulic_Pressure,
    MODE() WITHIN GROUP (ORDER BY Hydraulic_Pressure) AS mode_Hydraulic_Pressure
FROM machine_downtime;

SELECT
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Hydraulic_Pressure) AS q1,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Hydraulic_Pressure) AS median,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Hydraulic_Pressure) AS q3,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Hydraulic_Pressure) - 1.5 * (PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Hydraulic_Pressure) - PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Hydraulic_Pressure)) AS lower_bound,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Hydraulic_Pressure) + 1.5 * (PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Hydraulic_Pressure) - PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Hydraulic_Pressure)) AS upper_bound
FROM machine_downtime;



SELECT Hydraulic_Pressure
FROM machine_downtime
WHERE Hydraulic_Pressure < 1.26 OR Hydraulic_Pressure > 201.51;


--------------------






SELECT
    COUNT(*) AS count,
    MIN(Coolant_Pressure) AS min_Coolant_Pressure,
    MAX(Coolant_Pressure) AS max_Coolant_Pressure,
    AVG(Coolant_Pressure) AS avg_Coolant_Pressure,
    SUM(Coolant_Pressure) AS sum_Coolant_Pressure,
    STDDEV(Coolant_Pressure) AS stddev_Coolant_Pressure,
    VARIANCE(Coolant_Pressure) AS variance_Coolant_Pressure,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Coolant_Pressure) AS median_Coolant_Pressure,
    MODE() WITHIN GROUP (ORDER BY Coolant_Pressure) AS mode_Coolant_Pressure
FROM machine_downtime;

SELECT
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Coolant_Pressure) AS q1,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Coolant_Pressure) AS median,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Coolant_Pressure) AS q3,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Coolant_Pressure) - 1.5 * (PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Coolant_Pressure) - PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Coolant_Pressure)) AS lower_bound,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Coolant_Pressure) + 1.5 * (PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Coolant_Pressure) - PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Coolant_Pressure)) AS upper_bound
FROM machine_downtime;


SELECT Coolant_Pressure
FROM machine_downtime
WHERE Coolant_Pressure < 2.054 OR Coolant_Pressure > 8.276;

---------------
SELECT
    COUNT(*) AS count,
    MIN(Coolant_Temperature) AS min_Coolant_Temperature,
    MAX(Coolant_Temperature) AS max_Coolant_Temperature,
    AVG(Coolant_Temperature) AS avg_Coolant_Temperature,
    SUM(Coolant_Temperature) AS sum_Coolant_Temperature,
    STDDEV(Coolant_Pressure) AS stddev_Coolant_Temperature,
    VARIANCE(Coolant_Pressure) AS variance_Coolant_Temperature,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Coolant_Temperature) AS median_Coolant_Temperature,
    MODE() WITHIN GROUP (ORDER BY Coolant_Temperature) AS mode_Coolant_Temperature
FROM machine_downtime;



SELECT
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Coolant_Temperature) AS q1,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Coolant_Temperature) AS median,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Coolant_Temperature) AS q3,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Coolant_Temperature) - 1.5 * (PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Coolant_Temperature) - PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Coolant_Temperature)) AS lower_bound,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Coolant_Temperature) + 1.5 * (PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Coolant_Temperature) - PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Coolant_Temperature)) AS upper_bound
FROM machine_downtime;

SELECT Coolant_Temperature
FROM machine_downtime
WHERE Coolant_Temperature < -12.4 OR Coolant_Temperature > 48.4;

---------------
SELECT
    COUNT(*) AS count,
    MIN(Air_System_Pressure) AS min_Air_System_Pressure,
    MAX(Air_System_Pressure) AS max_Air_System_Pressure,
    AVG(Air_System_Pressure) AS avg_Air_System_Pressure,
    SUM(Air_System_Pressure) AS sum_Air_System_Pressure,
    STDDEV(Air_System_Pressure) AS stddev_Air_System_Pressure,
    VARIANCE(Air_System_Pressure) AS variance_Air_System_Pressure,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Air_System_Pressure) AS median_Air_System_Pressure,
    MODE() WITHIN GROUP (ORDER BY Air_System_Pressure) AS mode_Air_System_Pressure
FROM machine_downtime;


SELECT
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Air_System_Pressure) AS q1,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Air_System_Pressure) AS median,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Air_System_Pressure) AS q3,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Air_System_Pressure) - 1.5 * (PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Air_System_Pressure) - PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Air_System_Pressure)) AS lower_bound,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Air_System_Pressure) + 1.5 * (PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY Air_System_Pressure) - PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY Air_System_Pressure)) AS upper_bound
FROM machine_downtime;


SELECT Air_System_Pressure
FROM machine_downtime
WHERE Air_System_Pressure < 5.374 OR Air_System_Pressure > 7.624;


-----------





-----------
SELECT
    COUNT(*) AS count,
    MIN(Hydraulic_Oil_Temperature) AS min_Hydraulic_Oil_Temperature,
    MAX(Hydraulic_Oil_Temperature) AS max_Hydraulic_Oil_Temperature,
    AVG(Hydraulic_Oil_Temperature) AS avg_Hydraulic_Oil_Temperature,
    SUM(Hydraulic_Oil_Temperature) AS sum_Hydraulic_Oil_Temperature,
    STDDEV(Hydraulic_Oil_Temperature) AS stddev_Hydraulic_Oil_Temperature,
    VARIANCE(Hydraulic_Oil_Temperature) AS variance_Hydraulic_Oil_Temperature,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Hydraulic_Oil_Temperature) AS median_Hydraulic_Oil_Temperature,
    MODE() WITHIN GROUP (ORDER BY Hydraulic_Oil_Temperature) AS mode_Hydraulic_Oil_Temperature
FROM machine_downtime;

---------------------------

SELECT
    COUNT(*) AS count,
    MIN(Spindle_Bearing_Temperature) AS min_Spindle_Bearing_Temperature,
    MAX(Spindle_Bearing_Temperature) AS max_Spindle_Bearing_Temperature,
    AVG(Spindle_Bearing_Temperature) AS avg_Spindle_Bearing_Temperature,
    SUM(Spindle_Bearing_Temperature) AS sum_Spindle_Bearing_Temperature,
    STDDEV(Spindle_Bearing_Temperature) AS stddev_Spindle_Bearing_Temperature,
    VARIANCE(Spindle_Bearing_Temperature) AS variance_Spindle_Bearing_Temperature,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Spindle_Bearing_Temperature) AS median_Spindle_Bearing_Temperature,
    MODE() WITHIN GROUP (ORDER BY Spindle_Bearing_Temperature) AS mode_Spindle_Bearing_Temperature
FROM machine_downtime;

----------------------

SELECT
    COUNT(*) AS count,
    MIN(Spindle_Vibration) AS min_Spindle_Vibration,
    MAX(Spindle_Vibration) AS max_Spindle_Vibration,
    AVG(Spindle_Vibration) AS avg_Spindle_Vibration,
    SUM(Spindle_Vibration) AS sum_Spindle_Vibration,
    STDDEV(Spindle_Vibration) AS stddev_Spindle_Vibration,
    VARIANCE(Spindle_Vibration) AS variance_Spindle_Vibration,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Spindle_Vibration) AS median_Spindle_Vibration,
    MODE() WITHIN GROUP (ORDER BY Spindle_Vibration) AS mode_Spindle_Vibration
FROM machine_downtime;

--------------------------------------------


SELECT
    COUNT(*) AS count,
    MIN(Tool_Vibration) AS min_Tool_Vibration,
    MAX(Tool_Vibration) AS max_Tool_Vibration,
    AVG(Tool_Vibration) AS avg_Tool_Vibration,
    SUM(Tool_Vibration) AS sum_Tool_Vibration,
    STDDEV(Tool_Vibration) AS stddev_Tool_Vibration,
    VARIANCE(Tool_Vibration) AS variance_Tool_Vibration,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Tool_Vibration) AS median_Tool_Vibration,
    MODE() WITHIN GROUP (ORDER BY Tool_Vibration) AS mode_Tool_Vibration
FROM machine_downtime;

---------------------------------------------------------------------------------

SELECT
    COUNT(*) AS count,
    MIN(Spindle_Speed) AS min_Spindle_Speed,
    MAX(Spindle_Speed) AS max_Spindle_Speed,
    AVG(Spindle_Speed) AS avg_Spindle_Speed,
    SUM(Spindle_Speed) AS sum_Spindle_Speed,
    STDDEV(Spindle_Speed) AS stddev_Spindle_Speed,
    VARIANCE(Spindle_Speed) AS variance_Spindle_Speed,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Spindle_Speed) AS median_Spindle_Speed,
    MODE() WITHIN GROUP (ORDER BY Spindle_Speed) AS mode_Spindle_Speed
FROM machine_downtime;

------------------------------------------------------------------------

SELECT
    COUNT(*) AS count,
    MIN(Voltage) AS min_Voltage,
    MAX(Voltage) AS max_Voltage,
    AVG(Voltage) AS avg_Voltage,
    SUM(Voltage) AS sum_Voltage,
    STDDEV(Voltage) AS stddev_Voltage,
    VARIANCE(Voltage) AS variance_Voltage,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Voltage) AS median_Voltage,
    MODE() WITHIN GROUP (ORDER BY Voltage) AS mode_Voltage
FROM machine_downtime;

---------------------------------------------------------------------

SELECT
    COUNT(*) AS count,
    MIN(Torque) AS min_Torque,
    MAX(Torque) AS max_Torque,
    AVG(Torque) AS avg_Torque,
    SUM(Torque) AS sum_Torque,
    STDDEV(Torque) AS stddev_Torque,
    VARIANCE(Torque) AS variance_Torque,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Torque) AS median_Torque,
    MODE() WITHIN GROUP (ORDER BY Torque) AS mode_Torque
FROM machine_downtime;

--------------------------------------------------------------------------------








-- We have 3 column which are varchar datatype.

--Frequency distribution in "Machine_ID" column  
SELECT machine_id, COUNT(*) AS Frequency
FROM machine_downtime
GROUP BY machine_id
ORDER BY Frequency DESC;
-------
--Unique Values in "machine_id" column

SELECT COUNT(DISTINCT machine_id) AS unique_category_count
FROM machine_downtime;

--------
-- Mode in the "machine_id" column

SELECT MODE() WITHIN GROUP (ORDER BY machine_id) AS mode_category
FROM machine_downtime;

----
--Checking NULL VALUES in "machine_id"

SELECT COUNT(CASE WHEN machine_id IS NULL THEN 1 ELSE NULL END) AS missing_category_count
FROM machine_downtime;


------------------
 --Frequency distribution in "Assembly_Line_No" column
 
SELECT assembly_line_no, COUNT(*) AS Frequency
FROM machine_downtime
GROUP BY 1
ORDER BY 2 DESC;


-------------------------
-- Unique Values in "assembly_line_no" column
SELECT 
	COUNT(DISTINCT assembly_line_no ) AS unique_values
FROM 
	machine_downtime
	
-----------------------------------------

----Checkin Mode

SELECT MODE() WITHIN GROUP (ORDER BY assembly_line_no) as mode_value
FROM machine_downtime


------

SELECT count (CASE WHEN assembly_line_no is NULL THEN 1 ELSE NULL END) AS missing_category_count
FROM
machine_downtime



-----

SELECT   date, machine_id, count(downtime)
FROM
machine_downtime
WHERE downtime = 'Machine_Failure'
GROUP BY 1, 2
ORDER BY 1, 3 DESC




-------
SELECT
	EXTRACT (YEAR from DATE), machine_id, count(downtime)
FROM
	machine_downtime
WHERE 
	downtime = 'Machine_Failure'
GROUP BY 1, 2
ORDER BY 1, 3 DESC


------

--The dates and machine_id when machine failed at the lowest "Hydraulic Pressure"

SELECT
date, machine_id, MIN (Hydraulic_Pressure) AS Min_Hyd_Presure
FROM
machine_downtime
WHERE
	downtime = 'Machine_Failure'
GROUP BY 
	1, machine_id
	
	
	
	
-----------------------------
--The dates and machine_id when machine failed at the Highest "Hydraulic Pressure"

SELECT
date, machine_id, MAX (Hydraulic_Pressure) AS Max_Hyd_Presure
FROM
machine_downtime
WHERE
	downtime = 'Machine_Failure'
GROUP BY 
	1, machine_id
LIMIT 10