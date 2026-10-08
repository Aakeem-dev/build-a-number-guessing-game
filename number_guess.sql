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
-- Name: guess_game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guess_game (
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.guess_game OWNER TO freecodecamp;

--
-- Data for Name: guess_game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guess_game VALUES ('user_1791480811240', 2, 579);
INSERT INTO public.guess_game VALUES ('user_1791480811241', 5, 109);
INSERT INTO public.guess_game VALUES ('user_1791480986537', 2, 721);
INSERT INTO public.guess_game VALUES ('user_1791480986538', 5, 310);
INSERT INTO public.guess_game VALUES ('user_1791481120654', 2, 100);
INSERT INTO public.guess_game VALUES ('user_1791481120655', 5, 242);
INSERT INTO public.guess_game VALUES ('user_1791481601454', 2, 590);
INSERT INTO public.guess_game VALUES ('user_1791481601455', 5, 36);
INSERT INTO public.guess_game VALUES ('user_1791481658699', 2, 196);
INSERT INTO public.guess_game VALUES ('user_1791481658700', 5, 57);


--
-- Name: guess_game guess_game_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guess_game
    ADD CONSTRAINT guess_game_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

