-- b)
SELECT
  p.id, p.time, t.id as tb_id, t.location, c.license_plate,
  o.id as owner_id, o.name, o.address, o.email, o.phone
FROM passing p
LEFT JOIN
(
car c INNER JOIN person o
ON o.id = c.owner_id
)
ON c.license_plate = p.car_license_plate
INNER JOIN toll_booth t
ON t.id = p.toll_booth_id;

-- c)
SELECT
  p.id, p.time, t.id as tb_id, t.location, c.license_plate,
  o.id as owner_id, o.name, o.address, o.email, o.phone
FROM passing p
INNER JOIN car c
ON c.license_plate = p.car_license_plate
INNER JOIN person o
ON o.id = c.owner_id
INNER JOIN toll_booth t
ON t.id = p.toll_booth_id;

-- d)
-- TODO: relasjonsalgebra idk

-- e)
SELECT car_license_plate, COUNT(car_license_plate) as count_passings
FROM passing
GROUP BY car_license_plate
HAVING car_license_plate IS NOT NULL;

-- f)
-- Tolket som finn tidspunkt for siste passering av bil med reg.nr. AA10000
SELECT car_license_plate, time as last_passing
FROM passing
WHERE car_license_plate = 'AA10000'
ORDER BY time DESC LIMIT 1;

-- g)
SELECT COUNT(id) as count_unreadable
FROM passing
GROUP BY car_license_plate
HAVING car_license_plate IS NULL;
