
SELECT s.nombre AS socio,
       c.nombre AS clase,
       c.dia_semana,
       c.hora,
       e.nombre AS entrenador
FROM socios s
JOIN inscripciones i ON s.numero_documento = i.numero_documento
JOIN clases_grupales c ON i.id_clase = c.id_clase
JOIN entrenadores e ON c.id_entrenador = e.id_entrenador
WHERE s.numero_documento = '1001234567'
  AND c.estado = 'activa'
ORDER BY c.dia_semana,
c.hora ASC;



SELECT s.numero_documento,
       s.nombre,
       s.telefono,
       s.acepta_whatsapp
FROM inscripciones i
JOIN socios s ON i.numero_documento = s.numero_documento
WHERE i.id_clase = 1
ORDER BY s.nombre ASC;
