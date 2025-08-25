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

-- 1. Primeras 10 observaciones (alternativa con TOP en algunos SGBD)
SELECT * FROM observations
ORDER BY id
LIMIT 10;

-- 2. Identificadores de región únicos (usando ORDER BY)
SELECT DISTINCT region_id 
FROM observations
ORDER BY region_id;

-- 3. Total de especies distintas observadas (con alias diferente)
SELECT COUNT(DISTINCT species_id) AS especies_totales 
FROM observations;

-- 4. Observaciones en región ID 2 (con ORDER BY)
SELECT * FROM observations
WHERE region_id = 2
ORDER BY observation_date;

-- 5. Observaciones del día 1998-08-08 (formato alternativo)
SELECT * FROM observations
WHERE DATE(observation_date) = DATE('1998-08-08');

-- Nivel 2 – Agregación y Ordenamiento

-- 6. Región con más observaciones (alias diferente)
SELECT region_id, COUNT(*) AS num_observaciones
FROM observations
GROUP BY region_id
ORDER BY num_observaciones DESC;

-- 7. Especies más frecuentes (TOP 5 con diferente alias)
SELECT species_id, COUNT(*) AS frecuencia
FROM observations
GROUP BY species_id
ORDER BY frecuencia DESC
LIMIT 5;

-- 8. Especies con menos de 5 registros (condición en WHERE equivalente)
SELECT species_id, COUNT(*) AS conteo_obs
FROM observations
GROUP BY species_id
HAVING COUNT(*) < 5
ORDER BY conteo_obs;

-- 9. Observadores más activos (alias diferente)
SELECT observer, COUNT(*) AS num_observaciones
FROM observations
GROUP BY observer
ORDER BY num_observaciones DESC;

-- Nivel 3 – JOIN

-- 10. Nombre de región por observación (INNER JOIN explícito)
SELECT o.id, r.name AS nombre_region, o.observation_date
FROM observations o
INNER JOIN regions r ON o.region_id = r.id;

-- 11. Nombre científico de cada especie (con alias de tabla)
SELECT o.id, s.scientific_name
FROM observations o
INNER JOIN species s ON o.species_id = s.id;

-- 12. Especies más observadas por región (subconsulta alternativa)
SELECT r.name AS region, s.scientific_name, COUNT(*) AS total_obs
FROM observations o
INNER JOIN species s ON o.species_id = s.id
INNER JOIN regions r ON o.region_id = r.id
GROUP BY r.name, s.scientific_name
ORDER BY r.name, total_obs DESC;

-- Nivel 4 (opcional) – Manipulación de Datos

-- 13. Insertar observación ficticia (con columnas en diferente orden)
INSERT INTO observations (
    observer, species_id, region_id, observation_date, count
) VALUES (
    'analista_prueba', 3, 2,

