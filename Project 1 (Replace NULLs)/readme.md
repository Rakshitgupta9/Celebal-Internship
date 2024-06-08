# Project: Replace NULL Values in SQL Table

## Overview

This project involves creating a SQL script to handle the replacement of `NULL` values in a table with the previous non-`NULL` value within the same business unit (BU). This script ensures data consistency by propagating the last known non-`NULL` value within each BU when subsequent entries have `NULL` values.

## Table Structure

The table `HZL_Table` contains the following columns:
- `Date` (DATE): The date of the entry.
- `BU` (VARCHAR(10)): The business unit.
- `Value` (INT): The value which may contain `NULL`.

## Steps

1. **Create the Table:**
    ```sql
    CREATE TABLE HZL_Table (
        Date DATE,
        BU VARCHAR(10),
        Value INT
    );
    ```

2. **Insert Data into the Table:**
    ```sql
    INSERT INTO HZL_Table (Date, BU, Value) VALUES
    ('2024-01-01', 'hzl', 3456),
    ('2024-02-01', 'hzl', NULL),
    ('2024-03-01', 'hzl', NULL),
    ('2024-04-01', 'hzl', NULL),
    ('2024-01-01', 'SC', 32456),
    ('2024-02-01', 'SC', NULL),
    ('2024-03-01', 'SC', NULL),
    ('2024-04-01', 'SC', NULL),
    ('2024-05-01', 'SC', 345),
    ('2024-06-01', 'SC', NULL);
    ```

3. **Replace `NULL` Values:**
    ```sql
    WITH CTE AS (
        SELECT
            Date,
            BU,
            Value,
            ROW_NUMBER() OVER (PARTITION BY BU ORDER BY Date) AS RN
        FROM
            HZL_Table
    ),
    RECURSIVE_CTE AS (
        SELECT
            Date,
            BU,
            Value,
            RN
        FROM
            CTE
        WHERE
            Value IS NOT NULL
        UNION ALL
        SELECT
            CTE.Date,
            CTE.BU,
            COALESCE(CTE.Value, RECURSIVE_CTE.Value) AS Value,
            CTE.RN
        FROM
            CTE
        JOIN
            RECURSIVE_CTE ON CTE.BU = RECURSIVE_CTE.BU AND CTE.RN = RECURSIVE_CTE.RN + 1
        WHERE
            CTE.Value IS NULL
    )
    SELECT
        Date,
        BU,
        Value
    FROM
        RECURSIVE_CTE
    ORDER BY
        BU,
        Date,
        RN;
    ```

## Usage

Run the above SQL script in your preferred SQL environment to create the table, insert data, and replace `NULL` values. The script will ensure that all `NULL` values in the `Value` column are replaced by the previous non-`NULL` value within the same business unit (BU).

## Contact

If you have any questions or suggestions, feel free to reach out to me at:
- **Name**: Rakshit Gupta
- **ID**: CT_CSI_SQ_4156
- **Email**: guptarakshit9858@gmail.com
- **LinkedIn**: [Rakshit Gupta](https://www.linkedin.com/in/rakshit9/)
