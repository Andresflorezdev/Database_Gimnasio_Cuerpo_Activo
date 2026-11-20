
ALTER TABLE membresias
ADD COLUMN valor_pagado NUMERIC(10, 2);

ALTER TABLE socios
ADD COLUMN acepta_whatsapp VARCHAR(2) NOT NULL DEFAULT 'no';

ALTER TABLE socios
ADD CONSTRAINT chk_socios_acepta_whatsapp
CHECK (acepta_whatsapp IN ('si', 'no'));



UPDATE membresias SET valor_pagado = 85000.00  WHERE id_membresia = 1;
UPDATE membresias SET valor_pagado = 200000.00 WHERE id_membresia = 2;
UPDATE membresias SET valor_pagado = 800000.00 WHERE id_membresia = 3;
UPDATE membresias SET valor_pagado = 85000.00  WHERE id_membresia = 4;
UPDATE membresias SET valor_pagado = 225000.00 WHERE id_membresia = 5;
UPDATE membresias SET valor_pagado = 85000.00  WHERE id_membresia = 6;
UPDATE membresias SET valor_pagado = 85000.00  WHERE id_membresia = 7;



UPDATE socios
SET acepta_whatsapp = 'si'
WHERE numero_documento IN ('1001234567', '1002345678', '1005678901');


SELECT column_name, data_type, is_nullable, column_default
FROM information_schema.columns
WHERE table_name = 'membresias'
ORDER BY ordinal_position;
