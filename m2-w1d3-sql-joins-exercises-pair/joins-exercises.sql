-- Write queries to return the following:
-- The following queries utilize the "world" database.

-- 1. The city name, country name, and city population of all cities in Europe with population greater than 1 million
--    Expected rows: 36

select name, country, population
from city cit
join country c on cit.countrycode = c.code
where population >= 1000000 and continent = 'europe'

-- 2. The city name, country name, and city population of all cities in countries where French is an official language and the city population is greater than 1 million
--    Expected rows: 2

select cit.name, c.name, cit.population
from city cit
join country c on c.code = cit.countrycode
join countrylanguage cl on cl.countrycode = cit.countrycode
where cit.population > 1000000  and cl.isofficial = 'true' and cl.language = 'french'

-- 3. The name of the countries and continents where the language Javanese is spoken
--    Expected rows: 1

select c.name, c.continent
from country c
join countrylanguage cl on cl.countrycode = c.code
where cl.language = 'javanese'

-- 4. The names of all of the countries in Africa that speak French as an official language
--    Expected rows: 5

select c.name, language from country c
join countrylanguage cl on c.code = cl.countrycode
where continent = 'africa' and cl.isofficial = 'true' and cl.language = 'french'

-- 5. The average city population of cities in Europe
--    Expected: 287,684

select avg(cit.population) avg_population
from city cit
join country c on c.code = cit.countrycode
where c.continent = 'europe'


-- 6. The average city population of cities in Asia
--    Expected: 395,019

select avg(cit.population) avg_population
from city cit
join country c on c.code = cit.countrycode
where c.continent = 'asia'

-- 7. The number of cities in countries where English is an official language
--    Expected: 523

select count(c.name)
from city cit
join countrylanguage cl on cl.countrycode = cit.countrycode
where cl.language = 'English' and cl.isofficial = 'true'


-- 8. The average population of cities in countries where the official language is English
--    Expected: 285,809

select avg(cit.population)
from city cit
join countrylanguage cl on cit.countrycode = cl.countrycode
where cl.language = 'english' and cl.isofficial = 'true'


-- 9. The names of all of the continents and the population of the continent’s largest city
--    Expected rows: 6, largest population for North America: 8,591,309

select c.continent, max(c.population)
from country c
join city cit on cit.countrycode = c.code
group by c.continent

-- 10. The names of all of the cities in South America that have a population of more than 1 million people and the official language of each city’s country
--     Expected rows: 29

select cit.name, language from city cit
join country c on cit.countrycode = c.code
join countrylanguage cl on cit.countrycode = cl.countrycode
where cit.population > 1000000 and continent = 'south america' and cl.isofficial = 'true'