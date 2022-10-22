--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: user_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_table (
    name character varying(30) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 1000
);


ALTER TABLE public.user_table OWNER TO freecodecamp;

--
-- Data for Name: user_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_table VALUES ('user_1666452788417', 2, 488);
INSERT INTO public.user_table VALUES ('user_1666452788418', 5, 26);
INSERT INTO public.user_table VALUES ('user_1666452809379', 2, 723);
INSERT INTO public.user_table VALUES ('user_1666452809380', 5, 41);
INSERT INTO public.user_table VALUES ('user_1666452842536', 2, 194);
INSERT INTO public.user_table VALUES ('user_1666452842537', 5, 51);
INSERT INTO public.user_table VALUES ('user_1666452887922', 2, 346);
INSERT INTO public.user_table VALUES ('user_1666452887923', 5, 8);
INSERT INTO public.user_table VALUES ('user_1666452915031', 2, 302);
INSERT INTO public.user_table VALUES ('user_1666452915032', 5, 164);
INSERT INTO public.user_table VALUES ('user_1666453000404', 2, 586);
INSERT INTO public.user_table VALUES ('user_1666453000405', 5, 197);
INSERT INTO public.user_table VALUES ('user_1666453132892', 2, 385);
INSERT INTO public.user_table VALUES ('user_1666453132893', 5, 134);
INSERT INTO public.user_table VALUES ('user_1666453198011', 2, 251);
INSERT INTO public.user_table VALUES ('user_1666453198012', 5, 316);
INSERT INTO public.user_table VALUES ('user_1666453219945', 2, 204);
INSERT INTO public.user_table VALUES ('user_1666453219947', 5, 7);


--
-- Name: user_table user_table_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_name_key UNIQUE (name);


--
-- PostgreSQL database dump complete
--

