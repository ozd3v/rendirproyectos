-- Role: secuser

-- DROP ROLE secuser;

CREATE ROLE secuser LOGIN
  ENCRYPTED PASSWORD 'md5e24a75ddb6858a5f53aa2f5a169a2f28'
  NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;

--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: sec; Type: SCHEMA; Schema: -; Owner: secuser
--

CREATE SCHEMA sec;


ALTER SCHEMA sec OWNER TO secuser;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = sec, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acl_class; Type: TABLE; Schema: sec; Owner: secuser; Tablespace: 
--

CREATE TABLE acl_class (
    id bigint NOT NULL,
    class character varying(100) NOT NULL
);


ALTER TABLE sec.acl_class OWNER TO secuser;

--
-- Name: acl_class_id_seq; Type: SEQUENCE; Schema: sec; Owner: secuser
--

CREATE SEQUENCE acl_class_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sec.acl_class_id_seq OWNER TO secuser;

--
-- Name: acl_class_id_seq; Type: SEQUENCE OWNED BY; Schema: sec; Owner: secuser
--

ALTER SEQUENCE acl_class_id_seq OWNED BY acl_class.id;


--
-- Name: acl_entry; Type: TABLE; Schema: sec; Owner: secuser; Tablespace: 
--

CREATE TABLE acl_entry (
    id bigint NOT NULL,
    acl_object_identity bigint NOT NULL,
    ace_order integer NOT NULL,
    sid bigint NOT NULL,
    mask integer NOT NULL,
    granting boolean NOT NULL,
    audit_success boolean NOT NULL,
    audit_failure boolean NOT NULL
);


ALTER TABLE sec.acl_entry OWNER TO secuser;

--
-- Name: acl_entry_id_seq; Type: SEQUENCE; Schema: sec; Owner: secuser
--

CREATE SEQUENCE acl_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sec.acl_entry_id_seq OWNER TO secuser;

--
-- Name: acl_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: sec; Owner: secuser
--

ALTER SEQUENCE acl_entry_id_seq OWNED BY acl_entry.id;


--
-- Name: acl_object_identity; Type: TABLE; Schema: sec; Owner: secuser; Tablespace: 
--

CREATE TABLE acl_object_identity (
    id bigint NOT NULL,
    object_id_class bigint NOT NULL,
    object_id_identity bigint NOT NULL,
    parent_object bigint,
    owner_sid bigint,
    entries_inheriting boolean NOT NULL
);


ALTER TABLE sec.acl_object_identity OWNER TO secuser;

--
-- Name: acl_object_identity_id_seq; Type: SEQUENCE; Schema: sec; Owner: secuser
--

CREATE SEQUENCE acl_object_identity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sec.acl_object_identity_id_seq OWNER TO secuser;

--
-- Name: acl_object_identity_id_seq; Type: SEQUENCE OWNED BY; Schema: sec; Owner: secuser
--

ALTER SEQUENCE acl_object_identity_id_seq OWNED BY acl_object_identity.id;


--
-- Name: acl_sid; Type: TABLE; Schema: sec; Owner: secuser; Tablespace: 
--

CREATE TABLE acl_sid (
    id bigint NOT NULL,
    principal boolean NOT NULL,
    sid character varying(100) NOT NULL
);


ALTER TABLE sec.acl_sid OWNER TO secuser;

--
-- Name: acl_sid_id_seq; Type: SEQUENCE; Schema: sec; Owner: secuser
--

CREATE SEQUENCE acl_sid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sec.acl_sid_id_seq OWNER TO secuser;

--
-- Name: acl_sid_id_seq; Type: SEQUENCE OWNED BY; Schema: sec; Owner: secuser
--

ALTER SEQUENCE acl_sid_id_seq OWNED BY acl_sid.id;


--
-- Name: authorities; Type: TABLE; Schema: sec; Owner: secuser; Tablespace: 
--

CREATE TABLE authorities (
    username character varying(50) NOT NULL,
    authority character varying(50) NOT NULL
);


ALTER TABLE sec.authorities OWNER TO secuser;

--
-- Name: group_authorities; Type: TABLE; Schema: sec; Owner: secuser; Tablespace: 
--

CREATE TABLE group_authorities (
    group_id bigint NOT NULL,
    authority character varying(50) NOT NULL
);


ALTER TABLE sec.group_authorities OWNER TO secuser;

--
-- Name: group_members; Type: TABLE; Schema: sec; Owner: secuser; Tablespace: 
--

CREATE TABLE group_members (
    id bigint NOT NULL,
    username character varying(50) NOT NULL,
    group_id bigint NOT NULL
);


ALTER TABLE sec.group_members OWNER TO secuser;

--
-- Name: group_members_id_seq; Type: SEQUENCE; Schema: sec; Owner: secuser
--

CREATE SEQUENCE group_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sec.group_members_id_seq OWNER TO secuser;

--
-- Name: group_members_id_seq; Type: SEQUENCE OWNED BY; Schema: sec; Owner: secuser
--

ALTER SEQUENCE group_members_id_seq OWNED BY group_members.id;


--
-- Name: groups; Type: TABLE; Schema: sec; Owner: secuser; Tablespace: 
--

CREATE TABLE groups (
    id bigint NOT NULL,
    group_name character varying(50) NOT NULL
);


ALTER TABLE sec.groups OWNER TO secuser;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: sec; Owner: secuser
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sec.groups_id_seq OWNER TO secuser;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: sec; Owner: secuser
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: persistent_logins; Type: TABLE; Schema: sec; Owner: secuser; Tablespace: 
--

CREATE TABLE persistent_logins (
    username character varying(64) NOT NULL,
    series character varying(64) NOT NULL,
    token character varying(64) NOT NULL,
    last_used timestamp without time zone NOT NULL
);


ALTER TABLE sec.persistent_logins OWNER TO secuser;

--
-- Name: users; Type: TABLE; Schema: sec; Owner: secuser; Tablespace: 
--

CREATE TABLE users (
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    enabled boolean NOT NULL
);


ALTER TABLE sec.users OWNER TO secuser;

--
-- Name: id; Type: DEFAULT; Schema: sec; Owner: secuser
--

ALTER TABLE ONLY acl_class ALTER COLUMN id SET DEFAULT nextval('acl_class_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: sec; Owner: secuser
--

ALTER TABLE ONLY acl_entry ALTER COLUMN id SET DEFAULT nextval('acl_entry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: sec; Owner: secuser
--

ALTER TABLE ONLY acl_object_identity ALTER COLUMN id SET DEFAULT nextval('acl_object_identity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: sec; Owner: secuser
--

ALTER TABLE ONLY acl_sid ALTER COLUMN id SET DEFAULT nextval('acl_sid_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: sec; Owner: secuser
--

ALTER TABLE ONLY group_members ALTER COLUMN id SET DEFAULT nextval('group_members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: sec; Owner: secuser
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Data for Name: acl_class; Type: TABLE DATA; Schema: sec; Owner: secuser
--



--
-- Name: acl_class_id_seq; Type: SEQUENCE SET; Schema: sec; Owner: secuser
--

SELECT pg_catalog.setval('acl_class_id_seq', 1, false);


--
-- Data for Name: acl_entry; Type: TABLE DATA; Schema: sec; Owner: secuser
--



--
-- Name: acl_entry_id_seq; Type: SEQUENCE SET; Schema: sec; Owner: secuser
--

SELECT pg_catalog.setval('acl_entry_id_seq', 1, false);


--
-- Data for Name: acl_object_identity; Type: TABLE DATA; Schema: sec; Owner: secuser
--



--
-- Name: acl_object_identity_id_seq; Type: SEQUENCE SET; Schema: sec; Owner: secuser
--

SELECT pg_catalog.setval('acl_object_identity_id_seq', 1, false);


--
-- Data for Name: acl_sid; Type: TABLE DATA; Schema: sec; Owner: secuser
--



--
-- Name: acl_sid_id_seq; Type: SEQUENCE SET; Schema: sec; Owner: secuser
--

SELECT pg_catalog.setval('acl_sid_id_seq', 1, false);


--
-- Data for Name: authorities; Type: TABLE DATA; Schema: sec; Owner: secuser
--

INSERT INTO authorities VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO authorities VALUES ('admin', 'ROLE_USER');
INSERT INTO authorities VALUES ('user', 'ROLE_USER');


--
-- Data for Name: group_authorities; Type: TABLE DATA; Schema: sec; Owner: secuser
--



--
-- Data for Name: group_members; Type: TABLE DATA; Schema: sec; Owner: secuser
--



--
-- Name: group_members_id_seq; Type: SEQUENCE SET; Schema: sec; Owner: secuser
--

SELECT pg_catalog.setval('group_members_id_seq', 1, false);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: sec; Owner: secuser
--



--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: sec; Owner: secuser
--

SELECT pg_catalog.setval('groups_id_seq', 1, false);


--
-- Data for Name: persistent_logins; Type: TABLE DATA; Schema: sec; Owner: secuser
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: sec; Owner: secuser
--

INSERT INTO users VALUES ('admin', '21232f297a57a5a743894a0e4a801fc3', true);
INSERT INTO users VALUES ('user', 'ee11cbb19052e40b07aac0ca060c23ee', true);


--
-- Name: acl_class_pkey; Type: CONSTRAINT; Schema: sec; Owner: secuser; Tablespace: 
--

ALTER TABLE ONLY acl_class
    ADD CONSTRAINT acl_class_pkey PRIMARY KEY (id);


--
-- Name: acl_entry_pkey; Type: CONSTRAINT; Schema: sec; Owner: secuser; Tablespace: 
--

ALTER TABLE ONLY acl_entry
    ADD CONSTRAINT acl_entry_pkey PRIMARY KEY (id);


--
-- Name: acl_object_identity_pkey; Type: CONSTRAINT; Schema: sec; Owner: secuser; Tablespace: 
--

ALTER TABLE ONLY acl_object_identity
    ADD CONSTRAINT acl_object_identity_pkey PRIMARY KEY (id);


--
-- Name: acl_sid_pkey; Type: CONSTRAINT; Schema: sec; Owner: secuser; Tablespace: 
--

ALTER TABLE ONLY acl_sid
    ADD CONSTRAINT acl_sid_pkey PRIMARY KEY (id);


--
-- Name: group_members_pkey; Type: CONSTRAINT; Schema: sec; Owner: secuser; Tablespace: 
--

ALTER TABLE ONLY group_members
    ADD CONSTRAINT group_members_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: sec; Owner: secuser; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: persistent_logins_pkey; Type: CONSTRAINT; Schema: sec; Owner: secuser; Tablespace: 
--

ALTER TABLE ONLY persistent_logins
    ADD CONSTRAINT persistent_logins_pkey PRIMARY KEY (series);


--
-- Name: unique_uk_1; Type: CONSTRAINT; Schema: sec; Owner: secuser; Tablespace: 
--

ALTER TABLE ONLY acl_sid
    ADD CONSTRAINT unique_uk_1 UNIQUE (sid, principal);


--
-- Name: unique_uk_2; Type: CONSTRAINT; Schema: sec; Owner: secuser; Tablespace: 
--

ALTER TABLE ONLY acl_class
    ADD CONSTRAINT unique_uk_2 UNIQUE (class);


--
-- Name: unique_uk_3; Type: CONSTRAINT; Schema: sec; Owner: secuser; Tablespace: 
--

ALTER TABLE ONLY acl_object_identity
    ADD CONSTRAINT unique_uk_3 UNIQUE (object_id_class, object_id_identity);


--
-- Name: unique_uk_4; Type: CONSTRAINT; Schema: sec; Owner: secuser; Tablespace: 
--

ALTER TABLE ONLY acl_entry
    ADD CONSTRAINT unique_uk_4 UNIQUE (acl_object_identity, ace_order);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: sec; Owner: secuser; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- Name: ix_auth_username; Type: INDEX; Schema: sec; Owner: secuser; Tablespace: 
--

CREATE UNIQUE INDEX ix_auth_username ON authorities USING btree (username, authority);


--
-- Name: fk_authorities_users; Type: FK CONSTRAINT; Schema: sec; Owner: secuser
--

ALTER TABLE ONLY authorities
    ADD CONSTRAINT fk_authorities_users FOREIGN KEY (username) REFERENCES users(username);


--
-- Name: fk_group_authorities_group; Type: FK CONSTRAINT; Schema: sec; Owner: secuser
--

ALTER TABLE ONLY group_authorities
    ADD CONSTRAINT fk_group_authorities_group FOREIGN KEY (group_id) REFERENCES groups(id);


--
-- Name: fk_group_members_group; Type: FK CONSTRAINT; Schema: sec; Owner: secuser
--

ALTER TABLE ONLY group_members
    ADD CONSTRAINT fk_group_members_group FOREIGN KEY (group_id) REFERENCES groups(id);


--
-- Name: foreign_fk_1; Type: FK CONSTRAINT; Schema: sec; Owner: secuser
--

ALTER TABLE ONLY acl_object_identity
    ADD CONSTRAINT foreign_fk_1 FOREIGN KEY (parent_object) REFERENCES acl_object_identity(id);


--
-- Name: foreign_fk_2; Type: FK CONSTRAINT; Schema: sec; Owner: secuser
--

ALTER TABLE ONLY acl_object_identity
    ADD CONSTRAINT foreign_fk_2 FOREIGN KEY (object_id_class) REFERENCES acl_class(id);


--
-- Name: foreign_fk_3; Type: FK CONSTRAINT; Schema: sec; Owner: secuser
--

ALTER TABLE ONLY acl_object_identity
    ADD CONSTRAINT foreign_fk_3 FOREIGN KEY (owner_sid) REFERENCES acl_sid(id);


--
-- Name: foreign_fk_4; Type: FK CONSTRAINT; Schema: sec; Owner: secuser
--

ALTER TABLE ONLY acl_entry
    ADD CONSTRAINT foreign_fk_4 FOREIGN KEY (acl_object_identity) REFERENCES acl_object_identity(id);


--
-- Name: foreign_fk_5; Type: FK CONSTRAINT; Schema: sec; Owner: secuser
--

ALTER TABLE ONLY acl_entry
    ADD CONSTRAINT foreign_fk_5 FOREIGN KEY (sid) REFERENCES acl_sid(id);


--
-- PostgreSQL database dump complete
--

-- Role: secuser


ALTER ROLE secuser
  SET search_path = sec;

