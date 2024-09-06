INSERT INTO
    CONVENI_SALE_2018
SELECT
    SURVEY_YEAR,
    PF_CODE,
    TOTAL_VALUE
FROM
    CONVENIENCE
WHERE
    SURVEY_YEAR = '2018'
    AND KIND_CODE = '100'
    AND TOTAL_VALUE IS NOT NULL
