select * from Death_cause

-- Total deaths from 1990 - 2019?
Select Entity, Code, Year,
      [Meningitis]
      +[Alzheimer]
      +[Parkinson]
      +[Nutritional]
      +[Malaria]
      +[Drowning]
      +[Interpersonal violence]
      +[Maternal disorders]
      +[HIV/AIDS]
      +[Drug use disorders]
      +[Tuberculosis]
      +[Cardiovascular diseases]
      +[Lower respiratory infections]
      +[Neonatal disorders]
      +[Alcohol use disorders]
      +[Self-harm]
      +[Exposure to forces of nature]
      +[Diarrheal diseases]
      +[Environmental heat and cold exposure]
      +[Neoplasms]
      +[Conflict and terrorism]
      +[Diabetes mellitus]
      +[Chronic kidney disease]
      +[Poisonings]
      +[Protein-energy malnutrition]
      +[Road injuries]
      +[Chronic respiratory diseases]
      +[Cirrhosis and other chronic liver diseases]
      +[Digestive diseases]
      +[Fire, heat, and hot substances]
      +[Acute hepatitis] as Total_deaths
From Death_cause

-- Which countries has the highest number of deaths in 2019?
Select Entity, Code, Year,
      [Meningitis]
      +[Alzheimer]
      +[Parkinson]
      +[Nutritional]
      +[Malaria]
      +[Drowning]
      +[Interpersonal violence]
      +[Maternal disorders]
      +[HIV/AIDS]
      +[Drug use disorders]
      +[Tuberculosis]
      +[Cardiovascular diseases]
      +[Lower respiratory infections]
      +[Neonatal disorders]
      +[Alcohol use disorders]
      +[Self-harm]
      +[Exposure to forces of nature]
      +[Diarrheal diseases]
      +[Environmental heat and cold exposure]
      +[Neoplasms]
      +[Conflict and terrorism]
      +[Diabetes mellitus]
      +[Chronic kidney disease]
      +[Poisonings]
      +[Protein-energy malnutrition]
      +[Road injuries]
      +[Chronic respiratory diseases]
      +[Cirrhosis and other chronic liver diseases]
      +[Digestive diseases]
      +[Fire, heat, and hot substances]
      +[Acute hepatitis] as Total_deaths
From Death_cause
Where Year = 2019 and Code is not null and Entity != 'World'
Order by Total_deaths desc

-- What is the main cause of death for each country in 2019?
With cte1 as (
SELECT		Entity, Code, Year, Cause_of_Death, Number_of_deaths, 
			rank() over (partition by entity order by number_of_deaths desc) as ranking
FROM		Death_cause
UNPIVOT (
    Number_of_deaths FOR Cause_of_Death IN 
	  ([Meningitis]
      ,[Alzheimer]
      ,[Parkinson]
      ,[Nutritional]
      ,[Malaria]
      ,[Drowning]
      ,[Interpersonal violence]
      ,[Maternal disorders]
      ,[HIV/AIDS]
      ,[Drug use disorders]
      ,[Tuberculosis]
      ,[Cardiovascular diseases]
      ,[Lower respiratory infections]
      ,[Neonatal disorders]
      ,[Alcohol use disorders]
      ,[Self-harm]
      ,[Exposure to forces of nature]
      ,[Diarrheal diseases]
      ,[Environmental heat and cold exposure]
      ,[Neoplasms]
      ,[Conflict and terrorism]
      ,[Diabetes mellitus]
      ,[Chronic kidney disease]
      ,[Poisonings]
      ,[Protein-energy malnutrition]
      ,[Road injuries]
      ,[Chronic respiratory diseases]
      ,[Cirrhosis and other chronic liver diseases]
      ,[Digestive diseases]
      ,[Fire, heat, and hot substances]
      ,[Acute hepatitis])
) AS UnpivotedData
Where Year = 2019 and code is not null and Entity != 'world'
)

Select  Entity, Code, Year, Cause_of_Death, Number_of_deaths
From cte1
Where ranking = 1
order by Number_of_deaths desc

--

SELECT		Entity, Code, Year, Cause_of_Death, Number_of_deaths, 
			rank() over (partition by entity order by number_of_deaths desc) as ranking
FROM		Death_cause
UNPIVOT (
    Number_of_deaths FOR Cause_of_Death IN 
	  ([Meningitis]
      ,[Alzheimer]
      ,[Parkinson]
      ,[Nutritional]
      ,[Malaria]
      ,[Drowning]
      ,[Interpersonal violence]
      ,[Maternal disorders]
      ,[HIV/AIDS]
      ,[Drug use disorders]
      ,[Tuberculosis]
      ,[Cardiovascular diseases]
      ,[Lower respiratory infections]
      ,[Neonatal disorders]
      ,[Alcohol use disorders]
      ,[Self-harm]
      ,[Exposure to forces of nature]
      ,[Diarrheal diseases]
      ,[Environmental heat and cold exposure]
      ,[Neoplasms]
      ,[Conflict and terrorism]
      ,[Diabetes mellitus]
      ,[Chronic kidney disease]
      ,[Poisonings]
      ,[Protein-energy malnutrition]
      ,[Road injuries]
      ,[Chronic respiratory diseases]
      ,[Cirrhosis and other chronic liver diseases]
      ,[Digestive diseases]
      ,[Fire, heat, and hot substances]
      ,[Acute hepatitis])
) AS UnpivotedData
Where Year = 2019 and code is not null and Entity = 'Vietnam'