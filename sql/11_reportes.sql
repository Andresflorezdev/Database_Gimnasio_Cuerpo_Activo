
SELECT COUNT(*) AS total_socios,
       COUNT(correo) AS socios_con_correo
FROM socios;


SELECT COALESCE(SUM(valor_pagado), 0) AS total_noviembre_2026
FROM membresias
WHERE fecha_inicio >= '2026-11-01'
  AND fecha_inicio <= '2026-11-30';


SELECT ROUND(MIN(valor_pagado)) AS menor_valor,
       ROUND(MAX(valor_pagado)) AS mayor_valor,
       ROUND(AVG(valor_pagado)) AS promedio_valor
FROM membresias;


SELECT COUNT(*) AS total_membresias,
       COUNT(DISTINCT numero_documento) AS socios_distintos
FROM membresias;
