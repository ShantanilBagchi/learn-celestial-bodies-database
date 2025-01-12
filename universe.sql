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
    name character varying(255) NOT NULL,
    age_in_billion_years numeric(5,2) NOT NULL,
    has_black_hole boolean NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_event (
    galaxy_event_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    year_occurred integer NOT NULL,
    is_significant boolean NOT NULL
);


ALTER TABLE public.galaxy_event OWNER TO freecodecamp;

--
-- Name: galaxy_event_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_event_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_event_event_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_event_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_event_event_id_seq OWNED BY public.galaxy_event.galaxy_event_id;


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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    size_in_km integer NOT NULL,
    is_habitable boolean NOT NULL,
    orbit_period_days numeric(5,2)
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    diameter_in_km integer NOT NULL,
    has_life boolean NOT NULL,
    gravity numeric(6,2)
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    luminosity numeric(10,4) NOT NULL,
    is_visible boolean NOT NULL,
    age_in_million_years integer NOT NULL
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
-- Name: galaxy_event galaxy_event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_event ALTER COLUMN galaxy_event_id SET DEFAULT nextval('public.galaxy_event_event_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.51, true, 'Home galaxy of the Solar System');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.01, true, 'Nearest spiral galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 4.00, false, 'Part of the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 6.30, true, 'Interacting grand-design spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 9.80, true, 'Unusual bright bulge');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 13.20, false, 'Face-on spiral galaxy');


--
-- Data for Name: galaxy_event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_event VALUES (1, 'Big Bang Observation', 1, -13700, true);
INSERT INTO public.galaxy_event VALUES (2, 'Galaxy Collision', 2, 3000, true);
INSERT INTO public.galaxy_event VALUES (3, 'Supernova', 3, 2020, false);
INSERT INTO public.galaxy_event VALUES (4, 'Black Hole Detection', 4, 1995, true);
INSERT INTO public.galaxy_event VALUES (5, 'Quasar Discovery', 5, 1985, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, false, 27.30);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false, 0.30);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false, 1.30);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3642, false, 1.80);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3121, true, 3.50);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5262, false, 7.20);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4821, false, 16.70);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 5150, false, 15.90);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 504, true, 1.40);
INSERT INTO public.moon VALUES (10, 'Triton', 5, 2706, false, 5.80);
INSERT INTO public.moon VALUES (11, 'Charon', 6, 1212, false, 6.40);
INSERT INTO public.moon VALUES (12, 'Nix', 6, 50, false, 24.90);
INSERT INTO public.moon VALUES (13, 'Hydra', 6, 51, false, 38.20);
INSERT INTO public.moon VALUES (14, 'Kerberos', 6, 19, false, 32.10);
INSERT INTO public.moon VALUES (15, 'Styx', 6, 16, false, 20.20);
INSERT INTO public.moon VALUES (16, 'Kepler Moon-1', 7, 1200, false, 35.50);
INSERT INTO public.moon VALUES (17, 'Kepler Moon-2', 8, 1400, false, 40.20);
INSERT INTO public.moon VALUES (18, 'Proxima Moon-1', 9, 200, false, 10.20);
INSERT INTO public.moon VALUES (19, 'Proxima Moon-2', 10, 240, false, 15.50);
INSERT INTO public.moon VALUES (20, 'Gliese Moon-1', 11, 1100, false, 30.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 12742, true, 9.81);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 6779, false, 3.71);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 139820, false, 24.79);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 116460, false, 10.44);
INSERT INTO public.planet VALUES (5, 'Venus', 1, 12104, false, 8.87);
INSERT INTO public.planet VALUES (6, 'Mercury', 1, 4879, false, 3.70);
INSERT INTO public.planet VALUES (7, 'Kepler-22b', 2, 25280, true, 8.80);
INSERT INTO public.planet VALUES (8, 'Kepler-69c', 2, 18200, false, 9.00);
INSERT INTO public.planet VALUES (9, 'Proxima b', 6, 11400, false, 12.00);
INSERT INTO public.planet VALUES (10, 'Proxima c', 6, 12500, false, 10.50);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 3, 25000, true, 7.00);
INSERT INTO public.planet VALUES (12, 'Gliese 581d', 3, 22000, false, 5.60);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0000, true, 4600);
INSERT INTO public.star VALUES (2, 'Sirius', 2, 25.4000, true, 242);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 126000.0000, true, 8000);
INSERT INTO public.star VALUES (4, 'Rigel', 2, 120000.0000, true, 8000);
INSERT INTO public.star VALUES (5, 'Alpha Centauri', 1, 1.5190, true, 5500);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 0.0017, true, 4500);


--
-- Name: galaxy_event_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_event_event_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_event galaxy_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_event
    ADD CONSTRAINT galaxy_event_name_key UNIQUE (name);


--
-- Name: galaxy_event galaxy_event_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_event
    ADD CONSTRAINT galaxy_event_pkey PRIMARY KEY (galaxy_event_id);


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
-- Name: galaxy_event galaxy_event_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_event
    ADD CONSTRAINT galaxy_event_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

