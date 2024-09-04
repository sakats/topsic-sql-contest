SELECT
    i.PORT_CODE AS "港コード",
    p.PORT_NAME AS "港名",
    entry.AMT AS "入国者数",
    exit.AMT AS "出国者数",
    entry.AMT - exit.AMT AS "差分"
FROM
    IMMIGRATION AS i
    JOIN PORT AS p ON p.PORT_CODE = i.PORT_CODE
    JOIN IMMIGRATION AS entry ON entry.PORT_CODE = i.PORT_CODE AND entry.KIND_CODE = 110
    JOIN IMMIGRATION AS exit ON exit.PORT_CODE = i.PORT_CODE AND exit.KIND_CODE = 120
    JOIN GRP AS g ON g.GROUP_CODE = i.GROUP_CODE AND g.GROUP_CODE = entry.GROUP_CODE AND g.GROUP_CODE = exit.GROUP_CODE
WHERE
    g.GROUP_NAME = "外国人"
    AND "差分" > 0
GROUP BY
    p.PORT_CODE
ORDER BY
    "差分" DESC,
    "港コード" DESC