
-- Create Table
CREATE TABLE riders_data (
    Date DATE,
    Season TINYINT,
    Year SMALLINT,
    Month TINYINT,
    Hour TINYINT,
    holiday BOOLEAN,
    weekday TINYINT,
    workingday BOOLEAN,
    weathersit TINYINT,
    wemp DECIMAL(5,2),
    atemp DECIMAL(5,2),
    hum DECIMAL(5,2),
    windspeed DECIMAL(5,2),
    rider_type VARCHAR(20),
    riders INT
);

ALTER TABLE riders_data
MODIFY Date DATE,
MODIFY Season TINYINT,
MODIFY Year SMALLINT,
MODIFY Month TINYINT,
MODIFY Hour TINYINT,
MODIFY Holiday BOOLEAN,
MODIFY Weekday TINYINT,
MODIFY Workingday BOOLEAN,
MODIFY Weathersit TINYINT,
MODIFY Temp DECIMAL(5,2),
MODIFY Atemp DECIMAL(5,2),
MODIFY Hum DECIMAL(5,2),
MODIFY Windspeed DECIMAL(5,2),
MODIFY Rider_type VARCHAR(20),
MODIFY Riders INT;

CREATE TABLE riders_data2 (
    Date DATE,
    Season TINYINT,
    Year SMALLINT,
    Month TINYINT,
    Hour TINYINT,
    holiday BOOLEAN,
    weekday TINYINT,
    workingday BOOLEAN,
    weathersit TINYINT,
    wemp DECIMAL(5,2),
    atemp DECIMAL(5,2),
    hum DECIMAL(5,2),
    windspeed DECIMAL(5,2),
    rider_type VARCHAR(20),
    riders INT
);

ALTER TABLE riders_data2
MODIFY Date DATE,
MODIFY Season TINYINT,
MODIFY Year SMALLINT,
MODIFY Month TINYINT,
MODIFY Hour TINYINT,
MODIFY Holiday BOOLEAN,
MODIFY Weekday TINYINT,
MODIFY Workingday BOOLEAN,
MODIFY Weathersit TINYINT,
MODIFY Temp DECIMAL(5,2),
MODIFY Atemp DECIMAL(5,2),
MODIFY Hum DECIMAL(5,2),
MODIFY Windspeed DECIMAL(5,2),
MODIFY Rider_type VARCHAR(20),
MODIFY Riders INT;

ALTER TABLE riders_data
RENAME COLUMN Season TO season;

CREATE TABLE cost_table (
    Year SMALLINT,
    Cost DECIMAL(5,2),
    COGS DECIMAL(5,2))
ALTER TABLE cost_table
CHANGE Cost price DECIMAL(5,2),
CHANGE COGS cogs DECIMAL(5,2)

-- Union and Join
WITH cte AS (
    SELECT * FROM riders_data
    UNION ALL
    SELECT * FROM riders_data2
)
SELECT 
    a.Date, 
    a.season,
    a.Year,
    a.weekday,
    a.hour,
    a.rider_type,	
    a.riders,
    b.price,
    b.cogs,
    riders * price as Revenue,
    riders * price - cogs as profit
FROM cte a
LEFT JOIN cost_table b
ON a.Year = b.year;

CREATE VIEW final_dataset AS
SELECT 
    a.Date,
    a.season,
    a.Year,
    a.weekday,
    a.hour,
    a.rider_type,
    a.riders,
    b.price,
    b.cogs,
    (a.riders * b.price) AS revenue,
    (a.riders * b.price - b.cogs) AS profit
FROM (
    SELECT * FROM riders_data
    UNION ALL
    SELECT * FROM riders_data2
) a
LEFT JOIN cost_table b
ON a.Year = b.year;
