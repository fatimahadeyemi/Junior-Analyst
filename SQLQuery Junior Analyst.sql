CREATE DATABASE ASKSQLProject;

SELECT *
FROM [dbo].[Junior Analyst SQL Project]

SELECT 
	FORMAT (Departure_Date, 'yyyy-MM') AS Months, Service_Category,
	SUM(Revenue) AS Total_Revenue
FROM [dbo].[Junior Analyst SQL Project]
GROUP BY FORMAT(Departure_Date, 'yyyy-MM'), Service_Category
ORDER BY Months;

SELECT 
	FORMAT(Departure_Date, 'yyyy-MM') AS Months, Service_Category, 
	SUM(Passengers) AS Total_Passengers
FROM [dbo].[Junior Analyst SQL Project]
GROUP BY FORMAT(Departure_Date, 'yyyy-MM'), Service_Category
ORDER BY Months;

SELECT 
	SUM(Passengers) AS Passengers_On_22_Jan_2019
FROM [dbo].[Junior Analyst SQL Project]
WHERE CAST(Departure_Date AS DATE) = '2019-01-22';

SELECT TOP 1 
	Departure_Date, 
	SUM(Revenue) AS Total_Revenue
FROM [dbo].[Junior Analyst SQL Project]
GROUP BY Departure_Date
ORDER BY Total_Revenue DESC;

SELECT 
	COUNT(Departure_Date) AS Days_Over_800k
FROM [dbo].[Junior Analyst SQL Project]
GROUP BY Departure_Date
HAVING SUM (Revenue) > '800000';

SELECT 
	FORMAT (Departure_Date, 'yyyy-MM') AS Months, 
	CASE 
		WHEN Service_Category IN ('Glasgow','Edinburgh') THEN 'Scotland'
		WHEN Service_Category IN ('Birmingham','Liverpool', 'Manchester', 'Kent','London') THEN 'England'
		ELSE 'Other'
			END AS Service_Category_Group,
		SUM (Revenue) AS Total_revenue
	FROM [dbo].[Junior Analyst SQL Project]
	GROUP BY 
	FORMAT (Departure_Date, 'yyyy-MM'), 
	CASE 
		WHEN Service_Category IN ('Glasgow','Edinburgh') THEN 'Scotland'
		WHEN Service_Category IN ('Birmingham','Liverpool', 'Manchester', 'Kent','London') THEN 'England'
		ELSE 'Other'
		END
	ORDER BY Months ASC;
