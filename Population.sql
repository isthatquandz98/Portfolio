Select * from world_population 
order by		country_name

-- Dân số các quốc gia trên thế giới năm 1950 và 2021
Select			wp1.Country_name, wp1.Year, wp1.Population, wp2.Year, wp2.population, (wp2.population - wp1.population) as "Chênh lệch"
From			world_population as wp1
Join			world_population as wp2
On				wp1.country_name = wp2.country_name
Where			wp1.year = 1950 and wp2.year = 2021

-- Dân số thế giới năm 2021 theo các châu lục
Select			Country_name, Year, Population
From			world_population
Where			Country_name like '%(UN)%' and Year = 2021
Order by		Population desc

-- Dân số Việt nam từ 1950 đến 2021
SELECT			Country_name, code,
				Year, Population,
				Population - LAG (Population) OVER (ORDER BY Country_name ASC) AS Population_growth
FROM			world_population
Where			Country_name like 'Vietnam'

-- Dân số dưới, trong và ngoài độ tuổi lao động của các quốc gia từ 2000 -2021
Select			Country_name, Year, ("Under the age of 1" + "Aged 1 to 4 years" + "Aged 5 to 9 years" + "Aged 10 to 14 years") as "Dưới độ tuổi lao động", 
				("Aged 15 to 19 years" + "Aged 20 to 29 years" + "Aged 30 to 39 years" + "Aged 40 to 49 years" + "Aged 50 to 59 years") as "Trong độ tuổi lao động",
				("Aged 60 to 69 years" + "Aged 70 to 79 years" + "Aged 80 to 89 years" + "Aged 90 to 99 years" + "Older than 100 years") as "Ngoài độ tuổi lao động"
From			world_population
Where			Year between 2000 and 2021
Order by		Country_name

-- Các quốc gia có dân số tuổi thọ cao hơn 100 tuổi
Select			Country_name, Year, "Older than 100 Years"
From			World_population
Where			"Older than 100 years" is not null
Order by		Country_name

-- Quốc gia nào có số người trên 100 tuổi cao nhất năm 2021
Select			Country_name, "Older than 100 years"
From			World_population
Where			Year = 2021 and "Older than 100 years" is not null and code is not null
Order by		"Older than 100 years" desc

-- Tình trạng dân số của các quốc gia năm 2021
-- Dân số già (độ tuổi trên 60 trên 7%, độ tuổi 0-14 dưới 35% )
-- Dân số trẻ (độ tuổi trên 60 dưới 7%, độ tuổi 0-14 trên 35% )
Select			Country_name,
				(Case	when (("Aged 60 to 69 years" + "Aged 70 to 79 years" + "Aged 80 to 89 years" + "Aged 90 to 99 years" + "Older than 100 years")/ Population)*100 >7 
						and (("Under the age of 1" + "Aged 1 to 4 years" + "Aged 5 to 9 years" + "Aged 10 to 14 years")/Population)*100 <35 Then 'Old population'
						When (("Aged 60 to 69 years" + "Aged 70 to 79 years" + "Aged 80 to 89 years" + "Aged 90 to 99 years" + "Older than 100 years")/ Population)*100 <7
						and (("Under the age of 1" + "Aged 1 to 4 years" + "Aged 5 to 9 years" + "Aged 10 to 14 years")/Population)*100 >35 Then 'Young population'
						Else 'Stable'
						End) as "Tình trạng dân số"
From			World_population
Where			Year = 2021
