
INSERT INTO socios (numero_documento, nombre, telefono, correo, acepta_whatsapp) VALUES
('1007890123', 'Mateo Zapata', '3101114455', NULL, 'si'),
('1008901234', 'Valentina Giraldo', '3112225566', 'val.giraldo@correo.com', 'no');



INSERT INTO membresias (numero_documento, id_plan, fecha_inicio, fecha_fin, valor_pagado) VALUES
('1001234567', 1, '2026-11-10', '2026-12-10', 85000.00),
('1007890123', 1, '2026-08-01', '2026-09-01', 85000.00),
('1008901234', 2, '2026-11-02', '2027-02-02', 225000.00),
('1005678901', 2, '2026-10-20', '2027-01-20', 210000.00),
('1004567890', 1, '2026-09-15', '2026-10-15', 85000.00),
('1002345678', 1, '2026-11-12', '2026-12-12', 75000.00);


INSERT INTO inscripciones (id_clase, numero_documento, fecha_inscripcion) VALUES
(4, '1001234567', '2026-11-12'),
(4, '1005678901', '2026-11-12'),
(2, '1005678901', '2026-11-13'),
(3, '1002345678', '2026-11-14');


SELECT * FROM socios;
SELECT * FROM membresias;
SELECT * FROM inscripciones;

