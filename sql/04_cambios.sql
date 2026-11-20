
ALTER TABLE clases_grupales
ADD COLUMN estado VARCHAR(15) NOT NULL DEFAULT 'activa';

ALTER TABLE clases_grupales
ADD CONSTRAINT chk_clases_grupales_estado
CHECK (estado IN ('activa', 'suspendida'));