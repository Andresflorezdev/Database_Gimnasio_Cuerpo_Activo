
SELECT id_membresia, numero_documento, id_plan, fecha_inicio, fecha_fin, valor_pagado
FROM membresias
WHERE (fecha_inicio >= '2026-09-01' AND fecha_inicio <= '2026-09-30')
   OR (fecha_inicio >= '2026-10-01' AND fecha_inicio <= '2026-10-31')
ORDER BY fecha_inicio ASC;


SELECT id_clase, nombre, dia_semana, hora, estado
FROM clases_grupales
WHERE nombre ILIKE '%spinning%';


SELECT numero_documento AS id, nombre, telefono
FROM socios
WHERE correo IS NULL;


SELECT id_clase, nombre, dia_semana, hora, estado
FROM clases_grupales
WHERE estado = 'activa'
  AND (dia_semana = 'Lunes' OR dia_semana = 'Miercoles');


SELECT id_clase, nombre, dia_semana, hora, estado
FROM clases_grupales
WHERE estado = 'activa'
  AND dia_semana = 'Lunes'
   OR dia_semana = 'Miercoles';


SELECT id_membresia AS membresia,
       numero_documento AS socio,
       valor_pagado AS pagado
FROM membresias
ORDER BY valor_pagado DESC, id_membresia ASC
LIMIT 3;


SELECT dia_semana
FROM clases_grupales
ORDER BY dia_semana;
