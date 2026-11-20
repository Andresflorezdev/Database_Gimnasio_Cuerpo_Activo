
SELECT e.id_entrenador,
       e.nombre,
       e.especialidad
FROM entrenadores e
LEFT JOIN clases_grupales c ON e.id_entrenador = c.id_entrenador
WHERE c.id_clase IS NULL
ORDER BY e.nombre ASC;


INSERT INTO socios (numero_documento, nombre, telefono, correo, acepta_whatsapp)
VALUES ('1009876543', 'Valeria Gómez', '3154445566', 'valeria.gomez@correo.com', 'si');

INSERT INTO socios (numero_documento, nombre, telefono, correo, acepta_whatsapp)
VALUES ('1009012345', 'Camila Ospina', '3123334455', 'camila.ospina@correo.com', 'si');

SELECT s.numero_documento,
       s.nombre,
       s.telefono
FROM socios s
LEFT JOIN inscripciones i ON s.numero_documento = i.numero_documento
WHERE i.id_inscripcion IS NULL
ORDER BY s.nombre ASC;


SELECT s.numero_documento,
       s.nombre,
       f.peso,
       f.estatura
FROM socios s
LEFT JOIN fichas_medicas f ON s.numero_documento = f.numero_documento
ORDER BY s.nombre ASC;
