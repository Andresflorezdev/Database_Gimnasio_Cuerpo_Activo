
ALTER TABLE membresias
ALTER COLUMN valor_pagado SET NOT NULL;


ALTER TABLE membresias
ADD CONSTRAINT chk_membresias_valor_pagado
CHECK (valor_pagado > 0);


ALTER TABLE membresias
ADD CONSTRAINT chk_membresias_fechas
CHECK (fecha_fin > fecha_inicio);


ALTER TABLE clases_grupales
ADD CONSTRAINT uq_clases_entrenador_dia_hora
UNIQUE (id_entrenador, dia_semana, hora);



INSERT INTO membresias (numero_documento, id_plan, fecha_inicio, fecha_fin, valor_pagado)
VALUES ('1001234567', 1, '2026-12-10', '2026-12-01', 85000.00);

INSERT INTO clases_grupales (id_entrenador, nombre, dia_semana, hora, cupo)
VALUES (1, 'Ciclo Indoor', 'Lunes', '07:00:00', 10);

INSERT INTO membresias (numero_documento, id_plan, fecha_inicio, fecha_fin, valor_pagado)
VALUES ('1001234567', 1, '2026-12-01', '2027-01-01', 0);

INSERT INTO membresias (numero_documento, id_plan, fecha_inicio, fecha_fin)
VALUES ('1001234567', 1, '2026-12-01', '2027-01-01');
