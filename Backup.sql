--
-- PostgreSQL database dump
--

\restrict 99RyJlaXD4OtlnTpmWw6H60w3cAnI4RjWkqsdaLYW2tRPptbqus5skABZTzbEna

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-20 09:12:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 229 (class 1259 OID 16758)
-- Name: clases_grupales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clases_grupales (
    id_clase integer NOT NULL,
    id_entrenador integer NOT NULL,
    nombre character varying(100) NOT NULL,
    dia_semana character varying(15) NOT NULL,
    hora time without time zone NOT NULL,
    cupo integer NOT NULL,
    estado character varying(15) DEFAULT 'activa'::character varying NOT NULL,
    CONSTRAINT chk_clases_grupales_estado CHECK (((estado)::text = ANY ((ARRAY['activa'::character varying, 'suspendida'::character varying])::text[]))),
    CONSTRAINT clases_grupales_cupo_check CHECK ((cupo > 0)),
    CONSTRAINT clases_grupales_dia_semana_check CHECK (((dia_semana)::text = ANY ((ARRAY['Lunes'::character varying, 'Martes'::character varying, 'Miercoles'::character varying, 'Jueves'::character varying, 'Viernes'::character varying, 'Sabado'::character varying, 'Domingo'::character varying])::text[])))
);


ALTER TABLE public.clases_grupales OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16757)
-- Name: clases_grupales_id_clase_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clases_grupales_id_clase_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clases_grupales_id_clase_seq OWNER TO postgres;

--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 228
-- Name: clases_grupales_id_clase_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clases_grupales_id_clase_seq OWNED BY public.clases_grupales.id_clase;


--
-- TOC entry 223 (class 1259 OID 16700)
-- Name: entrenadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entrenadores (
    id_entrenador integer NOT NULL,
    nombre character varying(100) NOT NULL,
    especialidad character varying(100) NOT NULL,
    correo character varying(100) NOT NULL
);


ALTER TABLE public.entrenadores OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16699)
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.entrenadores_id_entrenador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.entrenadores_id_entrenador_seq OWNER TO postgres;

--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 222
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.entrenadores_id_entrenador_seq OWNED BY public.entrenadores.id_entrenador;


--
-- TOC entry 225 (class 1259 OID 16713)
-- Name: fichas_medicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fichas_medicas (
    id_ficha integer NOT NULL,
    numero_documento character varying(20) NOT NULL,
    peso numeric(5,2) NOT NULL,
    estatura numeric(4,2) NOT NULL,
    lesiones text,
    CONSTRAINT fichas_medicas_estatura_check CHECK ((estatura > (0)::numeric)),
    CONSTRAINT fichas_medicas_peso_check CHECK ((peso > (0)::numeric))
);


ALTER TABLE public.fichas_medicas OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16712)
-- Name: fichas_medicas_id_ficha_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fichas_medicas_id_ficha_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fichas_medicas_id_ficha_seq OWNER TO postgres;

--
-- TOC entry 5114 (class 0 OID 0)
-- Dependencies: 224
-- Name: fichas_medicas_id_ficha_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fichas_medicas_id_ficha_seq OWNED BY public.fichas_medicas.id_ficha;


--
-- TOC entry 231 (class 1259 OID 16778)
-- Name: inscripciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripciones (
    id_inscripcion integer NOT NULL,
    id_clase integer NOT NULL,
    numero_documento character varying(20) NOT NULL,
    fecha_inscripcion date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.inscripciones OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16777)
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripciones_id_inscripcion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscripciones_id_inscripcion_seq OWNER TO postgres;

--
-- TOC entry 5115 (class 0 OID 0)
-- Dependencies: 230
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripciones_id_inscripcion_seq OWNED BY public.inscripciones.id_inscripcion;


--
-- TOC entry 227 (class 1259 OID 16735)
-- Name: membresias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.membresias (
    id_membresia integer NOT NULL,
    numero_documento character varying(20) NOT NULL,
    id_plan integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    valor_pagado numeric(10,2) NOT NULL,
    CONSTRAINT chk_membresias_fechas CHECK ((fecha_fin > fecha_inicio)),
    CONSTRAINT chk_membresias_valor_pagado CHECK ((valor_pagado > (0)::numeric)),
    CONSTRAINT membresias_check CHECK ((fecha_fin > fecha_inicio))
);


ALTER TABLE public.membresias OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16734)
-- Name: membresias_id_membresia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.membresias_id_membresia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.membresias_id_membresia_seq OWNER TO postgres;

--
-- TOC entry 5116 (class 0 OID 0)
-- Dependencies: 226
-- Name: membresias_id_membresia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.membresias_id_membresia_seq OWNED BY public.membresias.id_membresia;


--
-- TOC entry 233 (class 1259 OID 16833)
-- Name: ocupacion_clases; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.ocupacion_clases AS
 SELECT c.nombre AS clase,
    c.dia_semana,
    c.hora,
    c.cupo,
    count(i.id_inscripcion) AS inscritos
   FROM (public.clases_grupales c
     LEFT JOIN public.inscripciones i ON ((c.id_clase = i.id_clase)))
  WHERE ((c.estado)::text = 'activa'::text)
  GROUP BY c.id_clase, c.nombre, c.dia_semana, c.hora, c.cupo;


ALTER VIEW public.ocupacion_clases OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16685)
-- Name: planes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planes (
    id_plan integer NOT NULL,
    nombre character varying(50) NOT NULL,
    duracion_mes integer NOT NULL,
    precio numeric(10,2) NOT NULL,
    CONSTRAINT planes_duracion_mes_check CHECK ((duracion_mes > 0)),
    CONSTRAINT planes_precio_check CHECK ((precio > (0)::numeric))
);


ALTER TABLE public.planes OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16684)
-- Name: planes_id_plan_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planes_id_plan_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planes_id_plan_seq OWNER TO postgres;

--
-- TOC entry 5117 (class 0 OID 0)
-- Dependencies: 220
-- Name: planes_id_plan_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planes_id_plan_seq OWNED BY public.planes.id_plan;


--
-- TOC entry 219 (class 1259 OID 16673)
-- Name: socios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socios (
    numero_documento character varying(20) NOT NULL,
    nombre character varying(100) NOT NULL,
    telefono character varying(20) NOT NULL,
    correo character varying(100),
    acepta_whatsapp character varying(2) DEFAULT 'no'::character varying NOT NULL,
    CONSTRAINT chk_socios_acepta_whatsapp CHECK (((acepta_whatsapp)::text = ANY ((ARRAY['si'::character varying, 'no'::character varying])::text[])))
);


ALTER TABLE public.socios OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16828)
-- Name: socios_vencidos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.socios_vencidos AS
 SELECT s.nombre,
    s.telefono,
    s.acepta_whatsapp,
    max(m.fecha_fin) AS fecha_vencimiento_ultima
   FROM (public.socios s
     JOIN public.membresias m ON (((s.numero_documento)::text = (m.numero_documento)::text)))
  GROUP BY s.numero_documento, s.nombre, s.telefono, s.acepta_whatsapp
 HAVING (max(m.fecha_fin) < CURRENT_DATE);


ALTER VIEW public.socios_vencidos OWNER TO postgres;

--
-- TOC entry 4898 (class 2604 OID 16761)
-- Name: clases_grupales id_clase; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases_grupales ALTER COLUMN id_clase SET DEFAULT nextval('public.clases_grupales_id_clase_seq'::regclass);


--
-- TOC entry 4895 (class 2604 OID 16703)
-- Name: entrenadores id_entrenador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores ALTER COLUMN id_entrenador SET DEFAULT nextval('public.entrenadores_id_entrenador_seq'::regclass);


--
-- TOC entry 4896 (class 2604 OID 16716)
-- Name: fichas_medicas id_ficha; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas ALTER COLUMN id_ficha SET DEFAULT nextval('public.fichas_medicas_id_ficha_seq'::regclass);


--
-- TOC entry 4900 (class 2604 OID 16781)
-- Name: inscripciones id_inscripcion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones ALTER COLUMN id_inscripcion SET DEFAULT nextval('public.inscripciones_id_inscripcion_seq'::regclass);


--
-- TOC entry 4897 (class 2604 OID 16738)
-- Name: membresias id_membresia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias ALTER COLUMN id_membresia SET DEFAULT nextval('public.membresias_id_membresia_seq'::regclass);


--
-- TOC entry 4894 (class 2604 OID 16688)
-- Name: planes id_plan; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes ALTER COLUMN id_plan SET DEFAULT nextval('public.planes_id_plan_seq'::regclass);


--
-- TOC entry 5104 (class 0 OID 16758)
-- Dependencies: 229
-- Data for Name: clases_grupales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clases_grupales (id_clase, id_entrenador, nombre, dia_semana, hora, cupo, estado) FROM stdin;
3	2	Yoga Restaurativo	Martes	08:00:00	8	activa
4	2	Funcional Core	Jueves	19:00:00	12	activa
1	1	Spinning Extremo	Lunes	07:00:00	3	suspendida
2	1	Cardio Box	Miercoles	18:00:00	10	activa
6	2	Pilates	Viernes	18:00:00	12	activa
7	2	Zumba Express	Martes	17:00:00	2	activa
8	1	HIIT Matinal	Viernes	06:30:00	2	activa
\.


--
-- TOC entry 5098 (class 0 OID 16700)
-- Dependencies: 223
-- Data for Name: entrenadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entrenadores (id_entrenador, nombre, especialidad, correo) FROM stdin;
1	Carlos Arango	Spinning y Cardio	carlos.arango@cuerpoactivo.com
2	Diana Vélez	Yoga y Movilidad	diana.velez@cuerpoactivo.com
3	Julián Zapata	CrossFit y Fuerza	julian.zapata@cuerpoactivo.com
\.


--
-- TOC entry 5100 (class 0 OID 16713)
-- Dependencies: 225
-- Data for Name: fichas_medicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fichas_medicas (id_ficha, numero_documento, peso, estatura, lesiones) FROM stdin;
1	1001234567	58.50	1.64	Ninguna
2	1002345678	78.20	1.78	Esguince leve de tobillo derecho hace 6 meses
3	1003456789	62.00	1.68	\N
4	1005678901	54.80	1.60	Lumbalgia ocasional
\.


--
-- TOC entry 5106 (class 0 OID 16778)
-- Dependencies: 231
-- Data for Name: inscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones (id_inscripcion, id_clase, numero_documento, fecha_inscripcion) FROM stdin;
1	1	1001234567	2026-11-02
2	1	1002345678	2026-11-03
3	1	1005678901	2026-11-04
4	2	1001234567	2026-11-05
5	2	1003456789	2026-11-06
6	2	1004567890	2026-11-07
7	3	1001234567	2026-11-08
8	3	1005678901	2026-11-09
9	4	1002345678	2026-11-10
10	4	1004567890	2026-11-11
11	4	1001234567	2026-11-12
12	4	1005678901	2026-11-12
13	2	1005678901	2026-11-13
14	3	1002345678	2026-11-14
15	7	1007890123	2026-11-19
16	7	1008901234	2026-11-19
17	8	1006789012	2026-11-19
18	8	1003456789	2026-11-19
24	6	1009876543	2026-11-20
\.


--
-- TOC entry 5102 (class 0 OID 16735)
-- Dependencies: 227
-- Data for Name: membresias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.membresias (id_membresia, numero_documento, id_plan, fecha_inicio, fecha_fin, valor_pagado) FROM stdin;
1	1001234567	1	2026-09-01	2026-10-01	85000.00
2	1001234567	2	2026-10-02	2027-01-02	200000.00
3	1002345678	3	2026-06-15	2027-06-15	800000.00
4	1003456789	1	2026-08-10	2026-09-10	85000.00
5	1004567890	2	2026-10-15	2027-01-15	225000.00
6	1005678901	1	2026-11-01	2026-12-01	85000.00
7	1006789012	1	2026-11-05	2026-12-05	85000.00
13	1001234567	1	2026-11-10	2026-12-10	85000.00
14	1007890123	1	2026-08-01	2026-09-01	85000.00
15	1008901234	2	2026-11-02	2027-02-02	225000.00
16	1005678901	2	2026-10-20	2027-01-20	210000.00
17	1004567890	1	2026-09-15	2026-10-15	85000.00
18	1002345678	1	2026-11-12	2026-12-12	75000.00
\.


--
-- TOC entry 5096 (class 0 OID 16685)
-- Dependencies: 221
-- Data for Name: planes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planes (id_plan, nombre, duracion_mes, precio) FROM stdin;
1	Mensual	1	85000.00
2	Trimestral	3	225000.00
3	Anual	12	800000.00
\.


--
-- TOC entry 5094 (class 0 OID 16673)
-- Dependencies: 219
-- Data for Name: socios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socios (numero_documento, nombre, telefono, correo, acepta_whatsapp) FROM stdin;
1003456789	Eufemia Rios	3023334455	eufe.rios@correo.com	no
1004567890	Estefania Arias	3034445566	\N	no
1006789012	Martin Orozco	3056667788	martin.orozco@correo.com	no
1001234567	Emiliana Restrepo	3009998877	emi.restrepo@correo.com	si
1002345678	Raul Gomez	3012223344	rau.gomez@correo.com	si
1005678901	Marcela Cardona	3045556677	marcela.cardona@correo.com	si
1007890123	Mateo Zapata	3101114455	\N	si
1008901234	Valentina Giraldo	3112225566	val.giraldo@correo.com	no
1009876543	Valeria Gómez	3154445566	valeria.gomez@correo.com	si
1009012345	Camila Ospina	3123334455	camila.ospina@correo.com	si
\.


--
-- TOC entry 5118 (class 0 OID 0)
-- Dependencies: 228
-- Name: clases_grupales_id_clase_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clases_grupales_id_clase_seq', 9, true);


--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 222
-- Name: entrenadores_id_entrenador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.entrenadores_id_entrenador_seq', 4, true);


--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 224
-- Name: fichas_medicas_id_ficha_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fichas_medicas_id_ficha_seq', 4, true);


--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 230
-- Name: inscripciones_id_inscripcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripciones_id_inscripcion_seq', 24, true);


--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 226
-- Name: membresias_id_membresia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.membresias_id_membresia_seq', 18, true);


--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 220
-- Name: planes_id_plan_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planes_id_plan_seq', 3, true);


--
-- TOC entry 4932 (class 2606 OID 16771)
-- Name: clases_grupales clases_grupales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases_grupales
    ADD CONSTRAINT clases_grupales_pkey PRIMARY KEY (id_clase);


--
-- TOC entry 4922 (class 2606 OID 16711)
-- Name: entrenadores entrenadores_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_correo_key UNIQUE (correo);


--
-- TOC entry 4924 (class 2606 OID 16709)
-- Name: entrenadores entrenadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenadores
    ADD CONSTRAINT entrenadores_pkey PRIMARY KEY (id_entrenador);


--
-- TOC entry 4926 (class 2606 OID 16728)
-- Name: fichas_medicas fichas_medicas_numero_documento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_numero_documento_key UNIQUE (numero_documento);


--
-- TOC entry 4928 (class 2606 OID 16726)
-- Name: fichas_medicas fichas_medicas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_pkey PRIMARY KEY (id_ficha);


--
-- TOC entry 4936 (class 2606 OID 16790)
-- Name: inscripciones inscripciones_id_clase_numero_documento_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_id_clase_numero_documento_key UNIQUE (id_clase, numero_documento);


--
-- TOC entry 4938 (class 2606 OID 16788)
-- Name: inscripciones inscripciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_pkey PRIMARY KEY (id_inscripcion);


--
-- TOC entry 4930 (class 2606 OID 16746)
-- Name: membresias membresias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_pkey PRIMARY KEY (id_membresia);


--
-- TOC entry 4918 (class 2606 OID 16698)
-- Name: planes planes_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes
    ADD CONSTRAINT planes_nombre_key UNIQUE (nombre);


--
-- TOC entry 4920 (class 2606 OID 16696)
-- Name: planes planes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes
    ADD CONSTRAINT planes_pkey PRIMARY KEY (id_plan);


--
-- TOC entry 4914 (class 2606 OID 16683)
-- Name: socios socios_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_correo_key UNIQUE (correo);


--
-- TOC entry 4916 (class 2606 OID 16681)
-- Name: socios socios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_pkey PRIMARY KEY (numero_documento);


--
-- TOC entry 4934 (class 2606 OID 16812)
-- Name: clases_grupales uq_clases_entrenador_dia_hora; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases_grupales
    ADD CONSTRAINT uq_clases_entrenador_dia_hora UNIQUE (id_entrenador, dia_semana, hora);


--
-- TOC entry 4942 (class 2606 OID 16772)
-- Name: clases_grupales clases_grupales_id_entrenador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases_grupales
    ADD CONSTRAINT clases_grupales_id_entrenador_fkey FOREIGN KEY (id_entrenador) REFERENCES public.entrenadores(id_entrenador);


--
-- TOC entry 4939 (class 2606 OID 16813)
-- Name: fichas_medicas fichas_medicas_numero_documento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fichas_medicas
    ADD CONSTRAINT fichas_medicas_numero_documento_fkey FOREIGN KEY (numero_documento) REFERENCES public.socios(numero_documento) ON DELETE CASCADE;


--
-- TOC entry 4943 (class 2606 OID 16823)
-- Name: inscripciones inscripciones_id_clase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_id_clase_fkey FOREIGN KEY (id_clase) REFERENCES public.clases_grupales(id_clase) ON DELETE CASCADE;


--
-- TOC entry 4944 (class 2606 OID 16818)
-- Name: inscripciones inscripciones_numero_documento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_numero_documento_fkey FOREIGN KEY (numero_documento) REFERENCES public.socios(numero_documento) ON DELETE CASCADE;


--
-- TOC entry 4940 (class 2606 OID 16752)
-- Name: membresias membresias_id_plan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_id_plan_fkey FOREIGN KEY (id_plan) REFERENCES public.planes(id_plan);


--
-- TOC entry 4941 (class 2606 OID 16747)
-- Name: membresias membresias_numero_documento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_numero_documento_fkey FOREIGN KEY (numero_documento) REFERENCES public.socios(numero_documento);


-- Completed on 2026-11-20 09:12:41

--
-- PostgreSQL database dump complete
--

\unrestrict 99RyJlaXD4OtlnTpmWw6H60w3cAnI4RjWkqsdaLYW2tRPptbqus5skABZTzbEna

