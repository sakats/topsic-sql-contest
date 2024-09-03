SELECT
    a.AGE_CODE AS "年齢コード",
    a.AGE_NAME AS "年齢階層名",
    SUM(s.SP_TIME_5) AS "5時間未満",
    SUM(s.SP_TIME_6) AS "5時間以上6時間未満",
    SUM(s.SP_TIME_7) AS "6時間以上7時間未満",
    SUM(s.SP_TIME_8) AS "7時間以上8時間未満",
    SUM(s.SP_TIME_9) AS "8時間以上9時間未満",
    SUM(s.SP_TIME_9OVER) AS "9時間以上"
FROM
    SLEEP_TIME_DTL AS s
    RIGHT OUTER JOIN AGE_GRP AS a ON a.AGE_CODE = s.AGE_CODE
    RIGHT OUTER JOIN PREFECTURE AS p ON p.PF_CODE = s.PF_CODE
WHERE
    p.PF_NAME in ("北海道","青森県","岩手県","宮城県","福島県")
GROUP BY
    a.AGE_CODE
ORDER BY
    a.AGE_CODE ASC