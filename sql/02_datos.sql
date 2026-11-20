ALTER TABLE socios ALTER COLUMN correo DROP NOT NULL;

INSERT INTO planes (nombre, duracion_mes, precio) VALUES
('Mensual', 1, 85000.00),
('Trimestral', 3, 225000.00),
('Anual', 12, 800000.00);

INSERT INTO socios (numero_documento, nombre, telefono, correo) VALUES
('1001234567', 'Emiliana Restrepo', '3001112233', 'emi.restrepo@correo.com'),
('1002345678', 'Raul Gomez', '3012223344', 'rau.gomez@correo.com'),
('1003456789', 'Eufemia Rios', '3023334455', 'eufe.rios@correo.com'),
('1004567890', 'Estefania Arias', '3034445566', NULL),
('1005678901', 'Marcela Cardona', '3045556677', 'marcela.cardona@correo.com'),
('1006789012', 'Martin Orozco', '3056667788', 'martin.orozco@correo.com');

INSERT INTO fichas_medicas (numero_documento, peso, estatura, lesiones) VALUES
('1001234567', 58.50, 1.64, 'Ninguna'),
('1002345678', 78.20, 1.78, 'Esguince leve de tobillo derecho hace 6 meses'),
('1003456789', 62.00, 1.68, NULL),
('1005678901', 54.80, 1.60, 'Lumbalgia ocasional');

INSERT INTO entrenadores (nombre, especialidad, correo) VALUES
('Carlos Arango', 'Spinning y Cardio', 'carlos.arango@cuerpoactivo.com'),
('Diana Vélez', 'Yoga y Movilidad', 'diana.velez@cuerpoactivo.com'),
('Julián Zapata', 'CrossFit y Fuerza', 'julian.zapata@cuerpoactivo.com');

INSERT INTO clases_grupales (id_entrenador, nombre, dia_semana, hora, cupo) VALUES
(1, 'Spinning Extremo', 'Lunes', '07:00:00', 3),
(1, 'Cardio Box', 'Miercoles', '18:00:00', 10),
(2, 'Yoga Restaurativo', 'Martes', '08:00:00', 8),
(2, 'Funcional Core', 'Jueves', '19:00:00', 12);

INSERT INTO membresias (numero_documento, id_plan, fecha_inicio, fecha_fin) VALUES
('1001234567', 1, '2026-09-01', '2026-10-01'),
('1001234567', 2, '2026-10-02', '2027-01-02'),
('1002345678', 3, '2026-06-15', '2027-06-15'),
('1003456789', 1, '2026-08-10', '2026-09-10'),
('1004567890', 2, '2026-10-15', '2027-01-15'),
('1005678901', 1, '2026-11-01', '2026-12-01'),
('1006789012', 1, '2026-11-05', '2026-12-05'),
('1006789012', 1, '2026-11-05', '2026-12-05');

INSERT INTO inscripciones (id_clase, numero_documento, fecha_inscripcion) VALUES
(1, '1001234567', '2026-11-02'),
(1, '1002345678', '2026-11-03'),
(1, '1005678901', '2026-11-04'),
(2, '1001234567', '2026-11-05'),
(2, '1003456789', '2026-11-06'),
(2, '1004567890', '2026-11-07'),
(3, '1001234567', '2026-11-08'),
(3, '1005678901', '2026-11-09'),
(4, '1002345678', '2026-11-10'),
(4, '1004567890', '2026-11-11');