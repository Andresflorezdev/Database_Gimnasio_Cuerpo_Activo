
INSERT INTO clases_grupales (id_entrenador, nombre, dia_semana, hora, cupo, estado)
VALUES (2, 'Pilates', 'Viernes', '18:00:00', 12, 'activa');


SELECT s.nombre,
       s.telefono,
       s.acepta_whatsapp,
       MAX(m.fecha_fin) AS fecha_vencimiento_ultima
FROM socios s
JOIN membresias m ON s.numero_documento = m.numero_documento
GROUP BY s.numero_documento, s.nombre, s.telefono, s.acepta_whatsapp
HAVING MAX(m.fecha_fin) < CURRENT_DATE
ORDER BY fecha_vencimiento_ultima ASC, s.nombre ASC;



SELECT p.nombre AS plan,
       COUNT(m.id_membresia) AS membresias_vendidas,
       COALESCE(SUM(m.valor_pagado), 0) AS dinero_total
FROM planes p
LEFT JOIN membresias m ON p.id_plan = m.id_plan
GROUP BY p.id_plan, p.nombre
ORDER BY dinero_total DESC, membresias_vendidas DESC;


SELECT c.nombre AS clase,
       c.cupo,
       COUNT(i.id_inscripcion) AS inscritos
FROM clases_grupales c
LEFT JOIN inscripciones i ON c.id_clase = i.id_clase
WHERE c.estado = 'activa'
GROUP BY c.id_clase, c.nombre, c.cupo
ORDER BY c.nombre ASC;


SELECT c.nombre AS clase,
       c.cupo,
       COUNT(i.id_inscripcion) AS inscritos
FROM clases_grupales c
LEFT JOIN inscripciones i ON c.id_clase = i.id_clase
WHERE c.estado = 'activa'
GROUP BY c.id_clase, c.nombre, c.cupo
HAVING COUNT(i.id_inscripcion) >= c.cupo
ORDER BY c.nombre ASC;


-- con estas dos inserciones la ultima consulta funciona y se muestran
INSERT INTO clases_grupales (id_entrenador, nombre, dia_semana, hora, cupo, estado)
VALUES (2, 'Zumba Express', 'Martes', '17:00:00', 2, 'activa');

INSERT INTO inscripciones (id_clase, numero_documento, fecha_inscripcion)
VALUES
    (currval('clases_grupales_id_clase_seq'), '1007890123', CURRENT_DATE),
    (currval('clases_grupales_id_clase_seq'), '1008901234', CURRENT_DATE);


INSERT INTO clases_grupales (id_entrenador, nombre, dia_semana, hora, cupo, estado)
VALUES (1, 'HIIT Matinal', 'Viernes', '06:30:00', 2, 'activa');

INSERT INTO inscripciones (id_clase, numero_documento, fecha_inscripcion)
VALUES
    (currval('clases_grupales_id_clase_seq'), '1006789012', CURRENT_DATE),
    (currval('clases_grupales_id_clase_seq'), '1003456789', CURRENT_DATE);