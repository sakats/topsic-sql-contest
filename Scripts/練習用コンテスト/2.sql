SELECT
    h.PF_CODE AS '都道府県コード',
    p.PF_NAME AS '都道府県名',
    ROUND(CAST(h.INP_YES AS FLOAT) / (h.INP_YES + h.INP_NO + h.UNIDENTIFIED) * 100,1) AS '入院率'
FROM
    HOSPITALIZATION AS h
    JOIN PREFECTURE AS p ON h.PF_CODE = p.PF_CODE
ORDER BY
    "入院率" DESC,
    "都道府県コード" ASC;