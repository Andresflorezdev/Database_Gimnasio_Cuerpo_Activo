
CREATE OR REPLACE VIEW socios_vencidos AS
SELECT s.nombre,
       s.telefono,
       s.acepta_whatsapp,
       MAX(m.fecha_fin) AS fecha_vencimiento_ultima
FROM socios s
JOIN membresias m ON s.numero_documento = m.numero_documento
GROUP BY s.numero_documento, s.nombre, s.telefono, s.acepta_whatsapp
HAVING MAX(m.fecha_fin) < CURRENT_DATE;


CREATE OR REPLACE VIEW ocupacion_clases AS
SELECT c.nombre AS clase,
       c.dia_semana,
       c.hora,
       c.cupo,
       COUNT(i.id_inscripcion) AS inscritos
FROM clases_grupales c
LEFT JOIN inscripciones i ON c.id_clase = i.id_clase
WHERE c.estado = 'activa'
GROUP BY c.id_clase, c.nombre, c.dia_semana, c.hora, c.cupo;


SELECT nombre, telefono, fecha_vencimiento_ultima
FROM socios_vencidos
WHERE acepta_whatsapp = 'si'
ORDER BY fecha_vencimiento_ultima ASC;

SELECT clase,
       dia_semana,
       hora,
       cupo,
       inscritos,
       (cupo - inscritos) AS cupos_disponibles
FROM ocupacion_clases
ORDER BY cupos_disponibles ASC, clase ASC;


INSERT INTO inscripciones (id_clase, numero_documento, fecha_inscripcion)
SELECT id_clase, '1009876543', CURRENT_DATE
FROM clases_grupales
WHERE nombre = 'Pilates';

SELECT clase,
       dia_semana,
       hora,
       cupo,
       inscritos,
       (cupo - inscritos) AS cupos_disponibles
FROM ocupacion_clases
ORDER BY cupos_disponibles ASC, clase ASC;
