--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: baginvites; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.baginvites (
    bagid integer NOT NULL,
    inviterid integer NOT NULL,
    token character(20) NOT NULL,
    createdat timestamp without time zone DEFAULT now(),
    acceptedat timestamp without time zone,
    accepted boolean,
    invitee text NOT NULL
);


--
-- Name: bagvalues; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.bagvalues (
    savedbagid integer,
    value text,
    extra text
);


--
-- Name: clob; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.clob (
    clobid integer,
    clobpage integer,
    value text
);
ALTER TABLE ONLY public.clob ALTER COLUMN value SET STORAGE PLAIN;


--
-- Name: intermine_metadata; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.intermine_metadata (
    key text,
    value text,
    blob_value bytea
);


--
-- Name: listtrack; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.listtrack (
    type text,
    count integer,
    buildmode text,
    event text,
    username text,
    sessionidentifier text,
    "timestamp" timestamp without time zone
);


--
-- Name: logintrack; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.logintrack (
    username text,
    "timestamp" timestamp without time zone
);


--
-- Name: objectstore_unique_integer; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.objectstore_unique_integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: osbag_int; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.osbag_int (
    bagid integer,
    value integer
);


--
-- Name: permanenttoken; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.permanenttoken (
    token text,
    intermine_level text,
    message text,
    datecreated bigint,
    id integer,
    userprofileid integer
);


--
-- Name: precompute_index; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.precompute_index (
    name text,
    statement text,
    category text
);


--
-- Name: querytrack; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.querytrack (
    type text,
    username text,
    sessionidentifier text,
    "timestamp" timestamp without time zone
);


--
-- Name: savedbag; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.savedbag (
    osbid integer NOT NULL,
    type text,
    id integer NOT NULL,
    name text,
    datecreated bigint,
    description text,
    userprofileid integer,
    intermine_state text
);


--
-- Name: savedquery; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.savedquery (
    id integer NOT NULL,
    query text,
    userprofileid integer
);


--
-- Name: savedtemplatequery; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.savedtemplatequery (
    templatequery text,
    id integer NOT NULL,
    userprofileid integer
);


--
-- Name: searchtrack; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.searchtrack (
    keyword text,
    username text,
    sessionidentifier text,
    "timestamp" timestamp without time zone
);


--
-- Name: serial; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.serial
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sharedbag; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.sharedbag (
    bagid integer NOT NULL,
    userprofileid integer NOT NULL
);


--
-- Name: tag; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.tag (
    objectidentifier text,
    type text,
    id integer NOT NULL,
    tagname text,
    userprofileid integer
);


--
-- Name: templatesummary; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.templatesummary (
    summary text,
    id integer NOT NULL,
    templateid integer
);


--
-- Name: templatetrack; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.templatetrack (
    templatename text,
    username text,
    sessionidentifier text,
    "timestamp" timestamp without time zone
);


--
-- Name: templatetrack_backup; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.templatetrack_backup (
    templatename text,
    username text,
    sessionidentifier text,
    "timestamp" timestamp without time zone
);


--
-- Name: userpreferences; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.userpreferences (
    userprofileid integer NOT NULL,
    preferencename text NOT NULL,
    preferencevalue text
);


--
-- Name: userprofile; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE public.userprofile (
    username text,
    password text,
    id integer NOT NULL,
    apikey text,
    localaccount boolean,
    superuser boolean
);

