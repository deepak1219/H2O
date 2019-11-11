--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5
-- Dumped by pg_dump version 11.5

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
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- Name: postgis_raster; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis_raster WITH SCHEMA public;


--
-- Name: EXTENSION postgis_raster; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_raster IS 'PostGIS raster types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_access_tokens (
    id character varying(100) NOT NULL,
    user_id bigint,
    client_id integer NOT NULL,
    name character varying(255),
    scopes text,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_access_tokens OWNER TO postgres;

--
-- Name: oauth_auth_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_auth_codes (
    id character varying(100) NOT NULL,
    user_id bigint NOT NULL,
    client_id integer NOT NULL,
    scopes text,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_auth_codes OWNER TO postgres;

--
-- Name: oauth_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_clients (
    id integer NOT NULL,
    user_id bigint,
    name character varying(255) NOT NULL,
    secret character varying(100) NOT NULL,
    redirect text NOT NULL,
    personal_access_client boolean NOT NULL,
    password_client boolean NOT NULL,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_clients OWNER TO postgres;

--
-- Name: oauth_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_clients_id_seq OWNER TO postgres;

--
-- Name: oauth_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_clients_id_seq OWNED BY public.oauth_clients.id;


--
-- Name: oauth_personal_access_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_personal_access_clients (
    id integer NOT NULL,
    client_id integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_personal_access_clients OWNER TO postgres;

--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_personal_access_clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_personal_access_clients_id_seq OWNER TO postgres;

--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_personal_access_clients_id_seq OWNED BY public.oauth_personal_access_clients.id;


--
-- Name: oauth_refresh_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_refresh_tokens (
    id character varying(100) NOT NULL,
    access_token_id character varying(100) NOT NULL,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_refresh_tokens OWNER TO postgres;

--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    roles json,
    is_active boolean DEFAULT false NOT NULL,
    activation_token character varying(255) NOT NULL,
    deleted_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: vendor_contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_contacts (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    business_name character varying(255) NOT NULL,
    registration_no character varying(255) NOT NULL,
    contact_no character varying(20) NOT NULL,
    contact_no_alternate character varying(20),
    address text NOT NULL,
    "position" public.geography(Geometry,4326) NOT NULL,
    timings json,
    is_active boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.vendor_contacts OWNER TO postgres;

--
-- Name: vendor_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_contacts_id_seq OWNER TO postgres;

--
-- Name: vendor_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_contacts_id_seq OWNED BY public.vendor_contacts.id;


--
-- Name: vendor_services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendor_services (
    id bigint NOT NULL,
    vendor_id bigint NOT NULL,
    water_cat_id bigint NOT NULL,
    water_brand_id bigint NOT NULL,
    water_no_litres double precision NOT NULL,
    actual_amount double precision NOT NULL,
    tax_amount double precision NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.vendor_services OWNER TO postgres;

--
-- Name: vendor_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendor_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendor_services_id_seq OWNER TO postgres;

--
-- Name: vendor_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendor_services_id_seq OWNED BY public.vendor_services.id;


--
-- Name: water_brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.water_brands (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.water_brands OWNER TO postgres;

--
-- Name: water_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.water_brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.water_brands_id_seq OWNER TO postgres;

--
-- Name: water_brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.water_brands_id_seq OWNED BY public.water_brands.id;


--
-- Name: water_carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.water_carts (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    service_id bigint NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.water_carts OWNER TO postgres;

--
-- Name: water_carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.water_carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.water_carts_id_seq OWNER TO postgres;

--
-- Name: water_carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.water_carts_id_seq OWNED BY public.water_carts.id;


--
-- Name: water_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.water_categories (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.water_categories OWNER TO postgres;

--
-- Name: water_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.water_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.water_categories_id_seq OWNER TO postgres;

--
-- Name: water_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.water_categories_id_seq OWNED BY public.water_categories.id;


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: oauth_clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_clients_id_seq'::regclass);


--
-- Name: oauth_personal_access_clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_personal_access_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_personal_access_clients_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vendor_contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_contacts ALTER COLUMN id SET DEFAULT nextval('public.vendor_contacts_id_seq'::regclass);


--
-- Name: vendor_services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_services ALTER COLUMN id SET DEFAULT nextval('public.vendor_services_id_seq'::regclass);


--
-- Name: water_brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.water_brands ALTER COLUMN id SET DEFAULT nextval('public.water_brands_id_seq'::regclass);


--
-- Name: water_carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.water_carts ALTER COLUMN id SET DEFAULT nextval('public.water_carts_id_seq'::regclass);


--
-- Name: water_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.water_categories ALTER COLUMN id SET DEFAULT nextval('public.water_categories_id_seq'::regclass);


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
13	2014_10_12_000000_create_users_table	1
14	2014_10_12_100000_create_password_resets_table	1
15	2016_06_01_000001_create_oauth_auth_codes_table	1
16	2016_06_01_000002_create_oauth_access_tokens_table	1
17	2016_06_01_000003_create_oauth_refresh_tokens_table	1
18	2016_06_01_000004_create_oauth_clients_table	1
19	2016_06_01_000005_create_oauth_personal_access_clients_table	1
20	2019_08_19_000000_create_failed_jobs_table	1
21	2019_10_03_093126_add_roles_to_users_table	1
22	2019_10_04_103618_create_water_categories_table	1
23	2019_10_04_104902_create_water_brands_table	1
24	2019_10_22_100945_add_active_status_and_activation_token_to_users_table	1
27	2019_10_23_063412_create_vendor_contacts_table	2
28	2019_10_24_092343_create_vendor_services_table	3
30	2019_10_28_111835_create_water_carts_table	4
\.


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_access_tokens (id, user_id, client_id, name, scopes, revoked, created_at, updated_at, expires_at) FROM stdin;
0a470e985aa5cf153ea91b6dac1f92c4611f206befdf893ebc20c7e34d156a9cb19768b2f57a9e40	4	1	MyApp	[]	f	2019-10-22 12:21:41	2019-10-22 12:21:41	2020-10-22 12:21:41
d051c5f135f487b6d212b1ea3e188fa10df674f4f6025ac506737fa511f11e99fc9bfa11b80876d9	4	1	MyApp	[]	f	2019-10-22 12:35:58	2019-10-22 12:35:58	2020-10-22 12:35:58
e8095f044fcdda50030cf2a8c96f88a93d34c57efde7fa7add04db3fe568fa82b7286d33a0264c60	4	1	MyApp	[]	t	2019-10-22 12:37:32	2019-10-22 12:37:32	2020-10-22 12:37:32
817a78acaf42f1fb32a4f74df4c32466b10508aea46ab0eb74d0d4945682ced8faef643a050ed70e	4	1	MyApp	[]	t	2019-10-22 12:48:32	2019-10-22 12:48:32	2020-10-22 12:48:32
58876ffdc86f84a95d762b3a19ee30a19fa8567dfc773cba0d38a686ef2761213aade9539c97b1eb	4	1	MyApp	[]	f	2019-10-23 10:26:23	2019-10-23 10:26:23	2020-10-23 10:26:23
9aead46c1dae2d18e923e0d662afbe6a655a330765c6345577dbc7f5bbca372ab5b30f7615863b5a	5	1	MyApp	[]	f	2019-10-23 12:21:27	2019-10-23 12:21:27	2020-10-23 12:21:27
16b46bfb9468933061dea0167e47da41e534fdf21241f01da6eda7b97f05f6228c7d2856d08e9e1a	5	1	MyApp	[]	f	2019-10-23 12:28:22	2019-10-23 12:28:22	2020-10-23 12:28:22
a2578162c741f481fb9a03d1ebdf100903dfecbb1b32351d5aae63d47a258ddeedc35c909e949539	6	1	MyApp	[]	f	2019-10-28 11:53:45	2019-10-28 11:53:45	2020-10-28 11:53:45
\.


--
-- Data for Name: oauth_auth_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_auth_codes (id, user_id, client_id, scopes, revoked, expires_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_clients (id, user_id, name, secret, redirect, personal_access_client, password_client, revoked, created_at, updated_at) FROM stdin;
1	\N	h2o	kWuAxu9zTiFgQfjRJXWiN0nLH4DYKIdPgnKQFjAn	http://localhost	t	f	f	2019-10-22 12:21:03	2019-10-22 12:21:03
\.


--
-- Data for Name: oauth_personal_access_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_personal_access_clients (id, client_id, created_at, updated_at) FROM stdin;
1	1	2019-10-22 12:21:03	2019-10-22 12:21:03
\.


--
-- Data for Name: oauth_refresh_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.oauth_refresh_tokens (id, access_token_id, revoked, expires_at) FROM stdin;
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, roles, is_active, activation_token, deleted_at) FROM stdin;
4	test	test@test.com	\N	$2y$10$lSMZAv/Cnj8m/NPzCEtvpelaxj4t3sUamcA65lbb/nEfpyUnLnPba	\N	2019-10-22 12:21:41	2019-10-22 12:21:41	["vendor"]	t	17qabwLjHqel5vf0w0LtL6VQ9FYY63QM4JK4oHNH	\N
5	test1	test1@test.com	\N	$2y$10$iEj.yog7rKfxvP3t4u422OZNzgPGMT6ncqGs1Lygi6XGB7WZjL/JG	\N	2019-10-23 12:21:27	2019-10-23 12:21:27	["vendor"]	t	FrJyJFW6tr3ChAuXEX61H4KHcJOLoZls8BAZauPh	\N
6	customer1	test2@test.com	\N	$2y$10$sJsYxgauk1Km37ytLHBf.OhIp.dXwLj.migauZQms8LkZ9eun.UbC	\N	2019-10-28 11:53:45	2019-10-28 11:53:45	["customer"]	t	NNjxLzXvvURyvIfzUlUTD4WsbVSTkZZErgeLi0MW	\N
\.


--
-- Data for Name: vendor_contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_contacts (id, user_id, business_name, registration_no, contact_no, contact_no_alternate, address, "position", timings, is_active, created_at, updated_at) FROM stdin;
6	4	testbus	12334	34343443	\N	tetet	0101000020E61000000000000000003E400000000000002440	\N	t	\N	\N
\.


--
-- Data for Name: vendor_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendor_services (id, vendor_id, water_cat_id, water_brand_id, water_no_litres, actual_amount, tax_amount, is_active, created_at, updated_at) FROM stdin;
1	6	1	1	20	40.5	2	t	2019-10-24 11:06:42	2019-10-24 11:08:05
\.


--
-- Data for Name: water_brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.water_brands (id, name, is_active, created_at, updated_at) FROM stdin;
1	Local RO	t	\N	\N
2	Bisleri	t	\N	\N
\.


--
-- Data for Name: water_carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.water_carts (id, user_id, service_id, quantity, created_at, updated_at) FROM stdin;
1	6	1	1	2019-10-28 12:02:53	2019-10-28 12:02:53
\.


--
-- Data for Name: water_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.water_categories (id, name, is_active, created_at, updated_at) FROM stdin;
1	tanker	t	\N	\N
2	drinking water	t	\N	\N
\.


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 30, true);


--
-- Name: oauth_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_clients_id_seq', 1, true);


--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_personal_access_clients_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: vendor_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_contacts_id_seq', 6, true);


--
-- Name: vendor_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendor_services_id_seq', 1, true);


--
-- Name: water_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.water_brands_id_seq', 2, true);


--
-- Name: water_carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.water_carts_id_seq', 1, true);


--
-- Name: water_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.water_categories_id_seq', 4, true);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_auth_codes oauth_auth_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_auth_codes
    ADD CONSTRAINT oauth_auth_codes_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_personal_access_clients oauth_personal_access_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_personal_access_clients
    ADD CONSTRAINT oauth_personal_access_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_refresh_tokens oauth_refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_refresh_tokens
    ADD CONSTRAINT oauth_refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vendor_contacts vendor_contacts_business_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_contacts
    ADD CONSTRAINT vendor_contacts_business_name_unique UNIQUE (business_name);


--
-- Name: vendor_contacts vendor_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_contacts
    ADD CONSTRAINT vendor_contacts_pkey PRIMARY KEY (id);


--
-- Name: vendor_contacts vendor_contacts_registration_no_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_contacts
    ADD CONSTRAINT vendor_contacts_registration_no_unique UNIQUE (registration_no);


--
-- Name: vendor_services vendor_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_services
    ADD CONSTRAINT vendor_services_pkey PRIMARY KEY (id);


--
-- Name: water_brands water_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.water_brands
    ADD CONSTRAINT water_brands_pkey PRIMARY KEY (id);


--
-- Name: water_carts water_carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.water_carts
    ADD CONSTRAINT water_carts_pkey PRIMARY KEY (id);


--
-- Name: water_categories water_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.water_categories
    ADD CONSTRAINT water_categories_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth_access_tokens_user_id_index ON public.oauth_access_tokens USING btree (user_id);


--
-- Name: oauth_clients_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth_clients_user_id_index ON public.oauth_clients USING btree (user_id);


--
-- Name: oauth_personal_access_clients_client_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth_personal_access_clients_client_id_index ON public.oauth_personal_access_clients USING btree (client_id);


--
-- Name: oauth_refresh_tokens_access_token_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX oauth_refresh_tokens_access_token_id_index ON public.oauth_refresh_tokens USING btree (access_token_id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: vendor_contacts vendor_contacts_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_contacts
    ADD CONSTRAINT vendor_contacts_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: vendor_services vendor_services_vendor_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_services
    ADD CONSTRAINT vendor_services_vendor_id_foreign FOREIGN KEY (vendor_id) REFERENCES public.vendor_contacts(id);


--
-- Name: vendor_services vendor_services_water_brand_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_services
    ADD CONSTRAINT vendor_services_water_brand_id_foreign FOREIGN KEY (water_brand_id) REFERENCES public.water_brands(id);


--
-- Name: vendor_services vendor_services_water_cat_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendor_services
    ADD CONSTRAINT vendor_services_water_cat_id_foreign FOREIGN KEY (water_cat_id) REFERENCES public.water_categories(id);


--
-- PostgreSQL database dump complete
--

