
SELECT m.id_membresia,
       s.nombre AS socio,
       m.valor_pagado
FROM membresias m
JOIN socios s ON m.numero_documento = s.numero_documento
WHERE m.valor_pagado > (
    SELECT AVG(valor_pagado)
    FROM membresias
)
ORDER BY m.valor_pagado DESC, m.id_membresia ASC;


SELECT numero_documento,
       nombre,
       telefono
FROM socios
WHERE numero_documento IN (
    SELECT DISTINCT i.numero_documento
    FROM inscripciones i
    JOIN clases_grupales c ON i.id_clase = c.id_clase
    WHERE c.id_entrenador = 1
)
ORDER BY nombre ASC;


SELECT numero_documento,
       nombre,
       telefono
FROM socios
WHERE numero_documento NOT IN (
    SELECT numero_documento
    FROM inscripciones
)
ORDER BY nombre ASC;

