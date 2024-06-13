--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)

-- Started on 2024-06-13 11:50:47 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16444)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id_country integer NOT NULL,
    country_name character varying(100) NOT NULL,
    info character varying(1000),
    photo character varying(1000),
    "group" character varying(1),
    titles integer,
    dt character varying(30)
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16443)
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO postgres;

--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 209
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id_country;


--
-- TOC entry 212 (class 1259 OID 16453)
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    id_player integer NOT NULL,
    player_name character varying(100) NOT NULL,
    team character varying(100),
    photo character varying(1000),
    country integer,
    "position" character varying(20)
);


ALTER TABLE public.players OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16452)
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_id_seq OWNER TO postgres;

--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 211
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id_player;


--
-- TOC entry 214 (class 1259 OID 16483)
-- Name: stadiums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stadiums (
    id_stadium integer NOT NULL,
    stadium_name character varying(100) NOT NULL,
    city character varying(100),
    photo character varying(1000),
    capacity integer
);


ALTER TABLE public.stadiums OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16482)
-- Name: stadiums_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stadiums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stadiums_id_seq OWNER TO postgres;

--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 213
-- Name: stadiums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stadiums_id_seq OWNED BY public.stadiums.id_stadium;


--
-- TOC entry 3257 (class 2604 OID 16447)
-- Name: countries id_country; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id_country SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- TOC entry 3258 (class 2604 OID 16456)
-- Name: players id_player; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players ALTER COLUMN id_player SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- TOC entry 3259 (class 2604 OID 16486)
-- Name: stadiums id_stadium; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stadiums ALTER COLUMN id_stadium SET DEFAULT nextval('public.stadiums_id_seq'::regclass);


--
-- TOC entry 3407 (class 0 OID 16444)
-- Dependencies: 210
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id_country, country_name, info, photo, "group", titles, dt) FROM stdin;
1	Argentina	Campeona de America y del mundo, intentara revalidar su titulo en el fin de ciclo de varios jugadores	https://copaamerica.com/_next/image?url=%2Fselecao-argentina.jpg&w=3840&q=75	A	15	Lionel Scaloni
2	Perú	La selección peruana, dirigida por Jorge Fossati, se prepara para enfrentar a Nicaragua y República Dominicana antes de la Copa América. En el torneo, Perú jugará contra Argentina, Chile y Canadá	https://copaamerica.com/_next/image?url=%2Fselecao-peru.jpg&w=3840&q=75	A	0	Jorge Fossati
3	Chile	La selección chilena, conocida como “La Roja”, busca repetir los éxitos de 2015 y 2016. En la Copa América 2024, Chile se medirá a Perú, Argentina y Canadá en el Grupo A	https://copaamerica.com/_next/image?url=%2Fselecao-chile.jpg&w=3840&q=75	A	2	Ricardo Gareca
4	Canadá	Por primera vez en su historia, Canadá participará en la Copa América 2024. El equipo canadiense se enfrentará a Argentina, Perú y Chile en el Grupo A	https://copaamerica.com/_next/image?url=%2Fselecao-canada.jpg&w=3840&q=75	A	0	Jesse Marsch
5	México	La selección mexicana, conocida como “El Tri”, tiene como objetivo aprovechar la ausencia de eliminatorias para el Mundial de 2026 y competir en la Copa América 2024. México jugará contra Ecuador, Venezuela y Jamaica en el Grupo B	https://copaamerica.com/_next/image?url=%2Fselecao-mexico.jpg&w=2048&q=75	B	10	Jaime Lozano
6	Ecuador	Ecuador anuncia su lista de convocados para la Copa América 2024. El equipo ecuatoriano jugará contra México, Venezuela y Jamaica en el Grupo B	https://copaamerica.com/_next/image?url=%2Fselecao-equador.jpg&w=3840&q=75	B	0	Felix Sanchez
7	Venezuela	La selección venezolana busca obtener el éxito más allá de sus fronteras y conquistar su primer título continental. Venezuela se enfrentará a México, Ecuador y Jamaica en el Grupo B	https://copaamerica.com/_next/image?url=%2Fselecao-venezuela.jpg&w=3840&q=75	B	0	Fernando Batista
8	Jamaica	La selección nacional de Jamaica, conocida como “Los Reggae Boyz”, venció a Canadá jugando de visitante y avanzó al repechaje. En la Copa América 2024, Jamaica jugará contra México, Ecuador y Venezuela en el Grupo B	https://copaamerica.com/_next/image?url=%2Fselecao-jamaica.jpg&w=2048&q=75	B	0	Heimir Hallgrimsson
9	Estados Unidos	La selección estadounidense participará por quinta vez en la Copa América 2024. Estados Unidos se medirá a Uruguay, Panamá y Bolivia en el Grupo C	https://copaamerica.com/_next/image?url=%2Fselecao-estados-unidos.jpg&w=2048&q=75	C	0	Gregg Berhalter
10	Uruguay	La seleccion uruguaya busca volver a lo mas alto con esta nueva generacion y asi volver a liderar sola el ranking de mas copas ganadas	https://copaamerica.com/_next/image?url=%2Fselecao-uruguai.jpg&w=2048&q=75	C	15	Marcelo Bielsa
11	Panamá	Panamá jugará su segunda Copa América en la historia. El equipo panameño se enfrentará a Estados Unidos, Uruguay y Bolivia en el Grupo C	https://copaamerica.com/_next/image?url=%2Fselecao-panama.jpg&w=2048&q=75	C	0	Thomas Christiansen
12	Bolivia	El equipo de la altura consiguio consagrarse una vez en el certamen, busca repetir la hazaña	https://copaamerica.com/_next/image?url=%2Fselecao-bolivia.jpg&w=2048&q=75	C	1	Antonio Carlos Zago
13	Brasil	La canarinha viene atravesando un momento complicado, pero siempre son candidatos. Se destacan Vinicius Junior y Rodrygo	https://copaamerica.com/_next/image?url=%2Fselecao-brasil.jpg&w=3840&q=75	D	9	Dorival Junior
14	Colombia	Tras quedarse afuera del ultimo mundial, la seleccion colombiana viene renovada para poder obtener su segunda Copa America	https://copaamerica.com/_next/image?url=%2Fselecao-colombia.jpg&w=3840&q=75	D	1	Nestor Lorenzo
15	Paraguay	Tras la ida de Guillermo Barros Schelotto, el conjunto paraguayo sigue buscando estabilidad, podra conseguirla para compeitr?	https://copaamerica.com/_next/image?url=%2Fselecao-paraguai.jpg&w=3840&q=75	D	2	Daneil Garnero
16	Costa Rica	La revelacion del mundial 2014 busca volver a ser sorpresa de la mano del experimentado Gustavo Alfaro	https://copaamerica.com/_next/image?url=%2Fselecao-costa-rica.jpg&w=2048&q=75	D	0	Gustavo Alfaro
\.


--
-- TOC entry 3409 (class 0 OID 16453)
-- Dependencies: 212
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (id_player, player_name, team, photo, country, "position") FROM stdin;
\.


--
-- TOC entry 3411 (class 0 OID 16483)
-- Dependencies: 214
-- Data for Name: stadiums; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stadiums (id_stadium, stadium_name, city, photo, capacity) FROM stdin;
1	Mercedes-Benz Stadium	Atlanta, GA	https://copaamerica.com/_next/image?url=%2Fstadiums%2Fmercedesbenz-stadium.jpg&w=1920&q=75	71000
2	Hard Rock Stadium	Miami Gardens, FL	https://copaamerica.com/_next/image?url=%2Fstadiums%2Fhardrock-stadium.jpg&w=1920&q=75	65300
3	AT&T Stadium	Arlington, TX	https://copaamerica.com/_next/image?url=%2Fstadiums%2Fatt-stadium.jpg&w=1920&q=75	80000
4	GEHA Field at Arrowhead Stadium	Kansas City, MO	https://copaamerica.com/_next/image?url=%2Fstadiums%2Fgeha-stadium.jpg&w=1920&q=75	76400
5	Q2 Stadium	Austin, TX	https://copaamerica.com/_next/image?url=%2Fstadiums%2Fq2-stadium.jpg&w=1920&q=75	20700
6	Bank of America Stadium	Charlotte, NC	https://copaamerica.com/_next/image?url=%2Fstadiums%2Fbankofamerica-stadium.jpg&w=1920&q=75	74500
7	MetLife Stadium	East Rutherford, NJ	https://copaamerica.com/_next/image?url=%2Fstadiums%2Fmetlife-stadium.jpg&w=1920&q=75	82500
8	State Farm Stadium	Glendale, AZ	https://copaamerica.com/_next/image?url=%2Fstadiums%2Fstatefarm-stadium.jpg&w=1920&q=75	63400
9	NRG Stadium	Houston, TX	https://copaamerica.com/_next/image?url=%2Fstadiums%2Fnrg-stadium.jpg&w=1920&q=75	72200
10	SoFi Stadium	Inglewood, CA	https://copaamerica.com/_next/image?url=%2Fstadiums%2Fsofi-stadium.jpg&w=1920&q=75	70000
11	Children’s Mercy Park	Kansas City, KS	https://copaamerica.com/_next/image?url=%2Fstadiums%2Fchildrenmercypark-stadium.jpg&w=1920&q=75	18500
12	Allegiant Stadium	Las Vegas, NV	https://copaamerica.com/_next/image?url=%2Fstadiums%2Fallegiant-stadium.jpg&w=1920&q=75	65000
13	Inter&Co Stadium	Orlando, FL	https://copaamerica.com/_next/image?url=%2Fstadiums%2Finterco-stadium.jpg&w=1920&q=75	25500
14	Levi’s® Stadium	Santa Clara, CA	https://copaamerica.com/_next/image?url=%2Fstadiums%2Flevis-stadium.jpg&w=1920&q=75	68500
\.


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 209
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 16, true);


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 211
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_id_seq', 1, false);


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 213
-- Name: stadiums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stadiums_id_seq', 14, true);


--
-- TOC entry 3261 (class 2606 OID 16451)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id_country);


--
-- TOC entry 3263 (class 2606 OID 16460)
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id_player);


--
-- TOC entry 3265 (class 2606 OID 16490)
-- Name: stadiums stadiums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stadiums
    ADD CONSTRAINT stadiums_pkey PRIMARY KEY (id_stadium);


--
-- TOC entry 3266 (class 2606 OID 16461)
-- Name: players players_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_country_fkey FOREIGN KEY (country) REFERENCES public.countries(id_country);


-- Completed on 2024-06-13 11:50:48 -03

--
-- PostgreSQL database dump complete
--

