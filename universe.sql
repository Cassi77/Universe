--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_type_id integer,
    age_in_billions_years numeric(4,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    avg_number_of_stars integer NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    distance_from_planet_km integer,
    has_water boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    has_life boolean,
    surface_temperature_celsius integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    surface_temperature_celsius integer,
    is_visible_from_earth boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'This is our galaxy', 1, 13.80);
INSERT INTO public.galaxy VALUES (2, 'LMC', 'This stands for large magellanic cloud', 2, 13.00);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'This is the closest galaxy', 1, 14.11);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 'We do not know much', 3, 5.70);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 'This galaxy was discovered recently', 1, 0.99);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'What a fancy name', 3, 11.11);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Elliptic', 1000000000);
INSERT INTO public.galaxy_type VALUES (2, 'Cloudy', 500000);
INSERT INTO public.galaxy_type VALUES (3, 'Spherical', 70000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (5, 'Europa', 5, 190000, true);
INSERT INTO public.moon VALUES (15, 'Lapetus', 7, 275000, true);
INSERT INTO public.moon VALUES (1, 'Moon', 2, 300000, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 100000, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 200000, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 2000, false);
INSERT INTO public.moon VALUES (6, 'Ganymade', 5, 78000, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 450000, false);
INSERT INTO public.moon VALUES (8, 'Titania', 6, 300000, false);
INSERT INTO public.moon VALUES (12, 'Miranda', 6, 300000, false);
INSERT INTO public.moon VALUES (23, 'Phantasma', 14, 300000, false);
INSERT INTO public.moon VALUES (25, 'Serenity', 17, 300000, false);
INSERT INTO public.moon VALUES (27, 'Solara', 19, 300000, false);
INSERT INTO public.moon VALUES (28, 'Crescentia', 21, 300000, false);
INSERT INTO public.moon VALUES (29, 'Zephyra', 22, 300000, false);
INSERT INTO public.moon VALUES (9, 'Oberon', 6, 275000, false);
INSERT INTO public.moon VALUES (10, 'Umbriel', 6, 275000, false);
INSERT INTO public.moon VALUES (26, 'Astraea', 18, 275000, false);
INSERT INTO public.moon VALUES (11, 'Ariel', 6, 100000, false);
INSERT INTO public.moon VALUES (13, 'Titan', 7, 100000, false);
INSERT INTO public.moon VALUES (14, 'Rhea', 7, 100000, false);
INSERT INTO public.moon VALUES (16, 'Dione', 7, 160000, false);
INSERT INTO public.moon VALUES (17, 'Enceladus', 7, 160000, false);
INSERT INTO public.moon VALUES (20, 'Lumina', 9, 160000, false);
INSERT INTO public.moon VALUES (21, 'Celestia', 11, 160000, false);
INSERT INTO public.moon VALUES (18, 'Triton', 8, 50000, false);
INSERT INTO public.moon VALUES (19, 'Proteus', 8, 50000, false);
INSERT INTO public.moon VALUES (22, 'Aetheria', 13, 50000, false);
INSERT INTO public.moon VALUES (24, 'Nova', 14, 50000, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Earth', 1, true, 20);
INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, 100);
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, 5);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, 50);
INSERT INTO public.planet VALUES (5, 'Juppiter', 1, false, -50);
INSERT INTO public.planet VALUES (6, 'Uranus', 1, false, -200);
INSERT INTO public.planet VALUES (7, 'Saturn', 1, false, -30);
INSERT INTO public.planet VALUES (8, 'Neptun', 1, false, -70);
INSERT INTO public.planet VALUES (9, 'Riss', 2, true, 300);
INSERT INTO public.planet VALUES (10, 'Yoda', 2, false, 125);
INSERT INTO public.planet VALUES (11, 'Bells', 4, false, 75);
INSERT INTO public.planet VALUES (12, 'Yeld', 4, true, 85);
INSERT INTO public.planet VALUES (13, 'Aelyn', 5, false, 0);
INSERT INTO public.planet VALUES (14, 'KN', 5, false, 500);
INSERT INTO public.planet VALUES (15, 'Leran', 5, true, -10);
INSERT INTO public.planet VALUES (16, 'Deghinsea', 6, false, -80);
INSERT INTO public.planet VALUES (17, 'Pluto', 7, false, 80);
INSERT INTO public.planet VALUES (18, 'Europa', 7, false, 0);
INSERT INTO public.planet VALUES (19, 'America', 9, false, 20);
INSERT INTO public.planet VALUES (20, 'Russia', 10, false, 55);
INSERT INTO public.planet VALUES (21, 'Lekain', 12, false, -5);
INSERT INTO public.planet VALUES (22, 'Arundel', 12, false, 60);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 10000, true);
INSERT INTO public.star VALUES (11, 'Selegon', 6, 10000, true);
INSERT INTO public.star VALUES (12, 'Phanuel', 6, 10000, true);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 50000, true);
INSERT INTO public.star VALUES (4, 'Res', 2, 50000, true);
INSERT INTO public.star VALUES (3, 'Antares', 1, 35000, true);
INSERT INTO public.star VALUES (10, 'Mist', 5, 40000, true);
INSERT INTO public.star VALUES (5, 'Sest', 2, 10000, false);
INSERT INTO public.star VALUES (6, 'Juno', 3, 10000, false);
INSERT INTO public.star VALUES (8, 'Ashunera', 5, 10000, false);
INSERT INTO public.star VALUES (7, 'Ashera', 4, 50000, false);
INSERT INTO public.star VALUES (9, 'Baric', 5, 35000, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 29, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 22, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

