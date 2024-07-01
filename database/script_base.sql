--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.12 (Ubuntu 14.12-0ubuntu0.22.04.1)

-- Started on 2024-07-01 14:22:33 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
CREATE TABLE public.countries (
    id_country integer NOT NULL,
    country_name character varying(100),
    info character varying(1000),
    photo character varying(1000),
    country_group character varying(1),
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
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 209
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id_country;


--
-- TOC entry 216 (class 1259 OID 65595)
-- Name: matches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matches (
    id_match integer NOT NULL,
    home_team_id integer NOT NULL,
    away_team_id integer NOT NULL,
    match_datetime timestamp without time zone NOT NULL,
    stadium_id integer,
    score_home_team integer,
    score_away_team integer,
    match_group character varying(30)
);


ALTER TABLE public.matches OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 65594)
-- Name: matches_id_match_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.matches_id_match_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.matches_id_match_seq OWNER TO postgres;

--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 215
-- Name: matches_id_match_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.matches_id_match_seq OWNED BY public.matches.id_match;


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
-- TOC entry 3433 (class 0 OID 0)
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
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 213
-- Name: stadiums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stadiums_id_seq OWNED BY public.stadiums.id_stadium;


--
-- TOC entry 3262 (class 2604 OID 16447)
-- Name: countries id_country; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id_country SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- TOC entry 3265 (class 2604 OID 65598)
-- Name: matches id_match; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches ALTER COLUMN id_match SET DEFAULT nextval('public.matches_id_match_seq'::regclass);


--
-- TOC entry 3263 (class 2604 OID 16456)
-- Name: players id_player; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players ALTER COLUMN id_player SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- TOC entry 3264 (class 2604 OID 16486)
-- Name: stadiums id_stadium; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stadiums ALTER COLUMN id_stadium SET DEFAULT nextval('public.stadiums_id_seq'::regclass);


--
-- TOC entry 3418 (class 0 OID 16444)
-- Dependencies: 210
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id_country, country_name, info, photo, country_group, titles, dt) FROM stdin;
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
-- TOC entry 3424 (class 0 OID 65595)
-- Dependencies: 216
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matches (id_match, home_team_id, away_team_id, match_datetime, stadium_id, score_home_team, score_away_team, match_group) FROM stdin;
1	1	4	2024-06-20 21:00:00	1	2	0	A
18	12	11	2024-07-01 22:00:00	13	\N	\N	C
19	9	10	2024-07-01 22:00:00	4	\N	\N	C
24	13	14	2024-07-02 22:00:00	14	\N	\N	D
25	16	15	2024-07-02 22:00:00	5	\N	\N	D
2	2	3	2024-06-21 21:00:00	3	0	0	A
3	2	4	2024-06-25 19:00:00	11	0	1	A
4	3	1	2024-06-25 22:00:00	7	0	1	A
5	1	2	2024-06-29 21:00:00	2	2	0	A
6	4	3	2024-06-29 21:00:00	13	0	0	A
8	6	7	2024-06-21 19:00:00	14	1	2	B
9	5	8	2024-06-21 22:00:00	9	1	0	B
10	6	8	2024-06-26 19:00:00	12	3	1	B
11	7	5	2024-06-26 22:00:00	10	1	0	B
12	5	6	2024-06-30 21:00:00	8	0	0	B
13	8	7	2024-06-30 21:00:00	5	0	3	B
14	9	12	2024-06-23 19:00:00	3	2	0	C
15	10	11	2024-06-23 22:00:00	2	3	1	C
16	11	9	2024-06-27 19:00:00	1	2	1	C
17	10	12	2024-06-27 22:00:00	7	5	0	C
20	14	15	2024-06-24 19:00:00	9	2	1	D
21	13	16	2024-06-24 22:00:00	10	0	0	D
22	14	16	2024-06-28 19:00:00	8	3	0	D
23	15	13	2024-06-28 22:00:00	12	1	4	D
\.


--
-- TOC entry 3420 (class 0 OID 16453)
-- Dependencies: 212
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (id_player, player_name, team, photo, country, "position") FROM stdin;
14	Marcos Acuña	Sevilla	https://media.tycsports.com/files/2022/11/01/500254/marcos-acuna-seleccion-argentina_1440x810_wmk.webp?v=1	1	Defensor
15	Nicolas Tagliafico	OL	https://www.debrown.com.ar/wp-content/uploads/2023/09/Tagliafico-51-partidos-argentina.jpg	1	Defensor
16	German Pezzella	Real Betis	https://media.lacapital.com.ar/p/aa9a41a25e82a90912a8d1d90e6f553d/adjuntos/205/imagenes/101/668/0101668249/german-pezzellajpeg.jpeg	1	Defensor
17	Lucas Martinez Quarta	Fiorentina	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWE50zp0bK36b_M1HazyvI3eOEhxAyiY-9rA&s	1	Defensor
12	Cristian Romero	Tottenham	https://a.espncdn.com/photo/2021/1201/r945033_1296x729_16-9.jpg	1	Defensor
18	Guido Rodriguez	Real Betis	https://tmssl.akamaized.net/images/foto/galerie/guido-rodriguez-argentina-1626788242-67549.jpg?lm=1626788257	1	Mediocampista
19	Gonzalo Montiel	Nottingham Forest	https://statics.launion.digital/2022/12/crop/6393da226c3a0__940x620.webp	1	Defensor
20	Leandro Paredes	AS Roma	https://media.tycsports.com/files/2021/06/17/295588/leandro-paredes_1440x810_wmk.jpg?v=4	1	Mediocampista
21	Alexis Macallister	Liverpool	https://tmssl.akamaized.net/images/foto/galerie/alexis-mac-allister-fc-liverpool-2023-1693910962-115929.jpg?lm=1693910988	1	Mediocampista
22	Rodrigo De Paul	Atletico de Madrid	https://resizer.glanacion.com/resizer/v2/rodrigo-de-paul-cumplio-30-anos-publico-fotos-con-2RUW2FLGJZBXNBQYBRNYSCUPW4.jpg?auth=472d4105194458f16c0ec2a62633ae1da1c8423f3abd6bc5b5ca9ffdb826a645&width=880&height=586&quality=70&smart=true	1	Mediocampista
10	Nahuel Molina	Atletico de Madrid	https://tmssl.akamaized.net/images/foto/galerie/nahuel-molina-1697214727-119313.jpg?lm=1697214743	1	Defensor
23	Exequiel Palacios	Bayer Leverkusen	https://laseleccionargentina.com/wp-content/uploads/2024/03/Palacios-1024x576.jpg	1	Mediocampista
24	Enzo Fernandez	Chelsea	https://laseleccionargentina.com/wp-content/uploads/2023/11/Enzo-Fernandez-1.jpg	1	Mediocampista
25	Giovanni Lo Celso	Tottenham	https://a3.espncdn.com/combiner/i?img=%2Fphoto%2F2023%2F0329%2Fr1151437_1296x729_16%2D9.jpg	1	Mediocampista
5	Emiliano Martinez	Aston Villa	https://tmssl.akamaized.net/images/foto/galerie/martinez-emiliano-2023-argentina-1694190167-116225.jpg?lm=1694190315	1	Arquero
27	Lionel Messi	Inter de Miami	https://www.fifpro.org/media/fhmfhvkx/messi-world-cup.jpg?rxy=0.48356841796117644,0.31512414378031967&width=1600&height=1024&rnd=133210253587130000	1	Delantero
8	Franco Armani	River	https://media.tycsports.com/files/2023/05/12/567348/armani_1440x810_wmk.webp	1	Arquero
9	Geronimo Rulli	Ajax	https://media.tycsports.com/files/2022/11/02/500760/geronimo-rulli-seleccion-argentina_416x234.webp	1	Arquero
11	Lisandro Martinez	Manchester United	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvZmxSxOXJaqIgjc5107f5x_bl5zhH-rNnaw&s	1	Defensor
13	Nicolas Otamendi	Benfica	https://tn.com.ar/resizer/v2/nicolas-otamendi-defensor-de-la-seleccion-argentina-en-el-mundial-de-qatar-2022-OZOCUEEXBFCMJHWJNFJOVNZGAA.jpg?auth=17f08ec965ea5df0a21e4792e30e8913efcf4c64f135726ce336afade2072939&width=767	1	Defensor
29	Alejandro Garnacho	Manchester United	https://media.tycsports.com/files/2024/03/09/688063/garnacho-manchester-united_1440x810_wmk.webp?v=1	1	Delantero
30	Lautaro Martinez	Inter de Milan	https://laseleccionargentina.com/wp-content/uploads/2024/01/Lautaro-Martinez-Inter-vs-Milan.jpg	1	Delantero
31	Julian Alvarez	Mancheste City	https://lmdiario.com.ar/download/multimedia.normal.af6cde1cfcc75bda.6a756c69616e20616c766172657a20466f746f204e41205245555445525320465f6e6f726d616c2e77656270.webp	1	Delantero
26	Angel Di Maria	Benfica	https://www.elciudadanoweb.com/wp-content/uploads/2024/06/di-maria-1280x960.jpg	1	Delantero
28	Valentin Carboni	AC Monza	https://www.topmercato.com/wp-content/uploads/2024/03/ICONSPORT_199131_0105-scaled.jpg	1	Mediocampista
32	Nicolas Gonzalez	Fiorentina	https://cdn.eldestapeweb.com/eldestape/062024/1719232932357.webp?cw=1296&ch=729&extw=jpg	1	Delantero
33	Vinicius Jr	Real Madrid	https://www.fifpro.org/media/fhxkcocj/imago1036849243h.jpg	13	Delantero
\.


--
-- TOC entry 3422 (class 0 OID 16483)
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
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 209
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 16, true);


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 215
-- Name: matches_id_match_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.matches_id_match_seq', 25, true);


--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 211
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_id_seq', 33, true);


--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 213
-- Name: stadiums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stadiums_id_seq', 14, true);


--
-- TOC entry 3267 (class 2606 OID 16451)
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id_country);


--
-- TOC entry 3273 (class 2606 OID 65600)
-- Name: matches matches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_pkey PRIMARY KEY (id_match);


--
-- TOC entry 3269 (class 2606 OID 16460)
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id_player);


--
-- TOC entry 3271 (class 2606 OID 16490)
-- Name: stadiums stadiums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stadiums
    ADD CONSTRAINT stadiums_pkey PRIMARY KEY (id_stadium);


--
-- TOC entry 3276 (class 2606 OID 65606)
-- Name: matches matches_away_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_away_team_id_fkey FOREIGN KEY (away_team_id) REFERENCES public.countries(id_country);


--
-- TOC entry 3275 (class 2606 OID 65601)
-- Name: matches matches_home_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_home_team_id_fkey FOREIGN KEY (home_team_id) REFERENCES public.countries(id_country);


--
-- TOC entry 3277 (class 2606 OID 65611)
-- Name: matches matches_stadium_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_stadium_id_fkey FOREIGN KEY (stadium_id) REFERENCES public.stadiums(id_stadium);


--
-- TOC entry 3274 (class 2606 OID 16461)
-- Name: players players_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_country_fkey FOREIGN KEY (country) REFERENCES public.countries(id_country);


-- Completed on 2024-07-01 14:22:33 -03

--
-- PostgreSQL database dump complete
--
