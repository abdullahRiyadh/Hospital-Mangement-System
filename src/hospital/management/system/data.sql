--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)

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
-- Name: appointments; Type: TABLE; Schema: public; Owner: a_r
--

CREATE TABLE public.appointments (
    id integer NOT NULL,
    patient_id integer NOT NULL,
    doctor_id integer NOT NULL,
    appointment_date date NOT NULL
);


ALTER TABLE public.appointments OWNER TO a_r;

--
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: a_r
--

CREATE SEQUENCE public.appointments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.appointments_id_seq OWNER TO a_r;

--
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: a_r
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- Name: connection_info; Type: TABLE; Schema: public; Owner: a_r
--

CREATE TABLE public.connection_info (
    id integer NOT NULL,
    connected_at timestamp without time zone NOT NULL
);


ALTER TABLE public.connection_info OWNER TO a_r;

--
-- Name: connection_info_id_seq; Type: SEQUENCE; Schema: public; Owner: a_r
--

CREATE SEQUENCE public.connection_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.connection_info_id_seq OWNER TO a_r;

--
-- Name: connection_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: a_r
--

ALTER SEQUENCE public.connection_info_id_seq OWNED BY public.connection_info.id;


--
-- Name: doctors; Type: TABLE; Schema: public; Owner: a_r
--

CREATE TABLE public.doctors (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    specialization character varying(255) NOT NULL
);


ALTER TABLE public.doctors OWNER TO a_r;

--
-- Name: doctors_id_seq; Type: SEQUENCE; Schema: public; Owner: a_r
--

CREATE SEQUENCE public.doctors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.doctors_id_seq OWNER TO a_r;

--
-- Name: doctors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: a_r
--

ALTER SEQUENCE public.doctors_id_seq OWNED BY public.doctors.id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: a_r
--

CREATE TABLE public.patients (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    age integer NOT NULL,
    gender character varying(10) NOT NULL
);


ALTER TABLE public.patients OWNER TO a_r;

--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: a_r
--

CREATE SEQUENCE public.patients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.patients_id_seq OWNER TO a_r;

--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: a_r
--

ALTER SEQUENCE public.patients_id_seq OWNED BY public.patients.id;


--
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: a_r
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- Name: connection_info id; Type: DEFAULT; Schema: public; Owner: a_r
--

ALTER TABLE ONLY public.connection_info ALTER COLUMN id SET DEFAULT nextval('public.connection_info_id_seq'::regclass);


--
-- Name: doctors id; Type: DEFAULT; Schema: public; Owner: a_r
--

ALTER TABLE ONLY public.doctors ALTER COLUMN id SET DEFAULT nextval('public.doctors_id_seq'::regclass);


--
-- Name: patients id; Type: DEFAULT; Schema: public; Owner: a_r
--

ALTER TABLE ONLY public.patients ALTER COLUMN id SET DEFAULT nextval('public.patients_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: a_r
--

COPY public.appointments (id, patient_id, doctor_id, appointment_date) FROM stdin;
1	3	4	2025-05-31
\.


--
-- Data for Name: connection_info; Type: TABLE DATA; Schema: public; Owner: a_r
--

COPY public.connection_info (id, connected_at) FROM stdin;
1	2025-05-21 14:38:22.933
2	2025-05-21 14:41:28.646
3	2025-05-21 14:58:18.307
\.


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: a_r
--

COPY public.doctors (id, name, specialization) FROM stdin;
1	Partho Das	Gastroenterology
2	Abdullah Riyadh	Medicine
3	Monsur Alam Babu	Dentist
4	Abdul Azim	Sexologist
5	Rashik Ishrak	Psychiatry
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: a_r
--

COPY public.patients (id, name, age, gender) FROM stdin;
1	Sabbir	24	Male
2	Hridoy	22	Male
3	Mehedi	35	Male
4	Kabir	40	Male
5	Himel	38	Male
6	Badol	24	Male
\.


--
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: a_r
--

SELECT pg_catalog.setval('public.appointments_id_seq', 1, true);


--
-- Name: connection_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: a_r
--

SELECT pg_catalog.setval('public.connection_info_id_seq', 3, true);


--
-- Name: doctors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: a_r
--

SELECT pg_catalog.setval('public.doctors_id_seq', 5, true);


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: a_r
--

SELECT pg_catalog.setval('public.patients_id_seq', 6, true);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: a_r
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- Name: connection_info connection_info_pkey; Type: CONSTRAINT; Schema: public; Owner: a_r
--

ALTER TABLE ONLY public.connection_info
    ADD CONSTRAINT connection_info_pkey PRIMARY KEY (id);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: a_r
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (id);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: a_r
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: appointments appointments_doctor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: a_r
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_doctor_id_fkey FOREIGN KEY (doctor_id) REFERENCES public.doctors(id);


--
-- Name: appointments appointments_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: a_r
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(id);


--
-- PostgreSQL database dump complete
--


