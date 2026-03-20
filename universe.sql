--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: element; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.element (
    element_id integer NOT NULL,
    atomic_number integer,
    atomic_mass numeric(4,2),
    is_metal boolean,
    is_radioactive boolean,
    element_index integer,
    electronegativity numeric(4,2),
    name character varying(30) NOT NULL,
    element_description text
);


ALTER TABLE public.element OWNER TO freecodecamp;

--
-- Name: elements_element_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.elements_element_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elements_element_id_seq OWNER TO freecodecamp;

--
-- Name: elements_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.elements_element_id_seq OWNED BY public.element.element_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    description text,
    has_black_hole boolean,
    is_spiral boolean,
    diameter_light_years integer,
    name character varying(30) NOT NULL,
    galaxy_description text,
    galaxy_age integer
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    is_spherical boolean,
    has_atmosphere boolean,
    orbital_period_days integer,
    planet_id integer,
    name character varying(30) NOT NULL,
    moon_description text,
    moon_age integer,
    moon_mass numeric(4,2)
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
    has_life boolean,
    has_rings boolean,
    radius_km integer,
    star_id integer,
    name character varying(30) NOT NULL,
    planet_description text,
    planet_age integer,
    planet_mass numeric(4,2)
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
    has_planetary_system boolean,
    is_main_sequence boolean,
    temperature_kelvin integer,
    galaxy_id integer,
    name character varying(30) NOT NULL,
    star_description text,
    star_age integer,
    star_mass numeric(4,2)
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
-- Name: element element_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element ALTER COLUMN element_id SET DEFAULT nextval('public.elements_element_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: element; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.element VALUES (1, 1, 1.01, false, false, 1, 2.20, 'Hydrogen', 'Most abundant element in the universe');
INSERT INTO public.element VALUES (2, 2, 4.00, false, false, 2, 0.00, 'Helium', 'Second most abundant element, found in stars');
INSERT INTO public.element VALUES (3, 26, 55.85, true, false, 3, 1.83, 'Iron', 'Most common element found in planetary cores');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Large spiral galaxy', true, true, 100000, 'Milky Way', 'Our home galaxy', 13600);
INSERT INTO public.galaxy VALUES (2, 'Nearest spiral galaxy', false, true, 220000, 'Andromeda', 'Closest large galaxy to Milky Way', 10000);
INSERT INTO public.galaxy VALUES (3, 'Dwarf galaxy', false, false, 14000, 'Large Magellanic Cloud', 'Satellite galaxy of Milky Way', 13000);
INSERT INTO public.galaxy VALUES (4, 'Elliptical galaxy', true, false, 120000, 'Messier 87', 'Famous for its massive black hole', 13200);
INSERT INTO public.galaxy VALUES (5, 'Barred spiral galaxy', true, true, 130000, 'NGC 1300', 'Classic example of a barred spiral', 8000);
INSERT INTO public.galaxy VALUES (6, 'Irregular galaxy', false, false, 25000, 'Small Magellanic Cloud', 'Companion galaxy to the Milky Way', 6500);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, true, true, 27, 1, 'Moon', 'Earth''s only natural satellite', 4500, 1.20);
INSERT INTO public.moon VALUES (2, true, true, 16, 3, 'Titan', 'Largest moon of Saturn with thick atmosphere', 4500, 99.99);
INSERT INTO public.moon VALUES (3, true, false, 2, 3, 'Enceladus', 'Saturn moon with water geysers', 4500, 0.18);
INSERT INTO public.moon VALUES (4, true, false, 1, 3, 'Mimas', 'Saturn moon with a giant impact crater', 4500, 0.04);
INSERT INTO public.moon VALUES (5, true, false, 4, 3, 'Dione', 'Saturn moon with oxygen atmosphere traces', 4500, 0.95);
INSERT INTO public.moon VALUES (6, true, true, 7, 4, 'Ganymede', 'Largest moon in the solar system', 4500, 99.99);
INSERT INTO public.moon VALUES (7, true, true, 3, 4, 'Europa', 'Jupiter moon with subsurface ocean', 4500, 48.00);
INSERT INTO public.moon VALUES (8, true, true, 2, 4, 'Io', 'Most volcanically active body in solar system', 4500, 59.00);
INSERT INTO public.moon VALUES (9, true, false, 16, 4, 'Callisto', 'Heavily cratered moon of Jupiter', 4500, 71.00);
INSERT INTO public.moon VALUES (10, false, false, 0, 2, 'Phobos', 'Larger of Mars two moons, irregular shape', 4500, 0.01);
INSERT INTO public.moon VALUES (11, false, false, 1, 2, 'Deimos', 'Smaller and more distant moon of Mars', 4500, 0.00);
INSERT INTO public.moon VALUES (12, true, false, 6, 5, 'Triton', 'Neptune''s largest moon, retrograde orbit', 4500, 35.00);
INSERT INTO public.moon VALUES (13, false, false, 360, 5, 'Nereid', 'Neptune moon with highly elliptical orbit', 4500, 0.03);
INSERT INTO public.moon VALUES (14, true, false, 5, 5, 'Proteus', 'Dark and irregularly shaped Neptune moon', 4500, 0.05);
INSERT INTO public.moon VALUES (15, true, false, 9, 7, 'Proxima m1', 'Hypothetical moon orbiting Proxima b', 4850, 0.80);
INSERT INTO public.moon VALUES (16, false, false, 14, 8, 'Sirius P1', 'Rocky moon in Sirius planetary system', 2000, 0.30);
INSERT INTO public.moon VALUES (17, true, false, 20, 9, 'Mirach m1', 'Moon orbiting gas giant in Andromeda system', 5000, 1.50);
INSERT INTO public.moon VALUES (18, false, false, 11, 10, 'LMC-M1', 'Moon in Large Magellanic Cloud system', 7000, 0.22);
INSERT INTO public.moon VALUES (19, true, false, 8, 11, 'Proxima c1', 'Moon orbiting Proxima c exoplanet', 4850, 0.60);
INSERT INTO public.moon VALUES (20, false, false, 30, 12, 'Sirius Bc1', 'Distant moon of ringed gas giant near Sirius', 2500, 0.45);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, true, false, 6371, 1, 'Earth', 'Only known planet with life', 4500, 1.00);
INSERT INTO public.planet VALUES (2, false, false, 3390, 1, 'Mars', 'The Red Planet with iron oxide surface', 4500, 0.11);
INSERT INTO public.planet VALUES (3, false, true, 58232, 1, 'Saturn', 'Gas giant famous for its ring system', 4500, 95.15);
INSERT INTO public.planet VALUES (4, false, true, 71492, 1, 'Jupiter', 'Largest planet in the solar system', 4500, 99.99);
INSERT INTO public.planet VALUES (5, false, false, 2439, 1, 'Mercury', 'Smallest and innermost planet', 4500, 0.06);
INSERT INTO public.planet VALUES (6, false, true, 25362, 1, 'Neptune', 'Coldest and windiest planet', 4500, 17.15);
INSERT INTO public.planet VALUES (7, false, false, 3760, 2, 'Proxima b', 'Potentially habitable exoplanet', 4850, 1.27);
INSERT INTO public.planet VALUES (8, false, false, 7150, 3, 'Sirius Ab', 'Rocky planet orbiting Sirius', 2000, 3.40);
INSERT INTO public.planet VALUES (9, false, true, 9500, 4, 'Mirach b', 'Gas giant in Andromeda system', 5000, 12.50);
INSERT INTO public.planet VALUES (10, false, false, 5800, 5, 'LMC-P1', 'Rocky planet in LMC star system', 7000, 2.30);
INSERT INTO public.planet VALUES (11, false, false, 4200, 2, 'Proxima c', 'Second exoplanet around Proxima Centauri', 4850, 7.00);
INSERT INTO public.planet VALUES (12, false, true, 11000, 3, 'Sirius Bc', 'Gas giant with rings near Sirius', 2500, 45.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, true, true, 5778, 1, 'Sun', 'The star at the center of our solar system', 4600, 1.00);
INSERT INTO public.star VALUES (2, false, true, 3500, 1, 'Proxima Centauri', 'Closest star to the Sun', 4850, 0.12);
INSERT INTO public.star VALUES (3, true, true, 9940, 1, 'Sirius', 'Brightest star in the night sky', 2420, 2.02);
INSERT INTO public.star VALUES (4, false, false, 3500, 2, 'Alpheratz', 'Brightest star in Andromeda galaxy', 5000, 3.60);
INSERT INTO public.star VALUES (5, true, true, 5200, 3, 'HV 2112', 'Massive star in Large Magellanic Cloud', 8000, 1.80);
INSERT INTO public.star VALUES (6, false, false, 30000, 4, 'P Cygni', 'Luminous blue variable star in M87 region', 5000, 76.00);


--
-- Name: elements_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.elements_element_id_seq', 3, true);


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
-- Name: element elements_element_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT elements_element_name_key UNIQUE (name);


--
-- Name: element elements_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT elements_pkey PRIMARY KEY (element_id);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


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

