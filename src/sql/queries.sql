-- PLEASE READ THIS BEFORE RUNNING THE EXERCISE

-- ⚠️ IMPORTANT: This SQL file may crash due to two common issues: comments and missing semicolons.

-- ✅ Suggestions:
-- 1) Always end each SQL query with a semicolon `;`
-- 2) Ensure comments are well-formed:
--    - Use `--` for single-line comments only
--    - Avoid inline comments after queries
--    - Do not use `/* */` multi-line comments, as they may break execution

-- -----------------------------------------------
-- queries.sql
-- Complete each mission by writing your SQL query
-- directly below the corresponding instruction
-- -----------------------------------------------

-- Consultas iniciales de exploración
SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;

-- Nivel 1 – Exploración Básica

-- 1. Primeras 10 observaciones 
SELECT * FROM observations
ORDER BY id
LIMIT 10;

-- 2. Identificadores de región únicos 
SELECT DISTINCT region_id 
FROM observations
ORDER BY region_id;

-- 3. Total de especies distintas observadas 
SELECT COUNT(DISTINCT species_id) AS especies_totales 
FROM observations;

-- 4. Observaciones en región ID 2 
SELECT * FROM observations
WHERE region_id = 2
ORDER BY observation_date;

-- 5. Observaciones del día 1998-08-08 
WHERE DATE(observation_date) = DATE('1998-08-08');

-- Nivel 2 – Agregación y Ordenamiento

-- 6. Región con más observaciones 
SELECT region_id, COUNT(*) AS num_observaciones
FROM observations
GROUP BY region_id
ORDER BY num_observaciones DESC;

-- 7. Especies más frecuentes 
SELECT species_id, COUNT(*) AS frecuencia
FROM observations
GROUP BY species_id
ORDER BY frecuencia DESC
LIMIT 5;

-- 8. Especies con menos de 5 registros 
SELECT species_id, COUNT(*) AS conteo_obs
FROM observations
GROUP BY species_id
HAVING COUNT(*) < 5
ORDER BY conteo_obs;

-- 9. Observadores más activos 
SELECT observer, COUNT(*) AS num_observaciones
FROM observations
GROUP BY observer
ORDER BY num_observaciones DESC;

-- Nivel 3 – JOIN

-- 10. Nombre de región por observación 
SELECT o.id, r.name AS nombre_region, o.observation_date
FROM observations o
INNER JOIN regions r ON o.region_id = r.id;

-- 11. Nombre científico de cada especie 
SELECT o.id, s.scientific_name
FROM observations o
INNER JOIN species s ON o.species_id = s.id;

-- 12. Especies más observadas por región 
SELECT r.name AS region, s.scientific_name, COUNT(*) AS total_obs
FROM observations o
INNER JOIN species s ON o.species_id = s.id
INNER JOIN regions r ON o.region_id = r.id
GROUP BY r.name, s.scientific_name
ORDER BY r.name, total_obs DESC;

