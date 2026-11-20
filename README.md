# Base de datos del gimnasio Cuerpo Activo

Proyecto académico de bases de datos para administrar información de un gimnasio. Incluye el diseño relacional, scripts SQL para PostgreSQL, datos de ejemplo, consultas e informes.

## Contenido del proyecto

- `sql/`: scripts SQL numerados para crear y modificar la base de datos, cargar datos y practicar consultas.
- `Backup.sql`: respaldo SQL de la base de datos.
- `Docs/Taller Gimnasio Cuerpo Activo.docx`: documento del taller.
- `Docs/tablas_trabajo_sql-generation.xlsx`: archivo de trabajo con tablas relacionadas con el proyecto.
- `Taller Gimnasio Cuerpo Activo.pdf`: documento en PDF del taller.
- `Diagramas/`: diagramas del modelo entidad-relación y del modelo relacional, además de archivos relacionados con PostgreSQL.

## Modelo de datos

El esquema contempla las siguientes entidades:

- `socios`: datos de contacto e identificación de los socios.
- `planes`: nombre, duración y precio de los planes.
- `entrenadores`: datos y especialidades de los entrenadores.
- `fichas_medicas`: peso, estatura y lesiones registradas para cada socio.
- `membresias`: planes adquiridos por los socios, fechas de vigencia y valor pagado.
- `clases_grupales`: clases, entrenador asignado, horario, cupo y estado.
- `inscripciones`: relación entre socios y clases grupales.

El esquema utiliza claves primarias y foráneas, restricciones de unicidad y validaciones para campos como precios, fechas, cupos y datos obligatorios.

## Scripts SQL

Los archivos de `sql/` están numerados y recorren distintas etapas del taller:

| Archivo | Contenido |
| --- | --- |
| `01_estructura.sql` | Creación de la base de datos y de las tablas iniciales. |
| `02_datos.sql` | Inserción de datos de ejemplo. |
| `03_consultas.sql` | Consultas básicas sobre los datos. |
| `04_cambios.sql` | Cambios de estructura y datos. |
| `05_actualizaciones.sql` | Actualizaciones de registros. |
| `06_tipos.sql` | Cambios y ejercicios relacionados con tipos de datos. |
| `07_restricciones.sql` | Restricciones y reglas de integridad. |
| `08_claves_foraneas.sql` | Claves foráneas y reglas relacionadas. |
| `09_mas_datos.sql` | Datos adicionales para los ejercicios. |
| `10_consultas.sql` | Consultas de selección y filtrado. |
| `11_reportes.sql` | Consultas de resumen y reportes. |
| `12_por_grupos.sql` | Consultas con agrupaciones. |
| `13_joins.sql` | Consultas con combinaciones de tablas. |
| `14_sin_pareja.sql` | Consultas para encontrar registros sin relación correspondiente. |
| `15_horarios.sql` | Consultas relacionadas con horarios. |
| `16_informe.sql` | Consultas de informe sobre socios, membresías y clases. |
| `17_subconsultas.sql` | Ejercicios con subconsultas. |
| `18_vistas.sql` | Creación y consulta de vistas. |

## Requisitos

- PostgreSQL.
- Una herramienta para ejecutar consultas SQL, como `psql` o pgAdmin.

## Ejecución

1. Abre una sesión de PostgreSQL con un usuario que pueda crear bases de datos.
2. Ejecuta `sql/01_estructura.sql` para crear la base y las tablas iniciales.
3. Conéctate a la base `gimnasio_cuerpo_activo`.
4. Ejecuta los demás scripts SQL en orden numérico, según los ejercicios que quieras realizar.

Los scripts posteriores incluyen modificaciones sucesivas al esquema. Para reproducir todo el taller desde cero, ejecútalos en orden y ten en cuenta que algunos insertan datos usados por las consultas de pasos posteriores. `Backup.sql` es una alternativa para restaurar un respaldo; no es necesario ejecutarlo junto con todos los scripts numerados.

## Diagramas

La carpeta `Diagramas/` contiene imágenes del diagrama entidad-relación, del modelo relacional y del esquema de PostgreSQL. También incluye el archivo editable `DIagrama-EDR-postgresql.pgerd`.
