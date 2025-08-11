-- Select all rows and columns from the cafe_sales table
select * from cafe_sales;

-- Count the total number of rows in the 'cafe_sales' table
select count(*) from cafe_sales;

-- Create a new table 'cafe_sales2' with the same structure as 'cafe_sales'
create table cafe_sales2 like cafe_sales;

--  Select all rows and columns from the newly created 'cafe_sales2' table
select * from cafe_sales2;

-- Count the total number of rows in 'cafe_sales2'
   select count(*) cafe_sales2; 

-- Insert all rows from 'cafe_sales' into 'cafe_sales2'  (copies the entire dataset into the new table)
   insert into cafe_sales2 select * from cafe_sales;
   
   
   -- RENAMING COLUMNS
ALTER TABLE cafe_sales2 
RENAME COLUMN `TransactIon ID` TO TransactIon_ID;    --  rename  column

ALTER TABLE cafe_sales2
RENAME COLUMN `Price Per Unit` TO Price_per_unit;       --  rename  column


ALTER TABLE cafe_sales2
RENAME COLUMN `Total Spent` TO TOTAL_SPENT;       --  rename  column



ALTER TABLE cafe_sales2
RENAME COLUMN `PAYMENT METHOD` TO PAYMENT_METHOD;    --  rename  column



ALTER TABLE cafe_sales2
RENAME COLUMN `TRANSACTION DATE` TO TRANSACTION_DATE;     --  rename  column

-- Count how many NULL or blank values exist in each column
SELECT
    SUM(CASE WHEN Transaction_ID IS NULL OR Transaction_ID = '' THEN 1 ELSE 0 END) AS Transaction_ID_Nulls,
    SUM(CASE WHEN Item IS NULL OR Item = '' THEN 1 ELSE 0 END) AS Item_Nulls,
    SUM(CASE WHEN Quantity IS NULL OR Quantity = '' THEN 1 ELSE 0 END) AS Quantity_Nulls,
    SUM(CASE WHEN Price_Per_Unit IS NULL OR Price_Per_Unit = '' THEN 1 ELSE 0 END) AS Price_Per_Unit_Nulls,
    SUM(CASE WHEN Total_Spent IS NULL OR Total_Spent = '' THEN 1 ELSE 0 END) AS Total_Spent_Nulls,
    SUM(CASE WHEN Payment_Method IS NULL OR Payment_Method = '' THEN 1 ELSE 0 END) AS Payment_Method_Nulls,
    SUM(CASE WHEN Location IS NULL OR Location = '' THEN 1 ELSE 0 END) AS Location_Nulls,
    SUM(CASE WHEN Transaction_Date IS NULL OR CAST(Transaction_Date AS CHAR) = '' THEN 1 ELSE 0 END) AS Transaction_Date_Nulls
FROM cafe_sales2;

-- Convert blank or 'UNKNOWN' payment method values into NULL
UPDATE cafe_sales2
SET `Payment_Method` = NULL
WHERE `Payment_Method` = '' OR `Payment_Method` = 'UNKNOWN';

-- Replace blank or NULL location values with 'Unknown'
UPDATE cafe_sales2
SET `Location` = 'Unknown'
WHERE `Location` IS NULL OR `Location` = '';

-- Set blank transaction dates to NULL (for later cleaning)
UPDATE cafe_sales2
SET `Transaction_Date` = NULL
WHERE `Transaction_Date` = '';
	

--  Replace NULL or blank items with 'Unknown Item'
UPDATE cafe_sales2
SET `Item` = 'Unknown Item'
WHERE `Item` IS NULL OR `Item` = '';

UPDATE cafe_sales2
SET `Payment_Method` = 'Unknown'
WHERE `Payment_Method` IS NULL OR `Payment_Method` = '';

-- Replace NULL payment methods with 'Unknown'
UPDATE cafe_sales2
SET `tOTAL_SPENT` = 'Unknown'
WHERE `tOTAL_SPENT` IS NULL OR `TOTAL_SPENT` = '';

-- Replace NULL total spent values with 'Unknown'
UPDATE cafe_sales2
SET `TRANSACTION_DATE` = 'Unknown'
WHERE `TRANSACTION_DATE` IS NULL OR `TRANSACTION_DATE` = '';


select * from cafe_sales2;

-- Check all rows that still have missing or invalid values
SELECT *
FROM cafe_sales2
WHERE 
    `Transaction_ID` IS NULL OR `Transaction_ID` = '' OR
    `Item` IS NULL OR `Item` = '' OR
    `Quantity` IS NULL OR `Quantity` = '' OR
    `Price_Per_Unit` IS NULL OR `Price_Per_Unit` = '' OR
    `Total_Spent` IS NULL OR `Total_Spent` = '' OR
    `Payment_Method` IS NULL OR `Payment_Method` = '' OR
    `Location` IS NULL OR `Location` = '' OR
    `Transaction_Date` IS NULL OR 
    CAST(`Transaction_Date` AS CHAR) = '0000-00-00' OR
    CAST(`Transaction_Date` AS CHAR) IN ('ERROR', 'Unknown');


    -- Show table structure (column names, data types, etc.)
    DESCRIBE cafe_sales2;
    

-- Change the `TRANSACTION_DATE` column to DATE type
ALTER TABLE cafe_sales2
MODIFY TRANSACTION_DATE DATE;


-- Delete rows with NULL, blank, 'ERROR', or 'UNKNOWN' transaction dates
  DELETE FROM cafe_sales2
WHERE TRANSACTION_DATE IS NULL
   OR TRIM(TRANSACTION_DATE) = ''
   OR UPPER(TRIM(TRANSACTION_DATE)) IN ('ERROR', 'UNKNOWN');
   

-- View all cleaned data
SELECT * FROM cafe_sales2;

-- Count total number of rows after cleaning
SELECT COUNT(*) FROM Cafe_sales2;







