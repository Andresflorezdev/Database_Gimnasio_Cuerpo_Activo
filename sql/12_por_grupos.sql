
SELECT id_plan,
       COUNT(*) AS total_vendidas
FROM membresias
GROUP BY id_plan
ORDER BY total_vendidas DESC, id_plan ASC;


SELECT id_clase,
       COUNT(*) AS total_inscritos
FROM inscripciones
GROUP BY id_clase
ORDER BY id_clase ASC;


SELECT id_clase,
       COUNT(*) AS total_inscritos
FROM inscripciones
GROUP BY id_clase
HAVING COUNT(*) >= 4
ORDER BY total_inscritos DESC, id_clase ASC;


SELECT numero_documento,
       COUNT(*) AS total_membresias
FROM membresias
GROUP BY numero_documento
HAVING COUNT(*) >= 2
ORDER BY total_membresias DESC, numero_documento ASC;


SELECT numero_documento,
       MAX(fecha_fin) AS ultima_fecha_fin
FROM membresias
GROUP BY numero_documento
HAVING MAX(fecha_fin) < CURRENT_DATE
ORDER BY ultima_fecha_fin ASC, numero_documento ASC;


SELECT id_plan,
       SUM(valor_pagado) AS total_recaudado
FROM membresias
GROUP BY id_plan
ORDER BY total_recaudado DESC, id_plan ASC;

