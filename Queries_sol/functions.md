1. 
    SELECT SUM(population)
    FROM country;

2. 
    SELECT country.name, country.continent
    FROM country
    ORDER BY country.continent;

3. 
    SELECT Continent, COUNT(name)
    FROM country
    GROUP BY Continent;

4. 
    SELECT Continent, SUM(SurfaceArea)
    FROM country
    GROUP BY Continent;

5. 
    SELECT country.Name, LifeExpectancy
    FROM country
    WHERE LifeExpectancy = ( SELECT MAX(LifeExpectancy) FROM country );

6. 
    SELECT SUM(GNP)
    FROM country
    WHERE continent = "Asia";

7. 
    SELECT AVG(LifeExpectancy)
    FROM country
    WHERE continent = "Europe";

8. 
    SELECT country.Name, city.Name, countrylanguage.Language
    FROM country, city, countrylanguage
    WHERE country.Capital = city.ID
    AND country.Code = countrylanguage.CountryCode
    AND countrylanguage.isOfficial = "T";

9. 
    SELECT country.Name
    FROM country
    WHERE LifeExpectancy = ( SELECT MAX(LifeExpectancy) FROM country);

Bonus :

10. 
    SELECT SUM(country.Population), country.Continent
    FROM country
    GROUP BY Continent

11. 
    SELECT b.Continent, b.GovernmentForm, b.LifeExpectancy
    FROM country as b
    WHERE b.LifeExpectancy = (
        SELECT MAX(a.LifeExpectancy)
        FROM country AS a
        WHERE a.governmentForm = b.governmentForm
    )
    GROUP BY b.governmentForm;

12. 
    SELECT Continent, COUNT(country.GovernmentForm)
    FROM country
    WHERE GovernmentForm LIKE "%Monarchy%"
    AND GovernmentForm NOT LIKE "%Constitutional%"
    GROUP BY Continent;

13. 
    SELECT b.Continent, b.name, (b.gnp / b.population) * 1000000 as "GNP_Capita"
    FROM country as b
    WHERE (b.gnp / b.population) = (
        SELECT MAX((a.gnp / a.population))
        FROM country as a
        WHERE a.Continent = b.Continent
    )
    GROUP BY b.Continent
