Select *
From CovidDeaths

-- Tableau Data Visualization Queries
-- These numbers are according to the data about Covid-19 till 26-07-2021

-- 1) Global numbers 
select SUM(new_cases) as Total_cases, SUM(cast(new_deaths as int)) as Total_deaths,
SUM(cast(new_deaths as int))/SUM(new_cases) * 100 as DeathPercentage
from DAProject..CovidDeaths
where continent is not null
order by 1,2

-- 2) Total Deaths per Continent
select location, SUM(cast(new_deaths as int)) as TotalDeathCount
from DAProject..CovidDeaths
where continent is null
and location not in ('World', 'European Union', 'International')
group by location
order by TotalDeathCount desc

-- 3) Population Infected Percent per Country
select location, population, MAX(total_cases) as HighestInfectionCount, 
MAX((total_cases/population))*100 as PercentPopulationInfected
from DAProject..CovidDeaths
group by location, population
order by PercentPopulationInfected desc

-- 4) Population Infected Percent (Time Series)
select location, population, date, MAX(total_cases) as HighestInfectionCount, 
MAX((total_cases/population))*100 as PercentPopulationInfected
from DAProject..CovidDeaths
group by location, population, date
order by PercentPopulationInfected desc