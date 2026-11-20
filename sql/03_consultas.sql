
SELECT nombre, dia_semana, hora
FROM clases_grupales
WHERE id_entrenador = 1;

SELECT id_membresia, numero_documento, fecha_fin
FROM membresias
WHERE fecha_fin < CURRENT_DATE;

SELECT nombre, precio
FROM planes
WHERE precio > 100000;

SELECT id_clase, fecha_inscripcion
FROM inscripciones
WHERE numero_documento = '1001234567';