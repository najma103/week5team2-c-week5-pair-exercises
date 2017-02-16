-- Write queries to return the following:
-- Make the following changes in the "world" database.

-- 1. Add Superman's hometown, Smallville, Kansas to the city table. The 
-- countrycode is 'USA', and population of 45001. (Yes, I looked it up on 
-- Wikipedia.)

INSERT INTO city (name, countrycode, district, population)  
VALUES ('Smallville', 'USA', 'Kansas', 45001);

-- 2. Add Kryptonese to the countrylanguage table. Kryptonese is spoken by 0.0001
-- percentage of the 'USA' population.

INSERT INTO countrylanguage(countrycode, language, isofficial, percentage)  
VALUES ('USA', 'Kryptonese', 'false', 0.0001);

-- 3. After heated debate, "Kryptonese" was renamed to "Krypto-babble", change 
-- the appropriate record accordingly.

UPDATE countrylanguage
SET language='Krypto-babble'
WHERE language='Kryptonese';

-- 4. Set the US captial to Smallville, Kansas in the country table.

update country
set capital = 4080
where code = 'USA'

-- 5. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)

DELETE FROM city
WHERE id = 4080;

-- Doesn't work because Smallville is being used in the country table

-- 6. Return the US captial to Washington.

update country
set capital = 3813
where code = 'USA'

-- 7. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)

DELETE FROM city
WHERE id = 4080;

-- It worked because smallville was not being used in any other table.

-- 8. Reverse the "is the official language" setting for all languages where the
-- country's year of independence is within the range of 1800 and 1972 
-- (exclusive). 
-- (590 rows affected)


UPDATE countrylanguage
SET isofficial = CASE WHEN isofficial = 1 THEN 0 ELSE 1 END
from countrylanguage cl
join country co on co.code = cl.countrycode
where co.indepyear >= 1800 and co.indepyear <= 1972


-- 9. Convert population so it is expressed in 1,000s for all cities. (Round to
-- the nearest integer value greater than 0.)
-- (4079 rows affected)

update city 
set population = round(population/1000, 1)


-- 10. Assuming a country's surfacearea is expressed in miles, convert it to 
-- meters for all countries where French is spoken by more than 20% of the 
-- population.
-- (7 rows affected)

update country 
set surfacearea = surfacearea*1609
from country co
join countrylanguage cl on cl.countrycode = co.code
where cl.language = 'french' and percentage >=20


