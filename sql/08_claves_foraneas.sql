
ALTER TABLE fichas_medicas
DROP CONSTRAINT fichas_medicas_numero_documento_fkey;

ALTER TABLE fichas_medicas
ADD CONSTRAINT fichas_medicas_numero_documento_fkey
FOREIGN KEY (numero_documento)
REFERENCES socios(numero_documento)
ON DELETE CASCADE;


ALTER TABLE inscripciones
DROP CONSTRAINT inscripciones_numero_documento_fkey;

ALTER TABLE inscripciones
ADD CONSTRAINT inscripciones_numero_documento_fkey
FOREIGN KEY (numero_documento)
REFERENCES socios(numero_documento)
ON DELETE CASCADE;


ALTER TABLE inscripciones
DROP CONSTRAINT inscripciones_id_clase_fkey;

ALTER TABLE inscripciones
ADD CONSTRAINT inscripciones_id_clase_fkey
FOREIGN KEY (id_clase)
REFERENCES clases_grupales(id_clase)
ON DELETE CASCADE;


SELECT constraint_name, delete_rule
FROM information_schema.referential_constraints
ORDER BY constraint_name;
