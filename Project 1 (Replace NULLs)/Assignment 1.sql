CREATE TABLE HZL_Table (
    Date DATE,
    BU VARCHAR(10),
    Value INT
);

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

SELECT * FROM HZL_Table; --ORIGINAL

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
