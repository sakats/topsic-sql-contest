DELETE FROM
    EMP
WHERE
    EMP_CODE in (SELECT EMP_CODE FROM EMP_INVALID)
    AND VALID_FLG = '0'
