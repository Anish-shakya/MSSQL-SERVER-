SELECT 
 CreationTime,
 -------------------------------------
 DAY(CreationTime) AS day,
 MONTH(CreationTime) As month,
 YEAR(CreationTime) AS year,
 --------------------------------------------
 DATEPART(YEAR,CreationTime) AS dp_year,
 DATEPART(MONTH,CreationTime) AS dp_month,
 DATEPART(QUARTER,CreationTime) AS dp_quarter,
 DATEPART(WEEK,CreationTime) AS dp_week,
 DATEPART(WEEKDAY,CreationTime) AS dp_weekday,
 -----------------------------------------------------
 DATENAME(MONTH,CreationTime) as dn_Monthname,
 DATENAME(WEEKDAY,CreationTime) AS dn_weekname,
 ------------------------------------------------------
 FORMAT(CreationTime,'MM-dd-yyyy') AS USD_Format,
 FORMAT(CreationTime,'dd-MM-yyyy') AS EURO_Format,
 FORMAT(CreationTime,'dd') AS dd,
 FORMAT(CreationTime,'ddd') AS ddd,
 FORMAT(CreationTime,'dddd') AS dddd,
 FORMAT(CreationTime,'MM') AS MM,
 FORMAT(CreationTime,'MMM') AS MMM,
 FORMAT(CreationTime,'MMMM') AS MMMM,
 FORMAT(CreationTime,'yy') AS yy,
 FORMAT(CreationTime,'yyyy') AS yyyy,
 FORMAT(CreationTime,'MMM-dd') AS month_date,
 FORMAT(CreationTime,'MMMM-dd') AS month_date,
 FORMAT(CreationTime,'yyyy-MM') AS year_month,
 FORMAT(CreationTime,'yyyy-MMM') AS year_month,
 FORMAT(CreationTime,'yyyy-MMMM') AS year_month,
 -----------------------------------------------------------
 'Day ' +
 FORMAT(CreationTime,'ddd MMM')+
 ' Q'+DATENAME(QUARTER,CreationTime)+' '+
 FORMAT(CreationTime,'yyyy HH:mm:ss tt') AS Custom_Format
FROM [SalesDB].[Sales].[Orders]
