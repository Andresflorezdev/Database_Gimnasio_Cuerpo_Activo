
SELECT s.nombre AS socio,
       p.nombre AS plan,
       m.fecha_inicio,
       m.fecha_fin,
       m.valor_pagado
FROM membresias m
JOIN socios s ON m.numero_documento = s.numero_documento
JOIN planes p ON m.id_plan = p.id_plan
ORDER BY m.fecha_inicio ASC, m.id_membresia ASC;



SELECT c.nombre AS clase,
       e.nombre AS entrenador,
       c.dia_semana,
       c.hora
FROM clases_grupales c
JOIN entrenadores e ON c.id_entrenador = e.id_entrenador
WHERE c.estado = 'activa'
ORDER BY c.dia_semana ASC, c.hora ASC;
