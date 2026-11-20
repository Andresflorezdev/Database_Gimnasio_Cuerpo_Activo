
SELECT numero_documento, nombre, telefono
FROM socios
WHERE numero_documento = '1001234567';

UPDATE socios
SET telefono = '3009998877'
WHERE numero_documento = '1001234567';


SELECT id_clase, nombre, estado
FROM clases_grupales
WHERE id_clase = 1;

UPDATE clases_grupales
SET estado = 'suspendida'
WHERE id_clase = 1;



SELECT id_membresia, numero_documento, id_plan, fecha_inicio, fecha_fin
FROM membresias
WHERE id_membresia = 10;

DELETE FROM membresias
WHERE id_membresia = 10;
