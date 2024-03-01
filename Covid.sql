select *
from Covid_death
Where continent is not null
Order by location, date

select *
from Covid_vaccinated
Where continent is not null
Order by location, date


-- Tổng số ca nhiễm (total_cases), số ca tử vong (total_deaths) trên thế giới theo từng quốc gia và Việt Nam
Select		Location, max(date) as "Ngày ghi nhận cuối", max(total_cases) as "Tổng số ca nhiễm" , max(total_deaths) as "Tổng số ca tử vong"
From		Covid_death
Where		continent is not null
Group by	Location
Order by	Location
---------------------------------
Select		Location, max(date) as "Ngày ghi nhận cuối", max(total_cases) as "Tổng số ca nhiễm" , max(total_deaths) as "Tổng số ca tử vong"
From		Covid_death
Where		location like 'Vietnam' and continent is not null
Group by	Location
Order by	Location

-- So sánh tổng số ca nhiễm và dân số của các nước

Select		Location, max(total_cases) as "Tổng số ca nhiễm" , population as "Dân số", 
			(max(total_cases)/population)*100 as "Tỷ lệ mắc Covid"
From		Covid_death
Where		"total_cases" is not null
Group by	Location, population
Order by	Location

--  Nước có tỷ lệ ca nhiễm và tỷ lệ tử vong cao nhất
Select		Location, max(total_cases) as "Tổng số ca nhiễm", Max(total_deaths) as "Tổng số ca tử vong"
From		Covid_death
Where		continent is not null
Group by	Location
Order by	max(total_cases) desc, Max(total_deaths) desc

-- Châu lục có tỷ lệ tử vong cao nhất do Covid
Select		Continent, max(date) as "Ngày cập nhật cuối", max(total_cases) as "Tổng số ca nhiễm", Max(total_deaths) as "Tổng số ca tử vong"
From		Covid_death
Group by	continent
Order by	max(total_cases) desc, Max(total_deaths) desc

-- Bao nhiêu người dã được tiêm vaccine? 
Select		CD.Location, CD.Population, Max(CV.people_vaccinated) as "Số người được tiêm vaccine",
			Max(CV.people_vaccinated)/(CD.Population)*100 as "Tỷ lệ tiêm vaccine"
From		Covid_death as CD
Join		Covid_vaccinated as CV
on			CD.location = CV.location and CD.date = CV.date
Group by	CD.Location, CD.Population
