--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: articles_article; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE articles_article (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    body_html text NOT NULL,
    pod_promos_id integer,
    pub_date timestamp with time zone NOT NULL,
    status integer NOT NULL
);


ALTER TABLE public.articles_article OWNER TO gareth53;

--
-- Name: articles_article_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE articles_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_article_id_seq OWNER TO gareth53;

--
-- Name: articles_article_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE articles_article_id_seq OWNED BY articles_article.id;


--
-- Name: articles_promo; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE articles_promo (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    headline character varying(200) NOT NULL,
    headline_link character varying(200),
    body_html text NOT NULL,
    article_link_id integer
);


ALTER TABLE public.articles_promo OWNER TO gareth53;

--
-- Name: articles_promo_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE articles_promo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.articles_promo_id_seq OWNER TO gareth53;

--
-- Name: articles_promo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE articles_promo_id_seq OWNED BY articles_promo.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO gareth53;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO gareth53;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO gareth53;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO gareth53;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO gareth53;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO gareth53;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO gareth53;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO gareth53;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO gareth53;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO gareth53;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO gareth53;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO gareth53;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: blog_blogcategory; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE blog_blogcategory (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    use_count integer
);


ALTER TABLE public.blog_blogcategory OWNER TO gareth53;

--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE blog_blogcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_blogcategory_id_seq OWNER TO gareth53;

--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE blog_blogcategory_id_seq OWNED BY blog_blogcategory.id;


--
-- Name: blog_entry; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE blog_entry (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    body_html text NOT NULL,
    pub_date timestamp with time zone NOT NULL,
    enable_comments boolean NOT NULL,
    category_id integer,
    status integer NOT NULL
);


ALTER TABLE public.blog_entry OWNER TO gareth53;

--
-- Name: blog_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE blog_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_entry_id_seq OWNER TO gareth53;

--
-- Name: blog_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE blog_entry_id_seq OWNED BY blog_entry.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO gareth53;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO gareth53;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO gareth53;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO gareth53;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO gareth53;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO gareth53;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_redirect; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE django_redirect (
    id integer NOT NULL,
    site_id integer NOT NULL,
    old_path character varying(200) NOT NULL,
    new_path character varying(200) NOT NULL
);


ALTER TABLE public.django_redirect OWNER TO gareth53;

--
-- Name: django_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE django_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_redirect_id_seq OWNER TO gareth53;

--
-- Name: django_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE django_redirect_id_seq OWNED BY django_redirect.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO gareth53;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO gareth53;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO gareth53;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: lifestream_item; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE lifestream_item (
    id integer NOT NULL,
    feed_id integer NOT NULL,
    url character varying(500) NOT NULL,
    title character varying(255) NOT NULL,
    pub_date timestamp with time zone,
    author character varying(255) NOT NULL,
    description text NOT NULL,
    guid character varying(255) NOT NULL,
    slug character varying(50) NOT NULL,
    category character varying(255) NOT NULL,
    image character varying(200) NOT NULL,
    media_url character varying(200) NOT NULL,
    media_type character varying(100) NOT NULL
);


ALTER TABLE public.lifestream_item OWNER TO gareth53;

--
-- Name: lifestream_item_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE lifestream_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lifestream_item_id_seq OWNER TO gareth53;

--
-- Name: lifestream_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE lifestream_item_id_seq OWNED BY lifestream_item.id;


--
-- Name: lifestream_source; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE lifestream_source (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(50) NOT NULL,
    url character varying(200) NOT NULL,
    last_check timestamp with time zone,
    last_update timestamp with time zone,
    image character varying(200) NOT NULL,
    description text NOT NULL,
    profile character varying(200) NOT NULL,
    website character varying(200) NOT NULL,
    active boolean NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    item_summary_template text NOT NULL
);


ALTER TABLE public.lifestream_source OWNER TO gareth53;

--
-- Name: lifestream_source_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE lifestream_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lifestream_source_id_seq OWNER TO gareth53;

--
-- Name: lifestream_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE lifestream_source_id_seq OWNED BY lifestream_source.id;


--
-- Name: south_migrationhistory; Type: TABLE; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE TABLE south_migrationhistory (
    id integer NOT NULL,
    app_name character varying(255) NOT NULL,
    migration character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.south_migrationhistory OWNER TO gareth53;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE; Schema: public; Owner: gareth53
--

CREATE SEQUENCE south_migrationhistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.south_migrationhistory_id_seq OWNER TO gareth53;

--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gareth53
--

ALTER SEQUENCE south_migrationhistory_id_seq OWNED BY south_migrationhistory.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY articles_article ALTER COLUMN id SET DEFAULT nextval('articles_article_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY articles_promo ALTER COLUMN id SET DEFAULT nextval('articles_promo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY blog_blogcategory ALTER COLUMN id SET DEFAULT nextval('blog_blogcategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY blog_entry ALTER COLUMN id SET DEFAULT nextval('blog_entry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY django_redirect ALTER COLUMN id SET DEFAULT nextval('django_redirect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY lifestream_item ALTER COLUMN id SET DEFAULT nextval('lifestream_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY lifestream_source ALTER COLUMN id SET DEFAULT nextval('lifestream_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY south_migrationhistory ALTER COLUMN id SET DEFAULT nextval('south_migrationhistory_id_seq'::regclass);


--
-- Data for Name: articles_article; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY articles_article (id, title, slug, body_html, pod_promos_id, pub_date, status) FROM stdin;
3	Podcast	podcast	<p>There used to be a podcast.</p>\r\n<p>It is no more.</p>\r\n<p>Every episode is available via MixCloud though...</p>\r\n<p>Go here: <a href="http://www.mixcloud.com/gareth53/">mixcloud.com/gareth53/</p>	\N	2015-12-11 16:04:54+00	1
1	About Me	about-me	<p>\r\nI've been working in the online industry since 2000 when I graduated from <a href="https://www.hud.ac.uk/">Huddersfield University</a> with an MSc. 'Designing Worldwide Interactive Systems'. Prior to that I worked as a Journalist.\r\n</p>\r\n<p>\r\nI spent the early part of my career focussed on front-end technologies (HTML5, CSS and JavaScript) and working with Macromedia Flash and Adobe Photoshop.\r\n</p>\r\n<p>\r\nIn 2007 I started working with <a href="https://www.djangoproject.com/\r\n">Django</a>, a Python web framework and evolved into a full-stack developer.\r\n</p>\r\n<p>\r\nI've mostly worked on brand-driven sites driving revenue through advertising. In the radio industry that's included sites for Capital FM, Radio X (formerly XFM), Classic FM and Heart. Whilst at BBC Worldwide I worked on TopGear.com, RadioTimes.com and new launches of BBCGoodFood.com and GardenersWorld.com.\r\n</p>\r\n<p>\r\nSince 2007 I've generally worked as a Technical Lead or Senior Developer, managing agile teams of upto 6 developers.\r\n</p>\r\n<p>\r\nI gained certification as a ScrumMaster from the Scrum Alliance in 2007 and have been working within scrum and kanban frameworks ever since.\r\n</p>	\N	2015-12-11 16:01:30+00	1
2	Work	work	<!--\r\n<style type="text/css">\r\n\r\nimg.work { float:right; clear:right; margin:0 0 10px 10px; width:260px;height:130px; border:1px solid #333 }\r\n-->\r\n</style>\r\n<p>Some of the more note-worthy projects I've worked on.</p>\r\n\r\n<h2>2011-2012: Global Radio iOS Apps for iPhone &amp; iPad</h2>\r\n<p>Keywords:  <acronym title="HyperText Markup Language">HTML</acronym>5, <acronym title="Cascading Style Sheets">CSS</acronym>3, JavaScript, Django, Piston</p>\r\n<p>\r\nAn updated version of the Global Radio family of iOS apps. It's a hybrid app - a native wrapper around a web-layer that renders HTML-formatted content delivered via HTTP. The main 'content' area of the app was written in HTML, CSS and JavaScript.\r\n</p>\r\n\r\n<h2>2011-2012: ClassicFM.com Re-launch</h2>\r\n<!--p><img src="http://www.gareth53.co.uk/assets/screengrabs/xfm_buzz_sml.jpg" border="0" alt="Xfm Buzz" width="260" height="130" /></p-->\r\n<p>Keywords: HTML, CSS, CMS, Django, jQuery, MySQL</p>\r\n<p>\r\nA re-launch of ClassicFM.com on 'Gusto', Global Radio's in-house CMS. Involved data migration fro the old site, a re-positioning of the brand online and a simplified design. The re-launch allowed us to re-use several components that had been developed for sister sites CapitalFM.com and Heart.co.uk\r\n</p>\r\n\r\n<h2>2010-2011: Xfm Buzz Prototype</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/xfm_buzz_sml.jpg" border="0" alt="Xfm Buzz" width="260" height="130"></p>\r\n<p>Keywords: User XP, User Interface Design, Prototyping, APIs, Product Development, HTML, CSS, Javascript, Microsoft Silverlight</p>\r\n<p>\r\nA prototype online radio player. It allows listeners to comment on and rate the music they hear as its played on the radio. It was conceived and developed in my 10% 'hack-time' Friday afternoons at Global Radio. It was never made public but influenced the way the business approached new projects. I've written in-depth about <a href="/blog/2011/05/xfm-buzz-radio-hack.html">the Xfm Buzz development experience</a>.\r\n</p>\r\n\r\n\r\n\r\n\r\n<h2>2010-2011: CapitalFM.com Re-launch</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/capitalfm2011_sml.jpg" border="0" alt="CapitalFM.com Re-launch" width="260" height="130"></p>\r\n<p>Keywords: HTML, CSS, CMS, Django, jQuery</p>\r\n<p>\r\nA re-launch of CapitalFM.com on Global Radio's in-house CMS. Was delivered to a tight deadline to tie-in with the launch of the national Capital FM Network. Included extensive localisation process, enhanced on air features and a commenting system built from scratch.\r\n</p>\r\n\r\n\r\n<h2>2010: Global Radio Galleries</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/galleries_sml.jpg" border="0" alt="Global Radio Galleries" width="260" height="130"></p>\r\n<p>Keywords: HTML, CSS, CMS, jQuery, JavaScript</p>\r\n<p>Enhanced gallery experience for Global Radio sites, designed for a smoother user experience. Images are loaded on request into the existing HTML document and there's a scrolling marquee of thumbnails. Added to that, new advertising is loaded into the page after a given number of clicks (a number that is throttled dependent upon demand). The gallery ends with the suggestion of related galleries. The CMS interface was dramatically improved, allowing editors to build, manage and share galleries much easier and quicker. The new gallery front-end resulted in dramatic rises in traffic. The same functionality has now been rolled out to xfm.co.uk and lbc.co.uk.</p>\r\n<h2>2009-2010: heart.co.uk</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/heart_sml.jpg" border="0"></p>\r\n<p>Keywords: Python, Django, <acronym title="HyperText Markup Language">HTML</acronym>, <acronym title="Cascading Style Sheets">CSS</acronym>, <acronym title="Content Management System">CMS</acronym>, jQuery</p>\r\n<p>A website for the Heart-branded commercial network. I worked on the team at Global Radio developing this site and the <acronym title="Content Management System">CMS</acronym> behind. Most of the magic is in the <acronym title="Content Management System">CMS</acronym> - with extensive and powerful functionality for the handling of shared and localised content. The site serves 20 different radio stations but is managed by only a handful of content editors.</p>\r\n<h2>2009: BigTop40.com</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/bigtop40_sml.jpg" border="0"></p>\r\n<p>Keywords: Python, Django, <acronym title="HyperText Markup Language">HTML</acronym>, <acronym title="Cascading Style Sheets">CSS</acronym>, <acronym title="Content Management System">CMS</acronym>, jQuery</p>\r\n<p>A new chart, a new radio show and a new site to accompany it. I worked as the sole developer on the initial stages of the project, the team expanding to three as the project gathered impetus. Delivered to a tight deadline and an ever-changing brief.</p>\r\n<h2>2009: Capitalfm.com relaunch</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/capitalfm_sml.jpg" border="0"></p>\r\n<p>Keywords: Python, Django, <acronym title="Content Management System">CMS</acronym></p>\r\n<p>The Capital Radio site was relaunched on a re-worked version of Global Radio's <acronym title="Content Management System">CMS</acronym>. This release wasn't so much a re-design as a reworking of the underlying <acronym title="Content Management System">CMS</acronym>. Extensive changes were made to the architecture and to the admin user flows.</p>\r\n<h2>2009-Present: iTunesCharts.net</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/itunescharts_sml.jpg" border="0"></p>\r\n<p>Keywords: Design, <acronym title="User Experience Design">UED</acronym>, <acronym title="Information Architecture">IA</acronym>, <acronym title="Search Engine Optimisation">SEO</acronym>, Python, Django, <acronym title="Content Management System">CMS</acronym>, <acronym title="HyperText Markup Language">HTML</acronym>, <acronym title="Cascading Style Sheets">CSS</acronym>, jQuery, Google Charts <acronym title="Applied Programming Interface">API</acronym> Design, <acronym title="User Experience Design">UED</acronym>, Development, SysAdmin</p>\r\n<p>Personal Project: A site powered by <acronym>RSS</acronym> feeds from apple.com. The site archives download charts and allows analysis of chart performance over time. Written in Python and on the Django framework. I conceived, designed and built the site.</p>\r\n<h2>2008-2009: ClassicFM.co.uk</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/classicfm_sml.jpg" border="0"></p>\r\n<p>Keywords: Python, Django, <acronym title="HyperText Markup Language">HTML</acronym>, <acronym title="Cascading Style Sheets">CSS</acronym>, <acronym title="Content Management System">CMS</acronym>, jQuery</p>\r\n<p>A re-design and re-build of the Classic FM site. The project included the development of several new <acronym title="Content Management System">CMS</acronym> features for fine-grained editorial control of increasingly complex page layouts. The site is also integrated with several external systems for podcast, now playing and schedule content.</p>\r\n<h2>2008: "This Is Global"</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/thisisglobal_sml.jpg" border="0"></p>\r\n<p>Keywords: Python, Django, <acronym title="HyperText Markup Language">HTML</acronym>, <acronym title="Cascading Style Sheets">CSS</acronym>, <acronym title="Content Management System">CMS</acronym>, jQuery  Corporate Site launch. Was delivered to a tight deadline and to an ever-changing brief as the Global family of companies acquired GCap Media. Admin is based on a heavily customised version of the base Django admin.</p>\r\n<h2>2008: Xfm Relaunch</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/xfm_sml.jpg" border="0"></p>\r\n<p>Keywords: Project-management, <acronym title="HyperText Markup Language">HTML</acronym>, <acronym title="Cascading Style Sheets">CSS</acronym>, Creative-direction, <acronym title="User Experience Design">UED</acronym>, <acronym title="Information Architecture">IA</acronym>, <acronym title="Search Engine Optimisation">SEO</acronym> Client-side Development, Project Management, Creative Direction</p>\r\n<p>I worked on the team re-launching Xfm.co.uk contributing to the initial requirements gathering and <acronym title="User Experience Design">UED</acronym> specification as well as creative direction to the design team and technical specifications to a US-based development team. I managed the client-side build in-house.</p>\r\n<h2>2007-2008: XfmSouthWales.co.uk</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/xfm-south-wales_sml.jpg" border="0"></p>\r\n<p>Keywords: Project-management, <acronym title="HyperText Markup Language">HTML</acronym>, <acronym title="Cascading Style Sheets">CSS</acronym>, Creative-direction</p>\r\n<p>A website to accompany the launch of a new radio station in South Wales. The site featured newsfeeds, photo galleries, complex competition mechanics, integrated twitter feeds and advanced webcam functionality. The site is no longer live as the station was sold and re-branded in May 2008.</p>\r\n<h2>2007: Mi-Xfm</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/xfm-mi-xfm_sml.jpg" border="0"></p>\r\n<p>Keywords: <acronym title="User Experience Design">UED</acronym>, Visual design</p>\r\n<p>I designed the interface for GCap Media's web-based personalised radio software. Users could opt to listen to one of three different Xfm channels, rating music as they listened - ratings which would, in turn, influence the songs they heard. A ClassicFM version of the player, using the same interface and user experience, was shortlisted for a <a href="http://www.radioawards.org/winners/?awid=178&amp;awname=The+Multiplatform+Radio+Award&amp;year=2009" target="_blank">Sony Radio Academy Award</a> in the "Multi-platform Radio Award" category.</p>\r\n<h2>2006-2007: GardenersWorld.com</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/gardeners-world_sml.jpg" border="0"></p>\r\n<p>Keywords: Project-management, <acronym title="HyperText Markup Language">HTML</acronym>, <acronym title="Cascading Style Sheets">CSS</acronym>, Creative-direction, X-SLT templating, <acronym title="Information Architecture">IA</acronym></p>\r\n<p>I was involved with the extensive planning and design process and user testing. The site was designed by POKE London, all development was produced in-house at BBC Worldwide. I managed the entire development process including custom database and admin and the integration of an e-commerce partnership with plant suppliers, crocus.co.uk.</p>\r\n<h2>2007: RadioTimes.com Relaunch</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/radio-times_sml.jpg" border="0"></p>\r\n<p>Keywords: Project-management, <acronym title="HyperText Markup Language">HTML</acronym>, <acronym title="Cascading Style Sheets">CSS</acronym>, testing, product-cycle-management</p>\r\n<p>The re-launch was designed to retain and enhance popular existing user flows whilst introducing new styles of content to encourage deeper interactions with the site. Advances in digital television, added to the widespread use of in-built <acronym title="Electronic Programming Guide">EPG</acronym> functionality threatened to erode the USP of the site, but the re-design increased page views per visit statistics and revenue accordingly.</p>\r\n<h2>2006: BBCGoodFood.com</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/bbc-good-food_sml.jpg" border="0"></p>\r\n<p>Keywords: Project-management, <acronym title="HyperText Markup Language">HTML</acronym>, <acronym title="Cascading Style Sheets">CSS</acronym> Project Management, client-side build, <acronym title="eXtensible Style Language Transformations">XSL-T</acronym> templates, custom admin interfaces, Adobe Flash audio widget.</p>\r\n<p>Major new website launch involved the build and population of a new recipe database and an extensive and varied supporting website.</p>\r\n<h2>2007: Land Rover Owner Site Re-launch</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/landroverowner_sml.jpg" border="0"></p>\r\n<p>Keywords: <acronym title="HyperText Markup Language">HTML</acronym>, <acronym title="Cascading Style Sheets">CSS</acronym></p>\r\n<p>Client-side build of all site templates for a site re-launch. The re-launch work was scheduled against a tight deadline and completed with a week!</p>\r\n<h2>2007: MaxPower.com Relaunch</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/max-power_sml.jpg" border="0"></p>\r\n<p>Keywords: <acronym title="HyperText Markup Language">HTML</acronym>, <acronym title="Cascading Style Sheets">CSS</acronym>, Adobe-Flash, Actionscript</p>\r\n<p>Client-side build of all site templates and support for PHP development. Some content-managed flash components and javascript widgets.</p>\r\n<h2>2006: GirlTalk Magazine Website</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/bbc-girl-talk_sml.jpg" border="0"></p>\r\n<p>Keywords: Project Management, Creative-direction, <acronym title="HyperText Markup Language">HTML</acronym>, <acronym title="Cascading Style Sheets">CSS</acronym>, javascript, <acronym title="eXtensible Style Language Transformations">XSL-T</acronym>, <acronym title="Content Management System">CMS</acronym></p>\r\n<p>New website launch to support BBC Magazine's popular weekly title aimed at 'tweenage' girls. The project included a password-protected club, integration with a third-party online subscription mechanic and a heavily customised admin interface.</p>\r\n<h2>2006: TopGear.com</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/topgear_sml.jpg" border="0"></p>\r\n<p>Keywords: <acronym title="HyperText Markup Language">HTML</acronym>, <acronym title="eXtensible Style Language Transformations">XSL-T</acronym>, <acronym title="Cascading Style Sheets">CSS</acronym>, <acronym title="Search Engine Optimisation">SEO</acronym>, <acronym title="Content Management System">CMS</acronym></p>\r\n<p>Detailed site analysis and recommendations followed by development work including pagination improvements, non-javascript functionality, implementation of an <acronym>RSS</acronym> strategy and changes to site and URL structure.</p>\r\n<h2>2005: Capital Radio Re-brand</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/capital-brand_sml.jpg" border="0"></p>\r\n<p>Keywords: Visual-design, Creative-direction</p>\r\n<p>A re-brand and re-launch of the Capital Radio brand, re-positioning the station at the heart of London and at the heart of an edgier r'n'b-flavoured sound. My involvement included creative direction, brainstorming and presentation of the design process to stakeholders. <a href="../../../../blog/2009/06/capital-fm-logos-1999-2009.html" target="_blank">I've blogged extensively about this extensively</a>.</p>\r\n<h2>2005: Xfm Rock Trumps</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/xfm-rock-trumps_sml.jpg" border="0"></p>\r\n<p>Keywords: <acronym title="User Experience Design">UED</acronym>, Adobe-flash, Actionscript</p>\r\n<p>A "rock!" version of the popular card game - built to promote Christian O'Connell's Breakfast Show. Complex game mechanic with AI opponents of varying skill levels. Data was loaded in via external <acronym title="eXtensible Markup Language">XML</acronym> sources. The game was popular with an actual, physical version of the game being produced to promote the Xfm brand at festivals. The game mechanic was also re-skinned multiple times for different radio brands.</p>\r\n<h2>2005: Xfm "On Tour" Game</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/xfm-national-tour_sml.jpg" border="0"></p>\r\n<p>Keywords: <acronym title="User Experience Design">UED</acronym>, Adobe-flash, Actionscript</p>\r\n<p>Flash game to promote Xfm as a national brand. Coincided with the launch of Xfm Scotland and Xfm Manchester. The game was based on an "Buzz Wire Game" mechanic. Users were required to move two points around a wire the shape of the British Isles. The points were moved using a combination of mouse (for position) and two keys in order to control the rotation of the game pointer. This was aimed to at media buyers, advertising executives and internal sales staff. Prizes were given to the highest scores. The game proved addictive with stats showing that some visitors playing the game over 100 times!</p>\r\n<h2>2004: Egg Hamster Quiz</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/egg-money-quiz_sml.jpg" border="0"></p>\r\n<p>Keywords: <acronym title="User Experience Design">UED</acronym>, Adobe-flash, Actionscript</p>\r\n<p>Flash-based quiz mechanic with extensive flash animation and high scoreboard. Delivered as part of a high-profile marketing campaign. The quiz engine was re-skinned and used in countless other contexts.</p>\r\n<h2>2004: Spider-Man2 Game</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/spiderman2_sml.jpg" border="0"></p>\r\n<p>Keywords: <acronym title="User Experience Design">UED</acronym>, Adobe-flash, Actionscript</p>\r\n<p>An arcade style game to promote the launch of the movie. Developed to rigorous QA and brand guidelines from</p>\r\n<h2>2004: Richard Bacon's Celebrity Sudoku</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/sudoku_sml.jpg" border="0"></p>\r\n<p>Keywords: <acronym title="User Experience Design">UED</acronym>, Adobe-flash, Actionscript, <acronym title="Content Management System">CMS</acronym></p>\r\n<p>Complex flash game, based on celebrity headshots rather than numbers. The internal logic was written from scratch and had to determine the feasibility of a user's attempt. The game proved popular and was promoted on air with a weekly puzzle. Times were submitted to a database with winners given prizes. The development work also involved a simple admin interface to allow editors to upload new pics and puzzles on a weekly basis.</p>\r\n<h2>2003-2004: £1K Runaway / £1k Fugitive</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/1k-fugitive_sml.jpg" border="0" alt=""></p>\r\n<p>Keywords: <acronym title="User Experience Design">UED</acronym>, Adobe-flash, Actionscript</p>\r\n<p>Flash game mechanic based on MB Games' "Guess Who?" to accompany a radio-based competition of the same name. A browser-based prototype was built in javascript as a proof-of-concept before an illustrator was employed to provide the faces. The mechanic was developed into a more involved mechanic for the subsequent year when a similar promotion was run on-air.</p>\r\n<h2>2002-2006: Online Radio Players</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/capital_player_sml.jpg" border="0"></p>\r\n<p>Keywords: <acronym title="HyperText Markup Language">HTML</acronym>, <acronym title="Cascading Style Sheets">CSS</acronym>, Javascript, JScript, Windows-Media-Player</p>\r\n<p>I designed and developed online radio and media players for the various brands in the Capital Radio Group family. This involved in-depth use of Microsoft's JScript <acronym title="Applied Programming Interface">API</acronym> wrapper around Windows Media Player as well as graceful handling of the non-Microsoft browser plug-ins. Later versions of the player were fed content via <acronym>RSS</acronym> from a third-party <acronym title="Content Management System">CMS</acronym> system which allowed playback of archive clips as well as tuning in to live streams.</p>\r\n<h2>2003: Beat The Intro Quiz Game</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/beat-the-intro_sml.jpg" border="0"></p>\r\n<p>Keywords: <acronym title="User Experience Design">UED</acronym>, Adobe-Flash</p>\r\n<p>An online version of a simple game. This was produced to accompany an on-air radio quiz which, in turn, was designed to promote the Christmas release of a DVD game. This audio quiz engine was re-skinned many times and the main engine is a component that is still in use today.</p>\r\n<h2>2001-2007: The Broken Family Band Official Site</h2>\r\n<p><img src="http://www.gareth53.co.uk/assets/screengrabs/broken-family-band_sml.jpg" border="0"></p>\r\n<p>Keywords: Visual-Design, <acronym title="HyperText Markup Language">HTML</acronym>, <acronym title="Cascading Style Sheets">CSS</acronym></p>\r\n<p>I designed, built and maintained a simple site to promote The Broken Family Band. The site consisted of simple photo galleries, streamed and downloadable audio and a nifty disocgraphy interface. The six years saw three re-designs (to tie in with album releases) .</p>	1	2015-12-11 16:03:21+00	1
\.


--
-- Name: articles_article_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('articles_article_id_seq', 3, true);


--
-- Data for Name: articles_promo; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY articles_promo (id, name, headline, headline_link, body_html, article_link_id) FROM stdin;
1	CV Downloads	My CV		<p>\r\nIf you'd like a copy of my resume, it's correct as of February 2016 and available for download:\r\n</p>\r\n<ul>\r\n<li><a href="#">GarethSeniorCV.doc</a> (MS Word format)</li>\r\n<li><a href="#">GarethSeniorCV.doc</a> (<acronym value="Portable Document Format">PDF</acronym>)</li>\r\n<li><a href="#">GarethSeniorCV.txt</a> (Plain text)</li>	\N
\.


--
-- Name: articles_promo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('articles_promo_id_seq', 1, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add user	3	add_user
8	Can change user	3	change_user
9	Can delete user	3	delete_user
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add site	6	add_site
17	Can change site	6	change_site
18	Can delete site	6	delete_site
19	Can add log entry	7	add_logentry
20	Can change log entry	7	change_logentry
21	Can delete log entry	7	delete_logentry
22	Can add redirect	8	add_redirect
23	Can change redirect	8	change_redirect
24	Can delete redirect	8	delete_redirect
25	Can add migration history	9	add_migrationhistory
26	Can change migration history	9	change_migrationhistory
27	Can delete migration history	9	delete_migrationhistory
28	Can add source	10	add_source
29	Can change source	10	change_source
30	Can delete source	10	delete_source
31	Can add item	11	add_item
32	Can change item	11	change_item
33	Can delete item	11	delete_item
34	Can add promo	12	add_promo
35	Can change promo	12	change_promo
36	Can delete promo	12	delete_promo
37	Can add article	13	add_article
38	Can change article	13	change_article
39	Can delete article	13	delete_article
40	Can add blog category	14	add_blogcategory
41	Can change blog category	14	change_blogcategory
42	Can delete blog category	14	delete_blogcategory
43	Can add entry	15	add_entry
44	Can change entry	15	change_entry
45	Can delete entry	15	delete_entry
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('auth_permission_id_seq', 45, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$24000$rovREtDhXUyq$ddhhMU0A6gKjAqRfSk09Gn8Xg/Ba+4hWPGHfiOTvNBU=	2016-01-19 13:21:18.53727+00	t	gareth			gareth53@gmail.com	t	t	2015-12-11 14:21:08.600479+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: blog_blogcategory; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY blog_blogcategory (id, title, slug, use_count) FROM stdin;
\.


--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('blog_blogcategory_id_seq', 1, false);


--
-- Data for Name: blog_entry; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY blog_entry (id, title, slug, body_html, pub_date, enable_comments, category_id, status) FROM stdin;
\.


--
-- Name: blog_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('blog_entry_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2015-12-11 14:22:50.086199+00	1	10	1	AudioBoom	1	
2	2015-12-11 14:23:13.419088+00	1	10	2	delicious	1	
3	2015-12-11 14:23:34.927878+00	1	10	3	Flickr	1	
4	2015-12-11 14:23:50.230011+00	1	10	4	Last.fm	1	
5	2015-12-11 14:24:05.807955+00	1	10	5	Pocket	1	
6	2015-12-11 14:24:21.774019+00	1	10	6	Wordpress	1	
7	2015-12-11 14:27:42.806593+00	1	10	1	AudioBoom	2	Changed item_summary_template.
8	2015-12-11 14:28:13.209803+00	1	10	2	delicious	2	Changed item_summary_template.
9	2015-12-11 14:28:42.584886+00	1	10	2	delicious	2	Changed item_summary_template.
10	2015-12-11 14:29:15.735087+00	1	10	2	delicious	2	Changed item_summary_template.
11	2015-12-11 14:30:02.319596+00	1	10	2	delicious	2	Changed item_summary_template.
12	2015-12-11 14:35:46.213955+00	1	10	4	Last.fm	3	
13	2015-12-11 14:37:19.865629+00	1	10	7	Mixcloud	1	
14	2015-12-11 14:37:57.624256+00	1	10	8	Goodreads	1	
15	2015-12-11 14:38:50.980275+00	1	10	9	GitHub	1	
16	2015-12-11 14:39:12.927862+00	1	10	1	AudioBoom	2	Changed item_summary_template.
17	2015-12-11 14:43:49.812113+00	1	10	5	Pocket	2	Changed item_summary_template.
18	2015-12-11 14:44:18.322599+00	1	10	5	Pocket	2	Changed item_summary_template.
19	2015-12-11 14:44:35.046998+00	1	10	5	Pocket	2	Changed item_summary_template.
20	2015-12-11 15:15:37.555875+00	1	10	1	AudioBoom	2	Changed item_summary_template.
21	2015-12-11 15:18:29.070488+00	1	10	10	Vimeo Videos	1	
22	2015-12-11 15:34:51.074743+00	1	10	7	Mixcloud	2	Changed item_summary_template.
23	2015-12-11 15:36:45.459882+00	1	10	11	Vimeo Likes	1	
24	2015-12-11 15:49:19.67252+00	1	10	12	Strava	1	
25	2015-12-11 15:51:54.810596+00	1	10	12	Strava	2	Changed item_summary_template.
26	2015-12-11 16:02:55.204443+00	1	13	1	About Me	1	
27	2015-12-11 16:03:23.462359+00	1	13	2	Work	1	
28	2015-12-11 16:04:57.059858+00	1	13	3	Podcast	1	
29	2015-12-11 16:05:41.412953+00	1	8	1	podcast ---> podcast.html	1	
30	2015-12-11 16:06:08.321833+00	1	6	1	gareth53.co.uk	2	Changed domain and name.
31	2015-12-11 16:06:54.118109+00	1	10	9	GitHub	2	Changed item_summary_template.
32	2015-12-14 09:10:23.333983+00	1	10	12	Strava	2	Changed item_summary_template.
33	2015-12-14 09:11:53.366847+00	1	10	3	Flickr	2	Changed item_summary_template.
34	2015-12-14 09:12:46.385862+00	1	10	6	Wordpress	2	Changed item_summary_template.
35	2015-12-14 09:13:06.179265+00	1	10	6	Wordpress	2	Changed item_summary_template.
36	2015-12-14 09:17:34.300819+00	1	10	11	Vimeo Watches	2	Changed name, slug and item_summary_template.
37	2015-12-14 09:17:57.458591+00	1	10	11	Vimeo Viewing	2	Changed name and slug.
38	2015-12-14 09:18:06.673326+00	1	10	10	Vimeo Videos	2	No fields changed.
39	2015-12-14 13:47:36.827292+00	1	13	3	Podcast	2	No fields changed.
40	2015-12-14 13:47:59.158708+00	1	11	298	What Is "Lynchian"?	2	Changed author.
41	2015-12-14 13:48:15.466166+00	1	11	136	Football – Championship 2015/16 Preview	2	No fields changed.
42	2015-12-14 13:49:05.255109+00	1	10	9	GitHub	2	Changed item_summary_template.
43	2015-12-16 13:30:08.786559+00	1	10	13	Netflix	1	Added.
44	2015-12-18 15:58:45.275837+00	1	11	306	info.sovrn.com/hubfs/sovrn_Official_Holiday_Income_Guide_2015.pdf	3	
45	2015-12-22 22:39:59.439203+00	1	11	299	No Way Out	3	
46	2016-01-05 08:14:41.248493+00	1	11	359	Forensic Files: Forensic Files: Collection: Dirty Little Seacret	3	
47	2016-01-05 08:14:41.250919+00	1	11	348	No Way Out	3	
48	2016-01-05 08:14:41.252149+00	1	11	347	Forensic Files: Forensic Files: Collection: "Dirty Little Seacret"	3	
49	2016-01-05 08:21:14.136495+00	1	11	361	No Way Out	3	
50	2016-01-05 08:21:14.139209+00	1	11	360	Forensic Files: Forensic Files: Collection: Dirty Little Seacret	3	
51	2016-01-05 08:21:30.015144+00	1	11	363	No Way Out	3	
52	2016-01-07 08:32:56.44729+00	1	10	14	Garmin Connect	1	Added.
53	2016-01-07 08:33:02.115683+00	1	10	14	Garmin Connect	2	Changed item_summary_template.
54	2016-01-07 08:40:00.490344+00	1	11	616	1 steps	3	
55	2016-01-07 08:40:00.49261+00	1	11	615	1 steps	3	
56	2016-01-07 08:43:09.870598+00	1	11	617	1 steps	3	
57	2016-01-07 08:47:19.290873+00	1	10	14	Garmin Connect	2	Changed item_summary_template.
58	2016-01-07 08:49:01.948715+00	1	11	618	1 steps	2	Changed slug.
59	2016-01-07 08:49:54.407317+00	1	10	13	Netflix	2	Changed active.
60	2016-01-07 08:53:34.816217+00	1	10	14	Garmin Connect	2	Changed active.
61	2016-01-07 14:01:04.75723+00	1	11	366	Making a Murderer: Season 1: "Fighting for their Lives"	3	
62	2016-01-07 14:01:04.760786+00	1	11	370	Making a Murderer: Season 1: "The Great Burden"	3	
63	2016-01-07 14:01:04.762296+00	1	11	369	Making a Murderer: Season 1: "Lack of Humility"	3	
64	2016-01-07 14:01:04.763918+00	1	11	368	Forensic Files: Forensic Files: Collection: "Textbook Murder"	3	
65	2016-01-07 14:01:04.765539+00	1	11	367	Forensic Files: Forensic Files: Collection: "Filtered Out"	3	
66	2016-01-07 14:01:04.76698+00	1	11	372	Making a Murderer: Season 1: "Framing Defense"	3	
67	2016-01-07 14:01:04.768066+00	1	11	371	Forensic Files: Forensic Files: Collection: "Home of the Brave"	3	
68	2016-01-07 14:01:04.769321+00	1	11	379	Making a Murderer: Season 1: "The Last Person to See Teresa Alive"	3	
69	2016-01-07 14:01:04.770212+00	1	11	378	Making a Murderer: Season 1: "Testing the Evidence"	3	
70	2016-01-07 14:01:04.771055+00	1	11	377	Forensic Files: Forensic Files: Collection: "A Squire's Riches"	3	
71	2016-01-07 14:01:04.773043+00	1	11	376	Maidentrip	3	
72	2016-01-07 14:01:04.773948+00	1	11	375	Red Dwarf: Series 3: "Marooned"	3	
73	2016-01-07 14:01:04.774764+00	1	11	374	Red Dwarf: Series 3: "Polymorph"	3	
74	2016-01-07 14:01:04.775539+00	1	11	373	Red Dwarf: Series 3: "Bodyswap"	3	
75	2016-01-07 14:01:04.77631+00	1	11	382	Making a Murderer: Season 1: "Indefensible"	3	
76	2016-01-07 14:01:04.777062+00	1	11	381	The Very Hungry Caterpillar and Other Stories	3	
77	2016-01-07 14:01:04.77784+00	1	11	380	Forensic Files: Forensic Files: Collection: "Three's a Crowd"	3	
78	2016-01-07 14:01:04.778595+00	1	11	384	Making a Murderer: Season 1: "Plight of the Accused"	3	
79	2016-01-07 14:01:04.779338+00	1	11	383	Forensic Files: Forensic Files: Collection: "Hear No Evil"	3	
80	2016-01-07 14:01:04.780075+00	1	11	387	Making a Murderer: Season 1: "Turning the Tables"	3	
81	2016-01-07 14:01:04.780829+00	1	11	386	Forensic Files: Forensic Files: Collection: "Purebread Murder"	3	
82	2016-01-07 14:01:04.78156+00	1	11	385	Primal Fear	3	
83	2016-01-07 14:01:04.782361+00	1	11	389	Making a Murderer: Season 1: "Eighteen Years Lost"	3	
84	2016-01-07 14:01:04.783146+00	1	11	388	Forensic Files: Forensic Files: Collection: "Lights Out"	3	
326	2016-01-19 08:48:20.607471+00	1	10	5	Pocket	2	Changed description.
85	2016-01-07 14:01:04.783964+00	1	11	391	Forensic Files: Forensic Files: Collection: "Waste Mis-Management"	3	
86	2016-01-07 14:01:04.785144+00	1	11	390	Forensic Files: Forensic Files: Collection: "Dirty Little Seacret"	3	
87	2016-01-07 14:01:04.785939+00	1	11	395	Forensic Files: Forensic Files: Collection: "Watchful Eye"	3	
88	2016-01-07 14:01:04.786689+00	1	11	394	Partners: Season 1: "They Come Together"	3	
89	2016-01-07 14:01:04.787506+00	1	11	393	The Conformist	3	
90	2016-01-07 14:01:04.788297+00	1	11	392	No Way Out	3	
91	2016-01-07 14:01:04.789471+00	1	11	365	Test	3	
92	2016-01-07 14:01:04.790343+00	1	11	364	No Way Out	3	
93	2016-01-07 14:01:04.791139+00	1	11	362	Forensic Files: Forensic Files: Collection: Dirty Little Seacret	3	
94	2016-01-07 14:01:04.791899+00	1	11	398	Forensic Files: Forensic Files: Collection: "Family Interrupted"	3	
95	2016-01-07 14:01:04.792655+00	1	11	397	Forensic Files: Forensic Files: Collection: "Runaway Love"	3	
96	2016-01-07 14:01:04.793403+00	1	11	396	Blue Ruin	3	
97	2016-01-07 14:01:04.794186+00	1	11	400	Forensic Files: Forensic Files: Collection: "Office Visit"	3	
98	2016-01-07 14:01:04.795255+00	1	11	399	Forensic Files: Forensic Files: Collection: "Shoe-in for Murder"	3	
99	2016-01-07 14:01:04.796088+00	1	11	403	How to Get Away with Murder: Season 1: "It's All My Fault"	3	
100	2016-01-07 14:01:04.796935+00	1	11	402	Forensic Files: Forensic Files: Collection: "DNA Dragnet"	3	
101	2016-01-07 14:01:04.797722+00	1	11	401	Forensic Files: Forensic Files: Collection: "Water Logged"	3	
102	2016-01-07 14:01:04.798454+00	1	11	405	How to Get Away with Murder: Season 1: "The Night Lila Died"	3	
103	2016-01-07 14:01:04.799188+00	1	11	404	Forensic Files: Forensic Files: Collection: "Seedy Intentions"	3	
104	2016-01-07 14:01:04.799947+00	1	11	408	How to Get Away with Murder: Season 1: "Mama's Here Now"	3	
105	2016-01-07 14:01:04.800726+00	1	11	407	Forensic Files: Forensic Files: Collection: "Fashion Police"	3	
106	2016-01-07 14:01:04.801514+00	1	11	406	Forensic Files: Forensic Files: Collection: "Church Dis-service"	3	
107	2016-01-07 14:01:04.802308+00	1	11	413	How to Get Away with Murder: Season 1: "She's a Murderer"	3	
108	2016-01-07 14:01:04.803072+00	1	11	412	Forensic Files: Forensic Files: Collection: "A Cinderella Story"	3	
109	2016-01-07 14:01:04.803837+00	1	11	411	Forensic Files: Forensic Files: Collection: "Sands of Crime"	3	
110	2016-01-07 14:01:04.80475+00	1	11	410	Forensic Files: Forensic Files: Collection: "Sworded Scheme"	3	
111	2016-01-07 14:01:04.805516+00	1	11	409	Master of None: Season 1: "Plan B"	3	
112	2016-01-07 14:01:04.80627+00	1	11	415	How to Get Away with Murder: Season 1: "Best Christmas Ever"	3	
113	2016-01-07 14:01:04.807003+00	1	11	414	Forensic Files: Forensic Files: Collection: "Catch 22"	3	
114	2016-01-07 14:01:04.807736+00	1	11	417	How to Get Away with Murder: Season 1: "Hello Raskolnikov"	3	
115	2016-01-07 14:01:04.808474+00	1	11	416	Forensic Files: Forensic Files: Collection: "Sole Survivor"	3	
116	2016-01-07 14:01:04.809201+00	1	11	418	How to Get Away with Murder: Season 1: "Kill Me, Kill Me, Kill Me"	3	
117	2016-01-07 14:01:04.809975+00	1	11	421	How to Get Away with Murder: Season 1: "He Has a Wife"	3	
118	2016-01-07 14:01:04.81074+00	1	11	420	Forensic Files: Forensic Files: Collection: "Sharper Image"	3	
119	2016-01-07 14:01:04.811591+00	1	11	419	Forensic Files: Forensic Files: Collection: "Wheel of Misfortune"	3	
120	2016-01-07 14:01:04.812357+00	1	11	423	Forensic Files: Forensic Files: Collection: "Fired-Up"	3	
121	2016-01-07 14:01:04.813106+00	1	11	422	Forensic Files: Forensic Files: Collection: "Bitter Brew"	3	
122	2016-01-07 14:01:04.813874+00	1	11	425	Forensic Files: Forensic Files: Collection: "Small Town Terror"	3	
123	2016-01-07 14:01:04.814609+00	1	11	424	Forensic Files: Forensic Files: Collection: "Blanket of Evidence"	3	
124	2016-01-07 14:01:04.815331+00	1	11	429	Forensic Files: Forensic Files: Collection: "A Tight Leash"	3	
125	2016-01-07 14:01:04.816075+00	1	11	428	Forensic Files: Forensic Files: Collection: "Fresh Heir"	3	
126	2016-01-07 14:01:04.816833+00	1	11	427	Forensic Files: Forensic Files: Collection: "Two in a Million"	3	
127	2016-01-07 14:01:04.817557+00	1	11	426	Forensic Files: Forensic Files: Collection: "The Day the Music Died"	3	
128	2016-01-07 14:01:04.8183+00	1	11	434	How to Get Away with Murder: Season 1: "Freakin' Whack-a-Mole"	3	
129	2016-01-07 14:01:04.819048+00	1	11	433	How to Get Away with Murder: Season 1: "He Deserved to Die"	3	
130	2016-01-07 14:01:04.819782+00	1	11	432	Forensic Files: Forensic Files: Collection: "Muffled Cries"	3	
131	2016-01-07 14:01:04.820513+00	1	11	431	Forensic Files: Forensic Files: Collection: "Skirting the Evidence"	3	
132	2016-01-07 14:01:04.821657+00	1	11	430	Forensic Files: Forensic Files: Collection: "Step by Step"	3	
133	2016-01-07 14:01:04.822619+00	1	11	435	How to Get Away with Murder: Season 1: "We're Not Friends"	3	
134	2016-01-07 14:01:04.823513+00	1	11	437	How to Get Away with Murder: Season 1: "Smile, or Go to Jail"	3	
135	2016-01-07 14:01:04.824455+00	1	11	436	How to Get Away with Murder: Season 1: "Let's Get to Scooping"	3	
136	2016-01-07 14:01:04.825262+00	1	11	440	How to Get Away with Murder: Season 1: "Pilot"	3	
137	2016-01-07 14:01:04.826076+00	1	11	439	How to Get Away with Murder: Season 1: "It's All Her Fault"	3	
138	2016-01-07 14:01:04.826825+00	1	11	438	The Central Park Five	3	
139	2016-01-07 14:01:04.827593+00	1	11	441	Man from Reno	3	
140	2016-01-07 14:01:04.828328+00	1	11	442	The Babadook	3	
141	2016-01-07 14:01:04.829058+00	1	11	444	Obvious Child	3	
142	2016-01-07 14:01:04.82979+00	1	11	443	The Deep	3	
143	2016-01-07 14:01:04.830515+00	1	11	445	World War Z	3	
144	2016-01-07 14:01:04.831254+00	1	11	447	Surfwise	3	
145	2016-01-07 14:01:04.832217+00	1	11	446	Dressed to Kill	3	
146	2016-01-07 14:01:04.832974+00	1	11	448	It's Such a Beautiful Day	3	
147	2016-01-07 14:01:04.833786+00	1	11	450	Red Dwarf: Series 2: "Queeg"	3	
148	2016-01-07 14:01:04.83457+00	1	11	449	Blackadder: Series 2: "Chains"	3	
149	2016-01-07 14:01:04.835321+00	1	11	451	Beyond the Edge	3	
150	2016-01-07 14:01:04.83606+00	1	11	452	Big Star: Nothing Can Hurt Me	3	
151	2016-01-07 14:01:04.836767+00	1	11	455	Louis Theroux's Weird Weekends: Series 2: "Swingers"	3	
152	2016-01-07 14:01:04.837522+00	1	11	454	Louis Theroux's Weird Weekends: Series 3: "Self-Fulfilment"	3	
153	2016-01-07 14:01:04.838279+00	1	11	453	Louis Theroux's Weird Weekends: Series 3: "India"	3	
154	2016-01-07 14:01:04.839011+00	1	11	456	All This Mayhem	3	
155	2016-01-07 14:01:04.839747+00	1	11	457	The Battered Bastards of Baseball	3	
156	2016-01-07 14:01:04.840468+00	1	11	458	The Summit	3	
239	2016-01-07 14:01:14.861856+00	1	11	540	The IT Crowd: Series 2: "Men Without Women"	3	
157	2016-01-07 14:01:04.841191+00	1	11	460	The New Detectives: Case Studies in Forensic Science: Best of the New Detectives: "Texas Rangers"	3	
158	2016-01-07 14:01:04.841958+00	1	11	459	Forensic Files: Forensic Files: Collection: "If I Were You"	3	
159	2016-01-07 14:01:04.84269+00	1	11	461	Of Two Minds	3	
160	2016-01-07 14:01:04.843417+00	1	11	462	The Short Game	3	
161	2016-01-07 14:01:14.794144+00	1	11	464	Tremors	3	
162	2016-01-07 14:01:14.79708+00	1	11	463	The Blair Witch Project	3	
163	2016-01-07 14:01:14.798214+00	1	11	466	Deceptive Practice: The Mysteries and Mentors of Ricky Jay	3	
164	2016-01-07 14:01:14.799458+00	1	11	465	Computer Chess	3	
165	2016-01-07 14:01:14.800659+00	1	11	467	They Came Together	3	
166	2016-01-07 14:01:14.801882+00	1	11	469	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Goes to Court!"	3	
167	2016-01-07 14:01:14.80301+00	1	11	468	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Makes Waffles!"	3	
168	2016-01-07 14:01:14.803933+00	1	11	470	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Rides a Bike!"	3	
169	2016-01-07 14:01:14.805465+00	1	11	471	Unbreakable Kimmy Schmidt: Season 1: "Kimmy's in a Love Triangle!"	3	
170	2016-01-07 14:01:14.806375+00	1	11	473	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Has a Birthday!"	3	
171	2016-01-07 14:01:14.807328+00	1	11	472	Marvel's Daredevil: Season 1: "Rabbit in a Snowstorm"	3	
172	2016-01-07 14:01:14.808342+00	1	11	475	Unbreakable Kimmy Schmidt: Season 1: "Kimmy is Bad at Math!"	3	
173	2016-01-07 14:01:14.809185+00	1	11	474	Bottom: Series 2: "Burglary"	3	
174	2016-01-07 14:01:14.810095+00	1	11	477	Marvel's Daredevil: Season 1: "Cut Man"	3	
175	2016-01-07 14:01:14.81096+00	1	11	476	Runaway	3	
176	2016-01-07 14:01:14.811731+00	1	11	479	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Goes to a Party!"	3	
177	2016-01-07 14:01:14.812525+00	1	11	478	Bottom: Series 2: "Culture"	3	
178	2016-01-07 14:01:14.813329+00	1	11	481	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Goes to School!"	3	
179	2016-01-07 14:01:14.814123+00	1	11	480	Marvel's Daredevil: Season 1: "Into the Ring"	3	
180	2016-01-07 14:01:14.814914+00	1	11	483	Better Call Saul: Season 1: "Marco"	3	
181	2016-01-07 14:01:14.815718+00	1	11	482	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Kisses a Boy!"	3	
182	2016-01-07 14:01:14.816482+00	1	11	484	Frank	3	
183	2016-01-07 14:01:14.817245+00	1	11	485	Begin Again	3	
184	2016-01-07 14:01:14.81801+00	1	11	486	Better Call Saul: Season 1: "Pimento"	3	
185	2016-01-07 14:01:14.818783+00	1	11	487	Atari: Game Over	3	
186	2016-01-07 14:01:14.819517+00	1	11	490	20 Feet from Stardom	3	
187	2016-01-07 14:01:14.82025+00	1	11	489	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Goes to the Doctor!"	3	
188	2016-01-07 14:01:14.82098+00	1	11	488	Bottom: Series 2: "Digger"	3	
189	2016-01-07 14:01:14.821776+00	1	11	492	Better Call Saul: Season 1: "Rico"	3	
190	2016-01-07 14:01:14.822562+00	1	11	491	Bottom: Series 1: "Accident"	3	
191	2016-01-07 14:01:14.823318+00	1	11	493	Better Call Saul: Season 1: "Bingo"	3	
192	2016-01-07 14:01:14.824105+00	1	11	496	The Flat	3	
193	2016-01-07 14:01:14.824855+00	1	11	495	Bottom: Series 1: "Apocalypse"	3	
194	2016-01-07 14:01:14.825603+00	1	11	494	Bottom: Series 1: "'S Up"	3	
195	2016-01-07 14:01:14.826334+00	1	11	499	Better Call Saul: Season 1: "Five-O"	3	
196	2016-01-07 14:01:14.827323+00	1	11	498	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Gets a Job!"	3	
197	2016-01-07 14:01:14.828252+00	1	11	497	Bottom: Series 1: "Contest"	3	
198	2016-01-07 14:01:14.829032+00	1	11	500	Better Call Saul: Season 1: "Alpine Shepherd Boy"	3	
199	2016-01-07 14:01:14.830058+00	1	11	502	This Ain't California	3	
200	2016-01-07 14:01:14.831156+00	1	11	501	Better Call Saul: Season 1: "Hero"	3	
201	2016-01-07 14:01:14.832033+00	1	11	503	Better Call Saul: Season 1: "Nacho"	3	
202	2016-01-07 14:01:14.832826+00	1	11	504	Transsiberian	3	
203	2016-01-07 14:01:14.833603+00	1	11	505	Better Call Saul: Season 1: "Mijo"	3	
204	2016-01-07 14:01:14.834345+00	1	11	506	Downloaded	3	
205	2016-01-07 14:01:14.835228+00	1	11	507	Jo Nesbo's Headhunters	3	
206	2016-01-07 14:01:14.835984+00	1	11	508	We Are the Best!	3	
207	2016-01-07 14:01:14.836799+00	1	11	509	Pantani: The Accidental Death of a Cyclist	3	
208	2016-01-07 14:01:14.837585+00	1	11	510	West of Memphis	3	
209	2016-01-07 14:01:14.838325+00	1	11	511	Dallas Buyers Club	3	
210	2016-01-07 14:01:14.839075+00	1	11	513	Black Books: Series 1: "Manny's First Day"	3	
211	2016-01-07 14:01:14.839865+00	1	11	512	Black Books: Series 1: "The Grapes of Wrath"	3	
212	2016-01-07 14:01:14.840626+00	1	11	514	Getting On: Series 1: "Episode 1"	3	
213	2016-01-07 14:01:14.841356+00	1	11	517	Peep Show: Series 4: "The Wedding"	3	
214	2016-01-07 14:01:14.842086+00	1	11	516	Peep Show: Series 6: "Jeremy at JLB"	3	
215	2016-01-07 14:01:14.842853+00	1	11	515	Peep Show: Series 6: "The Test"	3	
216	2016-01-07 14:01:14.843594+00	1	11	518	Peep Show: Series 5: "Mark's Women"	3	
217	2016-01-07 14:01:14.844372+00	1	11	520	Peep Show: Series 5: "Jeremy's Mummy"	3	
218	2016-01-07 14:01:14.845218+00	1	11	519	Peep Show: Series 5: "Jeremy's Manager"	3	
219	2016-01-07 14:01:14.846032+00	1	11	522	Hoop Dreams	3	
220	2016-01-07 14:01:14.846793+00	1	11	521	The Cat from Outer Space	3	
221	2016-01-07 14:01:14.847539+00	1	11	525	Frankenweenie	3	
222	2016-01-07 14:01:14.848294+00	1	11	524	Peep Show: Series 3: "Shrooming"	3	
223	2016-01-07 14:01:14.849103+00	1	11	523	Peep Show: Series 3: "Sisterning"	3	
224	2016-01-07 14:01:14.849846+00	1	11	526	Bionicle 2: Legends of Metru Nui	3	
225	2016-01-07 14:01:14.850583+00	1	11	528	Peep Show: Series 3: "Mugging"	3	
226	2016-01-07 14:01:14.851338+00	1	11	527	Peep Show: Series 3: "Sectioning"	3	
227	2016-01-07 14:01:14.852082+00	1	11	530	The IT Crowd: Series 4: "Italian for Beginners"	3	
228	2016-01-07 14:01:14.852815+00	1	11	529	Louis Theroux: "Louis Theroux: Louis and Michael"	3	
229	2016-01-07 14:01:14.853534+00	1	11	533	The IT Crowd: Series 4: "Jen the Fredo"	3	
230	2016-01-07 14:01:14.854264+00	1	11	532	The IT Crowd: Series 4: "The Final Countdown"	3	
231	2016-01-07 14:01:14.855073+00	1	11	531	The IT Crowd: Series 4: "Something Happened"	3	
232	2016-01-07 14:01:14.85586+00	1	11	537	Wall Street	3	
233	2016-01-07 14:01:14.856678+00	1	11	536	The IT Crowd: Series 3: "Tramps Like Us"	3	
234	2016-01-07 14:01:14.857512+00	1	11	535	The IT Crowd: Series 3: "The Speech"	3	
235	2016-01-07 14:01:14.858264+00	1	11	534	The IT Crowd: Series 3: "Friendface"	3	
236	2016-01-07 14:01:14.859048+00	1	11	538	The IT Crowd: Series 3: "From Hell"	3	
237	2016-01-07 14:01:14.859781+00	1	11	539	Girl Most Likely	3	
238	2016-01-07 14:01:14.860921+00	1	11	541	The IT Crowd: Series 2: "Smoke and Mirrors"	3	
240	2016-01-07 14:01:14.862664+00	1	11	545	BoJack Horseman: Season 1: "BoJack Hates the Troops"	3	
241	2016-01-07 14:01:14.863591+00	1	11	544	Ruthless People	3	
242	2016-01-07 14:01:14.864399+00	1	11	543	The IT Crowd: Series 2: "Moss and the German"	3	
243	2016-01-07 14:01:14.865165+00	1	11	542	The IT Crowd: Series 2: "The Dinner Party"	3	
244	2016-01-07 14:01:14.865893+00	1	11	547	The IT Crowd: Series 2: "The Work Outing"	3	
245	2016-01-07 14:01:14.866634+00	1	11	546	The IT Crowd: Series 2: "Return of the Golden Child"	3	
246	2016-01-07 14:01:14.867378+00	1	11	549	The IT Crowd: Series 1: "The Haunting of Bill Crouse"	3	
247	2016-01-07 14:01:14.868152+00	1	11	548	The IT Crowd: Series 1: "Aunt Irma Visits"	3	
248	2016-01-07 14:01:14.868878+00	1	11	550	The IT Crowd: Series 1: "The Red Door"	3	
249	2016-01-07 14:01:14.869611+00	1	11	555	Filth	3	
250	2016-01-07 14:01:14.870343+00	1	11	554	Stories We Tell	3	
251	2016-01-07 14:01:14.87107+00	1	11	553	The IT Crowd: Series 1: "Yesterday's Jam"	3	
252	2016-01-07 14:01:14.871812+00	1	11	552	The IT Crowd: Series 1: "Calamity Jen"	3	
253	2016-01-07 14:01:14.872796+00	1	11	551	The IT Crowd: Series 1: "Fifty-Fifty"	3	
254	2016-01-07 14:01:14.873605+00	1	11	561	Prince Avalanche	3	
255	2016-01-07 14:01:14.874427+00	1	11	560	BoJack Horseman: Season 1: "BoJack Horseman: The BoJack Horseman Story, Chapter One"	3	
256	2016-01-07 14:01:14.875226+00	1	11	559	Father Ted: Series 3: "Chirpy Burpy Cheap Sheep"	3	
257	2016-01-07 14:01:14.875965+00	1	11	558	Father Ted: Series 3: "Speed 3"	3	
258	2016-01-07 14:01:14.876709+00	1	11	557	Father Ted: Series 3: "The Mainland"	3	
259	2016-01-07 14:01:14.877446+00	1	11	556	The Royle Family: Season 2: "Pregnancy"	3	
260	2016-01-07 14:01:14.878222+00	1	11	562	Safety Not Guaranteed	3	
261	2016-01-07 14:01:21.06961+00	1	11	563	LIFE 2.0	3	
262	2016-01-07 14:01:21.071647+00	1	11	565	The Fog of War	3	
263	2016-01-07 14:01:21.072745+00	1	11	564	Slap Shot	3	
264	2016-01-07 14:01:21.073797+00	1	11	567	Cardinal Burns: "Episode 1"	3	
265	2016-01-07 14:01:21.07478+00	1	11	566	Cardinal Burns: "Episode 2"	3	
266	2016-01-07 14:01:21.075731+00	1	11	568	Educating Essex: "Episode 7"	3	
267	2016-01-07 14:01:21.07667+00	1	11	569	Educating Essex: "Episode 6"	3	
268	2016-01-07 14:01:21.077543+00	1	11	570	Educating Essex: "Episode 5"	3	
269	2016-01-07 14:01:21.078303+00	1	11	572	Punk in Africa	3	
270	2016-01-07 14:01:21.079208+00	1	11	571	Bones Brigade: An Autobiography	3	
271	2016-01-07 14:01:21.080709+00	1	11	573	Educating Essex: "Episode 4"	3	
272	2016-01-07 14:01:21.081961+00	1	11	574	Educating Essex: "Episode 3"	3	
273	2016-01-07 14:01:21.082822+00	1	11	577	Educating Essex: "Episode 1"	3	
274	2016-01-07 14:01:21.083632+00	1	11	576	Town of Runners	3	
275	2016-01-07 14:01:21.084415+00	1	11	575	Educating Essex: "Episode 2"	3	
276	2016-01-07 14:01:21.085236+00	1	11	582	Utopia: Season 1: "Episode 5"	3	
277	2016-01-07 14:01:21.086117+00	1	11	581	Utopia: Season 1: "Episode 6"	3	
278	2016-01-07 14:01:21.086947+00	1	11	580	Comedy Showcase: Milton Jones's House of Rooms	3	
279	2016-01-07 14:01:21.087746+00	1	11	579	Comedy Showcase: Felix & Murdo	3	
280	2016-01-07 14:01:21.088554+00	1	11	578	Black Books: Series 1: "Cooking the Books"	3	
281	2016-01-07 14:01:21.089346+00	1	11	585	Dear Mr. Watterson	3	
282	2016-01-07 14:01:21.090142+00	1	11	584	Louis Theroux's Weird Weekends: Series 1: "Head for the Hills"	3	
283	2016-01-07 14:01:21.090895+00	1	11	583	Louis Theroux's Weird Weekends: Series 1: "Weird Christmas"	3	
284	2016-01-07 14:01:21.091633+00	1	11	586	Craigslist Joe	3	
285	2016-01-07 14:01:21.092461+00	1	11	587	The Moo Man	3	
286	2016-01-07 14:01:21.093557+00	1	11	589	The Frozen Ground	3	
287	2016-01-07 14:01:21.094893+00	1	11	588	Louis Theroux's Weird Weekends: Series 1: "UFOs"	3	
288	2016-01-07 14:01:21.095785+00	1	11	590	House of Cards: Season 1: "Chapter 2"	3	
289	2016-01-07 14:01:21.096646+00	1	11	591	House of Cards: Season 1: "Chapter 1"	3	
290	2016-01-07 14:01:21.097853+00	1	11	593	After Porn Ends	3	
291	2016-01-07 14:01:21.098666+00	1	11	592	Jeff, Who Lives at Home	3	
292	2016-01-07 14:01:21.099448+00	1	11	594	Orange Is the New Black: Season 1: "The Chickening"	3	
293	2016-01-07 14:01:21.10021+00	1	11	595	Jason Becker: Not Dead Yet	3	
294	2016-01-07 14:01:21.100975+00	1	11	597	Dark Days	3	
295	2016-01-07 14:01:21.101749+00	1	11	596	Splinters	3	
296	2016-01-07 14:01:21.102531+00	1	11	598	Orange Is the New Black: Season 1: "Imaginary Enemies"	3	
297	2016-01-07 14:01:21.103291+00	1	11	600	Orange Is the New Black: Season 1: "Lesbian Request Denied"	3	
298	2016-01-07 14:01:21.10404+00	1	11	599	RuPaul's Drag Race: Season 2: "Gone with the Window"	3	
299	2016-01-07 14:01:21.104821+00	1	11	601	Orange Is the New Black: Season 1: "Tit Punch"	3	
300	2016-01-07 14:01:21.105627+00	1	11	602	Fat, Sick & Nearly Dead	3	
301	2016-01-07 14:01:21.106399+00	1	11	604	Orange Is the New Black: Season 1: "I Wasn't Ready"	3	
302	2016-01-07 14:01:21.107142+00	1	11	603	The Elephant in the Living Room	3	
303	2016-01-07 14:01:21.107895+00	1	11	605	Mortified Nation	3	
304	2016-01-07 14:01:21.108692+00	1	11	606	Cropsey	3	
305	2016-01-07 14:01:21.109466+00	1	11	607	Primer	3	
306	2016-01-07 14:01:21.110362+00	1	11	608	The Bridge	3	
307	2016-01-07 14:01:21.111145+00	1	11	609	Best Worst Movie	3	
308	2016-01-07 14:01:21.111939+00	1	11	610	Rango	3	
309	2016-01-07 14:01:21.112731+00	1	11	611	The Office (U.S.): Season 1: "Pilot"	3	
310	2016-01-07 14:01:21.113487+00	1	11	613	Mansome	3	
311	2016-01-07 14:01:21.114228+00	1	11	612	Drop the Dead Donkey: Series 1: "A New Dawn"	3	
312	2016-01-07 14:01:21.114983+00	1	11	614	Pumping Iron	3	
313	2016-01-12 08:44:00.769403+00	1	10	13	Netflix	2	Changed item_summary_template.
314	2016-01-12 08:44:19.518008+00	1	10	13	Netflix	2	Changed item_summary_template.
315	2016-01-12 08:47:28.249945+00	1	11	618	1 steps	2	Changed slug.
316	2016-01-12 08:47:36.496028+00	1	11	619	1234 steps	2	Changed slug.
317	2016-01-18 14:14:00.625315+00	1	10	14	Garmin Connect	2	Changed item_summary_template.
318	2016-01-18 14:14:30.611122+00	1	11	618	1 steps	2	No fields changed.
319	2016-01-19 08:41:54.925089+00	1	10	1	AudioBoom	2	Changed description.
320	2016-01-19 08:43:35.826357+00	1	10	6	Wordpress	2	Changed description.
321	2016-01-19 08:44:43.442954+00	1	10	13	Netflix	2	Changed description.
322	2016-01-19 08:45:15.490174+00	1	10	12	Strava	2	Changed description.
323	2016-01-19 08:46:22.849617+00	1	10	2	delicious	2	Changed description.
324	2016-01-19 08:47:00.712337+00	1	10	14	Garmin Connect	2	Changed description.
325	2016-01-19 08:47:49.640483+00	1	10	8	Goodreads	2	Changed description.
327	2016-01-19 08:49:15.755257+00	1	10	3	Flickr	2	Changed description.
328	2016-01-19 08:50:55.350895+00	1	10	9	GitHub	2	Changed description.
329	2016-01-19 08:51:39.258464+00	1	10	7	Mixcloud	2	Changed description.
330	2016-01-19 08:52:26.30294+00	1	10	10	Vimeo Videos	2	Changed description.
331	2016-01-19 08:53:37.079319+00	1	10	11	Vimeo Viewing	2	Changed description.
332	2016-01-19 13:21:55.571675+00	1	10	12	Strava	2	Changed description.
333	2016-01-19 13:35:28.419834+00	1	12	1	CV Downloads	1	Added.
334	2016-01-19 13:35:38.501834+00	1	13	2	Work	2	Changed pod_promos.
335	2016-01-19 13:49:28.184336+00	1	13	2	Work	2	Changed body_html.
336	2016-01-19 13:50:40.165568+00	1	13	2	Work	2	Changed body_html.
337	2016-01-19 13:58:34.088561+00	1	13	2	Work	2	Changed body_html.
338	2016-01-19 13:58:42.179767+00	1	13	1	About Me	2	Changed body_html.
339	2016-01-19 14:01:14.065988+00	1	13	2	Work	2	Changed body_html.
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 339, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	auth	user
4	contenttypes	contenttype
5	sessions	session
6	sites	site
7	admin	logentry
8	redirects	redirect
9	south	migrationhistory
10	lifestream	source
11	lifestream	item
12	articles	promo
13	articles	article
14	blog	blogcategory
15	blog	entry
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('django_content_type_id_seq', 15, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-12-14 13:46:11.268773+00
2	auth	0001_initial	2015-12-14 13:46:11.286783+00
3	admin	0001_initial	2015-12-14 13:46:11.302017+00
4	admin	0002_logentry_remove_auto_add	2015-12-14 13:46:11.320943+00
5	articles	0001_initial	2015-12-14 13:46:11.354774+00
6	contenttypes	0002_remove_content_type_name	2015-12-14 13:46:11.399175+00
7	auth	0002_alter_permission_name_max_length	2015-12-14 13:46:11.415087+00
8	auth	0003_alter_user_email_max_length	2015-12-14 13:46:11.428698+00
9	auth	0004_alter_user_username_opts	2015-12-14 13:46:11.441628+00
10	auth	0005_alter_user_last_login_null	2015-12-14 13:46:11.45242+00
11	auth	0006_require_contenttypes_0002	2015-12-14 13:46:11.454174+00
12	auth	0007_alter_validators_add_error_messages	2015-12-14 13:46:11.476316+00
13	blog	0001_initial	2015-12-14 13:46:11.489428+00
14	lifestream	0001_initial	2015-12-14 13:46:11.513334+00
15	sites	0001_initial	2015-12-14 13:46:11.518339+00
16	redirects	0001_initial	2015-12-14 13:46:11.527224+00
17	sessions	0001_initial	2015-12-14 13:46:11.538718+00
18	sites	0002_alter_domain_unique	2015-12-14 13:46:11.549038+00
19	lifestream	0002_auto_20151227_1839	2015-12-27 18:40:07.133422+00
20	lifestream	0003_auto_20160107_1357	2016-01-07 13:57:07.92519+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('django_migrations_id_seq', 20, true);


--
-- Data for Name: django_redirect; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY django_redirect (id, site_id, old_path, new_path) FROM stdin;
1	1	podcast	podcast.html
\.


--
-- Name: django_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('django_redirect_id_seq', 1, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
igqfuh1b3nqtbhvtcx5jdsgqe1nf7ibv	OGUwYzI4NDM0OTdlYWE2OWIyZmI3Mjg0OTUxM2M2ZmY0N2NjOGJlNjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu	2015-12-25 14:21:55.146585+00
0br1bqvm08ekwkra3wyc4n7x0dgh30un	OGUwYzI4NDM0OTdlYWE2OWIyZmI3Mjg0OTUxM2M2ZmY0N2NjOGJlNjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu	2015-12-25 14:25:57.154622+00
s2umwd3dg17jdm0vemhzewftonhgt5ro	OGUwYzI4NDM0OTdlYWE2OWIyZmI3Mjg0OTUxM2M2ZmY0N2NjOGJlNjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu	2015-12-25 15:13:08.615291+00
1rnsnum2offqqd6tnez4wm5a39r45f0b	OGUwYzI4NDM0OTdlYWE2OWIyZmI3Mjg0OTUxM2M2ZmY0N2NjOGJlNjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQRLAXUu	2015-12-25 15:34:42.165956+00
nambngjylv4en23cfo57tje8iu0mq193	NjU0ODE1ODRkOGNmMWU3ZDUwNzAzOTNjYTZkZGY2ZjQ2OGI1NTMwMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQxMjQ5NjVmMGQ1MDFlZmUyNjg5ZmM3Y2U3ODRiZjc4ZjE1Y2U5ZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-12-28 13:47:15.944801+00
6upfh5cxvkdibevvcpvoomh9cxck84vz	NjU0ODE1ODRkOGNmMWU3ZDUwNzAzOTNjYTZkZGY2ZjQ2OGI1NTMwMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQxMjQ5NjVmMGQ1MDFlZmUyNjg5ZmM3Y2U3ODRiZjc4ZjE1Y2U5ZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-12-29 13:28:23.913621+00
v1hp0f9mzkq4uigtmh6ftxjlpizkw2dp	NjU0ODE1ODRkOGNmMWU3ZDUwNzAzOTNjYTZkZGY2ZjQ2OGI1NTMwMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQxMjQ5NjVmMGQ1MDFlZmUyNjg5ZmM3Y2U3ODRiZjc4ZjE1Y2U5ZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-12-30 13:29:25.956337+00
0fos8jzcic1elxdl7y3vykjo8pcjqtsf	NjU0ODE1ODRkOGNmMWU3ZDUwNzAzOTNjYTZkZGY2ZjQ2OGI1NTMwMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQxMjQ5NjVmMGQ1MDFlZmUyNjg5ZmM3Y2U3ODRiZjc4ZjE1Y2U5ZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-12-30 16:48:31.322958+00
qvutc6vqu8gi0i024re19uzt16h1x1du	NjU0ODE1ODRkOGNmMWU3ZDUwNzAzOTNjYTZkZGY2ZjQ2OGI1NTMwMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQxMjQ5NjVmMGQ1MDFlZmUyNjg5ZmM3Y2U3ODRiZjc4ZjE1Y2U5ZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2015-12-31 16:30:36.081898+00
hixo7r2sgpn1wp8w49m4gcaux2y6phov	YzIxMGI1M2ViM2IwNjYwMGEyY2M4MDM2MzlkZmYwZDAxYWJiODkxYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQxMjQ5NjVmMGQ1MDFlZmUyNjg5ZmM3Y2U3ODRiZjc4ZjE1Y2U5ZDgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2016-01-04 16:41:25.557668+00
4exktkiokoccv2z21vou4a38lf7ox6lg	NjU0ODE1ODRkOGNmMWU3ZDUwNzAzOTNjYTZkZGY2ZjQ2OGI1NTMwMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQxMjQ5NjVmMGQ1MDFlZmUyNjg5ZmM3Y2U3ODRiZjc4ZjE1Y2U5ZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-01-19 08:14:18.651221+00
idl235bsbfst6edx3cpf4kwi6vi0u5hh	NjU0ODE1ODRkOGNmMWU3ZDUwNzAzOTNjYTZkZGY2ZjQ2OGI1NTMwMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQxMjQ5NjVmMGQ1MDFlZmUyNjg5ZmM3Y2U3ODRiZjc4ZjE1Y2U5ZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-01-19 13:09:23.271376+00
md1n1qfnso05q2nkom60cdojj6rdml9k	NjU0ODE1ODRkOGNmMWU3ZDUwNzAzOTNjYTZkZGY2ZjQ2OGI1NTMwMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQxMjQ5NjVmMGQ1MDFlZmUyNjg5ZmM3Y2U3ODRiZjc4ZjE1Y2U5ZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-01-21 08:32:20.174145+00
cpan0ndpils9f04kosfkklrhtdnokrv9	NjU0ODE1ODRkOGNmMWU3ZDUwNzAzOTNjYTZkZGY2ZjQ2OGI1NTMwMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQxMjQ5NjVmMGQ1MDFlZmUyNjg5ZmM3Y2U3ODRiZjc4ZjE1Y2U5ZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-01-21 13:59:40.09622+00
ocdynn2zafescprjvcn56n5ef6n3ydaf	NjU0ODE1ODRkOGNmMWU3ZDUwNzAzOTNjYTZkZGY2ZjQ2OGI1NTMwMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQxMjQ5NjVmMGQ1MDFlZmUyNjg5ZmM3Y2U3ODRiZjc4ZjE1Y2U5ZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-01-26 08:27:17.687042+00
egtylowy351njk58asnu4fzeu7a8ri3h	NjU0ODE1ODRkOGNmMWU3ZDUwNzAzOTNjYTZkZGY2ZjQ2OGI1NTMwMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQxMjQ5NjVmMGQ1MDFlZmUyNjg5ZmM3Y2U3ODRiZjc4ZjE1Y2U5ZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-01-26 09:37:21.036661+00
i5va3ig24n9dcevxf3kmkf0kcqg3vcfa	NjU0ODE1ODRkOGNmMWU3ZDUwNzAzOTNjYTZkZGY2ZjQ2OGI1NTMwMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQxMjQ5NjVmMGQ1MDFlZmUyNjg5ZmM3Y2U3ODRiZjc4ZjE1Y2U5ZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-02-01 14:13:32.973776+00
3fhulfu6c7104dnqyprz4s2rktuofx6w	NjU0ODE1ODRkOGNmMWU3ZDUwNzAzOTNjYTZkZGY2ZjQ2OGI1NTMwMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQxMjQ5NjVmMGQ1MDFlZmUyNjg5ZmM3Y2U3ODRiZjc4ZjE1Y2U5ZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-02-02 08:40:52.516619+00
6oq1xuz3tpdbhadu0vtmx630rr62d8zy	NjU0ODE1ODRkOGNmMWU3ZDUwNzAzOTNjYTZkZGY2ZjQ2OGI1NTMwMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQxMjQ5NjVmMGQ1MDFlZmUyNjg5ZmM3Y2U3ODRiZjc4ZjE1Y2U5ZDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-02-02 13:21:18.539606+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY django_site (id, domain, name) FROM stdin;
1	gareth53.co.uk	Gareth53.co.uk
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('django_site_id_seq', 1, true);


--
-- Data for Name: lifestream_item; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY lifestream_item (id, feed_id, url, title, pub_date, author, description, guid, slug, category, image, media_url, media_type) FROM stdin;
4	1	http://audioboom.com/boos/2747931-post-match-reaction-huddersfield-town-chris-powell-vs-birmingham-city	POST MATCH REACTION HUDDERSFIELD TOWN: Chris Powell vs Birmingham City	2014-12-20 17:59:17+00		Huddersfield Town manager Chris Powell speaks to BBC Radio Leeds' Paul Ogden following his side's 1-0 defeat to Birmingham City. #htafc	tag:audioboo.fm,2014-12-20:/boos/2747931	4-post-match-reaction-huddersfield-town-chris-powe				
76	5	http://reprints.longform.org/todd-marinovich-the-man-who-never-was	The Man Who Never Was	2015-12-10 22:37:47+00			http://reprints.longform.org/todd-marinovich-the-man-who-never-was	76-the-man-who-never-was				
5	1	http://audioboom.com/boos/2729242-post-match-reaction-huddersfield-town-chris-powell-v-norwich-city	POST MATCH REACTION HUDDERSFIELD TOWN: Chris Powell v Norwich City	2014-12-13 17:55:59+00		Huddersfield Town manager Chris Powell speaks to BBC Radio Leeds' Paul Ogden following his side's 5-0 defeat at Norwich. #htafc	tag:audioboo.fm,2014-12-13:/boos/2729242	5-post-match-reaction-huddersfield-town-chris-powe				
3	1	http://audioboom.com/boos/2803863-listen-huddersfield-town-s-nahki-wells-i-want-20-goals-this-season	LISTEN: Huddersfield Town's Nahki Wells "I want 20 goals this season"	2015-01-16 14:02:57+00		Huddersfield Town striker Nahki Wells on his year at the club and his 20 goal target for this season #htafc @htafcdotcom	tag:audioboo.fm,2015-01-16:/boos/2803863	3-listen-huddersfield-towns-nahki-wells-i-want-20-				
349	5	http://lifehacker.com/fitness-isnt-just-for-the-wealthy-how-to-stay-healthy-1744513922?trending_test_three_b&utm_expid=66866090-68.NesmD4FSTbKroxp5qEjtVQ.2&utm_source=pocket&utm_medium=email&utm_campaign=pockethits	Fitness Isn't Just for the Wealthy: How to Stay Healthy on a Budget	2015-12-22 15:10:11+00								
620	13	https://www.netflix.com/WiMovie/80075831?trkid=200250783	Making a Murderer: Season 1: "Fighting for their Lives"	2016-01-03 15:00:00+00								
621	13	https://www.netflix.com/WiMovie/80000716?trkid=200250783	Forensic Files: Forensic Files: Collection: "Filtered Out"	2016-01-02 15:00:00+00								
6	1	http://audioboom.com/boos/2691860-huddersfield-town-post-match-reaction-chris-powell	HUDDERSFIELD TOWN POST MATCH REACTION - CHRIS POWELL	2014-11-29 17:59:56+00		BBC Radio Leeds' Gareth Jones spoke to Huddersfield Town manager after his side lost 1-0 away at Bolton. #htafc	tag:audioboo.fm,2014-11-29:/boos/2691860	6-huddersfield-town-post-match-reaction-chris-powe				
7	1	http://audioboom.com/boos/2594249-huddersfield-town-chris-powell-post-match-reaction	Huddersfield Town - Chris Powell Post Match Reaction	2014-10-25 17:09:54+01		BBC Radio Leeds' Paul Ogden speaks to Huddersfield Town manager Chris Powell who witnessed his side come from two goals down to get a point away at Ipswich Town. #htafc	tag:audioboo.fm,2014-10-25:/boos/2594249	7-huddersfield-town-chris-powell-post-match-reacti				
8	1	http://audioboom.com/boos/2534944-post-match-reaction-huddersfield-town-chris-powell-vs-blackburn-rovers	POST MATCH REACTION HUDDERSFIELD TOWN: Chris Powell vs Blackburn Rovers	2014-10-04 17:32:52+01		Huddersfield Town manager Chris Powell speaks to BBC Radio Leeds' Paul Ogden following his side's 0-0 draw with Blackburn Rovers. #htafc	tag:audioboo.fm,2014-10-04:/boos/2534944	8-post-match-reaction-huddersfield-town-chris-powe				
9	1	http://audioboom.com/boos/2484510-huddersfield-town-chris-powell-post-match-reaction	Huddersfield Town - Chris Powell Post Match Reaction	2014-09-16 22:15:53+01		BBC Radio Leeds' Paul Ogden speaks to Huddersfield Town boss Chris Powell after his team’s 0-0 draw at home to Wigan #HTAFC	tag:audioboo.fm,2014-09-16:/boos/2484510	9-huddersfield-town-chris-powell-post-match-reacti				
10	1	http://audioboom.com/boos/2446257-interview-chairman-dean-hoyle-on-chris-powell	INTERVIEW: Chairman Dean Hoyle on Chris Powell	2014-09-03 18:19:30+01		Huddersfield Town Chairman Dean Hoyle tells BBC Radio Leeds why they've appointed former England left back and Charlton manager Chris Powell as their new boss. #htafc	tag:audioboo.fm,2014-09-03:/boos/2446257	10-interview-chairman-dean-hoyle-on-chris-powell				
11	1	http://audioboom.com/boos/2446235-interview-chris-powell-huddersfield-town-s-new-manager	INTERVIEW: Chris Powell, Huddersfield Town's new manager	2014-09-03 18:13:12+01		New Huddersfield Town manager Chris Powell talks to BBC Radio Leeds about his appointment at the club. #htafc	tag:audioboo.fm,2014-09-03:/boos/2446235	11-interview-chris-powell-huddersfield-towns-new-m				
12	1	http://audioboom.com/boos/2436018-post-match-reaction-huddersfield-town-mark-lillis-v-watford	POST MATCH REACTION HUDDERSFIELD TOWN: Mark Lillis v Watford	2014-08-30 16:50:46+01		Huddersfield Town caretaker manager Mark Lillis speaks to BBC Radio Leeds following his side's 4-2 defeat at Watford. #htafc	tag:audioboo.fm,2014-08-30:/boos/2436018	12-post-match-reaction-huddersfield-town-mark-lill				
13	1	http://audioboom.com/boos/2390617-huddersfield-town-dean-hoyle-interview	HUDDERSFIELD TOWN - Dean Hoyle Interview	2014-08-12 17:34:17+01		Dean Hoyle speaks to BBC Radio Leeds following Mark Robins' departure. #htafc	tag:audioboo.fm,2014-08-12:/boos/2390617	13-huddersfield-town-dean-hoyle-interview				
14	1	http://audioboom.com/boos/2407514-post-match-reaction-huddersfield-town-harry-bunn-v-reading	POST MATCH REACTION HUDDERSFIELD TOWN - Harry Bunn v Reading	2014-08-19 22:09:37+01		Huddersfield Town striker Harry Bunn speaks to BBC Radio Leed after his goal helped his side to victory over Reading. #htafc	tag:audioboo.fm,2014-08-19:/boos/2407514	14-post-match-reaction-huddersfield-town-harry-bun				
15	1	http://audioboom.com/boos/2407496-post-match-reaction-huddersfield-town-mark-lillis-v-reading	POST MATCH REACTION HUDDERSFIELD TOWN - Mark Lillis v Reading	2014-08-19 22:01:28+01		Huddersfield Town caretaker manager Mark Lillis speaks to BBC Radio Leeds following his side's victory over Reading. #htafc	tag:audioboo.fm,2014-08-19:/boos/2407496	15-post-match-reaction-huddersfield-town-mark-lill				
16	1	http://audioboom.com/boos/2092343-mark-robins-post-match-reaction	Mark Robins - Post match reaction	2014-04-21 17:33:44+01		Huddersfield Town manager Mark Robins reacts to his side's crucial 2-1 victory over Yeovil. #htafc	tag:audioboo.fm,2014-04-21:/boos/2092343	16-mark-robins-post-match-reaction				
17	1	http://audioboom.com/boos/2092371-adam-clayton-post-match-reaction	Adam Clayton - Post match reaction	2014-04-21 17:47:01+01		Huddersfield Town match-winner Adam Clayton reacts to the Terriers' 2-1 victory over Yeovil Town. #htafc	tag:audioboo.fm,2014-04-21:/boos/2092371	17-adam-clayton-post-match-reaction				
18	1	http://audioboom.com/boos/2070694-huddersfield-town-reaction-mark-robins	Huddersfield Town Reaction - Mark Robins	2014-04-12 16:36:17+01		BBC Radio Leeds' Paul Ogden speaks to Huddersfield Town manager Mark Robins after their 3-1 defeat away at Derby, which saw Town reduced to 9 men for much of the game. #htafc	tag:audioboo.fm,2014-04-12:/boos/2070694	18-huddersfield-town-reaction-mark-robins				
19	1	http://audioboom.com/boos/2058950-mark-robins-post-match-reaction	Mark Robins- Post match reaction	2014-04-08 22:02:27+01		Huddersfield Town manager Mark Robins spoke to BBC Radio Leeds' Paul Ogden after his side's defeat at home to Ipswich Town. #HTAFC	tag:audioboo.fm,2014-04-08:/boos/2058950	19-mark-robins-post-match-reaction				
20	1	http://audioboom.com/boos/2020325-trust-in-me-robins	Trust in me - Robins	2014-03-26 06:59:32+00		After their 2-2 draw against Middlesbrough, Huddersfield Town manager Mark Robins tells BBC Radio Leeds that fans must show faith in him	tag:audioboo.fm,2014-03-26:/boos/2020325	20-trust-in-me-robins				
93	5	http://warpspire.com/posts/kss	Knyle Style Sheets	2015-11-23 21:51:03+00			http://warpspire.com/posts/kss	93-knyle-style-sheets				
21	1	http://audioboom.com/boos/2011142-clayton-calls-for-more-professional-pride-at-huddersfield-town	Clayton calls for more professional pride at Huddersfield Town	2014-03-22 18:47:05+00		Huddersfield Town midfielder Adam Clayton has called for his side to regain their professional pride, in order win games before the end of the season. He was speaking to BBC Radio Leeds' Paul Ogden after Town were beaten 1-0 at Blackpool. #HTAFC	tag:audioboo.fm,2014-03-22:/boos/2011142	21-clayton-calls-for-more-professional-pride-at-hu				
22	1	http://audioboom.com/boos/1994261-huddersfield-town-robins-reaction	Huddersfield Town - Robins reaction	2014-03-15 17:59:51+00		BBC Radio Leeds' Paul Ogden speaks to Huddersfield Town manager Mark Robins after their 4-2 defeat to Blackburn at the John Smiths Stadium. #htafc	tag:audioboo.fm,2014-03-15:/boos/1994261	22-huddersfield-town-robins-reaction				
23	1	http://audioboom.com/boos/1988097-huddersfield-town-s-jonathan-hogg-pleased-with-a-0-0-draw-v-charlton-on-shocking-valley-pitch	Huddersfield Town's Jonathan Hogg pleased with a 0-0 draw v Charlton on "shocking" Valley pitch	2014-03-13 06:48:55+00		#htafc Town midfielder Jonathan Hogg reflects on 0-0 draw with the Championship's bottom club Charlton, on "shocking" pitch at The Valley @htafcdotcom	tag:audioboo.fm,2014-03-13:/boos/1988097	23-huddersfield-towns-jonathan-hogg-pleased-with-a				
24	1	http://audioboom.com/boos/1987435-town-boss-robins-reaction-to-stalemate-at-charlton	Town boss Robins reaction to stalemate at Charlton	2014-03-12 23:00:43+00		Huddersfield Town manager Mark Robins tells BBC Radio Leeds it was a solid performance from his side in the 0-0 draw at The Valley. @htafcdotcom #htafc @bbcleeds	tag:audioboo.fm,2014-03-12:/boos/1987435	24-town-boss-robins-reaction-to-stalemate-at-charl				
25	1	http://audioboom.com/boos/1976890-huddersfield-town-robins-post-match-reaction	Huddersfield Town - Robins Post Match Reaction	2014-03-08 18:15:26+00		BBC Radio Leeds' Paul Ogden gets the thoughts of Huddersfield Town manager Mark Robins after his side's 2-0 defeat to Doncaster at the Keepmoat Stadium. #htafc	tag:audioboo.fm,2014-03-08:/boos/1976890	25-huddersfield-town-robins-post-match-reaction				
26	1	http://audioboom.com/boos/1959267-huddersfield-town-southern-post-match-reaction	Huddersfield Town- Southern post match reaction	2014-03-01 17:56:49+00		Huddersfield Town midfielder Keith Southern speaks to BBC Leeds' Paul Ogden following his return to the side and scoring the first goal in their 5-0 win at home to Barnsley. #HTAFC	tag:audioboo.fm,2014-03-01:/boos/1959267	26-huddersfield-town-southern-post-match-reaction				
27	1	http://audioboom.com/boos/1959242-huddersfield-town-robins-post-match-reaction	Huddersfield Town - Robins post match reaction	2014-03-01 17:35:20+00		Huddersfield Town manager Mark Robins speaks to BBC Leeds' Paul Ogden following his side's emphatic 5-0 win at home to Yorkshire rivals Barnsley. #HTAFC	tag:audioboo.fm,2014-03-01:/boos/1959242	27-huddersfield-town-robins-post-match-reaction				
28	1	http://audioboom.com/boos/1915086-it-was-men-against-boys-robins-on-huddersfield-town-s-3-0-defeat-against-nottingham-forest	"It was men against boys" - Robins on Huddersfield Town's 3-0 defeat against Nottingham Forest	2014-02-11 22:50:46+00		Huddersfield Town manager Mark Robins reacts angrily to his side's 3-0 home defeat against Nottingham Forest. Robins was speaking to BBC Radio Leeds' Paul Ogden. #HTAFC	tag:audioboo.fm,2014-02-11:/boos/1915086	28-it-was-men-against-boys-robins-on-huddersfield-				
29	1	http://audioboom.com/boos/1876799-huddersfield-town-v-charlton-match-preview	Huddersfield Town v Charlton - Match Preview	2014-01-25 13:11:20+00		BBC Radio Leeds' Katherine Hannah and Paul Ogden look ahead to Huddersfield Town's 4th round FA  Cup tie at the John Smiths Stadium against Charlton. Full coverage from 2pm on BBC Radio Leeds. #htafc	tag:audioboo.fm,2014-01-25:/boos/1876799	29-huddersfield-town-v-charlton-match-preview				
30	1	http://audioboom.com/boos/1845891-huddersfield-town-s-dean-hoyle-on-nahki-wells	Huddersfield Town's Dean Hoyle on Nahki Wells	2014-01-11 18:23:26+00		BBC Radio Leeds' Paul Ogden spoke to Huddersfield town Chairman Dean Hoyle about their new record signing - Nahki Wells. #htafc	tag:audioboo.fm,2014-01-11:/boos/1845891	30-huddersfield-towns-dean-hoyle-on-nahki-wells				
31	1	http://audioboom.com/boos/1845920-huddersfield-town-nahki-wells-and-mark-robins	Huddersfield Town - Nahki Wells and Mark Robins	2014-01-11 18:32:47+00		BBC Radio Leeds' Paul Ogden spoke to Huddersfield Town's new signing Nahki Wells about scoring the winning goal on his debut, and boss Mark Robins about the record signing for the club. #htafc	tag:audioboo.fm,2014-01-11:/boos/1845920	31-huddersfield-town-nahki-wells-and-mark-robins				
32	1	http://audioboom.com/boos/1828636-the-football-panel-discuss-huddersfield-town-transfer-rumours-james-vaughan	The Football Panel discuss Huddersfield Town, transfer rumours & James Vaughan	2014-01-03 07:50:45+00		The Football Panel discuss Huddersfield Town's 3-2 loss to Burnley, the latest on James Vaughan & whether Town need a new striker #htafc	tag:audioboo.fm,2014-01-03:/boos/1828636	32-the-football-panel-discuss-huddersfield-town-tr				
33	1	http://audioboom.com/boos/1831099-robins-post-match-reaction-after-huddersfield-town-s-3-2-win-at-grimsby	Robins Post-Match reaction after Huddersfield Town's 3-2 win at Grimsby	2014-01-04 18:26:01+00		BBC Radio Leeds' Paul Ogden speaks to Huddersfield Town Manager Mark Robins following a thrilling comeback win in the FA Cup third round game away at Grimsby. #HTAFC	tag:audioboo.fm,2014-01-04:/boos/1831099	33-robins-post-match-reaction-after-huddersfield-t				
34	1	http://audioboom.com/boos/1826398-robins-post-match-reaction-after-3-2-loss-at-burnley	Robins Post-Match Reaction After 3-2 Loss at Burnley	2014-01-01 18:15:32+00		Huddersfield Town manager Mark Robins speaks to BBC Radio Leeds' Paul Ogden after his side failed to salvage a point at Burnley- going down 3-2. #HTAFC	tag:audioboo.fm,2014-01-01:/boos/1826398	34-robins-post-match-reaction-after-3-2-loss-at-bu				
35	1	http://audioboom.com/boos/1808619-robbie-rogers-on-life-at-leeds-and-the-fight-against-discrimination	Robbie Rogers on life at Leeds and the fight against discrimination	2013-12-19 13:36:05+00		Former Leeds Utd striker Robbie Rogers tells BBC Leeds about the emotional struggle he faced before coming to terms with his homosexuality so he can help fight discrimination. @MoveBEYONDit  #lufc #twitterwhites	tag:audioboo.fm,2013-12-19:/boos/1808619	35-robbie-rogers-on-life-at-leeds-and-the-fight-ag				
36	1	http://audioboom.com/boos/1812591-huddersfield-town-robins-post-match-reaction	Huddersfield Town - Robins post match reaction	2013-12-21 17:40:55+00		BBC Radio Leeds' Paul Ogden speaks to Huddersfield Town manager Mark Robins following their goalless draw away at Brighton. #htafc	tag:audioboo.fm,2013-12-21:/boos/1812591	36-huddersfield-town-robins-post-match-reaction				
37	1	http://audioboom.com/boos/1812337-brighton-v-huddersfield-town-match-preview	Brighton v Huddersfield Town - Match Preview	2013-12-21 13:41:02+00		BBC Radio Leeds' Gareth Jones and Paul Ogden look ahead to Huddersfield Town's clash away at Brighton. Full coverage from 2pm on BBC Radio Leeds. #htafc	tag:audioboo.fm,2013-12-21:/boos/1812337	37-brighton-v-huddersfield-town-match-preview				
275	12	http://strava.com/activities/360387671	08/01/2015 Barnet, United Kingdom	2015-08-01 08:04:40+01		Run (Barnet): Distance: 5.0km, Elevation Gain: 37m, Moving Time: 00:24:35, Average Speed: 12.1km/h	http://strava.com/activities/360387671	275-08012015-barnet-united-kingdom				
38	1	http://audioboom.com/boos/1774340-post-match-reaction-mark-robins	Post Match Reaction - Mark Robins	2013-12-03 23:01:35+00		A satisfied Huddersfield Town manager Mark Robins speaks to BBC Radio Leeds' Paul Ogden after his side's hard fought 1-0 win against Bolton Wanderers at the Reebok Stadium. #HTAFC	tag:audioboo.fm,2013-12-03:/boos/1774340	38-post-match-reaction-mark-robins				
39	1	http://audioboom.com/boos/1767258-huddersfield-town-post-match-reaction	Huddersfield Town - Post Match Reaction	2013-11-30 17:53:41+00		BBC Radio Leeds' Paul Ogden speaks to Huddersfield Town manager Mark Robins following their second Championship win on the bounce, beating league leaders Burnley 2-1. #htafc	tag:audioboo.fm,2013-11-30:/boos/1767258	39-huddersfield-town-post-match-reaction				
40	1	http://audioboom.com/boos/1717571-robins-post-match-reaction	Robins - Post Match Reaction	2013-11-09 18:13:54+00		Huddersfield Town manager Mark Robins gave a frank response to his side's 3-1 home defeat to Birmingham, when speaking with BBC Radio Leeds' Paul Ogden #HTAFC	tag:audioboo.fm,2013-11-09:/boos/1717571	40-robins-post-match-reaction				
41	1	http://audioboom.com/boos/1601013-draw-a-fair-result-robins	"Draw a fair result"- Robins	2013-09-14 17:54:53+01		Huddersfield Town manager Mark Robins spoke to BBC Radio Leeds' Paul Ogden after his side were held to a 0-0 draw by Yorkshire neighbours Doncaster Rovers. #HTAFC	tag:audioboo.fm,2013-09-14:/boos/1601013	41-draw-a-fair-result-robins				
42	1	http://audioboom.com/boos/1600638-huddersfield-town-v-doncaster-match-preview	Huddersfield Town v Doncaster match preview	2013-09-14 12:26:36+01		BBC Radio Leeds' Gareth Jones and Paul Ogden look ahead to the Yorkshire Derby between Huddersfield Town and Doncaster at the John Smiths Stadium. Full coverage from 2pm. #htafc	tag:audioboo.fm,2013-09-14:/boos/1600638	42-huddersfield-town-v-doncaster-match-preview				
43	1	http://audioboom.com/boos/1576190-mark-robins-post-match-reaction	Mark Robins post match reaction	2013-08-31 16:38:16+01		Huddersfield Town manager Mark Robins speaks to BBC Radio Leeds' Paul Ogden following Town's 2-1 defeat away at Barnsley #htafc	tag:audioboo.fm,2013-08-31:/boos/1576190	43-mark-robins-post-match-reaction				
44	1	http://audioboom.com/boos/1543402-robins-encouraged-by-town-s-performance	Robins encouraged by Town's performance.	2013-08-11 13:33:59+01		Huddersfiled Town are off the mark with their first point of the new Championship season after yesterday's 1-1 draw with QPR and manager Mark Robins to BBC Radio Leeds' Paul Ogden he was impressed with how his side played against the former Premier League side #htafc	tag:audioboo.fm,2013-08-11:/boos/1543402	44-robins-encouraged-by-towns-performance				
45	1	http://audioboom.com/boos/1542610-player-profile-oliver-norwood	Player Profile: Oliver Norwood	2013-08-10 13:31:56+01		As we try and get to know some of West Yorkshire's footballers a little bit better off the pitch, Huddersfield Town midfielder Oliver Norwood chatted to BBC Radio Leeds' Gareth Jones, starting with his holiday over the summer. #htafc	tag:audioboo.fm,2013-08-10:/boos/1542610	45-player-profile-oliver-norwood				
46	1	http://audioboom.com/boos/1542588-preview-of-huddersfield-town-v-qpr	Preview of Huddersfield Town v QPR	2013-08-10 12:41:09+01		BBC Radio Leeds' Gareth Jones and Paul Ogden look ahead to this afternoon's clash between Huddersfield Town and Queens Park Rangers at the John Smith's Stadium. Full coverage on fm frequencies and DAB from 2pm #htafc	tag:audioboo.fm,2013-08-10:/boos/1542588	46-preview-of-huddersfield-town-v-qpr				
47	1	http://audioboom.com/boos/1538280-first-win-was-important-james-vaughan	First win was important - James Vaughan	2013-08-07 05:56:51+01		After his two goals in Tuesday's 2-1 win over Bradford City in the League cup, Huddersfield Town striker James Vaughan speaks to @bbcleeds #htafc #bcafc	tag:audioboo.fm,2013-08-07:/boos/1538280	47-first-win-was-important-james-vaughan				
48	1	http://audioboom.com/boos/1538277-robins-pleased-with-brilliant-terriers	Robins pleased with 'brilliant' Terriers	2013-08-07 05:53:10+01		Huddersfield Town manager Mark Robins tells BBC Radio Leeds they were 'brilliant in spells' during Tuesday's 2-1 League Cup win over Bradford ##htafc #bcafc	tag:audioboo.fm,2013-08-07:/boos/1538277	48-robins-pleased-with-brilliant-terriers				
49	1	http://audioboom.com/boos/1532907-positive-signs-for-town-despite-defeat	Positive Signs For Town Despite Defeat	2013-08-03 17:20:25+01		Mark Robins tells BBC Radio Leeds there were positive signs throughout his team, after their narrow 1-opening day defeat at Nottingham Forest #htafc	tag:audioboo.fm,2013-08-03:/boos/1532907	49-positive-signs-for-town-despite-defeat				
50	1	http://audioboom.com/boos/1532619-nottingham-forest-v-huddersfield-town-preview	Nottingham Forest v Huddersfield Town Preview	2013-08-03 12:07:58+01		BBC Radio Leeds' Gareth Jones and Paul Ogden look ahead to Huddersfield Town's trip to Nottingham Forest as the Championship returns. Full coverage on all frequencies from 2pm #htafc	tag:audioboo.fm,2013-08-03:/boos/1532619	50-nottingham-forest-v-huddersfield-town-preview				
51	1	http://audioboom.com/boos/1525999-hogg-offers-us-something-different-robins	Hogg offers us something different - Robins	2013-07-30 10:01:02+01		Huddersfield Town manager Mark Robins talks to BBC Radio Leeds about the signing of Watford midfielder Jonathan Hogg #htafc	tag:audioboo.fm,2013-07-30:/boos/1525999	51-hogg-offers-us-something-different-robins				
52	1	http://audioboom.com/boos/1505414-robins-pleased-with-latest-workout	Robins pleased with latest workout	2013-07-17 06:09:34+01		Huddersfield Town manager Mark Robins tells BBC Radio Leeds that his side are not the finished article yet after Tuesday's 1-1 friendly draw at York City	tag:audioboo.fm,2013-07-17:/boos/1505414	52-robins-pleased-with-latest-workout				
53	1	http://audioboom.com/boos/1518054-dean-hoyle-on-town-new-signings-stadium-shares-mark-robins	Dean Hoyle on Town new signings, Stadium Shares & Mark Robins	2013-07-25 06:48:54+01		Chairman Dean Hoyle discusses with BBC Radio Leeds all issues at Huddersfield Town; including new signings, Stadium Shares & Mark Robins. Hear our whole Town special again as we speak to the likes of Robins, Hoyle, Stead and Southern - Link here: http://www.bbc.co.uk/programmes/p01c13c0 #htafc	tag:audioboo.fm,2013-07-25:/boos/1518054	53-dean-hoyle-on-town-new-signings-stadium-shares-				
54	1	http://audioboom.com/boos/1518234-huddersfield-s-stead-wants-more-goals	Huddersfield's Stead wants more goals.	2013-07-25 10:15:40+01		BBC Radio Leeds' Katherine Hannah speaks with Huddersfield Town's Jon Stead about his aims for the season. #htafc	tag:audioboo.fm,2013-07-25:/boos/1518234	54-huddersfields-stead-wants-more-goals				
55	1	http://audioboom.com/boos/1484482-hunt-excited-by-passion-at-elland-road	Hunt excited by passion at Elland Road	2013-07-04 06:13:53+01		New signing Noel Hunt tells BBC Radio Leeds that he needed little persuasion to move to Leeds United #lufc	tag:audioboo.fm,2013-07-04:/boos/1484482	55-hunt-excited-by-passion-at-elland-road				
622	13	https://www.netflix.com/WiMovie/80000715?trkid=200250783	Forensic Files: Forensic Files: Collection: "Textbook Murder"	2016-01-02 16:00:00+00								
56	1	http://audioboom.com/boos/1059264-secret-comedy-podcast-2012-04-helen-arney-loretta-maine-mark-thomas-more	Secret Comedy Podcast 2012 #04 - Helen Arney, Loretta Maine, Mark Thomas + more	2012-11-14 19:04:42+00		In episode four Susan Calman chats it up with Mark Thomas about his new show and gets Tiffany Stevenson and Mark Little to confess their secrets. Phil Nichols tells us about how Fernando Torres improved his love life, Helen Arney sings about making love, ahh... and Loretta Maine performs a little ditty about little things. We really couldn't squeeze anymore in.\nThere may be no such thing as a free lunch, but there is such a thing as a free podcast and we hope we made you laugh. If you can, please consider chipping in a few quid to support our work. Thank you! Donate at http://www.amnesty.org.uk/chipin	tag:audioboo.fm,2012-11-14:/boos/1059264	56-secret-comedy-podcast-2012-04-helen-arney-loret				
57	1	http://audioboom.com/boos/1054667-secret-comedy-podcast-2012-03-alan-davies-sarah-pascoe-david-o-doherty-michael-mittemeir-jo-caulfield-rob-becket-abandoman	Secret Comedy Podcast 2012 #03 - Alan Davies, Sarah Pascoe, David O'Doherty, Michael Mittemeir, Jo Caulfield, Rob Becket, Abandoman!	2012-11-12 15:25:09+00		In episode three our host Susan Calman brings some of the world's best comedians to a tiny stage in Edinburgh for your listening pleasure. There's QI's Alan Davies, Sarah Pascoe and Michael Mittemeir having a chat. As well as performances from the hilarious David O'Doherty, the rib tickling Jo Caulfield, the smiley Rob Becket and a phenomenal wrap up rap from Abandoman!\nThere may be no such thing as a free lunch, but there is such a thing as a free podcast and we hope we made you laugh. If you can, please consider chipping in a few quid to support our work. Thank you! Donate at http://www.amnesty.org.uk/chipin	tag:audioboo.fm,2012-11-12:/boos/1054667	57-secret-comedy-podcast-2012-03-alan-davies-sarah				
58	1	http://audioboom.com/boos/1054420-secret-comedy-podcast-2012-01-jimeoin-daniel-sloss-rhys-darby-lucy-porter-adam-kay-and-shappi-khorsandi	Secret Comedy Podcast 2012 #01 - Jimeoin, Daniel Sloss, Rhys Darby, Lucy Porter, Adam Kay and Shappi Khorsandi	2012-11-12 13:42:32+00		Welcome to the all-new Secret Comedy Podcast, recorded at the 2012 Edinburgh Festival.\n\nIn this episode we have Jimeoin, Daniel Sloss, Rhys Darby, Lucy Porter, Adam Kay and Shappi Khorsandi all kept in order by Susan Calman. Also on itunes: http://www.amnesty.org.uk/itunes \n\nThere may be no such thing as a free lunch, but there is such a thing as a free podcast and we hope we made you laugh. If you can, please consider chipping in a few quid to support our work. Thank you! Donate at http://www.amnesty.org.uk/chipin	tag:audioboo.fm,2012-11-12:/boos/1054420	58-secret-comedy-podcast-2012-01-jimeoin-daniel-sl				
59	1	http://audioboom.com/boos/710530-xfm-manchester-launch	Xfm Manchester - Launch	2012-03-13 23:13:02+00		New post by davidlloyd	tag:audioboo.fm,2012-03-13:/boos/710530	59-xfm-manchester-launch				
60	1	http://audioboom.com/boos/1426226-scott-mills-on-power-fm-aged-16	Scott Mills on Power FM aged 16	2013-06-01 14:21:31+01		New post by davidlloyd	tag:audioboo.fm,2013-06-01:/boos/1426226	60-scott-mills-on-power-fm-aged-16				
61	1	http://audioboom.com/boos/1292846-eric-morecambe	Eric Morecambe	2013-03-26 23:31:14+00		The funniest moment in British TV comedy? The Morecambe and Wise ‘Mr Preview’ sketch. Fact. I still cry with laughter no matter how many times I’ve seen it.\n\nThat partnership was abruptly ended in May 1984 when Eric Morecambe collapsed and died backstage at the Roses Theatre, Tewksbury.  Here’s how BBC Radio 4 reported the news. The newsreader is Bryan Martin.	tag:audioboo.fm,2013-03-26:/boos/1292846	61-eric-morecambe				
62	1	http://audioboom.com/boos/1292002-boris-sings-bob-marley-s-three-little-birds	Boris Sings Bob Marley's Three Little Birds	2013-03-26 15:48:36+00		As the Mayor of London launched a new busking initiative at London Bridge, he gave waiting journalists a splendid rendition of his favourite Bob Marley track!	tag:audioboo.fm,2013-03-26:/boos/1292002	62-boris-sings-bob-marleys-three-little-birds				
63	1	http://audioboom.com/boos/1370664-peter-clark-on-towns-hard-work	Peter Clark on Towns "Hard Work"	2013-05-04 15:16:11+01		Huddersfield Town Captain Peter Clark speaks to BBC Radio Leeds' Paul Ogden after their dramatic 2-2 draw against Barnsley that saw both teams survive the Championship relegation battle. #htafc	tag:audioboo.fm,2013-05-04:/boos/1370664	63-peter-clark-on-towns-hard-work				
64	1	http://audioboom.com/boos/1370597-huddersfield-town-manager-mark-robbins-reaction	Huddersfield Town manager Mark Robbins reaction	2013-05-04 14:34:14+01		Huddersfield Town manager Mark Robbins spoke to BBC Radio Leeds' Paul Ogden after avoiding relegation with todays draw against Barnsley #htafc	tag:audioboo.fm,2013-05-04:/boos/1370597	64-huddersfield-town-manager-mark-robbins-reaction				
65	1	http://audioboom.com/boos/1370574-dean-hoyle-s-immediate-reaction-to-huddersfield-town-s-championship-survival-against-barnsley	Dean Hoyle's immediate reaction to Huddersfield Town's Championship survival against Barnsley	2013-05-04 14:18:25+01		Dean Hoyle spoke to Paul Ogden on BBC Radio Leeds a few minutes after Huddersfield Town's Championship survival was confirmed via a dramatic 2-2 draw against Barnsley. #htafc	tag:audioboo.fm,2013-05-04:/boos/1370574	65-dean-hoyles-immediate-reaction-to-huddersfield-				
66	1	http://audioboom.com/boos/1357110-robins-delighted-with-town-performance	Robins delighted with Town performance	2013-04-27 16:46:51+01		Huddersfield Town manager Mark Robins speaks to BBC Radio Leeds' Paul Ogden after their 3-1 victory over Bristol City. #htafc	tag:audioboo.fm,2013-04-27:/boos/1357110	66-robins-delighted-with-town-performance				
67	1	http://audioboom.com/boos/974598-bletchley-park-podcast-extra-e05-jack-copeland-part-1	Bletchley Park Podcast Extra - E05 - Jack Copeland Part 1	2012-09-24 07:50:56+01		September 2012\n \nThis first part of Prof. Jack Copeland's, Turing Education Day talk, looks at Turings early work in Cambridge & then The Bombe.\n \n#Bpark, #ATY, #BletchleyPark, @AlanTuringYear, #JackCopeland	tag:audioboo.fm,2012-09-24:/boos/974598	67-bletchley-park-podcast-extra-e05-jack-copeland-				
68	1	http://audioboom.com/boos/1343164-robins-focused-on-staying-in-championship	Robins Focused on Staying In Championship	2013-04-20 16:38:08+01		Mark Robins told BBC Radio Leeds that he was happy with his side's performance after the Terriers put 3 past Millwall #htafc	tag:audioboo.fm,2013-04-20:/boos/1343164	68-robins-focused-on-staying-in-championship				
69	1	http://audioboom.com/boos/1342833-bbc-radio-leeds-speak-to-huddersfield-s-dean-hoyle	BBC Radio Leeds speak to Huddersfield's Dean Hoyle	2013-04-20 12:40:52+01		Huddersfield Town Chairman and owner Dean Hoyle speaks to BBC Radio Leeds' Paul Ogden, addressing some of the issues surrounding Town's difficult Championship season #htafc	tag:audioboo.fm,2013-04-20:/boos/1342833	69-bbc-radio-leeds-speak-to-huddersfields-dean-hoy				
70	1	http://audioboom.com/boos/859134-the-pulse-double-the-music-1994	The Pulse - double the music, 1994	2012-06-23 19:43:53+01		Featuring Elliott Webb, Geoff Hemming, Alex Roland, and... me!	tag:audioboo.fm,2012-06-23:/boos/859134	70-the-pulse-double-the-music-1994				
77	5	http://blonde.net/blog/2015/09/21/ux-dilemmas-should-we-use-button-or-link?utm_source=twitter&utm_medium=promotedtweet&utm_content=uxdesign&utm_campaign=blondeblog	UX dilemmas - should we use a button or a link?	2015-12-10 18:52:29+00			http://blonde.net/blog/2015/09/21/ux-dilemmas-should-we-use-button-or-link?utm_source=twitter&utm_medium=promotedtweet&utm_content=uxdesign&utm_campaign=blondeblog	77-ux-dilemmas-should-we-use-a-button-or-a-link				
71	1	http://audioboom.com/boos/1271339-huddersfield-s-vaughan-pays-tribute-to-teammates-after-win-at-leeds	Huddersfield's Vaughan pays tribute to teammates after win at Leeds	2013-03-16 16:24:04+00		Striker James Vaughan speaks to BBC Radio Leeds after his winning goal for Huddersfield Town at Leeds United. #htafc #lufc	tag:audioboo.fm,2013-03-16:/boos/1271339	71-huddersfields-vaughan-pays-tribute-to-teammates				
623	13	https://www.netflix.com/WiMovie/80075830?trkid=200250783	Making a Murderer: Season 1: "Lack of Humility"	2016-01-02 17:00:00+00								
72	1	http://audioboom.com/boos/1271324-robins-delighted-by-quality-of-huddersfield-win-over-leeds	Robins delighted by quality of Huddersfield win over Leeds	2013-03-16 16:15:46+00		Huddersfield Town manager Mark Robins gives his reaction to BBC Radio Leeds after their 2-1 win at Leeds United. #htafc #lufc	tag:audioboo.fm,2013-03-16:/boos/1271324	72-robins-delighted-by-quality-of-huddersfield-win				
73	1	http://audioboom.com/boos/1202915-david-oates-tribute	David Oates Tribute	2013-02-09 16:45:32+00		Blackpool FC pay tribute to 5 live commentator David Oates who passed away last week.	tag:audioboo.fm,2013-02-09:/boos/1202915	73-david-oates-tribute				
78	5	http://code.tutsplus.com/tutorials/beginners-guide-to-the-django-rest-framework--cms-19786	Beginner's Guide to the Django Rest Framework	2015-12-14 14:09:26+00			http://code.tutsplus.com/tutorials/beginners-guide-to-the-django-rest-framework--cms-19786	78-beginners-guide-to-the-django-rest-framework				
74	1	http://audioboom.com/boos/1205436-the-beatles-helped-me-consummate-my-marriage	"The Beatles helped me consummate my marriage"	2013-02-11 13:16:53+00		John, Paul, George and Ringo inspire Maureen and her husband to finally seal the deal #r2vine #PleasePleaseMe	tag:audioboo.fm,2013-02-11:/boos/1205436	74-the-beatles-helped-me-consummate-my-marriage				
79	5	http://ngenworks.com/technology/how-django-rest-framework-changed-my-life	How Django REST Framework Changed My Life	2015-12-10 13:07:09+00			http://ngenworks.com/technology/how-django-rest-framework-changed-my-life	79-how-django-rest-framework-changed-my-life				
75	1	http://audioboom.com/boos/1181823-huddersfield-town-s-mark-lillis-previews-palace-game	Huddersfield Town's Mark Lillis previews Palace game	2013-01-29 15:02:07+00		Huddersfield Town's caretaker manager Mark Lillis tells BBC Radio Leeds he expects to remain in charge for the next two games beginning with the visit of Crystal Palace on Wednesday. #htafc @bbcleeds	tag:audioboo.fm,2013-01-29:/boos/1181823	75-huddersfield-towns-mark-lillis-previews-palace-				
350	5	http://mikehadlow.blogspot.co.uk/2015/12/learn-to-code-its-harder-than-you-think.html?utm_source=pocket&utm_medium=email&utm_campaign=pockethits	Learn To Code, It’s Harder Than You Think	2015-12-22 15:10:11+00			http://mikehadlow.blogspot.co.uk/2015/12/learn-to-code-its-harder-than-you-think.html?utm_source=pocket&utm_medium=email&utm_campaign=pockethits	350-learn-to-code-its-harder-than-you-think				
80	5	https://twittercommunity.com/t/a-new-design-for-tweet-and-follow-buttons/52791	A new design for Tweet and follow buttons	2015-12-09 08:52:26+00			https://twittercommunity.com/t/a-new-design-for-tweet-and-follow-buttons/52791	80-a-new-design-for-tweet-and-follow-buttons				
81	5	https://vice.com/read/bruce-robinson-withnail-and-i-jack-the-ripper-912?utm_source=vicetwitterus	The 'Withnail and I' Creator Believes He's Discovered Who Jack the Ripper Really Was	2015-12-09 08:52:25+00			https://vice.com/read/bruce-robinson-withnail-and-i-jack-the-ripper-912?utm_source=vicetwitterus	81-the-withnail-and-i-creator-believes-hes-discove				
82	5	https://vice.com/read/life-as-an-amateur-comic-on-the-open-mic-circuit-246?utm_source=vicetwitterus	What Life Is Like As an Amateur Comic On the Open-Mic Circuit	2015-12-09 08:52:25+00			https://vice.com/read/life-as-an-amateur-comic-on-the-open-mic-circuit-246?utm_source=vicetwitterus	82-what-life-is-like-as-an-amateur-comic-on-the-op				
83	5	http://24ways.org/2014/seo-in-2015-and-why-you-should-care	SEO in 2015 (and Why You Should Care) ◆ 24 ways	2015-12-09 08:52:25+00			http://24ways.org/2014/seo-in-2015-and-why-you-should-care	83-seo-in-2015-and-why-you-should-care-24-ways				
84	5	http://csswizardry.com/2012/11/code-smells-in-css	Code smells in CSS	2015-12-09 08:52:25+00			http://csswizardry.com/2012/11/code-smells-in-css	84-code-smells-in-css				
85	5	https://medium.com/bull-market/the-economics-and-politics-of-thomas-the-tank-engine-8bbc05494b08#.io97chror	The economics and politics of Thomas the Tank Engine — Bull Market — Medium	2015-12-08 09:06:52+00			https://medium.com/bull-market/the-economics-and-politics-of-thomas-the-tank-engine-8bbc05494b08#.io97chror	85-the-economics-and-politics-of-thomas-the-tank-e				
86	5	http://damninteresting.com/the-zero-armed-bandit?utm_source=pocket&utm_medium=email&utm_campaign=pockethits	The Zero-Armed Bandit	2015-12-07 18:23:24+00			http://damninteresting.com/the-zero-armed-bandit?utm_source=pocket&utm_medium=email&utm_campaign=pockethits	86-the-zero-armed-bandit				
87	5	https://24ways.org/2014/dont-push-through-the-pain	Don’t Push Through the Pain ◆ 24 ways	2015-12-02 12:47:18+00			https://24ways.org/2014/dont-push-through-the-pain	87-dont-push-through-the-pain-24-ways				
88	5	http://24ways.org/2014/javascript-modules-the-es6-way	JavaScript Modules the ES6 Way ◆ 24 ways	2015-12-02 12:47:18+00			http://24ways.org/2014/javascript-modules-the-es6-way	88-javascript-modules-the-es6-way-24-ways				
89	5	http://deadspin.com/the-story-behind-bob-beamons-miracle-jump-and-the-only-1736766124	The Story Behind Bob Beamon's Miracle Jump And The Only Photo That Mattered	2015-11-24 22:49:33+00			http://deadspin.com/the-story-behind-bob-beamons-miracle-jump-and-the-only-1736766124	89-the-story-behind-bob-beamons-miracle-jump-and-t				
90	5	http://nytimes.com/2015/11/10/nyregion/trial-of-vincent-asaro-highlights-loss-of-mafias-code-of-silence.html?_r=0	Trial of Vincent Asaro Highlights Loss of Mafia’s Code of Silence	2015-11-23 23:15:01+00			http://nytimes.com/2015/11/10/nyregion/trial-of-vincent-asaro-highlights-loss-of-mafias-code-of-silence.html?_r=0	90-trial-of-vincent-asaro-highlights-loss-of-mafia				
91	5	http://slate.com/articles/technology/users/2015/11/sony_employees_on_the_hack_one_year_later.single.html	Inside the Sony Hack	2015-11-23 22:48:00+00			http://slate.com/articles/technology/users/2015/11/sony_employees_on_the_hack_one_year_later.single.html	91-inside-the-sony-hack				
92	5	http://alistapart.com/article/how-we-hold-our-gadgets	How We Hold Our Gadgets	2015-11-23 22:09:15+00			http://alistapart.com/article/how-we-hold-our-gadgets	92-how-we-hold-our-gadgets				
94	5	http://alistapart.com/blog/post/writing-css-on-growing-teams	Writing CSS on Growing Teams	2015-11-23 21:45:45+00			http://alistapart.com/blog/post/writing-css-on-growing-teams	94-writing-css-on-growing-teams				
95	5	http://bbc.co.uk/news/technology-34875474	Facebook tests 'break-up' tools	2015-11-23 21:42:33+00			http://bbc.co.uk/news/technology-34875474	95-facebook-tests-break-up-tools				
276	12	http://strava.com/activities/360387832	07/30/2015 Barnet, United Kingdom	2015-07-30 18:01:11+01		Run (Barnet): Distance: 6.5km, Elevation Gain: 51m, Moving Time: 00:35:25, Average Speed: 11.0km/h	http://strava.com/activities/360387832	276-07302015-barnet-united-kingdom				
96	5	http://vice.com/read/french-private-detective-interview-629?utm_source=vicetwitterus	An Interview with France's Longest-Serving Private Detective	2015-11-23 21:41:18+00			http://vice.com/read/french-private-detective-interview-629?utm_source=vicetwitterus	96-an-interview-with-frances-longest-serving-priva				
624	13	https://www.netflix.com/WiMovie/80000778?trkid=200250783	Making a Murderer: Season 1: "The Great Burden"	2016-01-02 18:00:00+00								
97	5	http://rollingstone.com/culture/news/life-and-death-in-a-troubled-teen-boot-camp-20151112	Life and Death in a Troubled Teen Boot Camp	2015-11-23 21:27:36+00			http://rollingstone.com/culture/news/life-and-death-in-a-troubled-teen-boot-camp-20151112	97-life-and-death-in-a-troubled-teen-boot-camp				
625	13	https://www.netflix.com/WiMovie/80000714?trkid=200250783	Forensic Files: Forensic Files: Collection: "Home of the Brave"	2016-01-01 20:00:00+00								
98	5	http://newyorker.com/magazine/2015/11/09/blood-ties	Blood Ties	2015-11-23 21:27:36+00			http://newyorker.com/magazine/2015/11/09/blood-ties	98-blood-ties				
99	5	http://espn.go.com/chalk/story/_/id/14095257/how-world-biggest-bookie-paul-phua-was-snared-fbi-last-year-world-series-poker-walked-away-free-man	How the world's biggest bookie, Paul Phua, was snared by the FBI at last year's World Series of Poker and walked away a free man	2015-11-23 21:27:35+00			http://espn.go.com/chalk/story/_/id/14095257/how-world-biggest-bookie-paul-phua-was-snared-fbi-last-year-world-series-poker-walked-away-free-man	99-how-the-worlds-biggest-bookie-paul-phua-was-sna				
277	12	http://strava.com/activities/360387985	07/29/2015 London, England, United Kingdom	2015-07-29 12:11:16+01		Run (London, England): Distance: 7.1km, Elevation Gain: 21m, Moving Time: 00:36:23, Average Speed: 11.6km/h	http://strava.com/activities/360387985	277-07292015-london-england-united-kingdom				
100	5	http://theatlantic.com/technology/archive/2015/10/raiders-of-the-lost-web/409210?utm_source=SFTwitter	Raiders of the Lost Web	2015-11-23 21:27:35+00			http://theatlantic.com/technology/archive/2015/10/raiders-of-the-lost-web/409210?utm_source=SFTwitter	100-raiders-of-the-lost-web				
144	8	http://www.goodreads.com/review/show/1299572846?utm_medium=api&utm_source=rss	Natural Born Heroes: How a Daring Band of Misfits Mastered the Lost Secrets of Strength and Endurance	2015-06-05 13:17:07+01		<a href="http://www.goodreads.com/book/show/22889750-natural-born-heroes?utm_medium=api&amp;utm_source=rss"><img alt="Natural Born Heroes: How a Daring Band of Misfits Mastered the Lost Secrets of Strength and Endurance" src="http://d.gr-assets.com/books/1410759464s/22889750.jpg" /></a><br />\n                                      author: Christopher McDougall<br />\n                                      name: Gareth<br />\n                                      average rating: 3.66<br />\n                                      book published: 2013<br />\n                                      rating: 4<br />\n                                      read at: 2015/06/05<br />\n                                      date added: 2015/06/05<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/1299572846?utm_medium=api&utm_source=rss	144-natural-born-heroes-how-a-daring-band-of-misfi				
101	5	https://theguardian.com/info/developer-blog/2015/aug/12/open-sourcing-grid-image-service	Open sourcing Grid, the Guardian’s new image management service	2015-11-23 21:27:33+00			https://theguardian.com/info/developer-blog/2015/aug/12/open-sourcing-grid-image-service	101-open-sourcing-grid-the-guardians-new-image-man				
146	8	http://www.goodreads.com/review/show/1258293421?utm_medium=api&utm_source=rss	The Secret Player	2015-04-18 21:28:59+01		<a href="http://www.goodreads.com/book/show/17674740-the-secret-player?utm_medium=api&amp;utm_source=rss"><img alt="The Secret Player" src="http://d.gr-assets.com/books/1369869222s/17674740.jpg" /></a><br />\n                                      author: Anonymous<br />\n                                      name: Gareth<br />\n                                      average rating: 3.64<br />\n                                      book published: 2013<br />\n                                      rating: 3<br />\n                                      read at: 2015/04/14<br />\n                                      date added: 2015/04/18<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/1258293421?utm_medium=api&utm_source=rss	146-the-secret-player				
102	5	https://theguardian.com/info/developer-blog/2014/mar/20/inside-the-guardians-cms-meet-scribe-an-extensible-rich-text-editor	Inside the Guardian’s CMS: meet Scribe, an extensible rich text editor	2015-11-23 21:27:33+00			https://theguardian.com/info/developer-blog/2014/mar/20/inside-the-guardians-cms-meet-scribe-an-extensible-rich-text-editor	102-inside-the-guardians-cms-meet-scribe-an-extens				
103	5	http://si.com/olympics/2015/11/09/michael-phelps-rehabilitation-rio-2016	After rehabilitation, the best of Michael Phelps may lie ahead	2015-11-19 14:10:15+00			http://si.com/olympics/2015/11/09/michael-phelps-rehabilitation-rio-2016	103-after-rehabilitation-the-best-of-michael-phelp				
626	13	https://www.netflix.com/WiMovie/80000777?trkid=200250783	Making a Murderer: Season 1: "Framing Defense"	2016-01-01 21:00:00+00								
104	5	http://theguardian.com/world/2015/nov/07/fisherman-lost-at-sea-436-days-book-extract	Lost at sea: the man who vanished for 14 months	2015-11-19 14:10:15+00			http://theguardian.com/world/2015/nov/07/fisherman-lost-at-sea-436-days-book-extract	104-lost-at-sea-the-man-who-vanished-for-14-months				
627	13	https://www.netflix.com/WiMovie/70062022?trkid=200250783	Red Dwarf: Series 3: "Bodyswap"	2015-12-31 20:00:00+00								
105	5	http://theatlantic.com/entertainment/archive/2015/08/the-red-baiting-of-lena-horne/398291	The Red-Baiting of Lena Horne	2015-11-17 08:02:47+00			http://theatlantic.com/entertainment/archive/2015/08/the-red-baiting-of-lena-horne/398291	105-the-red-baiting-of-lena-horne				
628	13	https://www.netflix.com/WiMovie/70062021?trkid=200250783	Red Dwarf: Series 3: "Polymorph"	2015-12-31 21:00:00+00								
629	13	https://www.netflix.com/WiMovie/70062020?trkid=200250783	Red Dwarf: Series 3: "Marooned"	2015-12-31 22:00:00+00								
630	13	https://www.netflix.com/WiMovie/70273212?trkid=200250783	Maidentrip	2015-12-31 23:00:00+00								
631	13	https://www.netflix.com/WiMovie/80000713?trkid=200250783	Forensic Files: Forensic Files: Collection: "A Squire's Riches"	2016-01-01 00:00:00+00								
145	8	http://www.goodreads.com/review/show/1273442221?utm_medium=api&utm_source=rss	Feet in the Clouds: A Tale of Fell-Running and Obsession	2015-05-06 19:04:26+01		<a href="http://www.goodreads.com/book/show/1099962.Feet_in_the_Clouds?utm_medium=api&amp;utm_source=rss"><img alt="Feet in the Clouds: A Tale of Fell-Running and Obsession" src="http://d.gr-assets.com/books/1387754184s/1099962.jpg" /></a><br />\n                                      author: Richard Askwith<br />\n                                      name: Gareth<br />\n                                      average rating: 4.16<br />\n                                      book published: 2004<br />\n                                      rating: 4<br />\n                                      read at: <br />\n                                      date added: 2015/05/06<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/1273442221?utm_medium=api&utm_source=rss	145-feet-in-the-clouds-a-tale-of-fell-running-and-				
107	2	http://www.paintcodeapp.com/news/iphone-6-screens-demystified	iPhone 6 Screens Demystified	2015-11-16 17:11:32+00			http://delicious.com/url/a21426d860713d1c9dffc46f1b9e8e9d#gareth53	107-iphone-6-screens-demystified				
632	13	https://www.netflix.com/WiMovie/80000776?trkid=200250783	Making a Murderer: Season 1: "Testing the Evidence"	2016-01-01 01:00:00+00								
108	2	https://github.com/JuanPotato/Legofy	JuanPotato/Legofy · GitHub	2015-10-29 12:03:38+00			http://delicious.com/url/b04a187424c04204ed0cadd1ca6070f8#gareth53	108-juanpotatolegofy-github				
149	8	http://www.goodreads.com/review/show/1169549221?utm_medium=api&utm_source=rss	Eat and Run: My Unlikely Journey to Ultramarathon Greatness	2015-01-15 21:19:47+00		<a href="http://www.goodreads.com/book/show/13202092-eat-and-run?utm_medium=api&amp;utm_source=rss"><img alt="Eat and Run: My Unlikely Journey to Ultramarathon Greatness" src="http://d.gr-assets.com/books/1344746039s/13202092.jpg" /></a><br />\n                                      author: Scott Jurek<br />\n                                      name: Gareth<br />\n                                      average rating: 3.89<br />\n                                      book published: 2012<br />\n                                      rating: 3<br />\n                                      read at: 2015/01/15<br />\n                                      date added: 2015/01/15<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/1169549221?utm_medium=api&utm_source=rss	149-eat-and-run-my-unlikely-journey-to-ultramarath				
111	2	http://elm-by-example.org/index.html	ELM By Example	2015-06-12 11:29:53+01			http://delicious.com/url/b81d832420802d9b02b44e15caca9a60#gareth53	111-elm-by-example				
109	2	http://www.nigella.com/recipes/view/simple-yoghurt-cake-2545	SIMPLE YOGHURT CAKE | Recipes | Nigella Lawson	2015-09-22 10:15:40+01			http://delicious.com/url/b2fcc8b5a527479a72a94dea4209bd51#gareth53	109-simple-yoghurt-cake-recipes-nigella-lawson				
112	2	http://www.htafcmegastore.com/index.php?route=product/product&keyword=race&product_id=1707	Huddersfield Town Store | Cycling Top	2015-05-08 10:38:33+01			http://delicious.com/url/27d49e971126d822bbf74393f7329111#gareth53	112-huddersfield-town-store-cycling-top				
150	8	http://www.goodreads.com/review/show/1116217822?utm_medium=api&utm_source=rss	Only Forward	2014-11-26 22:41:36+00		<a href="http://www.goodreads.com/book/show/920395.Only_Forward?utm_medium=api&amp;utm_source=rss"><img alt="Only Forward" src="http://d.gr-assets.com/books/1333726911s/920395.jpg" /></a><br />\n                                      author: Michael Marshall Smith<br />\n                                      name: Gareth<br />\n                                      average rating: 4.31<br />\n                                      book published: 1994<br />\n                                      rating: 3<br />\n                                      read at: 2014/11/26<br />\n                                      date added: 2014/11/26<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/1116217822?utm_medium=api&utm_source=rss	150-only-forward				
113	2	https://www.raceskin.co.uk/sizing-guide/	Sizing Guide | Raceskin	2015-05-08 10:38:11+01			http://delicious.com/url/437861a5b2031f87a8ff5063e193f088#gareth53	113-sizing-guide-raceskin				
110	2	http://monoqi.co.uk/gb_en/flash-sale/industrial-charm-for-the-home/sestini-e-corti/bar-stool-wood-iron.html	MONOQI | Bar Stool - Wood/Iron	2015-09-09 14:20:43+01			http://delicious.com/url/927d3d66b6ec536f69ac2a47ff07e9d2#gareth53	110-monoqi-bar-stool-woodiron				
114	2	http://maban.co.uk/95/	Anna Debenham: Freelance Front-End Developer based in the UK	2015-03-25 13:57:38+00			http://delicious.com/url/ded867996441e456f8d950750fe6a3ff#gareth53	114-anna-debenham-freelance-front-end-developer-ba				
156	8	http://www.goodreads.com/review/show/952409457?utm_medium=api&utm_source=rss	Running with the Pack	2014-06-12 12:58:20+01		<a href="http://www.goodreads.com/book/show/16124502-running-with-the-pack?utm_medium=api&amp;utm_source=rss"><img alt="Running with the Pack" src="http://d.gr-assets.com/books/1365425293s/16124502.jpg" /></a><br />\n                                      author: Mark Rowlands<br />\n                                      name: Gareth<br />\n                                      average rating: 3.57<br />\n                                      book published: 2013<br />\n                                      rating: 3<br />\n                                      read at: 2014/06/11<br />\n                                      date added: 2014/06/12<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/952409457?utm_medium=api&utm_source=rss	156-running-with-the-pack				
115	2	https://www.vanpattenmedia.com/2014/google-analytics-tag-manager-events	Trigger Google Analytics Events Within Google Tag Manager	2015-01-29 11:35:50+00			http://delicious.com/url/fc7c3c2713cec0644edf8cf9207492d1#gareth53	115-trigger-google-analytics-events-within-google-				
633	13	https://www.netflix.com/WiMovie/80000775?trkid=200250783	Making a Murderer: Season 1: "The Last Person to See Teresa Alive"	2016-01-01 02:00:00+00								
634	13	https://www.netflix.com/WiMovie/80000712?trkid=200250783	Forensic Files: Forensic Files: Collection: "Three's a Crowd"	2015-12-30 20:00:00+00								
635	13	https://www.netflix.com/WiMovie/70042389?trkid=200250783	The Very Hungry Caterpillar and Other Stories	2015-12-30 21:00:00+00								
636	13	https://www.netflix.com/WiMovie/80000774?trkid=200250783	Making a Murderer: Season 1: "Indefensible"	2015-12-30 22:00:00+00								
637	13	https://www.netflix.com/WiMovie/80000711?trkid=200250783	Forensic Files: Forensic Files: Collection: "Hear No Evil"	2015-12-27 15:00:00+00								
638	13	https://www.netflix.com/WiMovie/80000773?trkid=200250783	Making a Murderer: Season 1: "Plight of the Accused"	2015-12-27 16:00:00+00								
639	13	https://www.netflix.com/WiMovie/873159?trkid=200250783	Primal Fear	2015-12-20 15:00:00+00								
619	14	http://www.garminconnect.com/users/gareth.senior/	1234 steps	2016-01-06 08:52:39+00								
117	3	http://www.flickr.com/photos/gareth53/17400395291/	Milton Keynes Marathon	2015-05-07 08:40:21+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/17400395291/" title="Milton Keynes Marathon"><img alt="Milton Keynes Marathon" height="240" src="http://farm9.staticflickr.com/8873/17400395291_43abfac08f_m.jpg" width="160" /></a></p>\n\n<p>Around 18 miles in</p>	tag:flickr.com,2004:/photo/17400395291	117-milton-keynes-marathon				
119	3	http://www.flickr.com/photos/gareth53/16778242044/	Milton Keynes Marathon	2015-05-07 08:40:21+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/16778242044/" title="Milton Keynes Marathon"><img alt="Milton Keynes Marathon" height="240" src="http://farm8.staticflickr.com/7778/16778242044_67d289fbfa_m.jpg" width="160" /></a></p>\n\n<p>Spotted this photographer</p>	tag:flickr.com,2004:/photo/16778242044	119-milton-keynes-marathon				
120	3	http://www.flickr.com/photos/gareth53/17400395801/	Milton Keynes Marathon	2015-05-07 08:40:20+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/17400395801/" title="Milton Keynes Marathon"><img alt="Milton Keynes Marathon" height="240" src="http://farm8.staticflickr.com/7689/17400395801_a378ed54ed_m.jpg" width="160" /></a></p>	tag:flickr.com,2004:/photo/17400395801	120-milton-keynes-marathon				
351	5	http://theverge.com/2015/11/16/9743996/apple-designer-interview-bruce-tog-tognazzini-don-norman	Former Apple designers say the company has lost 'the fundamental principles of good design'	2015-12-22 14:58:07+00			http://theverge.com/2015/11/16/9743996/apple-designer-interview-bruce-tog-tognazzini-don-norman	351-former-apple-designers-say-the-company-has-los				
118	3	http://www.flickr.com/photos/gareth53/17193312457/	Milton Keynes Marathon	2015-05-07 08:40:21+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/17193312457/" title="Milton Keynes Marathon"><img alt="Milton Keynes Marathon" height="240" src="http://farm8.staticflickr.com/7700/17193312457_8780ffd0a8_m.jpg" width="160" /></a></p>	tag:flickr.com,2004:/photo/17193312457	118-milton-keynes-marathon				
121	3	http://www.flickr.com/photos/gareth53/17212984628/	Milton Keynes Marathon	2015-05-07 08:40:20+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/17212984628/" title="Milton Keynes Marathon"><img alt="Milton Keynes Marathon" height="240" src="http://farm9.staticflickr.com/8719/17212984628_04a5597858_m.jpg" width="160" /></a></p>\n\n<p>Around 5 miles in</p>	tag:flickr.com,2004:/photo/17212984628	121-milton-keynes-marathon				
352	5	https://adactio.com/journal/9963	Where to start?	2015-12-22 00:17:07+00			https://adactio.com/journal/9963	352-where-to-start				
122	3	http://www.flickr.com/photos/gareth53/17193312947/	Milton Keynes Marathon	2015-05-07 08:40:20+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/17193312947/" title="Milton Keynes Marathon"><img alt="Milton Keynes Marathon" height="240" src="http://farm8.staticflickr.com/7692/17193312947_6b6e331f8f_m.jpg" width="160" /></a></p>\n\n<p>Around 5 miles in</p>	tag:flickr.com,2004:/photo/17193312947	122-milton-keynes-marathon				
123	3	http://www.flickr.com/photos/gareth53/17400784785/	Milton Keynes Marathon	2015-05-07 08:40:19+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/17400784785/" title="Milton Keynes Marathon"><img alt="Milton Keynes Marathon" height="240" src="http://farm8.staticflickr.com/7699/17400784785_9b96377050_m.jpg" width="160" /></a></p>\n\n<p>Around 5 miles in</p>	tag:flickr.com,2004:/photo/17400784785	123-milton-keynes-marathon				
124	3	http://www.flickr.com/photos/gareth53/17213189660/	Milton Keynes Marathon	2015-05-07 08:40:19+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/17213189660/" title="Milton Keynes Marathon"><img alt="Milton Keynes Marathon" height="240" src="http://farm9.staticflickr.com/8832/17213189660_7d9de353e0_m.jpg" width="160" /></a></p>\n\n<p>Final straight</p>	tag:flickr.com,2004:/photo/17213189660	124-milton-keynes-marathon				
125	3	http://www.flickr.com/photos/gareth53/16778243164/	Milton Keynes Marathon	2015-05-07 08:40:19+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/16778243164/" title="Milton Keynes Marathon"><img alt="Milton Keynes Marathon" height="240" src="http://farm8.staticflickr.com/7750/16778243164_77bcf21004_m.jpg" width="160" /></a></p>\n\n<p>Final straight</p>	tag:flickr.com,2004:/photo/16778243164	125-milton-keynes-marathon				
126	3	http://www.flickr.com/photos/gareth53/14645179552/	Statue	2014-07-13 18:17:25+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/14645179552/" title="Statue"><img alt="Statue" height="180" src="http://farm4.staticflickr.com/3926/14645179552_81de34a9c5_m.jpg" width="240" /></a></p>	tag:flickr.com,2004:/photo/14645179552	126-statue				
127	3	http://www.flickr.com/photos/gareth53/14622616966/	Pearl Earring	2014-07-13 18:17:25+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/14622616966/" title="Pearl Earring"><img alt="Pearl Earring" height="180" src="http://farm4.staticflickr.com/3857/14622616966_80fb9949b0_m.jpg" width="240" /></a></p>\n\n<p>by Nathan Sawaya</p>	tag:flickr.com,2004:/photo/14622616966	127-pearl-earring				
128	3	http://www.flickr.com/photos/gareth53/14645584635/	Dissemble	2014-07-13 18:17:24+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/14645584635/" title="Dissemble"><img alt="Dissemble" height="180" src="http://farm3.staticflickr.com/2906/14645584635_4233f80f6f_m.jpg" width="240" /></a></p>\n\n<p>by Nathan Sawaya</p>	tag:flickr.com,2004:/photo/14645584635	128-dissemble				
129	3	http://www.flickr.com/photos/gareth53/14458678350/	Pyramid Head	2014-07-13 18:17:24+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/14458678350/" title="Pyramid Head"><img alt="Pyramid Head" height="180" src="http://farm3.staticflickr.com/2928/14458678350_32d5ec0155_m.jpg" width="240" /></a></p>\n\n<p>by Nathan Sawaya</p>	tag:flickr.com,2004:/photo/14458678350	129-pyramid-head				
130	3	http://www.flickr.com/photos/gareth53/14665261083/	Lego Globe	2014-07-13 18:17:23+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/14665261083/" title="Lego Globe"><img alt="Lego Globe" height="180" src="http://farm4.staticflickr.com/3914/14665261083_d8f7a8878c_m.jpg" width="240" /></a></p>\n\n<p>by Nathan Sawaya</p>	tag:flickr.com,2004:/photo/14665261083	130-lego-globe				
131	3	http://www.flickr.com/photos/gareth53/14622369016/	Corner House	2014-07-13 18:17:23+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/14622369016/" title="Corner House"><img alt="Corner House" height="180" src="http://farm4.staticflickr.com/3889/14622369016_99da989754_m.jpg" width="240" /></a></p>	tag:flickr.com,2004:/photo/14622369016	131-corner-house				
151	8	http://www.goodreads.com/review/show/1071952797?utm_medium=api&utm_source=rss	Soccernomics: Why England Loses, Why Germany and Brazil Win, and Why the U.S., Japan, Australia, Turkey--and Even Iraq--Are Destined to Become the Kings of the World's Most Popular Sport	2014-10-04 21:00:33+01		<a href="http://www.goodreads.com/book/show/6617185-soccernomics?utm_medium=api&amp;utm_source=rss"><img alt="Soccernomics: Why England Loses, Why Germany and Brazil Win, and Why the U.S., Japan, Australia, Turkey--and Even Iraq--Are Destined to Become the Kings of the World's Most Popular Sport" src="http://d.gr-assets.com/books/1432865592s/6617185.jpg" /></a><br />\n                                      author: Simon Kuper<br />\n                                      name: Gareth<br />\n                                      average rating: 3.90<br />\n                                      book published: 2009<br />\n                                      rating: 4<br />\n                                      read at: 2014/10/04<br />\n                                      date added: 2014/10/04<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/1071952797?utm_medium=api&utm_source=rss	151-soccernomics-why-england-loses-why-germany-and				
132	3	http://www.flickr.com/photos/gareth53/14458665390/	Fort Napoleon Art Gallery	2014-07-13 18:17:23+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/14458665390/" title="Fort Napoleon Art Gallery"><img alt="Fort Napoleon Art Gallery" height="180" src="http://farm4.staticflickr.com/3879/14458665390_820d29ec6f_m.jpg" width="240" /></a></p>	tag:flickr.com,2004:/photo/14458665390	132-fort-napoleon-art-gallery				
278	12	http://strava.com/activities/360388158	07/25/2015 Barnet, United Kingdom	2015-07-25 12:00:42+01		Walk (Barnet): Distance: 5.4km, Elevation Gain: 44m, Moving Time: 01:02:16, Average Speed: 5.2km/h	http://strava.com/activities/360388158	278-07252015-barnet-united-kingdom				
133	3	http://www.flickr.com/photos/gareth53/14458663480/	Fort Napoleon	2014-07-13 18:17:23+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/14458663480/" title="Fort Napoleon"><img alt="Fort Napoleon" height="180" src="http://farm6.staticflickr.com/5480/14458663480_f86bebd8f6_m.jpg" width="240" /></a></p>\n\n<p>Fort Napoleon Central Courtyard from the roof</p>	tag:flickr.com,2004:/photo/14458663480	133-fort-napoleon				
152	8	http://www.goodreads.com/review/show/1054444845?utm_medium=api&utm_source=rss	Keep on Running: The Highs and Lows of a Marathon Addict	2014-09-14 09:08:01+01		<a href="http://www.goodreads.com/book/show/14498731-keep-on-running?utm_medium=api&amp;utm_source=rss"><img alt="Keep on Running: The Highs and Lows of a Marathon Addict" src="http://d.gr-assets.com/books/1344453381s/14498731.jpg" /></a><br />\n                                      author: Phil Hewitt<br />\n                                      name: Gareth<br />\n                                      average rating: 3.38<br />\n                                      book published: 2012<br />\n                                      rating: 3<br />\n                                      read at: <br />\n                                      date added: 2014/09/14<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/1054444845?utm_medium=api&utm_source=rss	152-keep-on-running-the-highs-and-lows-of-a-marath				
134	3	http://www.flickr.com/photos/gareth53/14644916822/	Fort Napoleon	2014-07-13 18:17:22+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/14644916822/" title="Fort Napoleon"><img alt="Fort Napoleon" height="180" src="http://farm6.staticflickr.com/5233/14644916822_64febafeb9_m.jpg" width="240" /></a></p>\n\n<p>Central Courtyard</p>	tag:flickr.com,2004:/photo/14644916822	134-fort-napoleon				
353	5	https://londonist.com/2015/12/time-out-ditches-dedicated-london-comedy-section	Time Out Calls Time On London Comedy	2015-12-22 00:17:06+00			https://londonist.com/2015/12/time-out-ditches-dedicated-london-comedy-section	353-time-out-calls-time-on-london-comedy				
135	3	http://www.flickr.com/photos/gareth53/14458703849/	Noordzee	2014-07-13 18:17:22+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/14458703849/" title="Noordzee"><img alt="Noordzee" height="135" src="http://farm4.staticflickr.com/3863/14458703849_025e77eb28_m.jpg" width="240" /></a></p>	tag:flickr.com,2004:/photo/14458703849	135-noordzee				
153	8	http://www.goodreads.com/review/show/1044583399?utm_medium=api&utm_source=rss	The Unstoppable Keeper	2014-09-03 21:16:14+01		<a href="http://www.goodreads.com/book/show/22130307-the-unstoppable-keeper?utm_medium=api&amp;utm_source=rss"><img alt="The Unstoppable Keeper" src="http://d.gr-assets.com/books/1400870237s/22130307.jpg" /></a><br />\n                                      author: Lutz Pfannenstiel<br />\n                                      name: Gareth<br />\n                                      average rating: 4.16<br />\n                                      book published: 2014<br />\n                                      rating: 4<br />\n                                      read at: <br />\n                                      date added: 2014/09/03<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/1044583399?utm_medium=api&utm_source=rss	153-the-unstoppable-keeper				
279	12	http://strava.com/activities/353499745	07/25/2015 Barnet, United Kingdom	2015-07-25 08:09:53+01		Run (Barnet): Distance: 4.9km, Elevation Gain: 75m, Moving Time: 00:21:58, Average Speed: 13.4km/h	http://strava.com/activities/353499745	279-07252015-barnet-united-kingdom				
154	8	http://www.goodreads.com/review/show/993044991?utm_medium=api&utm_source=rss	The Skies Belong to Us: Love and Terror in the Golden Age of Hijacking	2014-07-14 06:36:05+01		<a href="http://www.goodreads.com/book/show/16071731-the-skies-belong-to-us?utm_medium=api&amp;utm_source=rss"><img alt="The Skies Belong to Us: Love and Terror in the Golden Age of Hijacking" src="http://d.gr-assets.com/books/1358131700s/16071731.jpg" /></a><br />\n                                      author: Brendan I. Koerner<br />\n                                      name: Gareth<br />\n                                      average rating: 3.99<br />\n                                      book published: 2013<br />\n                                      rating: 4<br />\n                                      read at: 2014/07/14<br />\n                                      date added: 2014/07/13<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/993044991?utm_medium=api&utm_source=rss	154-the-skies-belong-to-us-love-and-terror-in-the-				
139	6	https://gareth53.wordpress.com/2013/10/08/royal-parks-half-marathon/	Royal Parks Half-Marathon	2013-10-08 12:18:12+01		I ran my first half-marathon at the weekend. It was a much more pleasurable experience than the 10k earlier in the year. Start time was 9am with runners scheduled to enter start funnels at 8.40am. Fearing having to stand around for a long time getting nervous before the start I rolled up at 8.15am figuring [&#8230;]<img alt="" border="0" height="1" src="https://pixel.wp.com/b.gif?host=gareth53.wordpress.com&#038;blog=50990071&#038;post=33&#038;subd=gareth53&#038;ref=&#038;feed=1" width="1" />	http://gareth53.wordpress.com/?p=33	139-royal-parks-half-marathon				
155	8	http://www.goodreads.com/review/show/993041137?utm_medium=api&utm_source=rss	David and Goliath: Underdogs, Misfits, and the Art of Battling Giants	2014-07-11 15:25:00+01		<a href="http://www.goodreads.com/book/show/15751404-david-and-goliath?utm_medium=api&amp;utm_source=rss"><img alt="David and Goliath: Underdogs, Misfits, and the Art of Battling Giants" src="http://d.gr-assets.com/books/1391813567s/15751404.jpg" /></a><br />\n                                      author: Malcolm Gladwell<br />\n                                      name: Gareth<br />\n                                      average rating: 3.84<br />\n                                      book published: 2011<br />\n                                      rating: 3<br />\n                                      read at: 2014/07/10<br />\n                                      date added: 2014/07/11<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/993041137?utm_medium=api&utm_source=rss	155-david-and-goliath-underdogs-misfits-and-the-ar				
140	6	https://gareth53.wordpress.com/2013/09/02/xfm-co-uk-relaunch-and-why-its-not-responsive/	XFM.co.uk Relaunch (and why it’s not responsive)	2013-09-02 14:28:40+01		The Xfm website relaunched today &#8211; on a new CMS and with a new design. There&#8217;s very little absolutely new stuff that the previous site didn&#8217;t have, but lots of improved features, better UI and snappier performance. In particular, the playlist has been improved with better browse-ability and search. The content&#8217;s been re-structured too, with [&#8230;]<img alt="" border="0" height="1" src="https://pixel.wp.com/b.gif?host=gareth53.wordpress.com&#038;blog=50990071&#038;post=22&#038;subd=gareth53&#038;ref=&#038;feed=1" width="1" />	http://gareth53.wordpress.com/?p=22	140-xfmcouk-relaunch-and-why-its-not-responsive				
280	12	http://strava.com/activities/352910815	07/23/2015 London, England, United Kingdom	2015-07-23 12:02:44+01		Run (London, England): Distance: 5.0km, Elevation Gain: 12m, Moving Time: 00:24:58, Average Speed: 12.1km/h	http://strava.com/activities/352910815	280-07232015-london-england-united-kingdom				
640	13	https://www.netflix.com/WiMovie/80000710?trkid=200250783	Forensic Files: Forensic Files: Collection: "Purebread Murder"	2015-12-20 16:00:00+00								
281	12	http://strava.com/activities/352910924	07/21/2015 London, England, United Kingdom	2015-07-21 12:01:02+01		Run (London, England): Distance: 5.2km, Elevation Gain: 25m, Moving Time: 00:25:22, Average Speed: 12.4km/h	http://strava.com/activities/352910924	281-07212015-london-england-united-kingdom				
311	2	http://lea.verou.me/css3patterns/	CSS3 Patterns Gallery	2015-12-16 12:33:36+00			http://delicious.com/url/9045682f7c4bbecee57230e714d9076c#gareth53	311-css3-patterns-gallery				
141	6	https://gareth53.wordpress.com/2013/08/19/in-search-of-an-android-mp3-player/	In Search Of An Android MP3 Player	2013-08-19 20:11:10+01		I had first generation iPod Touch. A few months ago I decided it had come to the end of its useful life and the annoyances I had with it were outweighing the value I was getting from it. When I was thinking about as replacement I wanted to leave Apple behind &#8211; iTunes is a [&#8230;]<img alt="" border="0" height="1" src="https://pixel.wp.com/b.gif?host=gareth53.wordpress.com&#038;blog=50990071&#038;post=16&#038;subd=gareth53&#038;ref=&#038;feed=1" width="1" />	http://gareth53.wordpress.com/?p=16	141-in-search-of-an-android-mp3-player				
312	2	https://traams.bandcamp.com/	TRAAMS - Moderen Dancing Album Download	2015-12-15 11:00:35+00			http://delicious.com/url/606db25010d5cb4df4133e2d43602287#gareth53	312-traams-moderen-dancing-album-download				
142	6	https://gareth53.wordpress.com/2013/07/15/british-10k-london-run/	British 10K London Run	2013-07-15 10:49:24+01		I ran the British 10K Run yesterday. I&#8217;ve run 10k events before &#8211; in Regents Park, Richmond Park and Hyde Park, but never on a London street course and never in an event of this scale. The course was a good one covering some London landmarks on roads where it&#8217;s not normally possible to run. [&#8230;]<img alt="" border="0" height="1" src="https://pixel.wp.com/b.gif?host=gareth53.wordpress.com&#038;blog=50990071&#038;post=9&#038;subd=gareth53&#038;ref=&#038;feed=1" width="1" />	http://gareth53.wordpress.com/2013/07/15/british-10k-london-run/	142-british-10k-london-run				
143	6	https://gareth53.wordpress.com/2013/04/24/moving-to-wordpress/	Moving to WordPress	2013-04-24 13:16:48+01		So, here I am. I have blogged on my own domain but posts became ever more sporadic as time passed. I think I probably spent more time building my own blogging application that I did actually writing on the damn thing. But that&#8217;s OK. It was a learning process. I learned a lot. I learned [&#8230;]<img alt="" border="0" height="1" src="https://pixel.wp.com/b.gif?host=gareth53.wordpress.com&#038;blog=50990071&#038;post=3&#038;subd=gareth53&#038;ref=&#038;feed=1" width="1" />	http://gareth53.wordpress.com/?p=3	143-moving-to-wordpress				
313	2	https://vimeo.com/fronteers/videos	Fronteers’s Videos on Vimeo	2015-12-15 09:04:28+00			http://delicious.com/url/c81da3db7ee733f62955691c934e51ac#gareth53	313-fronteerss-videos-on-vimeo				
106	2	http://flexboxfroggy.com/	Flexbox Froggy - A game for learning CSS flexbox	2015-12-02 13:14:44+00			http://delicious.com/url/58259db00a1c26ee868b0c24ab27bfb5#gareth53	106-flexbox-froggy-a-game-for-learning-css-flexbox				
138	6	https://gareth53.wordpress.com/2015/05/05/maiden-marathon-milton-keynes/	Maiden Marathon – Milton Keynes	2015-05-05 14:29:38+01		I completed my first marathon yesterday. In the run-up to the day I&#8217;d been 50% terrified and 50% excited. As the day loomed closer the terrified half of me over-powered the excited half and completely took over. In the end though, the 3 months of training and a measured weekend of preparation stood me in good [&#8230;]<img alt="" border="0" height="1" src="https://pixel.wp.com/b.gif?host=gareth53.wordpress.com&#038;blog=50990071&#038;post=45&#038;subd=gareth53&#038;ref=&#038;feed=1" width="1" />	http://gareth53.wordpress.com/?p=45	138-maiden-marathon-milton-keynes				
354	5	http://pocket.co/socUpZ?cta=1	Get rich or die vlogging: The sad economics of internet fame	2015-12-22 00:17:06+00			http://pocket.co/socUpZ?cta=1	354-get-rich-or-die-vlogging-the-sad-economics-of-				
355	5	http://blog.garstasio.com/you-dont-need-jquery/ajax	Ajax Requests – You Don't Need jQuery! – Free yourself from the chains of jQuery by embracing and understanding the modern Web API and discovering various directed libraries to help you fill in the gaps.	2015-12-21 08:29:07+00			http://blog.garstasio.com/you-dont-need-jquery/ajax	355-ajax-requests-you-dont-need-jquery-free-yourse				
157	8	http://www.goodreads.com/review/show/948324505?utm_medium=api&utm_source=rss	Lost At Sea: The Jon Ronson Mysteries	2014-05-26 09:54:22+01		<a href="http://www.goodreads.com/book/show/15737151-lost-at-sea?utm_medium=api&amp;utm_source=rss"><img alt="Lost At Sea: The Jon Ronson Mysteries" src="http://d.gr-assets.com/books/1346292925s/15737151.jpg" /></a><br />\n                                      author: Jon Ronson<br />\n                                      name: Gareth<br />\n                                      average rating: 3.94<br />\n                                      book published: 2012<br />\n                                      rating: 4<br />\n                                      read at: <br />\n                                      date added: 2014/05/26<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/948324505?utm_medium=api&utm_source=rss	157-lost-at-sea-the-jon-ronson-mysteries				
641	13	https://www.netflix.com/WiMovie/80000772?trkid=200250783	Making a Murderer: Season 1: "Turning the Tables"	2015-12-20 17:00:00+00								
158	8	http://www.goodreads.com/review/show/936693817?utm_medium=api&utm_source=rss	Joyland	2014-05-14 06:02:13+01		<a href="http://www.goodreads.com/book/show/13596166-joyland?utm_medium=api&amp;utm_source=rss"><img alt="Joyland" src="http://d.gr-assets.com/books/1348154483s/13596166.jpg" /></a><br />\n                                      author: Stephen King<br />\n                                      name: Gareth<br />\n                                      average rating: 3.90<br />\n                                      book published: 2013<br />\n                                      rating: 4<br />\n                                      read at: <br />\n                                      date added: 2014/05/13<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/936693817?utm_medium=api&utm_source=rss	158-joyland				
356	5	http://engadget.com/2015/11/18/rise-and-fall-of-rdio	Too good to survive: The rise and fall of Rdio	2015-12-21 08:17:24+00			http://engadget.com/2015/11/18/rise-and-fall-of-rdio	356-too-good-to-survive-the-rise-and-fall-of-rdio				
159	8	http://www.goodreads.com/review/show/924450477?utm_medium=api&utm_source=rss	Frank: The True Story that Inspired the Movie	2014-04-30 07:56:57+01		<a href="http://www.goodreads.com/book/show/20554259-frank?utm_medium=api&amp;utm_source=rss"><img alt="Frank: The True Story that Inspired the Movie" src="http://d.gr-assets.com/books/1390740604s/20554259.jpg" /></a><br />\n                                      author: Jon Ronson<br />\n                                      name: Gareth<br />\n                                      average rating: 3.66<br />\n                                      book published: 2014<br />\n                                      rating: 4<br />\n                                      read at: 2014/04/30<br />\n                                      date added: 2014/04/30<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/924450477?utm_medium=api&utm_source=rss	159-frank-the-true-story-that-inspired-the-movie				
282	12	http://strava.com/activities/349533572	Afternoon Ride	2015-07-19 15:17:35+01		Ride (Barnet): Distance: 26.0km, Elevation Gain: 136m, Moving Time: 01:00:38, Average Speed: 25.8km/h	http://strava.com/activities/349533572	282-afternoon-ride				
160	8	http://www.goodreads.com/review/show/924450179?utm_medium=api&utm_source=rss	Ultramarathon Man: Confessions of an All-Night Runner	2014-04-30 07:56:19+01		<a href="http://www.goodreads.com/book/show/87632.Ultramarathon_Man?utm_medium=api&amp;utm_source=rss"><img alt="Ultramarathon Man: Confessions of an All-Night Runner" src="http://d.gr-assets.com/books/1309199653s/87632.jpg" /></a><br />\n                                      author: Dean Karnazes<br />\n                                      name: Gareth<br />\n                                      average rating: 3.93<br />\n                                      book published: 2005<br />\n                                      rating: 3<br />\n                                      read at: 2014/04/27<br />\n                                      date added: 2014/04/30<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/924450179?utm_medium=api&utm_source=rss	160-ultramarathon-man-confessions-of-an-all-night-				
161	8	http://www.goodreads.com/review/show/905591136?utm_medium=api&utm_source=rss	Lean UX: Applying Lean Principles to Improve User Experience	2014-04-09 15:45:10+01		<a href="http://www.goodreads.com/book/show/13436116-lean-ux?utm_medium=api&amp;utm_source=rss"><img alt="Lean UX: Applying Lean Principles to Improve User Experience" src="http://d.gr-assets.com/books/1381355830s/13436116.jpg" /></a><br />\n                                      author: Jeff Gothelf<br />\n                                      name: Gareth<br />\n                                      average rating: 3.84<br />\n                                      book published: 2012<br />\n                                      rating: 4<br />\n                                      read at: 2014/03/27<br />\n                                      date added: 2014/04/09<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/905591136?utm_medium=api&utm_source=rss	161-lean-ux-applying-lean-principles-to-improve-us				
357	5	http://theguardian.com/society/2015/dec/14/shopping-hell-kindness-therapeutic-depression-christmas?CMP=share_btn_tw	Shopping is hell and kindness is therapeutic – what I learned from being depressed at Christmas	2015-12-21 08:12:00+00			http://theguardian.com/society/2015/dec/14/shopping-hell-kindness-therapeutic-depression-christmas?CMP=share_btn_tw	357-shopping-is-hell-and-kindness-is-therapeutic-w				
162	8	http://www.goodreads.com/review/show/861389680?utm_medium=api&utm_source=rss	How to Disappear Completely and Never Be Found	2014-02-21 20:30:23+00		<a href="http://www.goodreads.com/book/show/202701.How_to_Disappear_Completely_and_Never_Be_Found?utm_medium=api&amp;utm_source=rss"><img alt="How to Disappear Completely and Never Be Found" src="http://d.gr-assets.com/books/1390769054s/202701.jpg" /></a><br />\n                                      author: Doug Richmond<br />\n                                      name: Gareth<br />\n                                      average rating: 3.40<br />\n                                      book published: 1986<br />\n                                      rating: 0<br />\n                                      read at: 2014/02/19<br />\n                                      date added: 2014/02/21<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/861389680?utm_medium=api&utm_source=rss	162-how-to-disappear-completely-and-never-be-found				
358	5	http://vice.com/read/we-asked-comedians-to-tell-us-the-worst-thing-that-happened-to-them-in-2015?utm_source=vicetwitterus	We Asked Comedians to Tell Us the Worst Thing That Happened to Them in 2015	2015-12-21 08:06:38+00			http://vice.com/read/we-asked-comedians-to-tell-us-the-worst-thing-that-happened-to-them-in-2015?utm_source=vicetwitterus	358-we-asked-comedians-to-tell-us-the-worst-thing-				
163	8	http://www.goodreads.com/review/show/861389240?utm_medium=api&utm_source=rss	Save the Cat!: The Last Book on Screenwriting You'll Ever Need	2014-02-21 20:29:40+00		<a href="http://www.goodreads.com/book/show/49464.Save_the_Cat_?utm_medium=api&amp;utm_source=rss"><img alt="Save the Cat!: The Last Book on Screenwriting You'll Ever Need" src="http://d.gr-assets.com/books/1411952887s/49464.jpg" /></a><br />\n                                      author: Blake Snyder<br />\n                                      name: Gareth<br />\n                                      average rating: 4.06<br />\n                                      book published: 2005<br />\n                                      rating: 0<br />\n                                      read at: 2014/02/15<br />\n                                      date added: 2014/02/21<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/861389240?utm_medium=api&utm_source=rss	163-save-the-cat-the-last-book-on-screenwriting-yo				
283	12	http://strava.com/activities/352911043	07/18/2015 Barnet, United Kingdom	2015-07-18 08:04:56+01		Run (Barnet): Distance: 5.0km, Elevation Gain: 36m, Moving Time: 00:23:31, Average Speed: 12.7km/h	http://strava.com/activities/352911043	283-07182015-barnet-united-kingdom				
164	8	http://www.goodreads.com/review/show/834927203?utm_medium=api&utm_source=rss	Jonny Magic and the Card Shark Kids: How a Gang of Geeks Beat the Odds and Stormed Las Vegas	2014-01-26 13:50:05+00		<a href="http://www.goodreads.com/book/show/392874.Jonny_Magic_and_the_Card_Shark_Kids?utm_medium=api&amp;utm_source=rss"><img alt="Jonny Magic and the Card Shark Kids: How a Gang of Geeks Beat the Odds and Stormed Las Vegas" src="http://d.gr-assets.com/books/1387742202s/392874.jpg" /></a><br />\n                                      author: David Kushner<br />\n                                      name: Gareth<br />\n                                      average rating: 3.59<br />\n                                      book published: 2005<br />\n                                      rating: 3<br />\n                                      read at: 2014/01/26<br />\n                                      date added: 2014/01/26<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/834927203?utm_medium=api&utm_source=rss	164-jonny-magic-and-the-card-shark-kids-how-a-gang				
642	13	https://www.netflix.com/WiMovie/80000709?trkid=200250783	Forensic Files: Forensic Files: Collection: "Lights Out"	2015-12-19 15:00:00+00								
165	8	http://www.goodreads.com/review/show/821475752?utm_medium=api&utm_source=rss	Fast Exercise: The Simple Secret of High Intensity Training: Get Fitter, Stronger and Better Toned in Just a Few Minutes a Day	2014-01-12 20:33:34+00		<a href="http://www.goodreads.com/book/show/20369977-fast-exercise?utm_medium=api&amp;utm_source=rss"><img alt="Fast Exercise: The Simple Secret of High Intensity Training: Get Fitter, Stronger and Better Toned in Just a Few Minutes a Day" src="http://d.gr-assets.com/books/1388446719s/20369977.jpg" /></a><br />\n                                      author: Michael Mosley<br />\n                                      name: Gareth<br />\n                                      average rating: 3.72<br />\n                                      book published: 2013<br />\n                                      rating: 3<br />\n                                      read at: <br />\n                                      date added: 2014/01/12<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/821475752?utm_medium=api&utm_source=rss	165-fast-exercise-the-simple-secret-of-high-intens				
166	8	http://www.goodreads.com/review/show/577861338?utm_medium=api&utm_source=rss	Mr. Nosey (Mr. Men, #4)	2014-01-07 09:21:41+00		<a href="http://www.goodreads.com/book/show/1200792.Mr_Nosey?utm_medium=api&amp;utm_source=rss"><img alt="Mr. Nosey (Mr. Men, #4)" src="http://d.gr-assets.com/books/1348247901s/1200792.jpg" /></a><br />\n                                      author: Roger Hargreaves<br />\n                                      name: Gareth<br />\n                                      average rating: 3.84<br />\n                                      book published: 1971<br />\n                                      rating: 4<br />\n                                      read at: 2011/01/23<br />\n                                      date added: 2014/01/07<br />\n                                      shelves: <br />\n                                      review: <br />Half of the charm of the Mr. Men is the illustration style. In the main, the Mr. Men are of pleasing shape and colour - they're solid, cheerful and they look like you could give any of them a nice big hug.<br /><br />Despite the flat two dimensional nature of the drawings it's often easy to envisage the Mr. Men in three dimensions. Mr. Nosey, however, is an exception to that rule. With his impossibly long nose, the three dimensional imagining raises a slew of practical questions. How does Nosey look down to tie his shoelaces? How does he turn around in a narrow passage? How does he wash his face? He's the only one of the Mr. Men that I think I wouldn't be able to hug.<br /><br />Mr. Nosey's physicality must be both a gift and a curse. One can only imagine that his olfactory powers are twenty to thirty times that of the other Mr. Men. His imposing conk must also be useful in a bar brawl - one can imagine him easily taking out four or five assailants with a vigorous shake of the head.<br /><br />The curse of Mr. Nosey soon manifests itself. Our protagonist is the victim of bullying. The residents of Tiddletown come together and decide that Mr. Nosey is, well, too nosy, despite incredibly flimsy evidence. He is curious, granted, but curiosity is a sign of a sharp mind and a thirst for knowledge. Yet, perhaps fuelled by jealousy (is it coincidence that Mr. Nosey is green in colour? Why not blue, yellow or red?) a gang of local tradespeople embark on a series of organised and systematic assaults on Mr. Nosey. A washerwoman casually clips his nose with a clothes-peg, a painter throws paint in his face and a carpenter goes as far as hitting his nose with a hammer! This may all be read as harmless slapstick until the climax of the book veers into slasher movie territory as a farmer brandishes a saw at Nosey's over-sized organ, laughing maniacally as he does so.<br /><br />But Mr. Nosey is beaten by this point. His sprit has been broken. His curiosity has been curbed and, despite showing the world a brave face, Mr. Nosey retreats rather than face more provocation. He ends the story as a timid shadow of his former self.<br /><br />On the face of it, Mr. Nosey could be a story about nosiness with the moral "mind your own business", but the lasting impression and message is about bullying and people's seemingly inability to accept physicalities that step beyond the boundaries of the normal.<br /><br />Perhaps Roger Hargreaves saw bullying as an unfortunate reality that children should be prepared for as early as possible. Whether you share this pessimistic world view or not, the story of Mr. Nosey is an affecting tale that leaves the sour aftertaste of pity and sadness.<br />	http://www.goodreads.com/review/show/577861338?utm_medium=api&utm_source=rss	166-mr-nosey-mr-men-4				
167	8	http://www.goodreads.com/review/show/525918939?utm_medium=api&utm_source=rss	Mr. Happy (Mr. Men, #3)	2014-01-07 09:19:31+00		<a href="http://www.goodreads.com/book/show/278275.Mr_Happy?utm_medium=api&amp;utm_source=rss"><img alt="Mr. Happy (Mr. Men, #3)" src="http://d.gr-assets.com/books/1432174737s/278275.jpg" /></a><br />\n                                      author: Roger Hargreaves<br />\n                                      name: Gareth<br />\n                                      average rating: 3.98<br />\n                                      book published: 1971<br />\n                                      rating: 5<br />\n                                      read at: 2011/01/16<br />\n                                      date added: 2014/01/07<br />\n                                      shelves: <br />\n                                      review: <br />While in the modern western world man chases fame, fortune and the respect of his peers, in more archaic cultures the ultimate pursuit is for a greater level of understanding or some kind of connection with a higher force. Whatever the culture, man does this for a single reason: because he thinks it will make him happy. This pursuit of happiness is the meaning of life, the always just-out-of-reach goal for humans the world over.<br /><br />Mr. Happy, the fourth member of the Mr. Men family, is in a state of perpetual happiness. Quite how this state of happiness has been achieved is unclear. He lives in a house of a similar size and style to that of the other Mr. Men we have already met. He displays no obvious trappings of wealth or success, no enviable family from which he may derive some kind of pride or worth and offers no insight, wisdom or religious beliefs.<br /><br />Happy, we are told, lives in a land called "Happyland" in which all the people, the birds, even the worms are happy. One begins to wonder if our hero is a member of some kind of cult. The next notion is that perhaps My. Happy is under the influence of some kind of narcotic which makes him THINK that the birds and the worms are conversing with him and confirming that they too are enjoying life to the full. So many questions and (given that this is short-form fiction) so little time for answers.<br /><br />After the scene has been established, Mr. Happy goes for a walk whereupon (and with a nod to the great CS Lewis) he discovers a tiny red door in the trunk of a tree. Behind the door is a small room in which we meet Mr. Happy's alter-ego, Mr. Miserable.<br /><br />Mr. Miserable is suffering from a textbook case of agoraphobia. And whilst Miserable doesn't obviously experience any kind of panic attack during the course of the story he is clearly displaying symptoms of anxiety. Mr. Happy, with an alarming lack of caution, attempts to win his new patient's trust and prescribes a course of exposure treatment. Happy leads Miserable outside and encourages him to engage with the world.<br /><br />Whether Miserable actually exists, or is just a manifestation of the buried emotional distress, doubts and fears of Mr. Happy - that's left up to the reader to decide. However, to diagnose our hero as suffering from schizophrenia would be perfectly justified - and the classic 'voices in the head' symptom would certainly solve the talking birds/worms quandary.<br /><br />In the end though, it matters not how you choose to translate or frame the fable. Mr. Happy is a profound tale - a story that reaffirms the value of human friendship and appeals to society to recognise the devastating affect of mental illness. It's a plea for us to tackle these issues and to those in throe to depression, it's a simple message that there are people who care and who can help.<br /><br />Simply choosing to tackle a subject and a message of such gravity in a form more suited to frothy, flimsy stories is shocking. What's more shocking however, is the apparent ease and aplomb Hargreaves displays whilst dealing with this thorny issue. Hargreaves isn't just an author of children's fiction, he's a poet, a social activist, the voice of reason and, surely for some... a lifeline. It is our duty to cherish and champion his work.<br />	http://www.goodreads.com/review/show/525918939?utm_medium=api&utm_source=rss	167-mr-happy-mr-men-3				
168	8	http://www.goodreads.com/review/show/505135106?utm_medium=api&utm_source=rss	Mr. Tickle (Mr. Men, #1)	2014-01-07 09:16:49+00		<a href="http://www.goodreads.com/book/show/838161.Mr_Tickle?utm_medium=api&amp;utm_source=rss"><img alt="Mr. Tickle (Mr. Men, #1)" src="http://d.gr-assets.com/books/1178803207s/838161.jpg" /></a><br />\n                                      author: Roger Hargreaves<br />\n                                      name: Gareth<br />\n                                      average rating: 3.91<br />\n                                      book published: 1971<br />\n                                      rating: 5<br />\n                                      read at: 2011/01/02<br />\n                                      date added: 2014/01/07<br />\n                                      shelves: <br />\n                                      review: <br />This book details a day in the life of he central character - Mr. Tickle who is quickly established as a classic anti-establishment figure in the manner of James Dean in "Rebel Without A Cause", Peter Fonda in "Easy Rider" or Marlon Brando in "The Wild One".<br /><br />Tickle goes about his day humiliating people in positions of authority, making them look stupid and disrupting the valuable work they are doing in the community and their contributions to the wider society.<br />Mr. Tickle breaks in to a school and tickles a teacher. Beyond that he attacks a policeman, a railway guard and a postman. Traffic is disrupted, trains run late and items belonging to the Royal Mail are damaged.<br /><br />Tickle is a recidivist without morals or conscience. He’s an archetypal anarchist, intent on 'sticking it to the man'. It's easy to see why two-year-olds warm to him – his generation are the so-called "Terrible Twos", infants who are learning the norms of society by testing behavioural boundaries that have been established by their parents.<br /><br />Mr. Tickle's motivations for disrupting these important functions of '70s society are unclear. He simply wakes up in the morning in the mood for mischief and embarks with glee on his trail of destruction. Tickle is a real sociopath but with obvious charisma and charm – a classic folk-hero figure.<br /><br />The Mr. Tickle design has, in recent years, been given a makeover. His newer form shows a character in the midst of an uncontrollable (or forced?) giggling fit – a flamboyant (or attention-seeking?) display of glee at his antics. The original rendering simply shows Mr. Tickle sporting a large satisfied grin – it's the kind of grin that, upon seeing it, makes the observer want to smile too – a natural, unforced and contagious expression of happiness. Of course, as Tickle's repeated pattern of destruction comes to light, it's the kind of calm smile that hints at hidden depths and becomes an unnerving and unsettling expression of something far more sinister and intriguing.<br /><br />At the end, it becomes clear this is a book for a parent and their child to enjoy together as the reader is encouraged to spring a surprise on their audience by tickling them. It's a genius interactive ending that cements this book's place as a children's classic.<br />	http://www.goodreads.com/review/show/505135106?utm_medium=api&utm_source=rss	168-mr-tickle-mr-men-1				
169	8	http://www.goodreads.com/review/show/804807412?utm_medium=api&utm_source=rss	Sass for Web Designers	2013-12-30 13:15:30+00		<a href="http://www.goodreads.com/book/show/17249364-sass-for-web-designers?utm_medium=api&amp;utm_source=rss"><img alt="Sass for Web Designers" src="http://d.gr-assets.com/books/1388141038s/17249364.jpg" /></a><br />\n                                      author: Dan Cederholm<br />\n                                      name: Gareth<br />\n                                      average rating: 4.22<br />\n                                      book published: 2013<br />\n                                      rating: 3<br />\n                                      read at: <br />\n                                      date added: 2013/12/30<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/804807412?utm_medium=api&utm_source=rss	169-sass-for-web-designers				
170	8	http://www.goodreads.com/review/show/804032270?utm_medium=api&utm_source=rss	Speccy Nation	2013-12-29 21:57:52+00		<a href="http://www.goodreads.com/book/show/16003283-speccy-nation?utm_medium=api&amp;utm_source=rss"><img alt="Speccy Nation" src="http://d.gr-assets.com/books/1347380272s/16003283.jpg" /></a><br />\n                                      author: Dan Whitehead<br />\n                                      name: Gareth<br />\n                                      average rating: 3.22<br />\n                                      book published: 2012<br />\n                                      rating: 3<br />\n                                      read at: <br />\n                                      date added: 2013/12/29<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/804032270?utm_medium=api&utm_source=rss	170-speccy-nation				
171	8	http://www.goodreads.com/review/show/804030058?utm_medium=api&utm_source=rss	Masters of Doom: How Two Guys Created an Empire and Transformed Pop Culture	2013-12-29 21:56:07+00		<a href="http://www.goodreads.com/book/show/222146.Masters_of_Doom?utm_medium=api&amp;utm_source=rss"><img alt="Masters of Doom: How Two Guys Created an Empire and Transformed Pop Culture" src="http://d.gr-assets.com/books/1438591316s/222146.jpg" /></a><br />\n                                      author: David Kushner<br />\n                                      name: Gareth<br />\n                                      average rating: 4.26<br />\n                                      book published: 2003<br />\n                                      rating: 4<br />\n                                      read at: <br />\n                                      date added: 2013/12/29<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/804030058?utm_medium=api&utm_source=rss	171-masters-of-doom-how-two-guys-created-an-empire				
172	8	http://www.goodreads.com/review/show/596492341?utm_medium=api&utm_source=rss	Conquistadors Of The Useless	2013-12-26 20:43:06+00		<a href="http://www.goodreads.com/book/show/945729.Conquistadors_Of_The_Useless?utm_medium=api&amp;utm_source=rss"><img alt="Conquistadors Of The Useless" src="http://d.gr-assets.com/books/1347977795s/945729.jpg" /></a><br />\n                                      author: Lionel Terray<br />\n                                      name: Gareth<br />\n                                      average rating: 4.35<br />\n                                      book published: 2001<br />\n                                      rating: 5<br />\n                                      read at: <br />\n                                      date added: 2013/12/26<br />\n                                      shelves: <br />\n                                      review: <br />best book I've read on climbing. terray avoids the repetition that blights most mountaineering memoirs. he has a <br />lovely, poetic turn of phrase too. the early chapters are full of the breathless, adrenaline fuelled enthusiasm of youth, his accounts of WW2 cynical and drenched in frustration whilst the later chapters are more philosophical.<br />Terray is also able to offer an insight into the odd combination of allure and futility that mountains climb in my holds for him. recommended!<br />	http://www.goodreads.com/review/show/596492341?utm_medium=api&utm_source=rss	172-conquistadors-of-the-useless				
643	13	https://www.netflix.com/WiMovie/80000771?trkid=200250783	Making a Murderer: Season 1: "Eighteen Years Lost"	2015-12-19 16:00:00+00								
173	8	http://www.goodreads.com/review/show/677695741?utm_medium=api&utm_source=rss	A taste of the unexpected (Pocket Penguin 70s #10)	2013-12-20 10:26:13+00		<a href="http://www.goodreads.com/book/show/265809.A_taste_of_the_unexpected?utm_medium=api&amp;utm_source=rss"><img alt="A taste of the unexpected (Pocket Penguin 70s #10)" src="http://d.gr-assets.com/books/1173261256s/265809.jpg" /></a><br />\n                                      author: Roald Dahl<br />\n                                      name: Gareth<br />\n                                      average rating: 3.94<br />\n                                      book published: <br />\n                                      rating: 0<br />\n                                      read at: 2013/07/26<br />\n                                      date added: 2013/12/20<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/677695741?utm_medium=api&utm_source=rss	173-a-taste-of-the-unexpected-pocket-penguin-70s-1				
174	8	http://www.goodreads.com/review/show/777196624?utm_medium=api&utm_source=rss	Autobiography	2013-11-30 14:39:25+00		<a href="http://www.goodreads.com/book/show/18590968-autobiography?utm_medium=api&amp;utm_source=rss"><img alt="Autobiography" src="http://d.gr-assets.com/books/1380330316s/18590968.jpg" /></a><br />\n                                      author: Morrissey<br />\n                                      name: Gareth<br />\n                                      average rating: 3.69<br />\n                                      book published: 2013<br />\n                                      rating: 3<br />\n                                      read at: 2013/11/30<br />\n                                      date added: 2013/11/30<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/777196624?utm_medium=api&utm_source=rss	174-autobiography				
175	8	http://www.goodreads.com/review/show/745986453?utm_medium=api&utm_source=rss	Them: Adventures with Extremists	2013-10-21 15:50:42+01		<a href="http://www.goodreads.com/book/show/1823.Them?utm_medium=api&amp;utm_source=rss"><img alt="Them: Adventures with Extremists" src="http://d.gr-assets.com/books/1400199696s/1823.jpg" /></a><br />\n                                      author: Jon Ronson<br />\n                                      name: Gareth<br />\n                                      average rating: 3.92<br />\n                                      book published: 2001<br />\n                                      rating: 4<br />\n                                      read at: 2013/10/21<br />\n                                      date added: 2013/10/21<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/745986453?utm_medium=api&utm_source=rss	175-them-adventures-with-extremists				
176	8	http://www.goodreads.com/review/show/725627057?utm_medium=api&utm_source=rss	Kubrick	2013-09-22 18:31:07+01		<a href="http://www.goodreads.com/book/show/536360.Kubrick?utm_medium=api&amp;utm_source=rss"><img alt="Kubrick" src="http://d.gr-assets.com/books/1175619454s/536360.jpg" /></a><br />\n                                      author: Michael Herr<br />\n                                      name: Gareth<br />\n                                      average rating: 3.85<br />\n                                      book published: 1995<br />\n                                      rating: 3<br />\n                                      read at: 2013/09/15<br />\n                                      date added: 2013/09/22<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/725627057?utm_medium=api&utm_source=rss	176-kubrick				
177	8	http://www.goodreads.com/review/show/725628229?utm_medium=api&utm_source=rss	Trainspotting: A Screenplay (Based on the Novel by Irvine Welsh)	2013-09-22 18:27:47+01		<a href="http://www.goodreads.com/book/show/23951.Trainspotting?utm_medium=api&amp;utm_source=rss"><img alt="Trainspotting: A Screenplay (Based on the Novel by Irvine Welsh)" src="http://d.gr-assets.com/books/1167484357s/23951.jpg" /></a><br />\n                                      author: John Hodge<br />\n                                      name: Gareth<br />\n                                      average rating: 4.23<br />\n                                      book published: 1996<br />\n                                      rating: 4<br />\n                                      read at: 2013/09/22<br />\n                                      date added: 2013/09/22<br />\n                                      shelves: <br />\n                                      review: <br />the edition i read included an entertaining foreword by the author and an interview with Irvine Welsh as a postscript. it also included some scenes and lines that were cut from the film.<br />	http://www.goodreads.com/review/show/725628229?utm_medium=api&utm_source=rss	177-trainspotting-a-screenplay-based-on-the-novel-				
178	8	http://www.goodreads.com/review/show/666713082?utm_medium=api&utm_source=rss	In Cold Blood	2013-07-13 18:43:24+01		<a href="http://www.goodreads.com/book/show/168642.In_Cold_Blood?utm_medium=api&amp;utm_source=rss"><img alt="In Cold Blood" src="http://d.gr-assets.com/books/1424931136s/168642.jpg" /></a><br />\n                                      author: Truman Capote<br />\n                                      name: Gareth<br />\n                                      average rating: 4.03<br />\n                                      book published: 1965<br />\n                                      rating: 0<br />\n                                      read at: <br />\n                                      date added: 2013/07/13<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/666713082?utm_medium=api&utm_source=rss	178-in-cold-blood				
179	8	http://www.goodreads.com/review/show/666712495?utm_medium=api&utm_source=rss	Born to Run: A Hidden Tribe, Superathletes, and the Greatest Race the World Has Never Seen	2013-07-13 18:42:57+01		<a href="http://www.goodreads.com/book/show/6289283-born-to-run?utm_medium=api&amp;utm_source=rss"><img alt="Born to Run: A Hidden Tribe, Superathletes, and the Greatest Race the World Has Never Seen" src="http://d.gr-assets.com/books/1320531983s/6289283.jpg" /></a><br />\n                                      author: Christopher McDougall<br />\n                                      name: Gareth<br />\n                                      average rating: 4.27<br />\n                                      book published: 2009<br />\n                                      rating: 5<br />\n                                      read at: 2011/03/16<br />\n                                      date added: 2013/07/13<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/666712495?utm_medium=api&utm_source=rss	179-born-to-run-a-hidden-tribe-superathletes-and-t				
284	12	http://strava.com/activities/352911131	07/15/2015 London, England, United Kingdom	2015-07-15 12:24:30+01		Run (London, England): Distance: 3.9km, Elevation Gain: 21m, Moving Time: 00:20:13, Average Speed: 11.7km/h	http://strava.com/activities/352911131	284-07152015-london-england-united-kingdom				
180	8	http://www.goodreads.com/review/show/666711999?utm_medium=api&utm_source=rss	Helter Skelter: The True Story of the Manson Murders	2013-07-13 18:42:16+01		<a href="http://www.goodreads.com/book/show/105992.Helter_Skelter?utm_medium=api&amp;utm_source=rss"><img alt="Helter Skelter: The True Story of the Manson Murders" src="http://d.gr-assets.com/books/1347694754s/105992.jpg" /></a><br />\n                                      author: Vincent Bugliosi<br />\n                                      name: Gareth<br />\n                                      average rating: 3.96<br />\n                                      book published: 1974<br />\n                                      rating: 0<br />\n                                      read at: 1993/07/20<br />\n                                      date added: 2013/07/13<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/666711999?utm_medium=api&utm_source=rss	180-helter-skelter-the-true-story-of-the-manson-mu				
644	13	https://www.netflix.com/WiMovie/80000708?trkid=200250783	Forensic Files: Forensic Files: Collection: "Dirty Little Seacret"	2015-12-17 20:00:00+00								
181	8	http://www.goodreads.com/review/show/666711722?utm_medium=api&utm_source=rss	On Writing: A Memoir of the Craft	2013-07-13 18:41:42+01		<a href="http://www.goodreads.com/book/show/10569.On_Writing?utm_medium=api&amp;utm_source=rss"><img alt="On Writing: A Memoir of the Craft" src="http://d.gr-assets.com/books/1436735207s/10569.jpg" /></a><br />\n                                      author: Stephen King<br />\n                                      name: Gareth<br />\n                                      average rating: 4.27<br />\n                                      book published: 1999<br />\n                                      rating: 0<br />\n                                      read at: <br />\n                                      date added: 2013/07/13<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/666711722?utm_medium=api&utm_source=rss	181-on-writing-a-memoir-of-the-craft				
182	8	http://www.goodreads.com/review/show/666710601?utm_medium=api&utm_source=rss	Freakonomics: A Rogue Economist Explores the Hidden Side of Everything (Freakonomics, #1)	2013-07-13 18:40:39+01		<a href="http://www.goodreads.com/book/show/1202.Freakonomics?utm_medium=api&amp;utm_source=rss"><img alt="Freakonomics: A Rogue Economist Explores the Hidden Side of Everything (Freakonomics, #1)" src="http://d.gr-assets.com/books/1327909092s/1202.jpg" /></a><br />\n                                      author: Steven D. Levitt<br />\n                                      name: Gareth<br />\n                                      average rating: 3.90<br />\n                                      book published: 2001<br />\n                                      rating: 4<br />\n                                      read at: 2013/07/05<br />\n                                      date added: 2013/07/13<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/666710601?utm_medium=api&utm_source=rss	182-freakonomics-a-rogue-economist-explores-the-hi				
183	8	http://www.goodreads.com/review/show/625011650?utm_medium=api&utm_source=rss	Gone Girl	2013-05-26 16:04:26+01		<a href="http://www.goodreads.com/book/show/8442457-gone-girl?utm_medium=api&amp;utm_source=rss"><img alt="Gone Girl" src="http://d.gr-assets.com/books/1339602131s/8442457.jpg" /></a><br />\n                                      author: Gillian Flynn<br />\n                                      name: Gareth<br />\n                                      average rating: 3.93<br />\n                                      book published: 2012<br />\n                                      rating: 4<br />\n                                      read at: 2013/05/26<br />\n                                      date added: 2013/05/26<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/625011650?utm_medium=api&utm_source=rss	183-gone-girl				
184	8	http://www.goodreads.com/review/show/617011098?utm_medium=api&utm_source=rss	Don't Make Me Think: A Common Sense Approach to Web Usability	2013-05-21 08:02:21+01		<a href="http://www.goodreads.com/book/show/3368.Don_t_Make_Me_Think?utm_medium=api&amp;utm_source=rss"><img alt="Don't Make Me Think: A Common Sense Approach to Web Usability" src="http://d.gr-assets.com/books/1390867006s/3368.jpg" /></a><br />\n                                      author: Steve Krug<br />\n                                      name: Gareth<br />\n                                      average rating: 4.20<br />\n                                      book published: 2000<br />\n                                      rating: 4<br />\n                                      read at: 2013/05/20<br />\n                                      date added: 2013/05/21<br />\n                                      shelves: <br />\n                                      review: <br />I re-read this, 10 years after first reading it.<br /><br />I wondered if it still held up a decade later. It has dated (most notably in the example screenshots) but since the most salient points relate to cognitive psychology it's still a worthwhile read.<br /><br />On the plus side it's very easy to read and incredibly concise. The most impressive thing is not what's in the book, but what's NOT in the book - it would have been easy to get sidetracked down many a blind alley that would have weakened the key thrusts of the book and seen it date a lot quicker.<br /><br />It's interesting to see that a whole swathe of things that Krug was contentiously recommending back in the early noughties have become the 'normal', accepted conventions.<br /><br />I almost definitely won't read it again in 2023, but it remained enjoyable, relevant and useful in 2013.<br />	http://www.goodreads.com/review/show/617011098?utm_medium=api&utm_source=rss	184-dont-make-me-think-a-common-sense-approach-to-				
185	8	http://www.goodreads.com/review/show/611923405?utm_medium=api&utm_source=rss	The Moomins and the Great Flood (The Moomins, #1)	2013-05-10 16:14:16+01		<a href="http://www.goodreads.com/book/show/3300083-the-moomins-and-the-great-flood?utm_medium=api&amp;utm_source=rss"><img alt="The Moomins and the Great Flood (The Moomins, #1)" src="http://d.gr-assets.com/books/1256923501s/3300083.jpg" /></a><br />\n                                      author: Tove Jansson<br />\n                                      name: Gareth<br />\n                                      average rating: 4.03<br />\n                                      book published: 1945<br />\n                                      rating: 0<br />\n                                      read at: 2013/04/08<br />\n                                      date added: 2013/05/10<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/611923405?utm_medium=api&utm_source=rss	185-the-moomins-and-the-great-flood-the-moomins-1				
318	12	http://strava.com/activities/450031178	Morning Run	2015-12-11 07:38:56+00		Run (Barnet): Distance: 4.3km, Elevation Gain: 0m, Moving Time: 00:22:18, Average Speed: 11.6km/h	http://strava.com/activities/450031178	318-morning-run				
186	8	http://www.goodreads.com/review/show/596042690?utm_medium=api&utm_source=rss	Room	2013-05-10 16:11:55+01		<a href="http://www.goodreads.com/book/show/7937843-room?utm_medium=api&amp;utm_source=rss"><img alt="Room" src="http://d.gr-assets.com/books/1344265419s/7937843.jpg" /></a><br />\n                                      author: Emma Donoghue<br />\n                                      name: Gareth<br />\n                                      average rating: 3.97<br />\n                                      book published: 2010<br />\n                                      rating: 4<br />\n                                      read at: 2013/04/30<br />\n                                      date added: 2013/05/10<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/596042690?utm_medium=api&utm_source=rss	186-room				
319	12	http://strava.com/activities/450031285	Morning Run	2015-12-08 07:42:44+00		Run (Barnet): Distance: 4.3km, Elevation Gain: 0m, Moving Time: 00:22:44, Average Speed: 11.3km/h	http://strava.com/activities/450031285	319-morning-run				
187	8	http://www.goodreads.com/review/show/608437575?utm_medium=api&utm_source=rss	American Psycho	2013-05-10 16:11:31+01		<a href="http://www.goodreads.com/book/show/28676.American_Psycho?utm_medium=api&amp;utm_source=rss"><img alt="American Psycho" src="http://d.gr-assets.com/books/1436934349s/28676.jpg" /></a><br />\n                                      author: Bret Easton Ellis<br />\n                                      name: Gareth<br />\n                                      average rating: 3.81<br />\n                                      book published: 1991<br />\n                                      rating: 2<br />\n                                      read at: 2013/05/09<br />\n                                      date added: 2013/05/10<br />\n                                      shelves: <br />\n                                      review: <br />Well, that was the least satisfying book I've read for a while.<br /><br />I did wonder if maybe it no longer works as a satire on the banking industry as it is now - because, you know, they've cleaned up their act now, right? ... No, that can't be it.<br /><br />It's just boring and repetitive, and the jokes don't bear repeating that much.<br />	http://www.goodreads.com/review/show/608437575?utm_medium=api&utm_source=rss	187-american-psycho				
188	8	http://www.goodreads.com/review/show/507029627?utm_medium=api&utm_source=rss	Unfamous	2013-05-06 14:04:12+01		<a href="http://www.goodreads.com/book/show/13516146-unfamous?utm_medium=api&amp;utm_source=rss"><img alt="Unfamous" src="http://d.gr-assets.com/books/1360360467s/13516146.jpg" /></a><br />\n                                      author: Emma Morgan<br />\n                                      name: Gareth<br />\n                                      average rating: 2.56<br />\n                                      book published: 2010<br />\n                                      rating: 4<br />\n                                      read at: 2011/06/09<br />\n                                      date added: 2013/05/06<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/507029627?utm_medium=api&utm_source=rss	188-unfamous				
320	12	http://strava.com/activities/448299859	Afternoon Run	2015-12-06 15:24:40+00		Run (Barnet): Distance: 7.9km, Elevation Gain: 57m, Moving Time: 00:42:34, Average Speed: 11.1km/h	http://strava.com/activities/448299859	320-afternoon-run				
189	8	http://www.goodreads.com/review/show/606745446?utm_medium=api&utm_source=rss	The Magic Shop	2013-05-04 13:20:34+01		<a href="http://www.goodreads.com/book/show/1477274.The_Magic_Shop?utm_medium=api&amp;utm_source=rss"><img alt="The Magic Shop" src="http://d.gr-assets.com/books/1391621878s/1477274.jpg" /></a><br />\n                                      author: H.G. Wells<br />\n                                      name: Gareth<br />\n                                      average rating: 3.76<br />\n                                      book published: 1903<br />\n                                      rating: 3<br />\n                                      read at: 2013/04/29<br />\n                                      date added: 2013/05/04<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/606745446?utm_medium=api&utm_source=rss	189-the-magic-shop				
190	8	http://www.goodreads.com/review/show/547557353?utm_medium=api&utm_source=rss	Two Scoops of Django: Best Practices for Django 1.5	2013-04-21 21:02:10+01		<a href="http://www.goodreads.com/book/show/17278772-two-scoops-of-django?utm_medium=api&amp;utm_source=rss"><img alt="Two Scoops of Django: Best Practices for Django 1.5" src="http://d.gr-assets.com/books/1358953257s/17278772.jpg" /></a><br />\n                                      author: Daniel Greenfeld<br />\n                                      name: Gareth<br />\n                                      average rating: 4.26<br />\n                                      book published: 2013<br />\n                                      rating: 3<br />\n                                      read at: 2013/04/18<br />\n                                      date added: 2013/04/21<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/547557353?utm_medium=api&utm_source=rss	190-two-scoops-of-django-best-practices-for-django				
321	12	http://strava.com/activities/448299970	Morning Run	2015-12-05 09:06:11+00		Run (London): Distance: 5.4km, Elevation Gain: 42m, Moving Time: 00:24:00, Average Speed: 13.4km/h	http://strava.com/activities/448299970	321-morning-run				
645	13	https://www.netflix.com/WiMovie/80000707?trkid=200250783	Forensic Files: Forensic Files: Collection: "Waste Mis-Management"	2015-12-17 21:00:00+00								
317	12	http://strava.com/activities/450031104	Morning Run	2015-12-13 09:03:59+00		Run (Barnet): Distance: 4.9km, Elevation Gain: 0m, Moving Time: 00:24:39, Average Speed: 11.9km/h	http://strava.com/activities/450031104	317-morning-run				
646	13	https://www.netflix.com/WiMovie/810117?trkid=200250783	No Way Out	2015-12-13 15:00:00+00								
191	8	http://www.goodreads.com/review/show/567076438?utm_medium=api&utm_source=rss	Safe House	2013-04-21 21:02:05+01		<a href="http://www.goodreads.com/book/show/13538955-safe-house?utm_medium=api&amp;utm_source=rss"><img alt="Safe House" src="http://d.gr-assets.com/books/1344321589s/13538955.jpg" /></a><br />\n                                      author: Chris Ewan<br />\n                                      name: Gareth<br />\n                                      average rating: 3.54<br />\n                                      book published: 2012<br />\n                                      rating: 3<br />\n                                      read at: 2013/03/23<br />\n                                      date added: 2013/04/21<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/567076438?utm_medium=api&utm_source=rss	191-safe-house				
647	13	https://www.netflix.com/WiMovie/70054715?trkid=200250783	The Conformist	2015-12-13 16:00:00+00								
192	8	http://www.goodreads.com/review/show/572499036?utm_medium=api&utm_source=rss	Responsive Web Design	2013-04-21 21:02:02+01		<a href="http://www.goodreads.com/book/show/9815906-responsive-web-design?utm_medium=api&amp;utm_source=rss"><img alt="Responsive Web Design" src="http://d.gr-assets.com/books/1291401033s/9815906.jpg" /></a><br />\n                                      author: Ethan Marcotte<br />\n                                      name: Gareth<br />\n                                      average rating: 4.24<br />\n                                      book published: 2011<br />\n                                      rating: 4<br />\n                                      read at: <br />\n                                      date added: 2013/04/21<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/572499036?utm_medium=api&utm_source=rss	192-responsive-web-design				
648	13	https://www.netflix.com/WiMovie/80045895?trkid=200250783	Partners: Season 1: "They Come Together"	2015-12-13 17:00:00+00								
193	8	http://www.goodreads.com/review/show/596042218?utm_medium=api&utm_source=rss	The Secret Life of Bletchley Park: The WWII Codebreaking Centre and the Men and Women Who Worked There	2013-04-21 21:02:00+01		<a href="http://www.goodreads.com/book/show/7961760-the-secret-life-of-bletchley-park?utm_medium=api&amp;utm_source=rss"><img alt="The Secret Life of Bletchley Park: The WWII Codebreaking Centre and the Men and Women Who Worked There" src="http://d.gr-assets.com/books/1328725789s/7961760.jpg" /></a><br />\n                                      author: Sinclair McKay<br />\n                                      name: Gareth<br />\n                                      average rating: 3.70<br />\n                                      book published: 2010<br />\n                                      rating: 3<br />\n                                      read at: 2013/04/18<br />\n                                      date added: 2013/04/21<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/596042218?utm_medium=api&utm_source=rss	193-the-secret-life-of-bletchley-park-the-wwii-cod				
649	13	https://www.netflix.com/WiMovie/80000706?trkid=200250783	Forensic Files: Forensic Files: Collection: "Watchful Eye"	2015-12-13 18:00:00+00								
194	8	http://www.goodreads.com/review/show/596042097?utm_medium=api&utm_source=rss	World War Z: An Oral History of the Zombie War	2013-04-21 21:01:58+01		<a href="http://www.goodreads.com/book/show/8908.World_War_Z?utm_medium=api&amp;utm_source=rss"><img alt="World War Z: An Oral History of the Zombie War" src="http://d.gr-assets.com/books/1386328204s/8908.jpg" /></a><br />\n                                      author: Max Brooks<br />\n                                      name: Gareth<br />\n                                      average rating: 4.01<br />\n                                      book published: 2006<br />\n                                      rating: 3<br />\n                                      read at: 2013/04/16<br />\n                                      date added: 2013/04/21<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/596042097?utm_medium=api&utm_source=rss	194-world-war-z-an-oral-history-of-the-zombie-war				
650	13	https://www.netflix.com/WiMovie/70278931?trkid=200250783	Blue Ruin	2015-12-12 15:00:00+00								
195	8	http://www.goodreads.com/review/show/553528224?utm_medium=api&utm_source=rss	The Hundred-Year-Old Man Who Climbed Out of the Window and Disappeared	2013-03-15 14:56:18+00		<a href="http://www.goodreads.com/book/show/13486632-the-hundred-year-old-man-who-climbed-out-of-the-window-and-disappeared?utm_medium=api&amp;utm_source=rss"><img alt="The Hundred-Year-Old Man Who Climbed Out of the Window and Disappeared" src="http://d.gr-assets.com/books/1334848488s/13486632.jpg" /></a><br />\n                                      author: Jonas Jonasson<br />\n                                      name: Gareth<br />\n                                      average rating: 3.80<br />\n                                      book published: 2009<br />\n                                      rating: 5<br />\n                                      read at: 2013/03/15<br />\n                                      date added: 2013/03/15<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/553528224?utm_medium=api&utm_source=rss	195-the-hundred-year-old-man-who-climbed-out-of-th				
651	13	https://www.netflix.com/WiMovie/80000705?trkid=200250783	Forensic Files: Forensic Files: Collection: "Runaway Love"	2015-12-12 16:00:00+00								
196	8	http://www.goodreads.com/review/show/525918510?utm_medium=api&utm_source=rss	The Secret Life of Houdini: The Making of America's First Superhero	2013-02-27 09:32:46+00		<a href="http://www.goodreads.com/book/show/13944.The_Secret_Life_of_Houdini?utm_medium=api&amp;utm_source=rss"><img alt="The Secret Life of Houdini: The Making of America's First Superhero" src="http://d.gr-assets.com/books/1388512498s/13944.jpg" /></a><br />\n                                      author: William Kalush<br />\n                                      name: Gareth<br />\n                                      average rating: 3.83<br />\n                                      book published: 2006<br />\n                                      rating: 4<br />\n                                      read at: 2013/02/27<br />\n                                      date added: 2013/02/27<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/525918510?utm_medium=api&utm_source=rss	196-the-secret-life-of-houdini-the-making-of-ameri				
652	13	https://www.netflix.com/WiMovie/80000704?trkid=200250783	Forensic Files: Forensic Files: Collection: "Family Interrupted"	2015-12-12 17:00:00+00								
197	8	http://www.goodreads.com/review/show/505156393?utm_medium=api&utm_source=rss	Mr. Greedy (Mr. Men, #2)	2013-01-21 07:04:01+00		<a href="http://www.goodreads.com/book/show/614039.Mr_Greedy?utm_medium=api&amp;utm_source=rss"><img alt="Mr. Greedy (Mr. Men, #2)" src="http://d.gr-assets.com/books/1348836358s/614039.jpg" /></a><br />\n                                      author: Roger Hargreaves<br />\n                                      name: Gareth<br />\n                                      average rating: 3.94<br />\n                                      book published: 1971<br />\n                                      rating: 5<br />\n                                      read at: 2011/01/08<br />\n                                      date added: 2013/01/20<br />\n                                      shelves: <br />\n                                      review: <br />After the complex deconstructed take on the criminal mind of Mr. Tickle, author Roger Hargreaves returns to more familiar territories in children's literature with the second in his Mr. Men series.<br /><br />Mr. Greedy is an allegorical tale tackling a low-level vice - one of the all too familiar seven deadly sins.<br /><br />Mr. Greedy is initially a difficult character to comprehend. He's quite clearly obese, yet undistressed at the unhealthy and frankly, quite dangerous state of his body. He dreams of food, he attacks his meals with relish and seems to derive an enormous amount of pleasure from the act of consumption. Yet it's clear this is not comfort eating. Mr. Greedy is clearly not an unhappy individual - it's tempting to assume that our hero is suffering Prada Willi Syndrome or some other medically recognised genetic disorder. More likely, in this reviewer's opinion, is that Mr. Greedy is a former elite sportsman. His diet is heavily skewed toward carbohydrates such as breads and cereals - foods that an endurance athlete might favour. It is not uncommon for distinguished cyclists and long-distance runners to bloat in retirement - finding it relatively easy to stop training, but much more difficult to alter the eating habits that their career has led them to. Indeed, after eating an enormous breakfast, Greedy steps out to take a walk in order to build an appetite for his lunch – this is not the behaviour of the classic glutton.<br /><br />Despite the lack of clarity to the back story, what is clear is that, despite his apparent happiness, Mr. Greedy's lifestyle is to be frowned upon - at first it appears to be a typical, disappointing one-dimensional allegory. But Hargreaves can't be that obvious can he?<br /><br />After an entertaining breakfast and during his mid-morning constitutional, Mr. Greedy appears to slip into either a dreamlike daze or some kind of food-induced hallucinatory state. In an incredible scene Greedy happens upon a secret room filled with over-sized foodstuffs such as oranges bigger than himself and peas the size of footballs. Now Greedy is faced with a test - his vice could consume him. Can he resist his urges and beat his demons?<br /><br />It's a cautionary tale, typical of stories aimed at young children, yet Hargreaves subverts the form by misinterpreting the moral of the tale. It's a delightful and suitable kicker, of which Hargreaves is an undoubted master.<br /><br />That this is only book two in a series of fifty, should serve to fill any reader with a wild anticipation and appetite for the other unexpected delights that Roger Hargreaves may have yet to serve.<br />	http://www.goodreads.com/review/show/505156393?utm_medium=api&utm_source=rss	197-mr-greedy-mr-men-2				
653	13	https://www.netflix.com/WiMovie/80000703?trkid=200250783	Forensic Files: Forensic Files: Collection: "Shoe-in for Murder"	2015-12-06 15:00:00+00								
198	8	http://www.goodreads.com/review/show/505141108?utm_medium=api&utm_source=rss	Street Magic: Great Tricks and Close-Up Secrets Revealed	2013-01-13 17:32:02+00		<a href="http://www.goodreads.com/book/show/639189.Street_Magic?utm_medium=api&amp;utm_source=rss"><img alt="Street Magic: Great Tricks and Close-Up Secrets Revealed" src="http://d.gr-assets.com/books/1176600032s/639189.jpg" /></a><br />\n                                      author: Paul Zenon<br />\n                                      name: Gareth<br />\n                                      average rating: 3.56<br />\n                                      book published: 2005<br />\n                                      rating: 0<br />\n                                      read at: 2012/12/28<br />\n                                      date added: 2013/01/13<br />\n                                      shelves: magic<br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/505141108?utm_medium=api&utm_source=rss	198-street-magic-great-tricks-and-close-up-secrets				
654	13	https://www.netflix.com/WiMovie/80000702?trkid=200250783	Forensic Files: Forensic Files: Collection: "Office Visit"	2015-12-06 16:00:00+00								
199	8	http://www.goodreads.com/review/show/505132479?utm_medium=api&utm_source=rss	Three to See the King	2013-01-13 17:21:43+00		<a href="http://www.goodreads.com/book/show/325603.Three_to_See_the_King?utm_medium=api&amp;utm_source=rss"><img alt="Three to See the King" src="http://d.gr-assets.com/books/1312003080s/325603.jpg" /></a><br />\n                                      author: Magnus Mills<br />\n                                      name: Gareth<br />\n                                      average rating: 3.74<br />\n                                      book published: 2001<br />\n                                      rating: 0<br />\n                                      read at: <br />\n                                      date added: 2013/01/13<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/505132479?utm_medium=api&utm_source=rss	199-three-to-see-the-king				
655	13	https://www.netflix.com/WiMovie/80000717?trkid=200250783	Forensic Files: Forensic Files: Collection: "Water Logged"	2015-12-01 20:00:00+00								
200	8	http://www.goodreads.com/review/show/505132326?utm_medium=api&utm_source=rss	All Quiet on the Orient Express	2013-01-13 17:21:31+00		<a href="http://www.goodreads.com/book/show/325598.All_Quiet_on_the_Orient_Express?utm_medium=api&amp;utm_source=rss"><img alt="All Quiet on the Orient Express" src="http://d.gr-assets.com/books/1286552647s/325598.jpg" /></a><br />\n                                      author: Magnus Mills<br />\n                                      name: Gareth<br />\n                                      average rating: 4.07<br />\n                                      book published: 1999<br />\n                                      rating: 0<br />\n                                      read at: <br />\n                                      date added: 2013/01/13<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/505132326?utm_medium=api&utm_source=rss	200-all-quiet-on-the-orient-express				
656	13	https://www.netflix.com/WiMovie/80000701?trkid=200250783	Forensic Files: Forensic Files: Collection: "DNA Dragnet"	2015-12-01 21:00:00+00								
201	8	http://www.goodreads.com/review/show/505132120?utm_medium=api&utm_source=rss	The Restraint of Beasts	2013-01-13 17:21:20+00		<a href="http://www.goodreads.com/book/show/323208.The_Restraint_of_Beasts?utm_medium=api&amp;utm_source=rss"><img alt="The Restraint of Beasts" src="http://d.gr-assets.com/books/1348299275s/323208.jpg" /></a><br />\n                                      author: Magnus Mills<br />\n                                      name: Gareth<br />\n                                      average rating: 3.93<br />\n                                      book published: 1998<br />\n                                      rating: 0<br />\n                                      read at: <br />\n                                      date added: 2013/01/13<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/505132120?utm_medium=api&utm_source=rss	201-the-restraint-of-beasts				
657	13	https://www.netflix.com/WiMovie/80046815?trkid=200250783	How to Get Away with Murder: Season 1: "It's All My Fault"	2015-12-01 22:00:00+00								
202	8	http://www.goodreads.com/review/show/505129318?utm_medium=api&utm_source=rss	Treasure Island	2013-01-13 17:18:00+00		<a href="http://www.goodreads.com/book/show/295.Treasure_Island?utm_medium=api&amp;utm_source=rss"><img alt="Treasure Island" src="http://d.gr-assets.com/books/1388607993s/295.jpg" /></a><br />\n                                      author: Robert Louis Stevenson<br />\n                                      name: Gareth<br />\n                                      average rating: 3.80<br />\n                                      book published: 1883<br />\n                                      rating: 0<br />\n                                      read at: 2012/08/01<br />\n                                      date added: 2013/01/13<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/505129318?utm_medium=api&utm_source=rss	202-treasure-island				
658	13	https://www.netflix.com/WiMovie/80000700?trkid=200250783	Forensic Files: Forensic Files: Collection: "Seedy Intentions"	2015-11-30 20:00:00+00								
203	8	http://www.goodreads.com/review/show/505128620?utm_medium=api&utm_source=rss	The Wrestling	2013-01-13 17:17:11+00		<a href="http://www.goodreads.com/book/show/585862.The_Wrestling?utm_medium=api&amp;utm_source=rss"><img alt="The Wrestling" src="http://d.gr-assets.com/books/1176042589s/585862.jpg" /></a><br />\n                                      author: Simon Garfield<br />\n                                      name: Gareth<br />\n                                      average rating: 4.00<br />\n                                      book published: 1996<br />\n                                      rating: 4<br />\n                                      read at: <br />\n                                      date added: 2013/01/13<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/505128620?utm_medium=api&utm_source=rss	203-the-wrestling				
204	8	http://www.goodreads.com/review/show/491403449?utm_medium=api&utm_source=rss	JavaScript: The Good Parts	2013-01-13 17:14:58+00		<a href="http://www.goodreads.com/book/show/2998152-javascript?utm_medium=api&amp;utm_source=rss"><img alt="JavaScript: The Good Parts" src="http://d.gr-assets.com/books/1328834793s/2998152.jpg" /></a><br />\n                                      author: Douglas Crockford<br />\n                                      name: Gareth<br />\n                                      average rating: 4.22<br />\n                                      book published: 2008<br />\n                                      rating: 4<br />\n                                      read at: 2013/01/11<br />\n                                      date added: 2013/01/13<br />\n                                      shelves: development<br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/491403449?utm_medium=api&utm_source=rss	204-javascript-the-good-parts				
205	8	http://www.goodreads.com/review/show/491359898?utm_medium=api&utm_source=rss	Going to Sea in a Sieve: The Autobiography	2013-01-01 10:31:39+00		<a href="http://www.goodreads.com/book/show/12039654-going-to-sea-in-a-sieve?utm_medium=api&amp;utm_source=rss"><img alt="Going to Sea in a Sieve: The Autobiography" src="http://d.gr-assets.com/books/1365160326s/12039654.jpg" /></a><br />\n                                      author: Danny Baker<br />\n                                      name: Gareth<br />\n                                      average rating: 4.25<br />\n                                      book published: 2012<br />\n                                      rating: 4<br />\n                                      read at: 2012/12/31<br />\n                                      date added: 2013/01/01<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/491359898?utm_medium=api&utm_source=rss	205-going-to-sea-in-a-sieve-the-autobiography				
659	13	https://www.netflix.com/WiMovie/80046814?trkid=200250783	How to Get Away with Murder: Season 1: "The Night Lila Died"	2015-11-30 21:00:00+00								
206	8	http://www.goodreads.com/review/show/472050372?utm_medium=api&utm_source=rss	Is Everyone Hanging Out Without Me? (And Other Concerns)	2012-12-07 12:30:31+00		<a href="http://www.goodreads.com/book/show/10335308-is-everyone-hanging-out-without-me?utm_medium=api&amp;utm_source=rss"><img alt="Is Everyone Hanging Out Without Me? (And Other Concerns)" src="http://d.gr-assets.com/books/1443264638s/10335308.jpg" /></a><br />\n                                      author: Mindy Kaling<br />\n                                      name: Gareth<br />\n                                      average rating: 3.83<br />\n                                      book published: 2011<br />\n                                      rating: 2<br />\n                                      read at: 2012/12/01<br />\n                                      date added: 2012/12/07<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/472050372?utm_medium=api&utm_source=rss	206-is-everyone-hanging-out-without-me-and-other-c				
207	8	http://www.goodreads.com/review/show/441595431?utm_medium=api&utm_source=rss	Card Tricks For Beginners (Breese's Guides)	2012-11-19 18:26:46+00		<a href="http://www.goodreads.com/book/show/2745580-card-tricks-for-beginners?utm_medium=api&amp;utm_source=rss"><img alt="Card Tricks For Beginners (Breese's Guides)" src="http://s.gr-assets.com/assets/nophoto/book/50x75-a91bf249278a81aabab721ef782c4a74.png" /></a><br />\n                                      author: Harry Baron<br />\n                                      name: Gareth<br />\n                                      average rating: 2.00<br />\n                                      book published: 2011<br />\n                                      rating: 2<br />\n                                      read at: 2012/11/19<br />\n                                      date added: 2012/11/19<br />\n                                      shelves: magic<br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/441595431?utm_medium=api&utm_source=rss	207-card-tricks-for-beginners-breeses-guides				
208	8	http://www.goodreads.com/review/show/442059319?utm_medium=api&utm_source=rss	Hiding the Elephant: How Magicians Invented the Impossible and Learned to Disappear	2012-10-26 07:42:47+01		<a href="http://www.goodreads.com/book/show/202703.Hiding_the_Elephant?utm_medium=api&amp;utm_source=rss"><img alt="Hiding the Elephant: How Magicians Invented the Impossible and Learned to Disappear" src="http://d.gr-assets.com/books/1388731632s/202703.jpg" /></a><br />\n                                      author: Jim Steinmeyer<br />\n                                      name: Gareth<br />\n                                      average rating: 4.09<br />\n                                      book published: 2003<br />\n                                      rating: 5<br />\n                                      read at: <br />\n                                      date added: 2012/10/26<br />\n                                      shelves: magic<br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/442059319?utm_medium=api&utm_source=rss	208-hiding-the-elephant-how-magicians-invented-the				
209	8	http://www.goodreads.com/review/show/442059192?utm_medium=api&utm_source=rss	The Royal Road to Card Magic	2012-10-26 07:42:10+01		<a href="http://www.goodreads.com/book/show/1429280.The_Royal_Road_to_Card_Magic?utm_medium=api&amp;utm_source=rss"><img alt="The Royal Road to Card Magic" src="http://d.gr-assets.com/books/1328867180s/1429280.jpg" /></a><br />\n                                      author: Jean Hugard<br />\n                                      name: Gareth<br />\n                                      average rating: 4.44<br />\n                                      book published: 1981<br />\n                                      rating: 5<br />\n                                      read at: <br />\n                                      date added: 2012/10/26<br />\n                                      shelves: magic<br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/442059192?utm_medium=api&utm_source=rss	209-the-royal-road-to-card-magic				
210	8	http://www.goodreads.com/review/show/442059047?utm_medium=api&utm_source=rss	Card College, Volume 1: A Complete Course in Sleight of Hand Card Magic	2012-10-26 07:41:26+01		<a href="http://www.goodreads.com/book/show/1664637.Card_College_Volume_1?utm_medium=api&amp;utm_source=rss"><img alt="Card College, Volume 1: A Complete Course in Sleight of Hand Card Magic" src="http://d.gr-assets.com/books/1341528631s/1664637.jpg" /></a><br />\n                                      author: Roberto Giobbi<br />\n                                      name: Gareth<br />\n                                      average rating: 4.54<br />\n                                      book published: 1992<br />\n                                      rating: 0<br />\n                                      read at: 2010/11/02<br />\n                                      date added: 2012/10/26<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/442059047?utm_medium=api&utm_source=rss	210-card-college-volume-1-a-complete-course-in-sle				
211	8	http://www.goodreads.com/review/show/441594839?utm_medium=api&utm_source=rss	Fooling Houdini: Magicians, Mentalists, Math Geeks, and the Hidden Powers of the Mind	2012-10-25 16:20:21+01		<a href="http://www.goodreads.com/book/show/13183927-fooling-houdini?utm_medium=api&amp;utm_source=rss"><img alt="Fooling Houdini: Magicians, Mentalists, Math Geeks, and the Hidden Powers of the Mind" src="http://d.gr-assets.com/books/1332894558s/13183927.jpg" /></a><br />\n                                      author: Alex  Stone<br />\n                                      name: Gareth<br />\n                                      average rating: 3.62<br />\n                                      book published: 2011<br />\n                                      rating: 4<br />\n                                      read at: 2012/10/12<br />\n                                      date added: 2012/10/25<br />\n                                      shelves: magic<br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/441594839?utm_medium=api&utm_source=rss	211-fooling-houdini-magicians-mentalists-math-geek				
212	8	http://www.goodreads.com/review/show/423613147?utm_medium=api&utm_source=rss	The Men Who Stare at Goats	2012-09-28 08:29:49+01		<a href="http://www.goodreads.com/book/show/1824.The_Men_Who_Stare_at_Goats?utm_medium=api&amp;utm_source=rss"><img alt="The Men Who Stare at Goats" src="http://d.gr-assets.com/books/1437183381s/1824.jpg" /></a><br />\n                                      author: Jon Ronson<br />\n                                      name: Gareth<br />\n                                      average rating: 3.59<br />\n                                      book published: 2004<br />\n                                      rating: 4<br />\n                                      read at: 2012/09/24<br />\n                                      date added: 2012/09/28<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/423613147?utm_medium=api&utm_source=rss	212-the-men-who-stare-at-goats				
660	13	https://www.netflix.com/WiMovie/80000499?trkid=200250783	Forensic Files: Forensic Files: Collection: "Church Dis-service"	2015-11-29 15:00:00+00								
213	8	http://www.goodreads.com/review/show/402926634?utm_medium=api&utm_source=rss	Eleanor Rigby	2012-08-29 14:48:28+01		<a href="http://www.goodreads.com/book/show/10008.Eleanor_Rigby?utm_medium=api&amp;utm_source=rss"><img alt="Eleanor Rigby" src="http://d.gr-assets.com/books/1439806437s/10008.jpg" /></a><br />\n                                      author: Douglas Coupland<br />\n                                      name: Gareth<br />\n                                      average rating: 3.64<br />\n                                      book published: 2004<br />\n                                      rating: 0<br />\n                                      read at: <br />\n                                      date added: 2012/08/29<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/402926634?utm_medium=api&utm_source=rss	213-eleanor-rigby				
661	13	https://www.netflix.com/WiMovie/80000498?trkid=200250783	Forensic Files: Forensic Files: Collection: "Fashion Police"	2015-11-29 16:00:00+00								
214	8	http://www.goodreads.com/review/show/32760961?utm_medium=api&utm_source=rss	Watchmen	2012-08-29 14:45:28+01		<a href="http://www.goodreads.com/book/show/472331.Watchmen?utm_medium=api&amp;utm_source=rss"><img alt="Watchmen" src="http://d.gr-assets.com/books/1442239711s/472331.jpg" /></a><br />\n                                      author: Alan Moore<br />\n                                      name: Gareth<br />\n                                      average rating: 4.33<br />\n                                      book published: 1987<br />\n                                      rating: 5<br />\n                                      read at: <br />\n                                      date added: 2012/08/29<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/32760961?utm_medium=api&utm_source=rss	214-watchmen				
662	13	https://www.netflix.com/WiMovie/80046813?trkid=200250783	How to Get Away with Murder: Season 1: "Mama's Here Now"	2015-11-29 17:00:00+00								
215	8	http://www.goodreads.com/review/show/32761025?utm_medium=api&utm_source=rss	The Road	2012-08-29 14:45:25+01		<a href="http://www.goodreads.com/book/show/6288.The_Road?utm_medium=api&amp;utm_source=rss"><img alt="The Road" src="http://d.gr-assets.com/books/1439197219s/6288.jpg" /></a><br />\n                                      author: Cormac McCarthy<br />\n                                      name: Gareth<br />\n                                      average rating: 3.94<br />\n                                      book published: 2006<br />\n                                      rating: 3<br />\n                                      read at: <br />\n                                      date added: 2012/08/29<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/32761025?utm_medium=api&utm_source=rss	215-the-road				
663	13	https://www.netflix.com/WiMovie/80065723?trkid=200250783	Master of None: Season 1: "Plan B"	2015-11-28 15:00:00+00								
216	8	http://www.goodreads.com/review/show/327905175?utm_medium=api&utm_source=rss	The Burgess Book of Lies	2012-08-29 14:45:17+01		<a href="http://www.goodreads.com/book/show/215454.The_Burgess_Book_of_Lies?utm_medium=api&amp;utm_source=rss"><img alt="The Burgess Book of Lies" src="http://d.gr-assets.com/books/1348530441s/215454.jpg" /></a><br />\n                                      author: Adrian Burgess<br />\n                                      name: Gareth<br />\n                                      average rating: 3.52<br />\n                                      book published: 1994<br />\n                                      rating: 2<br />\n                                      read at: 2012/07/23<br />\n                                      date added: 2012/08/29<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/327905175?utm_medium=api&utm_source=rss	216-the-burgess-book-of-lies				
664	13	https://www.netflix.com/WiMovie/80000497?trkid=200250783	Forensic Files: Forensic Files: Collection: "Sworded Scheme"	2015-11-28 16:00:00+00								
217	8	http://www.goodreads.com/review/show/327905329?utm_medium=api&utm_source=rss	The Psychopath Test: A Journey Through the Madness Industry	2012-08-29 14:45:11+01		<a href="http://www.goodreads.com/book/show/9378733-the-psychopath-test?utm_medium=api&amp;utm_source=rss"><img alt="The Psychopath Test: A Journey Through the Madness Industry" src="http://d.gr-assets.com/books/1307825196s/9378733.jpg" /></a><br />\n                                      author: Jon Ronson<br />\n                                      name: Gareth<br />\n                                      average rating: 3.87<br />\n                                      book published: 2011<br />\n                                      rating: 4<br />\n                                      read at: <br />\n                                      date added: 2012/08/29<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/327905329?utm_medium=api&utm_source=rss	217-the-psychopath-test-a-journey-through-the-madn				
218	8	http://www.goodreads.com/review/show/374917179?utm_medium=api&utm_source=rss	Revelation Space (Revelation Space, #1)	2012-08-29 14:45:01+01		<a href="http://www.goodreads.com/book/show/89187.Revelation_Space?utm_medium=api&amp;utm_source=rss"><img alt="Revelation Space (Revelation Space, #1)" src="http://d.gr-assets.com/books/1405532042s/89187.jpg" /></a><br />\n                                      author: Alastair Reynolds<br />\n                                      name: Gareth<br />\n                                      average rating: 3.96<br />\n                                      book published: 2000<br />\n                                      rating: 2<br />\n                                      read at: 2012/08/29<br />\n                                      date added: 2012/08/29<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/374917179?utm_medium=api&utm_source=rss	218-revelation-space-revelation-space-1				
219	8	http://www.goodreads.com/review/show/402922572?utm_medium=api&utm_source=rss	Eiger Dreams: Ventures Among Men and Mountains	2012-08-29 14:44:58+01		<a href="http://www.goodreads.com/book/show/1897.Eiger_Dreams?utm_medium=api&amp;utm_source=rss"><img alt="Eiger Dreams: Ventures Among Men and Mountains" src="http://d.gr-assets.com/books/1388341505s/1897.jpg" /></a><br />\n                                      author: Jon Krakauer<br />\n                                      name: Gareth<br />\n                                      average rating: 3.94<br />\n                                      book published: 1990<br />\n                                      rating: 4<br />\n                                      read at: 2011/12/30<br />\n                                      date added: 2012/08/29<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/402922572?utm_medium=api&utm_source=rss	219-eiger-dreams-ventures-among-men-and-mountains				
665	13	https://www.netflix.com/WiMovie/80000496?trkid=200250783	Forensic Files: Forensic Files: Collection: "Sands of Crime"	2015-11-28 17:00:00+00								
220	8	http://www.goodreads.com/review/show/402923246?utm_medium=api&utm_source=rss	The Tipping Point: How Little Things Can Make a Big Difference	2012-08-29 14:44:54+01		<a href="http://www.goodreads.com/book/show/2612.The_Tipping_Point?utm_medium=api&amp;utm_source=rss"><img alt="The Tipping Point: How Little Things Can Make a Big Difference" src="http://d.gr-assets.com/books/1442270711s/2612.jpg" /></a><br />\n                                      author: Malcolm Gladwell<br />\n                                      name: Gareth<br />\n                                      average rating: 3.86<br />\n                                      book published: 2000<br />\n                                      rating: 3<br />\n                                      read at: <br />\n                                      date added: 2012/08/29<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/402923246?utm_medium=api&utm_source=rss	220-the-tipping-point-how-little-things-can-make-a				
666	13	https://www.netflix.com/WiMovie/80000495?trkid=200250783	Forensic Files: Forensic Files: Collection: "A Cinderella Story"	2015-11-28 18:00:00+00								
221	8	http://www.goodreads.com/review/show/402923329?utm_medium=api&utm_source=rss	Outliers: The Story of Success	2012-08-29 14:44:53+01		<a href="http://www.goodreads.com/book/show/3228917-outliers?utm_medium=api&amp;utm_source=rss"><img alt="Outliers: The Story of Success" src="http://d.gr-assets.com/books/1344266315s/3228917.jpg" /></a><br />\n                                      author: Malcolm Gladwell<br />\n                                      name: Gareth<br />\n                                      average rating: 4.08<br />\n                                      book published: 2008<br />\n                                      rating: 4<br />\n                                      read at: <br />\n                                      date added: 2012/08/29<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/402923329?utm_medium=api&utm_source=rss	221-outliers-the-story-of-success				
667	13	https://www.netflix.com/WiMovie/80046812?trkid=200250783	How to Get Away with Murder: Season 1: "She's a Murderer"	2015-11-28 19:00:00+00								
222	8	http://www.goodreads.com/review/show/402923406?utm_medium=api&utm_source=rss	Blink: The Power of Thinking Without Thinking	2012-08-29 14:44:51+01		<a href="http://www.goodreads.com/book/show/40102.Blink?utm_medium=api&amp;utm_source=rss"><img alt="Blink: The Power of Thinking Without Thinking" src="http://d.gr-assets.com/books/1440763417s/40102.jpg" /></a><br />\n                                      author: Malcolm Gladwell<br />\n                                      name: Gareth<br />\n                                      average rating: 3.85<br />\n                                      book published: 2001<br />\n                                      rating: 5<br />\n                                      read at: <br />\n                                      date added: 2012/08/29<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/402923406?utm_medium=api&utm_source=rss	222-blink-the-power-of-thinking-without-thinking				
268	12	http://strava.com/activities/369641223	08/15/2015 Barnet, United Kingdom	2015-08-15 07:26:52+01		Run (Barnet): Distance: 11.7km, Elevation Gain: 44m, Moving Time: 01:01:19, Average Speed: 11.4km/h	http://strava.com/activities/369641223	268-08152015-barnet-united-kingdom				
223	8	http://www.goodreads.com/review/show/402922336?utm_medium=api&utm_source=rss	Into the Wild	2012-08-29 14:41:08+01		<a href="http://www.goodreads.com/book/show/1845.Into_the_Wild?utm_medium=api&amp;utm_source=rss"><img alt="Into the Wild" src="http://d.gr-assets.com/books/1403173986s/1845.jpg" /></a><br />\n                                      author: Jon Krakauer<br />\n                                      name: Gareth<br />\n                                      average rating: 3.91<br />\n                                      book published: 1996<br />\n                                      rating: 4<br />\n                                      read at: <br />\n                                      date added: 2012/08/29<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/402922336?utm_medium=api&utm_source=rss	223-into-the-wild				
668	13	https://www.netflix.com/WiMovie/80000494?trkid=200250783	Forensic Files: Forensic Files: Collection: "Catch 22"	2015-11-26 20:00:00+00								
224	8	http://www.goodreads.com/review/show/402915209?utm_medium=api&utm_source=rss	Into Thin Air: A Personal Account of the Mount Everest Disaster	2012-08-29 14:29:49+01		<a href="http://www.goodreads.com/book/show/1898.Into_Thin_Air?utm_medium=api&amp;utm_source=rss"><img alt="Into Thin Air: A Personal Account of the Mount Everest Disaster" src="http://d.gr-assets.com/books/1446286672s/1898.jpg" /></a><br />\n                                      author: Jon Krakauer<br />\n                                      name: Gareth<br />\n                                      average rating: 4.08<br />\n                                      book published: 1997<br />\n                                      rating: 5<br />\n                                      read at: 2010/12/26<br />\n                                      date added: 2012/08/29<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/402915209?utm_medium=api&utm_source=rss	224-into-thin-air-a-personal-account-of-the-mount-				
669	13	https://www.netflix.com/WiMovie/80046811?trkid=200250783	How to Get Away with Murder: Season 1: "Best Christmas Ever"	2015-11-26 21:00:00+00								
670	13	https://www.netflix.com/WiMovie/80000493?trkid=200250783	Forensic Files: Forensic Files: Collection: "Sole Survivor"	2015-11-25 20:00:00+00								
671	13	https://www.netflix.com/WiMovie/80046810?trkid=200250783	How to Get Away with Murder: Season 1: "Hello Raskolnikov"	2015-11-25 21:00:00+00								
672	13	https://www.netflix.com/WiMovie/80046809?trkid=200250783	How to Get Away with Murder: Season 1: "Kill Me, Kill Me, Kill Me"	2015-11-20 20:00:00+00								
225	8	http://www.goodreads.com/review/show/402914105?utm_medium=api&utm_source=rss	Adrian Mole: The Prostrate Years (Adrian Mole, #8)	2012-08-29 14:27:33+01		<a href="http://www.goodreads.com/book/show/6619022-adrian-mole?utm_medium=api&amp;utm_source=rss"><img alt="Adrian Mole: The Prostrate Years (Adrian Mole, #8)" src="http://d.gr-assets.com/books/1348042201s/6619022.jpg" /></a><br />\n                                      author: Sue Townsend<br />\n                                      name: Gareth<br />\n                                      average rating: 3.98<br />\n                                      book published: 2009<br />\n                                      rating: 0<br />\n                                      read at: <br />\n                                      date added: 2012/08/29<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/402914105?utm_medium=api&utm_source=rss	225-adrian-mole-the-prostrate-years-adrian-mole-8				
285	12	http://strava.com/activities/344603981	Afternoon Ride	2015-07-12 15:36:32+01		Ride (Barnet): Distance: 22.4km, Elevation Gain: 129m, Moving Time: 00:51:47, Average Speed: 26.0km/h	http://strava.com/activities/344603981	285-afternoon-ride				
226	8	http://www.goodreads.com/review/show/402913881?utm_medium=api&utm_source=rss	Adrian Mole: The Lost Years (Adrian Mole #1-4)	2012-08-29 14:27:25+01		<a href="http://www.goodreads.com/book/show/51073.Adrian_Mole?utm_medium=api&amp;utm_source=rss"><img alt="Adrian Mole: The Lost Years (Adrian Mole #1-4)" src="http://d.gr-assets.com/books/1387726486s/51073.jpg" /></a><br />\n                                      author: Sue Townsend<br />\n                                      name: Gareth<br />\n                                      average rating: 3.83<br />\n                                      book published: 1994<br />\n                                      rating: 4<br />\n                                      read at: 2012/08/24<br />\n                                      date added: 2012/08/29<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/402913881?utm_medium=api&utm_source=rss	226-adrian-mole-the-lost-years-adrian-mole-1-4				
227	8	http://www.goodreads.com/review/show/402913052?utm_medium=api&utm_source=rss	The Last Greatest Magician in the World: Howard Thurston versus Houdini & the Battles of the American Wizards	2012-08-29 14:25:40+01		<a href="http://www.goodreads.com/book/show/9598209-the-last-greatest-magician-in-the-world?utm_medium=api&amp;utm_source=rss"><img alt="The Last Greatest Magician in the World: Howard Thurston versus Houdini &amp; the Battles of the American Wizards" src="http://d.gr-assets.com/books/1348845121s/9598209.jpg" /></a><br />\n                                      author: Jim Steinmeyer<br />\n                                      name: Gareth<br />\n                                      average rating: 3.72<br />\n                                      book published: 2011<br />\n                                      rating: 3<br />\n                                      read at: <br />\n                                      date added: 2012/08/29<br />\n                                      shelves: magic<br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/402913052?utm_medium=api&utm_source=rss	227-the-last-greatest-magician-in-the-world-howard				
228	8	http://www.goodreads.com/review/show/374917597?utm_medium=api&utm_source=rss	The Glorious Deception: The Double Life of William Robinson, aka Chung Ling Soo, the "Marvelous Chinese Conjurer"	2012-07-23 11:18:51+01		<a href="http://www.goodreads.com/book/show/377911.The_Glorious_Deception?utm_medium=api&amp;utm_source=rss"><img alt="The Glorious Deception: The Double Life of William Robinson, aka Chung Ling Soo, the &quot;Marvelous Chinese Conjurer&quot;" src="http://d.gr-assets.com/books/1404537823s/377911.jpg" /></a><br />\n                                      author: Jim Steinmeyer<br />\n                                      name: Gareth<br />\n                                      average rating: 4.06<br />\n                                      book published: 2005<br />\n                                      rating: 4<br />\n                                      read at: <br />\n                                      date added: 2012/07/23<br />\n                                      shelves: magic<br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/374917597?utm_medium=api&utm_source=rss	228-the-glorious-deception-the-double-life-of-will				
229	8	http://www.goodreads.com/review/show/30443829?utm_medium=api&utm_source=rss	The Collected Short Stories	2012-07-23 11:18:29+01		<a href="http://www.goodreads.com/book/show/130105.The_Collected_Short_Stories?utm_medium=api&amp;utm_source=rss"><img alt="The Collected Short Stories" src="http://d.gr-assets.com/books/1289491532s/130105.jpg" /></a><br />\n                                      author: Roald Dahl<br />\n                                      name: Gareth<br />\n                                      average rating: 4.36<br />\n                                      book published: 1991<br />\n                                      rating: 0<br />\n                                      read at: 2012/07/23<br />\n                                      date added: 2012/07/23<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/30443829?utm_medium=api&utm_source=rss	229-the-collected-short-stories				
230	8	http://www.goodreads.com/review/show/32761070?utm_medium=api&utm_source=rss	Naked	2012-07-23 11:18:25+01		<a href="http://www.goodreads.com/book/show/4138.Naked?utm_medium=api&amp;utm_source=rss"><img alt="Naked" src="http://d.gr-assets.com/books/1394178867s/4138.jpg" /></a><br />\n                                      author: David Sedaris<br />\n                                      name: Gareth<br />\n                                      average rating: 4.07<br />\n                                      book published: 1997<br />\n                                      rating: 0<br />\n                                      read at: 2012/07/23<br />\n                                      date added: 2012/07/23<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/32761070?utm_medium=api&utm_source=rss	230-naked				
231	8	http://www.goodreads.com/review/show/327905386?utm_medium=api&utm_source=rss	Dai Vernon:  A Biography--Artist - Magician - Muse (Vol. 1: 1894-1941)	2012-05-11 10:20:17+01		<a href="http://www.goodreads.com/book/show/989237.Dai_Vernon?utm_medium=api&amp;utm_source=rss"><img alt="Dai Vernon:  A Biography--Artist - Magician - Muse (Vol. 1: 1894-1941)" src="http://d.gr-assets.com/books/1387714838s/989237.jpg" /></a><br />\n                                      author: David Ben<br />\n                                      name: Gareth<br />\n                                      average rating: 4.41<br />\n                                      book published: 2006<br />\n                                      rating: 4<br />\n                                      read at: <br />\n                                      date added: 2012/05/11<br />\n                                      shelves: magic<br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/327905386?utm_medium=api&utm_source=rss	231-dai-vernon-a-biography-artist-magician-muse-vo				
232	8	http://www.goodreads.com/review/show/5757249?utm_medium=api&utm_source=rss	Travels in the Scriptorium	2009-12-17 17:08:42+00		<a href="http://www.goodreads.com/book/show/454.Travels_in_the_Scriptorium?utm_medium=api&amp;utm_source=rss"><img alt="Travels in the Scriptorium " src="http://d.gr-assets.com/books/1436395511s/454.jpg" /></a><br />\n                                      author: Paul Auster<br />\n                                      name: Gareth<br />\n                                      average rating: 3.20<br />\n                                      book published: 2005<br />\n                                      rating: 3<br />\n                                      read at: 2007/09/01<br />\n                                      date added: 2009/12/17<br />\n                                      shelves: <br />\n                                      review: <br />one of the quotes on the back of this book claims "fans won't be able to resist consuming it whole" which is a safe enough bet given then the book is only 90 pages long.<br />It's incredibly referential of Auster's previous work so "fans" will probably wring more from it.<br />I enjoyed it, I love Auster's voice &amp; style, but the novel is too simple to be as compelling or engaging as some of Auster's previous work. If his "New York Trilogy" is a puzzle, this is just a jigsaw piece.<br />	http://www.goodreads.com/review/show/5757249?utm_medium=api&utm_source=rss	232-travels-in-the-scriptorium				
673	13	https://www.netflix.com/WiMovie/80000491?trkid=200250783	Forensic Files: Forensic Files: Collection: "Wheel of Misfortune"	2015-11-19 20:00:00+00								
233	8	http://www.goodreads.com/review/show/32761076?utm_medium=api&utm_source=rss	Dress Your Family in Corduroy and Denim	2008-09-13 13:11:05+01		<a href="http://www.goodreads.com/book/show/10176.Dress_Your_Family_in_Corduroy_and_Denim?utm_medium=api&amp;utm_source=rss"><img alt="Dress Your Family in Corduroy and Denim" src="http://d.gr-assets.com/books/1352983006s/10176.jpg" /></a><br />\n                                      author: David Sedaris<br />\n                                      name: Gareth<br />\n                                      average rating: 4.08<br />\n                                      book published: 2004<br />\n                                      rating: 0<br />\n                                      read at: <br />\n                                      date added: 2008/09/13<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/32761076?utm_medium=api&utm_source=rss	233-dress-your-family-in-corduroy-and-denim				
234	8	http://www.goodreads.com/review/show/32761065?utm_medium=api&utm_source=rss	Me Talk Pretty One Day	2008-09-13 13:10:43+01		<a href="http://www.goodreads.com/book/show/4137.Me_Talk_Pretty_One_Day?utm_medium=api&amp;utm_source=rss"><img alt="Me Talk Pretty One Day" src="http://d.gr-assets.com/books/1431013639s/4137.jpg" /></a><br />\n                                      author: David Sedaris<br />\n                                      name: Gareth<br />\n                                      average rating: 3.96<br />\n                                      book published: 2000<br />\n                                      rating: 0<br />\n                                      read at: <br />\n                                      date added: 2008/09/13<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/32761065?utm_medium=api&utm_source=rss	234-me-talk-pretty-one-day				
235	8	http://www.goodreads.com/review/show/32761015?utm_medium=api&utm_source=rss	The Rain Before it Falls	2008-09-13 13:09:12+01		<a href="http://www.goodreads.com/book/show/895807.The_Rain_Before_it_Falls?utm_medium=api&amp;utm_source=rss"><img alt="The Rain Before it Falls" src="http://d.gr-assets.com/books/1429787713s/895807.jpg" /></a><br />\n                                      author: Jonathan Coe<br />\n                                      name: Gareth<br />\n                                      average rating: 3.61<br />\n                                      book published: 2007<br />\n                                      rating: 0<br />\n                                      read at: <br />\n                                      date added: 2008/09/13<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/32761015?utm_medium=api&utm_source=rss	235-the-rain-before-it-falls				
236	8	http://www.goodreads.com/review/show/32760875?utm_medium=api&utm_source=rss	The Diving Bell and the Butterfly	2008-09-13 13:06:34+01		<a href="http://www.goodreads.com/book/show/193755.The_Diving_Bell_and_the_Butterfly?utm_medium=api&amp;utm_source=rss"><img alt="The Diving Bell and the Butterfly" src="http://d.gr-assets.com/books/1336930564s/193755.jpg" /></a><br />\n                                      author: Jean-Dominique Bauby<br />\n                                      name: Gareth<br />\n                                      average rating: 4.01<br />\n                                      book published: 1997<br />\n                                      rating: 0<br />\n                                      read at: <br />\n                                      date added: 2008/09/13<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/32760875?utm_medium=api&utm_source=rss	236-the-diving-bell-and-the-butterfly				
237	8	http://www.goodreads.com/review/show/32760837?utm_medium=api&utm_source=rss	Seven Up	2008-09-13 13:04:21+01		<a href="http://www.goodreads.com/book/show/2486462.Seven_Up?utm_medium=api&amp;utm_source=rss"><img alt="Seven Up" src="http://d.gr-assets.com/books/1319098465s/2486462.jpg" /></a><br />\n                                      author: Stella Bruzzi<br />\n                                      name: Gareth<br />\n                                      average rating: 3.00<br />\n                                      book published: 1999<br />\n                                      rating: 3<br />\n                                      read at: <br />\n                                      date added: 2008/09/13<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/32760837?utm_medium=api&utm_source=rss	237-seven-up				
238	8	http://www.goodreads.com/review/show/30443872?utm_medium=api&utm_source=rss	Born Standing Up: A Comic's Life	2008-08-18 14:20:55+01		<a href="http://www.goodreads.com/book/show/773858.Born_Standing_Up?utm_medium=api&amp;utm_source=rss"><img alt="Born Standing Up: A Comic's Life" src="http://d.gr-assets.com/books/1348034328s/773858.jpg" /></a><br />\n                                      author: Steve Martin<br />\n                                      name: Gareth<br />\n                                      average rating: 3.85<br />\n                                      book published: 2007<br />\n                                      rating: 3<br />\n                                      read at: <br />\n                                      date added: 2008/08/18<br />\n                                      shelves: <br />\n                                      review: <br />I enjoyed it, but I was hoping that it would be both funnier and more insightful. It's basically biographical with a little inisight into the craft of stand-up, I wanted more.<br />	http://www.goodreads.com/review/show/30443872?utm_medium=api&utm_source=rss	238-born-standing-up-a-comics-life				
239	8	http://www.goodreads.com/review/show/5757273?utm_medium=api&utm_source=rss	The Business	2008-08-18 14:18:33+01		<a href="http://www.goodreads.com/book/show/886124.The_Business?utm_medium=api&amp;utm_source=rss"><img alt="The Business" src="http://d.gr-assets.com/books/1328666356s/886124.jpg" /></a><br />\n                                      author: Iain Banks<br />\n                                      name: Gareth<br />\n                                      average rating: 3.42<br />\n                                      book published: 1999<br />\n                                      rating: 3<br />\n                                      read at: 2008/08/18<br />\n                                      date added: 2008/08/18<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/5757273?utm_medium=api&utm_source=rss	239-the-business				
674	13	https://www.netflix.com/WiMovie/80000490?trkid=200250783	Forensic Files: Forensic Files: Collection: "Sharper Image"	2015-11-19 21:00:00+00								
240	8	http://www.goodreads.com/review/show/5757154?utm_medium=api&utm_source=rss	Beginning JavaScript with Dom Scripting and Ajax: From Novice to Professional	2008-08-18 14:18:00+01		<a href="http://www.goodreads.com/book/show/128986.Beginning_JavaScript_with_Dom_Scripting_and_Ajax?utm_medium=api&amp;utm_source=rss"><img alt="Beginning JavaScript with Dom Scripting and Ajax: From Novice to Professional" src="http://d.gr-assets.com/books/1348589321s/128986.jpg" /></a><br />\n                                      author: Christian Heilmann<br />\n                                      name: Gareth<br />\n                                      average rating: 3.84<br />\n                                      book published: 2006<br />\n                                      rating: 2<br />\n                                      read at: <br />\n                                      date added: 2008/08/18<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/5757154?utm_medium=api&utm_source=rss	240-beginning-javascript-with-dom-scripting-and-aj				
300	5	http://time.com/tiger	Tiger Woods 40th Birthday Interview	2015-12-16 18:24:30+00			http://time.com/tiger	300-tiger-woods-40th-birthday-interview				
241	8	http://www.goodreads.com/review/show/5753689?utm_medium=api&utm_source=rss	Adventures in the Screen Trade	2007-09-15 22:11:23+01		<a href="http://www.goodreads.com/book/show/459744.Adventures_in_the_Screen_Trade?utm_medium=api&amp;utm_source=rss"><img alt="Adventures in the Screen Trade" src="http://d.gr-assets.com/books/1344268974s/459744.jpg" /></a><br />\n                                      author: William Goldman<br />\n                                      name: Gareth<br />\n                                      average rating: 4.13<br />\n                                      book published: 1983<br />\n                                      rating: 5<br />\n                                      read at: <br />\n                                      date added: 2007/09/15<br />\n                                      shelves: <br />\n                                      review: <br />I've read this three times now. Which is all you need to know.<br />	http://www.goodreads.com/review/show/5753689?utm_medium=api&utm_source=rss	241-adventures-in-the-screen-trade				
269	12	http://strava.com/activities/369641469	08/12/2015 London, England, United Kingdom	2015-08-12 12:02:36+01		Run (London, England): Distance: 5.0km, Elevation Gain: 12m, Moving Time: 00:24:53, Average Speed: 12.1km/h	http://strava.com/activities/369641469	269-08122015-london-england-united-kingdom				
242	8	http://www.goodreads.com/review/show/5753698?utm_medium=api&utm_source=rss	The Polysyllabic Spree	2007-09-15 22:09:21+01		<a href="http://www.goodreads.com/book/show/4260.The_Polysyllabic_Spree?utm_medium=api&amp;utm_source=rss"><img alt="The Polysyllabic Spree" src="http://d.gr-assets.com/books/1327723619s/4260.jpg" /></a><br />\n                                      author: Nick Hornby<br />\n                                      name: Gareth<br />\n                                      average rating: 3.74<br />\n                                      book published: 2004<br />\n                                      rating: 3<br />\n                                      read at: <br />\n                                      date added: 2007/09/15<br />\n                                      shelves: <br />\n                                      review: <br />I like Nick Hornby, he's an affable read. This is sinilar to his earlier "31 Songs" but, for me, less interesting. It's occasionally snobbish &amp; occasionally so middle-class that it stings a bit... it's repetitive too, but given that it's a collection of contributions to a perodical over a couple of years I guess that's understandable and forgiveable.<br />It made me a laugh out loud a few times though, reminded me of some great books I've already read and gave me a nudge to read a few more.<br />	http://www.goodreads.com/review/show/5753698?utm_medium=api&utm_source=rss	242-the-polysyllabic-spree				
675	13	https://www.netflix.com/WiMovie/80046808?trkid=200250783	How to Get Away with Murder: Season 1: "He Has a Wife"	2015-11-19 22:00:00+00								
243	8	http://www.goodreads.com/review/show/6252809?utm_medium=api&utm_source=rss	A Spot of Bother	2007-09-15 21:48:11+01		<a href="http://www.goodreads.com/book/show/4701.A_Spot_of_Bother?utm_medium=api&amp;utm_source=rss"><img alt="A Spot of Bother" src="http://d.gr-assets.com/books/1428506021s/4701.jpg" /></a><br />\n                                      author: Mark Haddon<br />\n                                      name: Gareth<br />\n                                      average rating: 3.45<br />\n                                      book published: 2006<br />\n                                      rating: 4<br />\n                                      read at: 2007/09/01<br />\n                                      date added: 2007/09/15<br />\n                                      shelves: <br />\n                                      review: <br />I don't think I've ever read book in one sitting, but this was as close as I've got. It's not as loveable as "Dog In The Night", but it does have some great characters and some great set-pieces. <br />	http://www.goodreads.com/review/show/6252809?utm_medium=api&utm_source=rss	243-a-spot-of-bother				
270	12	http://strava.com/activities/365136860	Afternoon Ride	2015-08-09 15:01:12+01		Ride (Barnet): Distance: 22.5km, Elevation Gain: 238m, Moving Time: 00:57:48, Average Speed: 23.4km/h	http://strava.com/activities/365136860	270-afternoon-ride				
676	13	https://www.netflix.com/WiMovie/80000489?trkid=200250783	Forensic Files: Forensic Files: Collection: "Bitter Brew"	2015-11-18 20:00:00+00								
677	13	https://www.netflix.com/WiMovie/80000487?trkid=200250783	Forensic Files: Forensic Files: Collection: "Fired-Up"	2015-11-18 21:00:00+00								
678	13	https://www.netflix.com/WiMovie/80000486?trkid=200250783	Forensic Files: Forensic Files: Collection: "Blanket of Evidence"	2015-11-17 20:00:00+00								
679	13	https://www.netflix.com/WiMovie/80000483?trkid=200250783	Forensic Files: Forensic Files: Collection: "Small Town Terror"	2015-11-17 21:00:00+00								
680	13	https://www.netflix.com/WiMovie/80000492?trkid=200250783	Forensic Files: Forensic Files: Collection: "The Day the Music Died"	2015-11-16 20:00:00+00								
681	13	https://www.netflix.com/WiMovie/80000488?trkid=200250783	Forensic Files: Forensic Files: Collection: "Two in a Million"	2015-11-16 21:00:00+00								
257	10	https://vimeo.com/17798001	disapearance	2010-12-14 09:56:45+00		<p></p><p><p class="first">i did this</p></p><p><strong>Cast:</strong> <a href="https://vimeo.com/user5479400">Gareth Senior</a></p>	tag:vimeo,2010-12-14:clip17798001	257-disapearance				
249	7	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-7/	The Nick And Gareth Podcast #7	2009-06-02 13:07:08+01		<div style="clear: both; height: 3px; width: 300;"></div><p style="display: block; font-size: 11px; font-family: 'Open Sans', Helvetica, Arial, sans-serif; margin: 0; padding: 3px 4px; color: #999; width: 300;"><a href="https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-7/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=resource_link" style="color: #808080; font-weight: bold;" target="_blank">The Nick and Gareth Podcast #7</a><span> by </span><a href="https://www.mixcloud.com/gareth53/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=profile_link" style="color: #808080; font-weight: bold;" target="_blank">Gareth53</a><span> on </span><a href="https://www.mixcloud.com/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=homepage_link" style="color: #808080; font-weight: bold;" target="_blank"> Mixcloud</a></p><div style="clear: both; height: 3px;"></div>	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-7/	249-the-nick-and-gareth-podcast-7				
682	13	https://www.netflix.com/WiMovie/80000484?trkid=200250783	Forensic Files: Forensic Files: Collection: "Fresh Heir"	2015-11-16 22:00:00+00								
250	7	https://www.mixcloud.com/gareth53/i-know-nothing-about-hip-hop/	I Know Nothing About Hip-Hop	2009-05-29 22:11:26+01		<div style="clear: both; height: 3px; width: 300;"></div><p style="display: block; font-size: 11px; font-family: 'Open Sans', Helvetica, Arial, sans-serif; margin: 0; padding: 3px 4px; color: #999; width: 300;"><a href="https://www.mixcloud.com/gareth53/i-know-nothing-about-hip-hop/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=resource_link" style="color: #808080; font-weight: bold;" target="_blank">I Know Nothing About Hip-Hop</a><span> by </span><a href="https://www.mixcloud.com/gareth53/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=profile_link" style="color: #808080; font-weight: bold;" target="_blank">Gareth53</a><span> on </span><a href="https://www.mixcloud.com/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=homepage_link" style="color: #808080; font-weight: bold;" target="_blank"> Mixcloud</a></p><div style="clear: both; height: 3px;"></div>	https://www.mixcloud.com/gareth53/i-know-nothing-about-hip-hop/	250-i-know-nothing-about-hip-hop				
683	13	https://www.netflix.com/WiMovie/80000480?trkid=200250783	Forensic Files: Forensic Files: Collection: "A Tight Leash"	2015-11-16 23:00:00+00								
251	7	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-6/	The Nick And Gareth Podcast #6	2009-05-18 12:18:14+01		<div style="clear: both; height: 3px; width: 300;"></div><p style="display: block; font-size: 11px; font-family: 'Open Sans', Helvetica, Arial, sans-serif; margin: 0; padding: 3px 4px; color: #999; width: 300;"><a href="https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-6/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=resource_link" style="color: #808080; font-weight: bold;" target="_blank">The Nick and Gareth Podcast #6</a><span> by </span><a href="https://www.mixcloud.com/gareth53/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=profile_link" style="color: #808080; font-weight: bold;" target="_blank">Gareth53</a><span> on </span><a href="https://www.mixcloud.com/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=homepage_link" style="color: #808080; font-weight: bold;" target="_blank"> Mixcloud</a></p><div style="clear: both; height: 3px;"></div>	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-6/	251-the-nick-and-gareth-podcast-6				
684	13	https://www.netflix.com/WiMovie/80000485?trkid=200250783	Forensic Files: Forensic Files: Collection: "Step by Step"	2015-11-15 15:00:00+00								
252	7	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-5/	The Nick And Gareth Podcast #5	2009-05-11 15:10:39+01		<div style="clear: both; height: 3px; width: 300;"></div><p style="display: block; font-size: 11px; font-family: 'Open Sans', Helvetica, Arial, sans-serif; margin: 0; padding: 3px 4px; color: #999; width: 300;"><a href="https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-5/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=resource_link" style="color: #808080; font-weight: bold;" target="_blank">The Nick and Gareth Podcast #5</a><span> by </span><a href="https://www.mixcloud.com/gareth53/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=profile_link" style="color: #808080; font-weight: bold;" target="_blank">Gareth53</a><span> on </span><a href="https://www.mixcloud.com/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=homepage_link" style="color: #808080; font-weight: bold;" target="_blank"> Mixcloud</a></p><div style="clear: both; height: 3px;"></div>	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-5/	252-the-nick-and-gareth-podcast-5				
685	13	https://www.netflix.com/WiMovie/80000482?trkid=200250783	Forensic Files: Forensic Files: Collection: "Skirting the Evidence"	2015-11-15 16:00:00+00								
253	7	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-4/	The Nick And Gareth Podcast #4	2009-05-03 18:14:06+01		<div style="clear: both; height: 3px; width: 300;"></div><p style="display: block; font-size: 11px; font-family: 'Open Sans', Helvetica, Arial, sans-serif; margin: 0; padding: 3px 4px; color: #999; width: 300;"><a href="https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-4/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=resource_link" style="color: #808080; font-weight: bold;" target="_blank">The Nick And Gareth Podcast #4</a><span> by </span><a href="https://www.mixcloud.com/gareth53/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=profile_link" style="color: #808080; font-weight: bold;" target="_blank">Gareth53</a><span> on </span><a href="https://www.mixcloud.com/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=homepage_link" style="color: #808080; font-weight: bold;" target="_blank"> Mixcloud</a></p><div style="clear: both; height: 3px;"></div>	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-4/	253-the-nick-and-gareth-podcast-4				
686	13	https://www.netflix.com/WiMovie/80000481?trkid=200250783	Forensic Files: Forensic Files: Collection: "Muffled Cries"	2015-11-15 17:00:00+00								
687	13	https://www.netflix.com/WiMovie/80046807?trkid=200250783	How to Get Away with Murder: Season 1: "He Deserved to Die"	2015-11-15 18:00:00+00								
271	12	http://strava.com/activities/364366828	08/08/2015 Barnet, United Kingdom	2015-08-08 08:05:24+01		Run (Barnet): Distance: 5.0km, Elevation Gain: 38m, Moving Time: 00:21:47, Average Speed: 13.9km/h	http://strava.com/activities/364366828	271-08082015-barnet-united-kingdom				
688	13	https://www.netflix.com/WiMovie/80046806?trkid=200250783	How to Get Away with Murder: Season 1: "Freakin' Whack-a-Mole"	2015-11-15 19:00:00+00								
254	7	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-3/	The Nick And Gareth Podcast #3	2009-04-24 09:05:58+01		<div style="clear: both; height: 3px; width: 300;"></div><p style="display: block; font-size: 11px; font-family: 'Open Sans', Helvetica, Arial, sans-serif; margin: 0; padding: 3px 4px; color: #999; width: 300;"><a href="https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-3/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=resource_link" style="color: #808080; font-weight: bold;" target="_blank">The Nick and Gareth Podcast #3</a><span> by </span><a href="https://www.mixcloud.com/gareth53/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=profile_link" style="color: #808080; font-weight: bold;" target="_blank">Gareth53</a><span> on </span><a href="https://www.mixcloud.com/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=homepage_link" style="color: #808080; font-weight: bold;" target="_blank"> Mixcloud</a></p><div style="clear: both; height: 3px;"></div>	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-3/	254-the-nick-and-gareth-podcast-3				
255	7	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-2/	The Nick And Gareth Podcast #2	2009-04-17 08:46:05+01		<div style="clear: both; height: 3px; width: 300;"></div><p style="display: block; font-size: 11px; font-family: 'Open Sans', Helvetica, Arial, sans-serif; margin: 0; padding: 3px 4px; color: #999; width: 300;"><a href="https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-2/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=resource_link" style="color: #808080; font-weight: bold;" target="_blank">The Nick and Gareth Podcast #2</a><span> by </span><a href="https://www.mixcloud.com/gareth53/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=profile_link" style="color: #808080; font-weight: bold;" target="_blank">Gareth53</a><span> on </span><a href="https://www.mixcloud.com/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=homepage_link" style="color: #808080; font-weight: bold;" target="_blank"> Mixcloud</a></p><div style="clear: both; height: 3px;"></div>	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-2/	255-the-nick-and-gareth-podcast-2				
314	9	https://github.com/gareth53/gareth53_v2/compare/c6d12e4324...8299a15f95	gareth53 pushed to master at gareth53/gareth53_v2	2015-12-15 17:42:44+00		<!-- push -->\n<span class="mega-octicon octicon-git-commit"></span>\n\n<div class="time">\n  <time datetime="2015-12-15T17:42:44Z">Dec 15, 2015</time>\n</div>\n\n<div class="title">\n  <a href="https://github.com/gareth53">gareth53</a> pushed to <a href="https://github.com/gareth53/gareth53_v2/tree/master">master</a> at <a href="https://github.com/gareth53/gareth53_v2">gareth53/gareth53_v2</a>\n</div>\n\n<div class="details">\n  <a href="https://github.com/gareth53"><img alt="@gareth53" class="gravatar" height="30" src="https://avatars1.githubusercontent.com/u/39545?v=3&amp;s=60" width="30" /></a>\n\n    <div class="commits ">\n      <ul>\n        <li>\n          <span title="Gareth Senior">\n            <img alt="" height="16" src="https://2.gravatar.com/avatar/eb7287caf2279f1c30f7afee9cb7e75c?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="16" />\n          </span>\n          <code><a href="https://github.com/gareth53/gareth53_v2/commit/8299a15f9525da0b4e2ced9417e252800e229c8c">8299a15</a></code>\n          <div class="message">\n            <blockquote>\n              fixing the Sources serializer. tidying urls.py\n            </blockquote>\n          </div>\n        </li>\n      </ul>\n    </div>\n</div>	tag:github.com,2008:PushEvent/3445922026	314-gareth53-pushed-to-master-at-gareth53gareth53_				
256	7	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-1/	The Nick And Gareth Podcast #1	2009-04-15 08:39:26+01		<div style="clear: both; height: 3px; width: 300;"></div><p style="display: block; font-size: 11px; font-family: 'Open Sans', Helvetica, Arial, sans-serif; margin: 0; padding: 3px 4px; color: #999; width: 300;"><a href="https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-1/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=resource_link" style="color: #808080; font-weight: bold;" target="_blank">The Nick and Gareth Podcast #1</a><span> by </span><a href="https://www.mixcloud.com/gareth53/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=profile_link" style="color: #808080; font-weight: bold;" target="_blank">Gareth53</a><span> on </span><a href="https://www.mixcloud.com/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=homepage_link" style="color: #808080; font-weight: bold;" target="_blank"> Mixcloud</a></p><div style="clear: both; height: 3px;"></div>	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-1/	256-the-nick-and-gareth-podcast-1				
689	13	https://www.netflix.com/WiMovie/80046805?trkid=200250783	How to Get Away with Murder: Season 1: "We're Not Friends"	2015-11-14 15:00:00+00								
690	13	https://www.netflix.com/WiMovie/80046804?trkid=200250783	How to Get Away with Murder: Season 1: "Let's Get to Scooping"	2015-11-08 15:00:00+00								
691	13	https://www.netflix.com/WiMovie/80046803?trkid=200250783	How to Get Away with Murder: Season 1: "Smile, or Go to Jail"	2015-11-08 16:00:00+00								
692	13	https://www.netflix.com/WiMovie/70242981?trkid=200250783	The Central Park Five	2015-11-01 15:00:00+00								
693	13	https://www.netflix.com/WiMovie/80046802?trkid=200250783	How to Get Away with Murder: Season 1: "It's All Her Fault"	2015-11-01 16:00:00+00								
694	13	https://www.netflix.com/WiMovie/80046801?trkid=200250783	How to Get Away with Murder: Season 1: "Pilot"	2015-11-01 17:00:00+00								
695	13	https://www.netflix.com/WiMovie/80011632?trkid=200250783	Man from Reno	2015-10-18 15:00:00+01								
696	13	https://www.netflix.com/WiMovie/70300205?trkid=200250783	The Babadook	2015-10-15 20:00:00+01								
697	13	https://www.netflix.com/WiMovie/70259266?trkid=200250783	The Deep	2015-10-04 15:00:00+01								
698	13	https://www.netflix.com/WiMovie/70301275?trkid=200250783	Obvious Child	2015-10-04 16:00:00+01								
699	13	https://www.netflix.com/WiMovie/70262639?trkid=200250783	World War Z	2015-09-27 15:00:00+01								
700	13	https://www.netflix.com/WiMovie/60020714?trkid=200250783	Dressed to Kill	2015-09-14 20:00:00+01								
701	13	https://www.netflix.com/WiMovie/70098885?trkid=200250783	Surfwise	2015-09-14 21:00:00+01								
702	13	https://www.netflix.com/WiMovie/70259089?trkid=200250783	It's Such a Beautiful Day	2015-09-10 20:00:00+01								
703	13	https://www.netflix.com/WiMovie/70129529?trkid=200250783	Blackadder: Series 2: "Chains"	2015-08-29 15:00:00+01								
704	13	https://www.netflix.com/WiMovie/70062017?trkid=200250783	Red Dwarf: Series 2: "Queeg"	2015-08-29 16:00:00+01								
705	13	https://www.netflix.com/WiMovie/70291611?trkid=200250783	Beyond the Edge	2015-08-23 15:00:00+01								
706	13	https://www.netflix.com/WiMovie/70276014?trkid=200250783	Big Star: Nothing Can Hurt Me	2015-08-01 15:00:00+01								
707	13	https://www.netflix.com/WiMovie/70273777?trkid=200250783	Louis Theroux's Weird Weekends: Series 3: "India"	2015-07-29 20:00:00+01								
708	13	https://www.netflix.com/WiMovie/70273776?trkid=200250783	Louis Theroux's Weird Weekends: Series 3: "Self-Fulfilment"	2015-07-29 21:00:00+01								
709	13	https://www.netflix.com/WiMovie/70222222?trkid=200250783	Louis Theroux's Weird Weekends: Series 2: "Swingers"	2015-07-29 22:00:00+01								
710	13	https://www.netflix.com/WiMovie/80022983?trkid=200250783	All This Mayhem	2015-07-26 15:00:00+01								
711	13	https://www.netflix.com/WiMovie/70299904?trkid=200250783	The Battered Bastards of Baseball	2015-06-09 20:00:00+01								
263	9	https://github.com/gareth53/grogan/compare/b2ac32423e...17ed473e00	gareth53 pushed to master at gareth53/grogan	2015-10-30 16:50:46+00		<!-- push -->\n<span class="mega-octicon octicon-git-commit"></span>\n\n<div class="time">\n  <time datetime="2015-10-30T16:50:46Z">Oct 30, 2015</time>\n</div>\n\n<div class="title">\n  <a href="https://github.com/gareth53">gareth53</a> pushed to <a href="https://github.com/gareth53/grogan/tree/master">master</a> at <a href="https://github.com/gareth53/grogan">gareth53/grogan</a>\n</div>\n\n<div class="details">\n  <a href="https://github.com/gareth53"><img alt="@gareth53" class="gravatar" height="30" src="https://avatars1.githubusercontent.com/u/39545?v=3&amp;s=60" width="30" /></a>\n\n    <div class="commits ">\n      <ul>\n        <li>\n          <span title="Gareth Senior">\n            <img alt="" height="16" src="https://2.gravatar.com/avatar/eb7287caf2279f1c30f7afee9cb7e75c?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="16" />\n          </span>\n          <code><a href="https://github.com/gareth53/grogan/commit/17ed473e00b7d1180f7ed0eb6863f745a2212931">17ed473</a></code>\n          <div class="message">\n            <blockquote>\n              now handling POST data on the edit croips admin flow\n            </blockquote>\n          </div>\n        </li>\n        <li>\n          <span title="Gareth Senior">\n            <img alt="" height="16" src="https://2.gravatar.com/avatar/eb7287caf2279f1c30f7afee9cb7e75c?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="16" />\n          </span>\n          <code><a href="https://github.com/gareth53/grogan/commit/1f68cb63e0e35ab4e7ce40ce8216dcafa9a6d83a">1f68cb6</a></code>\n          <div class="message">\n            <blockquote>\n              updated readme with work what has been done\n            </blockquote>\n          </div>\n        </li>\n        <li class="more"><a href="https://github.com/gareth53/grogan/compare/b2ac32423e...17ed473e00">View comparison for these 2 commits &raquo;</a></li>\n      </ul>\n    </div>\n</div>	tag:github.com,2008:PushEvent/3292966338	263-gareth53-pushed-to-master-at-gareth53grogan				
712	13	https://www.netflix.com/WiMovie/70268450?trkid=200250783	The Summit	2015-06-06 15:00:00+01								
264	9	https://github.com/gareth53/grogan/compare/15ecccf696...2969a6a26d	gareth53 pushed to master at gareth53/grogan	2015-10-30 16:09:09+00		<!-- push -->\n<span class="mega-octicon octicon-git-commit"></span>\n\n<div class="time">\n  <time datetime="2015-10-30T16:09:09Z">Oct 30, 2015</time>\n</div>\n\n<div class="title">\n  <a href="https://github.com/gareth53">gareth53</a> pushed to <a href="https://github.com/gareth53/grogan/tree/master">master</a> at <a href="https://github.com/gareth53/grogan">gareth53/grogan</a>\n</div>\n\n<div class="details">\n  <a href="https://github.com/gareth53"><img alt="@gareth53" class="gravatar" height="30" src="https://avatars1.githubusercontent.com/u/39545?v=3&amp;s=60" width="30" /></a>\n\n    <div class="commits ">\n      <ul>\n        <li>\n          <span title="Gareth Senior">\n            <img alt="" height="16" src="https://2.gravatar.com/avatar/eb7287caf2279f1c30f7afee9cb7e75c?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="16" />\n          </span>\n          <code><a href="https://github.com/gareth53/grogan/commit/2969a6a26df2a449b7f8eec718b049127adb995e">2969a6a</a></code>\n          <div class="message">\n            <blockquote>\n              fixture\n            </blockquote>\n          </div>\n        </li>\n      </ul>\n    </div>\n</div>	tag:github.com,2008:PushEvent/3292801967	264-gareth53-pushed-to-master-at-gareth53grogan				
713	13	https://www.netflix.com/WiMovie/80000479?trkid=200250783	Forensic Files: Forensic Files: Collection: "If I Were You"	2015-05-31 15:00:00+01								
265	9	https://github.com/gareth53/grogan/compare/8921e03246...15ecccf696	gareth53 pushed to master at gareth53/grogan	2015-10-30 16:07:36+00		<!-- push -->\n<span class="mega-octicon octicon-git-commit"></span>\n\n<div class="time">\n  <time datetime="2015-10-30T16:07:36Z">Oct 30, 2015</time>\n</div>\n\n<div class="title">\n  <a href="https://github.com/gareth53">gareth53</a> pushed to <a href="https://github.com/gareth53/grogan/tree/master">master</a> at <a href="https://github.com/gareth53/grogan">gareth53/grogan</a>\n</div>\n\n<div class="details">\n  <a href="https://github.com/gareth53"><img alt="@gareth53" class="gravatar" height="30" src="https://avatars1.githubusercontent.com/u/39545?v=3&amp;s=60" width="30" /></a>\n\n    <div class="commits ">\n      <ul>\n        <li>\n          <span title="Gareth Senior">\n            <img alt="" height="16" src="https://2.gravatar.com/avatar/eb7287caf2279f1c30f7afee9cb7e75c?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="16" />\n          </span>\n          <code><a href="https://github.com/gareth53/grogan/commit/15ecccf69659decee53cb7871de9e495a3ff3ce2">15ecccf</a></code>\n          <div class="message">\n            <blockquote>\n              whitespace\n            </blockquote>\n          </div>\n        </li>\n      </ul>\n    </div>\n</div>	tag:github.com,2008:PushEvent/3292796023	265-gareth53-pushed-to-master-at-gareth53grogan				
714	13	https://www.netflix.com/WiMovie/80035426?trkid=200250783	The New Detectives: Case Studies in Forensic Science: Best of the New Detectives: "Texas Rangers"	2015-05-31 16:00:00+01								
272	12	http://strava.com/activities/364367005	08/06/2015 Barnet, United Kingdom	2015-08-06 17:12:34+01		Run (Barnet): Distance: 6.0km, Elevation Gain: 25m, Moving Time: 00:32:28, Average Speed: 11.1km/h	http://strava.com/activities/364367005	272-08062015-barnet-united-kingdom				
715	13	https://www.netflix.com/WiMovie/70251680?trkid=200250783	Of Two Minds	2015-05-30 15:00:00+01								
273	12	http://strava.com/activities/364367154	08/04/2015 London, England, United Kingdom	2015-08-04 12:28:44+01		Run (London, England): Distance: 7.1km, Elevation Gain: 10m, Moving Time: 00:36:57, Average Speed: 11.5km/h	http://strava.com/activities/364367154	273-08042015-london-england-united-kingdom				
716	13	https://www.netflix.com/WiMovie/70290567?trkid=200250783	The Short Game	2015-05-24 15:00:00+01								
274	12	http://strava.com/activities/359338069	Morning Ride	2015-08-02 09:47:04+01		Ride (Barnet): Distance: 28.1km, Elevation Gain: 183m, Moving Time: 01:07:08, Average Speed: 25.1km/h	http://strava.com/activities/359338069	274-morning-ride				
717	13	https://www.netflix.com/WiMovie/18957965?trkid=200250783	The Blair Witch Project	2015-05-17 15:00:00+01								
262	9	https://github.com/gareth53/grogan/compare/fe960c5718...10b19d1c8d	gareth53 pushed to master at gareth53/grogan	2015-10-30 17:18:18+00		<!-- push -->\n<span class="mega-octicon octicon-git-commit"></span>\n\n<div class="time">\n  <time datetime="2015-10-30T17:18:18Z">Oct 30, 2015</time>\n</div>\n\n<div class="title">\n  <a href="https://github.com/gareth53">gareth53</a> pushed to <a href="https://github.com/gareth53/grogan/tree/master">master</a> at <a href="https://github.com/gareth53/grogan">gareth53/grogan</a>\n</div>\n\n<div class="details">\n  <a href="https://github.com/gareth53"><img alt="@gareth53" class="gravatar" height="30" src="https://avatars1.githubusercontent.com/u/39545?v=3&amp;s=60" width="30" /></a>\n\n    <div class="commits ">\n      <ul>\n        <li>\n          <span title="Gareth Senior">\n            <img alt="" height="16" src="https://2.gravatar.com/avatar/eb7287caf2279f1c30f7afee9cb7e75c?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="16" />\n          </span>\n          <code><a href="https://github.com/gareth53/grogan/commit/10b19d1c8d662806f265539f4a9eeffb04498c03">10b19d1</a></code>\n          <div class="message">\n            <blockquote>\n              now looping back to crop1 instead of crop1 (becuase they're zero-inde…\n            </blockquote>\n          </div>\n        </li>\n      </ul>\n    </div>\n</div>	tag:github.com,2008:PushEvent/3293074982	262-gareth53-pushed-to-master-at-gareth53grogan				
718	13	https://www.netflix.com/WiMovie/60033108?trkid=200250783	Tremors	2015-05-17 16:00:00+01								
719	13	https://www.netflix.com/WiMovie/70268896?trkid=200250783	Computer Chess	2015-05-09 15:00:00+01								
266	9	https://github.com/gareth53/grogan/compare/146463cbef...8921e03246	gareth53 pushed to master at gareth53/grogan	2015-10-30 16:03:51+00		<!-- push -->\n<span class="mega-octicon octicon-git-commit"></span>\n\n<div class="time">\n  <time datetime="2015-10-30T16:03:51Z">Oct 30, 2015</time>\n</div>\n\n<div class="title">\n  <a href="https://github.com/gareth53">gareth53</a> pushed to <a href="https://github.com/gareth53/grogan/tree/master">master</a> at <a href="https://github.com/gareth53/grogan">gareth53/grogan</a>\n</div>\n\n<div class="details">\n  <a href="https://github.com/gareth53"><img alt="@gareth53" class="gravatar" height="30" src="https://avatars1.githubusercontent.com/u/39545?v=3&amp;s=60" width="30" /></a>\n\n    <div class="commits ">\n      <ul>\n        <li>\n          <span title="Gareth Senior">\n            <img alt="" height="16" src="https://2.gravatar.com/avatar/eb7287caf2279f1c30f7afee9cb7e75c?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="16" />\n          </span>\n          <code><a href="https://github.com/gareth53/grogan/commit/8921e0324619cf6c7ae10ed11494a15d3bafb273">8921e03</a></code>\n          <div class="message">\n            <blockquote>\n              removed dupe line\n            </blockquote>\n          </div>\n        </li>\n        <li>\n          <span title="Gareth Senior">\n            <img alt="" height="16" src="https://2.gravatar.com/avatar/eb7287caf2279f1c30f7afee9cb7e75c?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="16" />\n          </span>\n          <code><a href="https://github.com/gareth53/grogan/commit/c206b6925ce115de8335087889dcb9f9d6b5c2e8">c206b69</a></code>\n          <div class="message">\n            <blockquote>\n              handling lack of width OR hwight - amnd just returning a square image\n            </blockquote>\n          </div>\n        </li>\n        <li class="more"><a href="https://github.com/gareth53/grogan/compare/146463cbef...8921e03246">3 more commits &raquo;</a></li>\n      </ul>\n    </div>\n</div>	tag:github.com,2008:PushEvent/3292780718	266-gareth53-pushed-to-master-at-gareth53grogan				
720	13	https://www.netflix.com/WiMovie/70270768?trkid=200250783	Deceptive Practice: The Mysteries and Mentors of Ricky Jay	2015-05-09 16:00:00+01								
267	9	https://github.com/gareth53/grogan/compare/26f4e58492...146463cbef	gareth53 pushed to master at gareth53/grogan	2015-09-16 12:35:10+01		<!-- push -->\n<span class="mega-octicon octicon-git-commit"></span>\n\n<div class="time">\n  <time datetime="2015-09-16T12:35:10Z">Sep 16, 2015</time>\n</div>\n\n<div class="title">\n  <a href="https://github.com/gareth53">gareth53</a> pushed to <a href="https://github.com/gareth53/grogan/tree/master">master</a> at <a href="https://github.com/gareth53/grogan">gareth53/grogan</a>\n</div>\n\n<div class="details">\n  <a href="https://github.com/gareth53"><img alt="@gareth53" class="gravatar" height="30" src="https://avatars1.githubusercontent.com/u/39545?v=3&amp;s=60" width="30" /></a>\n\n    <div class="commits ">\n      <ul>\n        <li>\n          <span title="Gareth Senior">\n            <img alt="" height="16" src="https://2.gravatar.com/avatar/eb7287caf2279f1c30f7afee9cb7e75c?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="16" />\n          </span>\n          <code><a href="https://github.com/gareth53/grogan/commit/146463cbeff390becddb6ca3218b7dad1e95fad6">146463c</a></code>\n          <div class="message">\n            <blockquote>\n              fixtures files for suggested crops - these relating to GUSTO website …\n            </blockquote>\n          </div>\n        </li>\n        <li>\n          <span title="Gareth Senior">\n            <img alt="" height="16" src="https://2.gravatar.com/avatar/eb7287caf2279f1c30f7afee9cb7e75c?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="16" />\n          </span>\n          <code><a href="https://github.com/gareth53/grogan/commit/aecc96f81b3dbcb3b6d14f6d82cecefd7ec66447">aecc96f</a></code>\n          <div class="message">\n            <blockquote>\n              added a custom admin view to do all crops in one screen\n            </blockquote>\n          </div>\n        </li>\n        <li class="more"><a href="https://github.com/gareth53/grogan/compare/26f4e58492...146463cbef">1 more commit &raquo;</a></li>\n      </ul>\n    </div>\n</div>	tag:github.com,2008:PushEvent/3152175328	267-gareth53-pushed-to-master-at-gareth53grogan				
721	13	https://www.netflix.com/WiMovie/70299879?trkid=200250783	They Came Together	2015-05-04 20:00:00+01								
722	13	https://www.netflix.com/WiMovie/80028224?trkid=200250783	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Makes Waffles!"	2015-04-27 20:00:00+01								
723	13	https://www.netflix.com/WiMovie/80028223?trkid=200250783	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Goes to Court!"	2015-04-27 21:00:00+01								
724	13	https://www.netflix.com/WiMovie/80028222?trkid=200250783	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Rides a Bike!"	2015-04-25 15:00:00+01								
725	13	https://www.netflix.com/WiMovie/80028221?trkid=200250783	Unbreakable Kimmy Schmidt: Season 1: "Kimmy's in a Love Triangle!"	2015-04-23 20:00:00+01								
726	13	https://www.netflix.com/WiMovie/80018193?trkid=200250783	Marvel's Daredevil: Season 1: "Rabbit in a Snowstorm"	2015-04-22 20:00:00+01								
727	13	https://www.netflix.com/WiMovie/80028220?trkid=200250783	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Has a Birthday!"	2015-04-22 21:00:00+01								
728	13	https://www.netflix.com/WiMovie/70266837?trkid=200250783	Bottom: Series 2: "Burglary"	2015-04-21 20:00:00+01								
729	13	https://www.netflix.com/WiMovie/80028219?trkid=200250783	Unbreakable Kimmy Schmidt: Season 1: "Kimmy is Bad at Math!"	2015-04-21 21:00:00+01								
730	13	https://www.netflix.com/WiMovie/60001950?trkid=200250783	Runaway	2015-04-19 15:00:00+01								
731	13	https://www.netflix.com/WiMovie/80018192?trkid=200250783	Marvel's Daredevil: Season 1: "Cut Man"	2015-04-19 16:00:00+01								
732	13	https://www.netflix.com/WiMovie/70266836?trkid=200250783	Bottom: Series 2: "Culture"	2015-04-14 20:00:00+01								
733	13	https://www.netflix.com/WiMovie/80028218?trkid=200250783	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Goes to a Party!"	2015-04-14 21:00:00+01								
734	13	https://www.netflix.com/WiMovie/80018191?trkid=200250783	Marvel's Daredevil: Season 1: "Into the Ring"	2015-04-13 20:00:00+01								
735	13	https://www.netflix.com/WiMovie/80028217?trkid=200250783	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Goes to School!"	2015-04-13 21:00:00+01								
736	13	https://www.netflix.com/WiMovie/80028216?trkid=200250783	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Kisses a Boy!"	2015-04-08 20:00:00+01								
737	13	https://www.netflix.com/WiMovie/80021965?trkid=200250783	Better Call Saul: Season 1: "Marco"	2015-04-08 21:00:00+01								
738	13	https://www.netflix.com/WiMovie/70299856?trkid=200250783	Frank	2015-04-06 20:00:00+01								
739	13	https://www.netflix.com/WiMovie/70307852?trkid=200250783	Begin Again	2015-04-04 15:00:00+01								
740	13	https://www.netflix.com/WiMovie/80021964?trkid=200250783	Better Call Saul: Season 1: "Pimento"	2015-04-02 20:00:00+01								
741	13	https://www.netflix.com/WiMovie/80042198?trkid=200250783	Atari: Game Over	2015-03-31 20:00:00+01								
742	13	https://www.netflix.com/WiMovie/70266835?trkid=200250783	Bottom: Series 2: "Digger"	2015-03-30 20:00:00+01								
743	13	https://www.netflix.com/WiMovie/80028215?trkid=200250783	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Goes to the Doctor!"	2015-03-30 21:00:00+01								
744	13	https://www.netflix.com/WiMovie/70267838?trkid=200250783	20 Feet from Stardom	2015-03-30 22:00:00+01								
745	13	https://www.netflix.com/WiMovie/70266833?trkid=200250783	Bottom: Series 1: "Accident"	2015-03-26 20:00:00+00								
746	13	https://www.netflix.com/WiMovie/80021963?trkid=200250783	Better Call Saul: Season 1: "Rico"	2015-03-26 21:00:00+00								
747	13	https://www.netflix.com/WiMovie/80021962?trkid=200250783	Better Call Saul: Season 1: "Bingo"	2015-03-25 20:00:00+00								
748	13	https://www.netflix.com/WiMovie/70266832?trkid=200250783	Bottom: Series 1: "'S Up"	2015-03-11 20:00:00+00								
749	13	https://www.netflix.com/WiMovie/70266831?trkid=200250783	Bottom: Series 1: "Apocalypse"	2015-03-11 21:00:00+00								
750	13	https://www.netflix.com/WiMovie/70241257?trkid=200250783	The Flat	2015-03-11 22:00:00+00								
751	13	https://www.netflix.com/WiMovie/70266830?trkid=200250783	Bottom: Series 1: "Contest"	2015-03-10 20:00:00+00								
752	13	https://www.netflix.com/WiMovie/80028213?trkid=200250783	Unbreakable Kimmy Schmidt: Season 1: "Kimmy Gets a Job!"	2015-03-10 21:00:00+00								
753	13	https://www.netflix.com/WiMovie/80021961?trkid=200250783	Better Call Saul: Season 1: "Five-O"	2015-03-10 22:00:00+00								
754	13	https://www.netflix.com/WiMovie/80021960?trkid=200250783	Better Call Saul: Season 1: "Alpine Shepherd Boy"	2015-03-04 20:00:00+00								
755	13	https://www.netflix.com/WiMovie/80021959?trkid=200250783	Better Call Saul: Season 1: "Hero"	2015-03-01 15:00:00+00								
756	13	https://www.netflix.com/WiMovie/70272723?trkid=200250783	This Ain't California	2015-03-01 16:00:00+00								
757	13	https://www.netflix.com/WiMovie/80021958?trkid=200250783	Better Call Saul: Season 1: "Nacho"	2015-02-17 20:00:00+00								
286	12	http://strava.com/activities/345311269	07/11/2015 Barnet, United Kingdom	2015-07-11 07:59:07+01		Run (Barnet): Distance: 5.5km, Elevation Gain: 33m, Moving Time: 00:26:22, Average Speed: 12.5km/h	http://strava.com/activities/345311269	286-07112015-barnet-united-kingdom				
310	2	http://blissfuljs.com/#download	Bliss.js — Heavenly JavaScript!	2015-12-16 12:41:06+00			http://delicious.com/url/c7ba67b684459f17e30720542a967046#gareth53	310-blissjs-heavenly-javascript				
287	12	http://strava.com/activities/342947869	Morning Ride	2015-07-10 09:54:39+01		Ride (Barnet): Distance: 28.8km, Elevation Gain: 215m, Moving Time: 01:13:09, Average Speed: 23.6km/h	http://strava.com/activities/342947869	287-morning-ride				
758	13	https://www.netflix.com/WiMovie/70084223?trkid=200250783	Transsiberian	2015-02-15 15:00:00+00								
288	12	http://strava.com/activities/342873309	07/06/2015 Barnet, United Kingdom	2015-07-06 06:39:55+01		Run (Barnet): Distance: 4.4km, Elevation Gain: 0m, Moving Time: 00:25:52, Average Speed: 10.2km/h	http://strava.com/activities/342873309	288-07062015-barnet-united-kingdom				
759	13	https://www.netflix.com/WiMovie/80021957?trkid=200250783	Better Call Saul: Season 1: "Mijo"	2015-02-10 20:00:00+00								
289	12	http://strava.com/activities/342873418	07/05/2015 Barnet, United Kingdom	2015-07-05 08:00:43+01		Ride (Barnet): Distance: 28.8km, Elevation Gain: 181m, Moving Time: 01:08:28, Average Speed: 25.2km/h	http://strava.com/activities/342873418	289-07052015-barnet-united-kingdom				
760	13	https://www.netflix.com/WiMovie/70273268?trkid=200250783	Downloaded	2015-01-04 15:00:00+00								
290	12	http://strava.com/activities/342873534	07/04/2015 London, United Kingdom	2015-07-04 08:12:08+01		Run (London): Distance: 5.0km, Elevation Gain: 76m, Moving Time: 00:24:16, Average Speed: 12.3km/h	http://strava.com/activities/342873534	290-07042015-london-united-kingdom				
761	13	https://www.netflix.com/WiMovie/70209132?trkid=200250783	Jo Nesbo's Headhunters	2014-12-26 20:00:00+00								
291	12	http://strava.com/activities/337536945	07/02/2015 London, England, United Kingdom	2015-07-02 12:20:26+01		Run (London, England): Distance: 4.8km, Elevation Gain: 26m, Moving Time: 00:24:13, Average Speed: 11.8km/h	http://strava.com/activities/337536945	291-07022015-london-england-united-kingdom				
762	13	https://www.netflix.com/WiMovie/70293818?trkid=200250783	We Are the Best!	2014-12-21 15:00:00+00								
292	12	http://strava.com/activities/337537043	06/30/2015 London, England, United Kingdom	2015-06-30 12:25:37+01		Run (London, England): Distance: 5.0km, Elevation Gain: 25m, Moving Time: 00:25:46, Average Speed: 11.6km/h	http://strava.com/activities/337537043	292-06302015-london-england-united-kingdom				
763	13	https://www.netflix.com/WiMovie/80014770?trkid=200250783	Pantani: The Accidental Death of a Cyclist	2014-12-20 15:00:00+00								
293	12	http://strava.com/activities/337537158	06/26/2015 London, England, United Kingdom	2015-06-26 12:26:54+01		Run (London, England): Distance: 5.5km, Elevation Gain: 22m, Moving Time: 00:27:45, Average Speed: 11.9km/h	http://strava.com/activities/337537158	293-06262015-london-england-united-kingdom				
764	13	https://www.netflix.com/WiMovie/70228187?trkid=200250783	West of Memphis	2014-12-14 15:00:00+00								
294	12	http://strava.com/activities/337537240	06/24/2015 London, England, United Kingdom	2015-06-24 12:00:28+01		Run (London, England): Distance: 5.7km, Elevation Gain: 15m, Moving Time: 00:27:53, Average Speed: 12.4km/h	http://strava.com/activities/337537240	294-06242015-london-england-united-kingdom				
765	13	https://www.netflix.com/WiMovie/70275751?trkid=200250783	Dallas Buyers Club	2014-12-05 20:00:00+00								
295	12	http://strava.com/activities/337537384	06/21/2015 Barnet, United Kingdom	2015-06-21 14:53:45+01		Ride (Barnet): Distance: 44.4km, Elevation Gain: 414m, Moving Time: 01:52:59, Average Speed: 23.6km/h	http://strava.com/activities/337537384	295-06212015-barnet-united-kingdom				
766	13	https://www.netflix.com/WiMovie/70219678?trkid=200250783	Black Books: Series 1: "The Grapes of Wrath"	2014-10-27 20:00:00+00								
296	12	http://strava.com/activities/337537539	06/20/2015 London, United Kingdom	2015-06-20 08:08:59+01		Run (London): Distance: 5.0km, Elevation Gain: 40m, Moving Time: 00:23:58, Average Speed: 12.6km/h	http://strava.com/activities/337537539	296-06202015-london-united-kingdom				
767	13	https://www.netflix.com/WiMovie/70219677?trkid=200250783	Black Books: Series 1: "Manny's First Day"	2014-10-27 21:00:00+00								
297	12	http://strava.com/activities/327995583	06/18/2015 Barnet, United Kingdom	2015-06-18 06:09:30+01		Ride (Barnet): Distance: 15.4km, Elevation Gain: 83m, Moving Time: 00:38:33, Average Speed: 24.0km/h	http://strava.com/activities/327995583	297-06182015-barnet-united-kingdom				
768	13	https://www.netflix.com/WiMovie/70298839?trkid=200250783	Getting On: Series 1: "Episode 1"	2014-10-20 20:00:00+01								
769	13	https://www.netflix.com/WiMovie/70216268?trkid=200250783	Peep Show: Series 6: "The Test"	2014-10-19 15:00:00+01								
770	13	https://www.netflix.com/WiMovie/70216267?trkid=200250783	Peep Show: Series 6: "Jeremy at JLB"	2014-10-19 16:00:00+01								
771	13	https://www.netflix.com/WiMovie/70216258?trkid=200250783	Peep Show: Series 4: "The Wedding"	2014-10-19 17:00:00+01								
772	13	https://www.netflix.com/WiMovie/70216265?trkid=200250783	Peep Show: Series 5: "Mark's Women"	2014-10-18 15:00:00+01								
773	13	https://www.netflix.com/WiMovie/70216264?trkid=200250783	Peep Show: Series 5: "Jeremy's Manager"	2014-10-13 20:00:00+01								
774	13	https://www.netflix.com/WiMovie/70216263?trkid=200250783	Peep Show: Series 5: "Jeremy's Mummy"	2014-10-13 21:00:00+01								
775	13	https://www.netflix.com/WiMovie/60037897?trkid=200250783	The Cat from Outer Space	2014-10-12 15:00:00+01								
776	13	https://www.netflix.com/WiMovie/60002760?trkid=200250783	Hoop Dreams	2014-10-12 16:00:00+01								
777	13	https://www.netflix.com/WiMovie/70216249?trkid=200250783	Peep Show: Series 3: "Sisterning"	2014-10-11 15:00:00+01								
778	13	https://www.netflix.com/WiMovie/70216248?trkid=200250783	Peep Show: Series 3: "Shrooming"	2014-10-11 16:00:00+01								
779	13	https://www.netflix.com/WiMovie/70219496?trkid=200250783	Frankenweenie	2014-10-11 17:00:00+01								
780	13	https://www.netflix.com/WiMovie/70002933?trkid=200250783	Bionicle 2: Legends of Metru Nui	2014-09-29 20:00:00+01								
781	13	https://www.netflix.com/WiMovie/70216247?trkid=200250783	Peep Show: Series 3: "Sectioning"	2014-09-28 15:00:00+01								
782	13	https://www.netflix.com/WiMovie/70216246?trkid=200250783	Peep Show: Series 3: "Mugging"	2014-09-28 16:00:00+01								
783	13	https://www.netflix.com/WiMovie/70298886?trkid=200250783	Louis Theroux: "Louis Theroux: Louis and Michael"	2014-09-27 15:00:00+01								
784	13	https://www.netflix.com/WiMovie/70159089?trkid=200250783	The IT Crowd: Series 4: "Italian for Beginners"	2014-09-27 16:00:00+01								
785	13	https://www.netflix.com/WiMovie/70159088?trkid=200250783	The IT Crowd: Series 4: "Something Happened"	2014-09-20 15:00:00+01								
298	11	https://vimeo.com/147956910	What Is "Lynchian"?	2015-12-11 16:08:01+00	Gareth Senior	<p></p><p><p class="first">What defines the unmistakeable cinema of David Lynch? This video essay explores this question, using text from DAVID LYNCH: THE MAN FROM ANOTHER PLACE, the new book by Dennis Lim.</p> <p><a href="https://www.fandor.com/keyframe/" rel="nofollow" target="_blank">fandor.com/keyframe/</a></p></p><p><strong>Cast:</strong>  <a href="https://vimeo.com/fandor">Fandor Keyframe</a>  and <a href="https://vimeo.com/kevinblee">Kevin B. Lee</a></p><p><strong>Tags:</strong>  <a href="https://vimeo.com/tag:david+lynch">david lynch</a>,  <a href="https://vimeo.com/tag:movies">movies</a>,  <a href="https://vimeo.com/tag:cinema">cinema</a>,  <a href="https://vimeo.com/tag:filmmaking">filmmaking</a>  and <a href="https://vimeo.com/tag:directing">directing</a></p>	tag:vimeo,2015-12-11:clip147956910	298-what-is-lynchian				
1	1	http://audioboom.com/boos/3074921-post-match-reaction-chris-powell-vs-nottingham-forest	POST MATCH REACTION - Chris Powell vs Nottingham Forest	2015-04-11 17:33:59+01		BBC Radio Leeds' Paul Odgen speaks to Huddersfield Town boss Chris Powell after his team beat Nottingham Forest 1-0 in the Championship #htafc	tag:audioboo.fm,2015-04-11:/boos/3074921	1-post-match-reaction-chris-powell-vs-nottingham-f				
2	1	http://audioboom.com/boos/2806698-huddersfield-town-post-match-interview-chris-powell-vs-middlesbrough	HUDDERSFIELD TOWN POST MATCH INTERVIEW – Chris Powell vs Middlesbrough	2015-01-17 18:26:53+00		Huddersfield Town manager Chris Powell speaks to BBC Radio Leeds’ Paul Ogden following his side’s 2-0 defeat at Middlesbrough #htafc	tag:audioboo.fm,2015-01-17:/boos/2806698	2-huddersfield-town-post-match-interview-chris-pow				
786	13	https://www.netflix.com/WiMovie/70159087?trkid=200250783	The IT Crowd: Series 4: "The Final Countdown"	2014-09-20 16:00:00+01								
787	13	https://www.netflix.com/WiMovie/70159086?trkid=200250783	The IT Crowd: Series 4: "Jen the Fredo"	2014-09-20 17:00:00+01								
788	13	https://www.netflix.com/WiMovie/70124260?trkid=200250783	The IT Crowd: Series 3: "Friendface"	2014-09-14 15:00:00+01								
789	13	https://www.netflix.com/WiMovie/70124259?trkid=200250783	The IT Crowd: Series 3: "The Speech"	2014-09-14 16:00:00+01								
790	13	https://www.netflix.com/WiMovie/70124258?trkid=200250783	The IT Crowd: Series 3: "Tramps Like Us"	2014-09-14 17:00:00+01								
136	6	https://gareth53.wordpress.com/2015/08/08/football-championship-201516-preview/	Football – Championship 2015/16 Preview	2015-08-08 14:42:45+01		Another football season rolls around. There seems to be a lot of Premiership predictions floating about (yawn! everybody&#8217;s picking Chelsea to win it) but very few in-depth Championship previews. The betting market is largely unsurprising with the exception of Bolton being such long odds. The favoured teams are those that narrowly missed out (or, in [&#8230;]<img alt="" border="0" height="1" src="https://pixel.wp.com/b.gif?host=gareth53.wordpress.com&#038;blog=50990071&#038;post=55&#038;subd=gareth53&#038;ref=&#038;feed=1" width="1" />	http://gareth53.wordpress.com/?p=55	136-football-championship-201516-preview				
148	8	http://www.goodreads.com/review/show/1222114040?utm_medium=api&utm_source=rss	Running with the Kenyans: Passion, Adventure, and the Secrets of the Fastest People on Earth	2015-03-08 20:52:14+00		<a href="http://www.goodreads.com/book/show/13147812-running-with-the-kenyans?utm_medium=api&amp;utm_source=rss"><img alt="Running with the Kenyans: Passion, Adventure, and the Secrets of the Fastest People on Earth" src="http://d.gr-assets.com/books/1333577703s/13147812.jpg" /></a><br />\n                                      author: Adharanand Finn<br />\n                                      name: Gareth<br />\n                                      average rating: 3.78<br />\n                                      book published: 2010<br />\n                                      rating: 3<br />\n                                      read at: 2015/02/14<br />\n                                      date added: 2015/03/08<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/1222114040?utm_medium=api&utm_source=rss	148-running-with-the-kenyans-passion-adventure-and				
791	13	https://www.netflix.com/WiMovie/60003330?trkid=200250783	Wall Street	2014-09-14 18:00:00+01								
792	13	https://www.netflix.com/WiMovie/70124256?trkid=200250783	The IT Crowd: Series 3: "From Hell"	2014-09-09 20:00:00+01								
793	13	https://www.netflix.com/WiMovie/70259080?trkid=200250783	Girl Most Likely	2014-09-07 15:00:00+01								
794	13	https://www.netflix.com/WiMovie/70120053?trkid=200250783	The IT Crowd: Series 2: "Men Without Women"	2014-09-06 15:00:00+01								
795	13	https://www.netflix.com/WiMovie/70120052?trkid=200250783	The IT Crowd: Series 2: "Smoke and Mirrors"	2014-09-06 16:00:00+01								
796	13	https://www.netflix.com/WiMovie/70120051?trkid=200250783	The IT Crowd: Series 2: "The Dinner Party"	2014-08-31 15:00:00+01								
797	13	https://www.netflix.com/WiMovie/70120050?trkid=200250783	The IT Crowd: Series 2: "Moss and the German"	2014-08-31 16:00:00+01								
798	13	https://www.netflix.com/WiMovie/60021851?trkid=200250783	Ruthless People	2014-08-31 17:00:00+01								
799	13	https://www.netflix.com/WiMovie/70298931?trkid=200250783	BoJack Horseman: Season 1: "BoJack Hates the Troops"	2014-08-31 18:00:00+01								
800	13	https://www.netflix.com/WiMovie/70120049?trkid=200250783	The IT Crowd: Series 2: "Return of the Golden Child"	2014-08-30 15:00:00+01								
801	13	https://www.netflix.com/WiMovie/70120048?trkid=200250783	The IT Crowd: Series 2: "The Work Outing"	2014-08-30 16:00:00+01								
802	13	https://www.netflix.com/WiMovie/70116822?trkid=200250783	The IT Crowd: Series 1: "Aunt Irma Visits"	2014-08-29 20:00:00+01								
803	13	https://www.netflix.com/WiMovie/70116821?trkid=200250783	The IT Crowd: Series 1: "The Haunting of Bill Crouse"	2014-08-29 21:00:00+01								
804	13	https://www.netflix.com/WiMovie/70116820?trkid=200250783	The IT Crowd: Series 1: "The Red Door"	2014-08-27 20:00:00+01								
805	13	https://www.netflix.com/WiMovie/70116819?trkid=200250783	The IT Crowd: Series 1: "Fifty-Fifty"	2014-08-25 20:00:00+01								
806	13	https://www.netflix.com/WiMovie/70116818?trkid=200250783	The IT Crowd: Series 1: "Calamity Jen"	2014-08-25 21:00:00+01								
807	13	https://www.netflix.com/WiMovie/70116817?trkid=200250783	The IT Crowd: Series 1: "Yesterday's Jam"	2014-08-25 22:00:00+01								
808	13	https://www.netflix.com/WiMovie/70257420?trkid=200250783	Stories We Tell	2014-08-25 23:00:00+01								
809	13	https://www.netflix.com/WiMovie/70298426?trkid=200250783	Filth	2014-08-26 00:00:00+01								
810	13	https://www.netflix.com/WiMovie/70217057?trkid=200250783	The Royle Family: Season 2: "Pregnancy"	2014-08-24 15:00:00+01								
811	13	https://www.netflix.com/WiMovie/70216344?trkid=200250783	Father Ted: Series 3: "The Mainland"	2014-08-24 16:00:00+01								
812	13	https://www.netflix.com/WiMovie/70216342?trkid=200250783	Father Ted: Series 3: "Speed 3"	2014-08-24 17:00:00+01								
813	13	https://www.netflix.com/WiMovie/70216340?trkid=200250783	Father Ted: Series 3: "Chirpy Burpy Cheap Sheep"	2014-08-24 18:00:00+01								
302	5	http://newyorker.com/books/page-turner/the-two-lives-of-michael-jackson?utm_source=pocket&utm_medium=email&utm_campaign=pockethits	The Two Lives of Michael Jackson	2015-12-15 08:58:04+00			http://newyorker.com/books/page-turner/the-two-lives-of-michael-jackson?utm_source=pocket&utm_medium=email&utm_campaign=pockethits	302-the-two-lives-of-michael-jackson				
814	13	https://www.netflix.com/WiMovie/70298930?trkid=200250783	BoJack Horseman: Season 1: "BoJack Horseman: The BoJack Horseman Story, Chapter One"	2014-08-24 19:00:00+01								
116	3	http://www.flickr.com/photos/gareth53/16778247734/	Milton Keynes Marathon	2015-05-07 08:40:22+01		<p><a href="http://www.flickr.com/people/gareth53/">gareth53</a> posted a photo:</p>\n\t\n<p><a href="http://www.flickr.com/photos/gareth53/16778247734/" title="Milton Keynes Marathon"><img alt="Milton Keynes Marathon" height="240" src="http://farm9.staticflickr.com/8859/16778247734_fa6f303888_m.jpg" width="160" /></a></p>\n\n<p>Around 18 miles in</p>	tag:flickr.com,2004:/photo/16778247734	116-milton-keynes-marathon				
137	6	https://gareth53.wordpress.com/2015/05/11/championship-football-predictions-for-201415/	Championship Football Predictions for 2014/15	2015-05-11 16:14:49+01		Season&#8217;s over. Time to compare my Championship predictions with what actually happened in the real world. At the beginning of the season I listed out the Championship teams in a rough order of where I expected them to finish the season. Nailing at definite order proved too tricky, but I at least grouped the teams [&#8230;]<img alt="" border="0" height="1" src="https://pixel.wp.com/b.gif?host=gareth53.wordpress.com&#038;blog=50990071&#038;post=52&#038;subd=gareth53&#038;ref=&#038;feed=1" width="1" />	http://gareth53.wordpress.com/?p=52	137-championship-football-predictions-for-201415				
147	8	http://www.goodreads.com/review/show/1244991725?utm_medium=api&utm_source=rss	So You've Been Publicly Shamed	2015-04-03 21:46:48+01		<a href="http://www.goodreads.com/book/show/22571552-so-you-ve-been-publicly-shamed?utm_medium=api&amp;utm_source=rss"><img alt="So You've Been Publicly Shamed" src="http://d.gr-assets.com/books/1413749614s/22571552.jpg" /></a><br />\n                                      author: Jon Ronson<br />\n                                      name: Gareth<br />\n                                      average rating: 3.86<br />\n                                      book published: 2015<br />\n                                      rating: 0<br />\n                                      read at: <br />\n                                      date added: 2015/04/03<br />\n                                      shelves: <br />\n                                      review: <br /><br />	http://www.goodreads.com/review/show/1244991725?utm_medium=api&utm_source=rss	147-so-youve-been-publicly-shamed				
304	5	http://theatlantic.com/technology/archive/2015/11/the-technology-that-created-a-new-generation-of-runners/417126?utm_source=pocket&utm_medium=email&utm_campaign=pockethits	The Technology That Created a New Generation of Runners	2015-12-13 10:19:37+00			http://theatlantic.com/technology/archive/2015/11/the-technology-that-created-a-new-generation-of-runners/417126?utm_source=pocket&utm_medium=email&utm_campaign=pockethits	304-the-technology-that-created-a-new-generation-o				
815	13	https://www.netflix.com/WiMovie/70267271?trkid=200250783	Prince Avalanche	2014-08-24 20:00:00+01								
305	5	http://wired.com/2015/12/what-really-happens-when-you-get-shot?utm_source=pocket&utm_medium=email&utm_campaign=pockethits	What Really Happens When You Get Shot	2015-12-13 10:15:17+00			http://wired.com/2015/12/what-really-happens-when-you-get-shot?utm_source=pocket&utm_medium=email&utm_campaign=pockethits	305-what-really-happens-when-you-get-shot				
816	13	https://www.netflix.com/WiMovie/70227946?trkid=200250783	Safety Not Guaranteed	2014-08-17 15:00:00+01								
817	13	https://www.netflix.com/WiMovie/70129457?trkid=200250783	LIFE 2.0	2014-08-16 15:00:00+01								
818	13	https://www.netflix.com/WiMovie/60022761?trkid=200250783	Slap Shot	2014-08-10 15:00:00+01								
307	5	http://blog.digitalbusinessacademyuk.com/the-future-of-work-futrgen	The Future of Work - FutrGen	2015-12-13 08:26:23+00			http://blog.digitalbusinessacademyuk.com/the-future-of-work-futrgen	307-the-future-of-work-futrgen				
819	13	https://www.netflix.com/WiMovie/60031296?trkid=200250783	The Fog of War	2014-08-10 16:00:00+01								
308	5	http://fastcompany.com/3053036/how-to-be-a-success-at-everything/the-simple-technique-to-fit-a-40-hour-work-week-into-167-h?utm_source=pocket&utm_medium=email&utm_campaign=pockethits	The Simple Technique To Fit A 40-Hour Workweek Into 16.7 Hours	2015-12-13 08:15:32+00			http://fastcompany.com/3053036/how-to-be-a-success-at-everything/the-simple-technique-to-fit-a-40-hour-work-week-into-167-h?utm_source=pocket&utm_medium=email&utm_campaign=pockethits	308-the-simple-technique-to-fit-a-40-hour-workweek				
820	13	https://www.netflix.com/WiMovie/70307178?trkid=200250783	Cardinal Burns: "Episode 2"	2014-08-09 15:00:00+01								
309	5	http://bbc.com/future/story/20151106-why-we-should-stop-worrying-about-our-wandering-minds?utm_source=pocket&utm_medium=email&utm_campaign=pockethits	Why we should stop worrying about our wandering minds	2015-12-13 08:08:40+00			http://bbc.com/future/story/20151106-why-we-should-stop-worrying-about-our-wandering-minds?utm_source=pocket&utm_medium=email&utm_campaign=pockethits	309-why-we-should-stop-worrying-about-our-wanderin				
821	13	https://www.netflix.com/WiMovie/70307177?trkid=200250783	Cardinal Burns: "Episode 1"	2014-08-09 16:00:00+01								
322	12	http://strava.com/activities/448300060	Morning Run	2015-12-03 07:40:09+00		Run (Barnet): Distance: 4.4km, Elevation Gain: 0m, Moving Time: 00:23:05, Average Speed: 11.4km/h	http://strava.com/activities/448300060	322-morning-run				
822	13	https://www.netflix.com/WiMovie/70307198?trkid=200250783	Educating Essex: "Episode 7"	2014-08-06 20:00:00+01								
323	12	http://strava.com/activities/448300136	Morning Run	2015-11-30 07:38:05+00		Run (Barnet): Distance: 4.3km, Elevation Gain: 0m, Moving Time: 00:22:47, Average Speed: 11.3km/h	http://strava.com/activities/448300136	323-morning-run				
823	13	https://www.netflix.com/WiMovie/70307197?trkid=200250783	Educating Essex: "Episode 6"	2014-08-04 20:00:00+01								
324	12	http://strava.com/activities/448300249	Morning Run	2015-11-28 08:59:52+00		Run (London): Distance: 5.9km, Elevation Gain: 41m, Moving Time: 00:33:25, Average Speed: 10.6km/h	http://strava.com/activities/448300249	324-morning-run				
824	13	https://www.netflix.com/WiMovie/70307196?trkid=200250783	Educating Essex: "Episode 5"	2014-08-03 15:00:00+01								
825	13	https://www.netflix.com/WiMovie/70228180?trkid=200250783	Bones Brigade: An Autobiography	2014-08-02 15:00:00+01								
826	13	https://www.netflix.com/WiMovie/70286100?trkid=200250783	Punk in Africa	2014-08-02 16:00:00+01								
827	13	https://www.netflix.com/WiMovie/70307195?trkid=200250783	Educating Essex: "Episode 4"	2014-08-01 20:00:00+01								
828	13	https://www.netflix.com/WiMovie/70307194?trkid=200250783	Educating Essex: "Episode 3"	2014-07-30 20:00:00+01								
829	13	https://www.netflix.com/WiMovie/70307193?trkid=200250783	Educating Essex: "Episode 2"	2014-07-27 15:00:00+01								
830	13	https://www.netflix.com/WiMovie/70239501?trkid=200250783	Town of Runners	2014-07-27 16:00:00+01								
831	13	https://www.netflix.com/WiMovie/70307192?trkid=200250783	Educating Essex: "Episode 1"	2014-07-27 17:00:00+01								
832	13	https://www.netflix.com/WiMovie/70219676?trkid=200250783	Black Books: Series 1: "Cooking the Books"	2014-07-26 15:00:00+01								
833	13	https://www.netflix.com/WiMovie/80001001?trkid=200250783	Comedy Showcase: Felix & Murdo	2014-07-26 16:00:00+01								
834	13	https://www.netflix.com/WiMovie/80001002?trkid=200250783	Comedy Showcase: Milton Jones's House of Rooms	2014-07-26 17:00:00+01								
835	13	https://www.netflix.com/WiMovie/70303263?trkid=200250783	Utopia: Season 1: "Episode 6"	2014-07-26 18:00:00+01								
836	13	https://www.netflix.com/WiMovie/70303262?trkid=200250783	Utopia: Season 1: "Episode 5"	2014-07-26 19:00:00+01								
244	7	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-11/	The Nick And Gareth Podcast #11	2012-10-08 21:07:49+01		<div style="clear: both; height: 3px; width: 300;"></div><p style="display: block; font-size: 11px; font-family: 'Open Sans', Helvetica, Arial, sans-serif; margin: 0; padding: 3px 4px; color: #999; width: 300;"><a href="https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-11/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=resource_link" style="color: #808080; font-weight: bold;" target="_blank">The Nick and Gareth Podcast #11</a><span> by </span><a href="https://www.mixcloud.com/gareth53/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=profile_link" style="color: #808080; font-weight: bold;" target="_blank">Gareth53</a><span> on </span><a href="https://www.mixcloud.com/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=homepage_link" style="color: #808080; font-weight: bold;" target="_blank"> Mixcloud</a></p><div style="clear: both; height: 3px;"></div>	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-11/	244-the-nick-and-gareth-podcast-11				
245	7	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-10/	The Nick And Gareth Podcast #10	2012-10-07 21:32:44+01		<div style="clear: both; height: 3px; width: 300;"></div><p style="display: block; font-size: 11px; font-family: 'Open Sans', Helvetica, Arial, sans-serif; margin: 0; padding: 3px 4px; color: #999; width: 300;"><a href="https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-10/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=resource_link" style="color: #808080; font-weight: bold;" target="_blank">The Nick and Gareth Podcast #10</a><span> by </span><a href="https://www.mixcloud.com/gareth53/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=profile_link" style="color: #808080; font-weight: bold;" target="_blank">Gareth53</a><span> on </span><a href="https://www.mixcloud.com/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=homepage_link" style="color: #808080; font-weight: bold;" target="_blank"> Mixcloud</a></p><div style="clear: both; height: 3px;"></div>	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-10/	245-the-nick-and-gareth-podcast-10				
246	7	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-9/	The Nick And Gareth Podcast #9	2012-10-07 20:24:46+01		<div style="clear: both; height: 3px; width: 300;"></div><p style="display: block; font-size: 11px; font-family: 'Open Sans', Helvetica, Arial, sans-serif; margin: 0; padding: 3px 4px; color: #999; width: 300;"><a href="https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-9/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=resource_link" style="color: #808080; font-weight: bold;" target="_blank">The Nick and Gareth Podcast #9</a><span> by </span><a href="https://www.mixcloud.com/gareth53/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=profile_link" style="color: #808080; font-weight: bold;" target="_blank">Gareth53</a><span> on </span><a href="https://www.mixcloud.com/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=homepage_link" style="color: #808080; font-weight: bold;" target="_blank"> Mixcloud</a></p><div style="clear: both; height: 3px;"></div>	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-9/	246-the-nick-and-gareth-podcast-9				
837	13	https://www.netflix.com/WiMovie/70222220?trkid=200250783	Louis Theroux's Weird Weekends: Series 1: "Weird Christmas"	2014-07-03 20:00:00+01								
838	13	https://www.netflix.com/WiMovie/70222219?trkid=200250783	Louis Theroux's Weird Weekends: Series 1: "Head for the Hills"	2014-07-03 21:00:00+01								
839	13	https://www.netflix.com/WiMovie/70287057?trkid=200250783	Dear Mr. Watterson	2014-07-03 22:00:00+01								
840	13	https://www.netflix.com/WiMovie/70243234?trkid=200250783	Craigslist Joe	2014-06-30 20:00:00+01								
841	13	https://www.netflix.com/WiMovie/70268212?trkid=200250783	The Moo Man	2014-06-29 15:00:00+01								
842	13	https://www.netflix.com/WiMovie/70222217?trkid=200250783	Louis Theroux's Weird Weekends: Series 1: "UFOs"	2014-06-22 15:00:00+01								
843	13	https://www.netflix.com/WiMovie/70253159?trkid=200250783	The Frozen Ground	2014-06-22 16:00:00+01								
844	13	https://www.netflix.com/WiMovie/70248290?trkid=200250783	House of Cards: Season 1: "Chapter 2"	2014-06-21 15:00:00+01								
845	13	https://www.netflix.com/WiMovie/70248289?trkid=200250783	House of Cards: Season 1: "Chapter 1"	2014-06-15 15:00:00+01								
846	13	https://www.netflix.com/WiMovie/70208253?trkid=200250783	Jeff, Who Lives at Home	2014-06-14 15:00:00+01								
847	13	https://www.netflix.com/WiMovie/70242063?trkid=200250783	After Porn Ends	2014-06-14 16:00:00+01								
848	13	https://www.netflix.com/WiMovie/70259447?trkid=200250783	Orange Is the New Black: Season 1: "The Chickening"	2014-06-08 15:00:00+01								
849	13	https://www.netflix.com/WiMovie/70262748?trkid=200250783	Jason Becker: Not Dead Yet	2014-06-02 20:00:00+01								
850	13	https://www.netflix.com/WiMovie/70181725?trkid=200250783	Splinters	2014-06-01 15:00:00+01								
851	13	https://www.netflix.com/WiMovie/60001871?trkid=200250783	Dark Days	2014-06-01 16:00:00+01								
852	13	https://www.netflix.com/WiMovie/70259446?trkid=200250783	Orange Is the New Black: Season 1: "Imaginary Enemies"	2014-05-29 20:00:00+01								
853	13	https://www.netflix.com/WiMovie/70188198?trkid=200250783	RuPaul's Drag Race: Season 2: "Gone with the Window"	2014-05-26 20:00:00+01								
854	13	https://www.netflix.com/WiMovie/70259445?trkid=200250783	Orange Is the New Black: Season 1: "Lesbian Request Denied"	2014-05-26 21:00:00+01								
855	13	https://www.netflix.com/WiMovie/70259444?trkid=200250783	Orange Is the New Black: Season 1: "Tit Punch"	2014-05-25 15:00:00+01								
856	13	https://www.netflix.com/WiMovie/70173634?trkid=200250783	Fat, Sick & Nearly Dead	2014-05-21 20:00:00+01								
857	13	https://www.netflix.com/WiMovie/70180345?trkid=200250783	The Elephant in the Living Room	2014-05-18 15:00:00+01								
858	13	https://www.netflix.com/WiMovie/70259443?trkid=200250783	Orange Is the New Black: Season 1: "I Wasn't Ready"	2014-05-18 16:00:00+01								
859	13	https://www.netflix.com/WiMovie/70251218?trkid=200250783	Mortified Nation	2014-05-16 20:00:00+01								
860	13	https://www.netflix.com/WiMovie/70117040?trkid=200250783	Cropsey	2014-05-13 20:00:00+01								
861	13	https://www.netflix.com/WiMovie/60034782?trkid=200250783	Primer	2014-05-11 15:00:00+01								
316	9	https://github.com/gareth53/gareth53_v2/compare/06a1990859...fb70223e96	gareth53 pushed to master at gareth53/gareth53_v2	2015-12-14 09:35:26+00		<!-- push -->\n<span class="mega-octicon octicon-git-commit"></span>\n\n<div class="time">\n  <time datetime="2015-12-14T09:35:26Z">Dec 14, 2015</time>\n</div>\n\n<div class="title">\n  <a href="https://github.com/gareth53">gareth53</a> pushed to <a href="https://github.com/gareth53/gareth53_v2/tree/master">master</a> at <a href="https://github.com/gareth53/gareth53_v2">gareth53/gareth53_v2</a>\n</div>\n\n<div class="details">\n  <a href="https://github.com/gareth53"><img alt="@gareth53" class="gravatar" height="30" src="https://avatars1.githubusercontent.com/u/39545?v=3&amp;s=60" width="30" /></a>\n\n    <div class="commits ">\n      <ul>\n        <li>\n          <span title="Gareth Senior">\n            <img alt="" height="16" src="https://2.gravatar.com/avatar/eb7287caf2279f1c30f7afee9cb7e75c?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="16" />\n          </span>\n          <code><a href="https://github.com/gareth53/gareth53_v2/commit/fb70223e960eb3d31ef43ef40cca6104de3e4778">fb70223</a></code>\n          <div class="message">\n            <blockquote>\n              fixed a bug with datetimefilter. switched to using postgres\n            </blockquote>\n          </div>\n        </li>\n      </ul>\n    </div>\n</div>	tag:github.com,2008:PushEvent/3439433253	316-gareth53-pushed-to-master-at-gareth53gareth53_				
862	13	https://www.netflix.com/WiMovie/70059028?trkid=200250783	The Bridge	2014-05-10 15:00:00+01								
259	9	https://github.com/gareth53/RssRunkeeper/compare/master	gareth53 created branch master at gareth53/RssRunkeeper	2015-12-01 17:36:57+00		<!-- create -->\n<div class="simple">\n  <span class="octicon octicon-git-branch"></span>\n\n  <div class="title">\n    <a href="https://github.com/gareth53">gareth53</a> created branch <a class="css-truncate css-truncate-target branch-name" href="https://github.com/gareth53/RssRunkeeper/tree/master" title="master">master</a> at <a href="https://github.com/gareth53/RssRunkeeper">gareth53/RssRunkeeper</a>\n  </div>\n\n  <div class="time">\n    <time datetime="2015-12-01T17:36:57Z">Dec 1, 2015</time>\n  </div>\n</div>	tag:github.com,2008:CreateEvent/3396461865	259-gareth53-created-branch-master-at-gareth53rssr				
260	9	https://github.com/gareth53/RssRunkeeper	gareth53 created repository gareth53/RssRunkeeper	2015-12-01 17:35:31+00		<!-- create -->\n<div class="simple">\n  <span class="octicon octicon-repo"></span>\n\n  <div class="title">\n    <a href="https://github.com/gareth53">gareth53</a> created repository <a href="https://github.com/gareth53/RssRunkeeper" title="gareth53/RssRunkeeper">gareth53/RssRunkeeper</a>\n  </div>\n\n  <div class="time">\n    <time datetime="2015-12-01T17:35:31Z">Dec 1, 2015</time>\n  </div>\n</div>	tag:github.com,2008:CreateEvent/3396455735	260-gareth53-created-repository-gareth53rssrunkeep				
325	12	http://strava.com/activities/448300326	Lunch Run	2015-11-26 12:57:15+00		Run (Barnet): Distance: 7.9km, Elevation Gain: 56m, Moving Time: 00:40:16, Average Speed: 11.7km/h	http://strava.com/activities/448300326	325-lunch-run				
863	13	https://www.netflix.com/WiMovie/70114973?trkid=200250783	Best Worst Movie	2014-05-05 20:00:00+01								
326	12	http://strava.com/activities/448300420	Morning Run	2015-11-20 07:42:41+00		Run (Barnet): Distance: 4.1km, Elevation Gain: 0m, Moving Time: 00:20:28, Average Speed: 11.9km/h	http://strava.com/activities/448300420	326-morning-run				
864	13	https://www.netflix.com/WiMovie/70137742?trkid=200250783	Rango	2014-04-20 15:00:00+01								
327	12	http://strava.com/activities/448300564	Morning Run	2015-11-18 07:29:48+00		Run (Barnet): Distance: 4.1km, Elevation Gain: 0m, Moving Time: 00:19:49, Average Speed: 12.3km/h	http://strava.com/activities/448300564	327-morning-run				
258	9	https://github.com/gareth53/RssRunkeeper/compare/3f00f89d3e...d2a5e03ef8	gareth53 pushed to master at gareth53/RssRunkeeper	2015-12-08 14:09:06+00		<!-- push -->\n<span class="mega-octicon octicon-git-commit"></span>\n\n<div class="time">\n  <time datetime="2015-12-08T14:09:06Z">Dec 8, 2015</time>\n</div>\n\n<div class="title">\n  <a href="https://github.com/gareth53">gareth53</a> pushed to <a href="https://github.com/gareth53/RssRunkeeper/tree/master">master</a> at <a href="https://github.com/gareth53/RssRunkeeper">gareth53/RssRunkeeper</a>\n</div>\n\n<div class="details">\n  <a href="https://github.com/gareth53"><img alt="@gareth53" class="gravatar" height="30" src="https://avatars1.githubusercontent.com/u/39545?v=3&amp;s=60" width="30" /></a>\n\n    <div class="commits ">\n      <ul>\n        <li>\n          <span title="Gareth Senior">\n            <img alt="" height="16" src="https://2.gravatar.com/avatar/eb7287caf2279f1c30f7afee9cb7e75c?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="16" />\n          </span>\n          <code><a href="https://github.com/gareth53/RssRunkeeper/commit/d2a5e03ef8f28b737d17f7cf98cd5ef925108b44">d2a5e03</a></code>\n          <div class="message">\n            <blockquote>\n              whatevs\n            </blockquote>\n          </div>\n        </li>\n        <li>\n          <span title="Gareth Senior">\n            <img alt="" height="16" src="https://2.gravatar.com/avatar/eb7287caf2279f1c30f7afee9cb7e75c?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="16" />\n          </span>\n          <code><a href="https://github.com/gareth53/RssRunkeeper/commit/2f2eebb4566026dcfada2ede82dc2594a9ccac3e">2f2eebb</a></code>\n          <div class="message">\n            <blockquote>\n              contined experimentation\n            </blockquote>\n          </div>\n        </li>\n        <li class="more"><a href="https://github.com/gareth53/RssRunkeeper/compare/3f00f89d3e...d2a5e03ef8">1 more commit &raquo;</a></li>\n      </ul>\n    </div>\n</div>	tag:github.com,2008:PushEvent/3420270246	258-gareth53-pushed-to-master-at-gareth53rssrunkee				
328	12	http://strava.com/activities/448300656	Morning Run	2015-11-14 09:00:42+00		Run (London): Distance: 5.6km, Elevation Gain: 40m, Moving Time: 00:26:31, Average Speed: 12.6km/h	http://strava.com/activities/448300656	328-morning-run				
865	13	https://www.netflix.com/WiMovie/70105212?trkid=200250783	The Office (U.S.): Season 1: "Pilot"	2014-04-17 20:00:00+01								
866	13	https://www.netflix.com/WiMovie/70228205?trkid=200250783	Drop the Dead Donkey: Series 1: "A New Dawn"	2014-04-04 20:00:00+01								
867	13	https://www.netflix.com/WiMovie/70239469?trkid=200250783	Mansome	2014-04-04 21:00:00+01								
868	13	https://www.netflix.com/WiMovie/60031683?trkid=200250783	Pumping Iron	2014-04-03 20:00:00+01								
261	9	https://github.com/gareth53/grogan/compare/10b19d1c8d...26d81474b8	gareth53 pushed to master at gareth53/grogan	2015-10-30 17:46:32+00		<!-- push -->\n<span class="mega-octicon octicon-git-commit"></span>\n\n<div class="time">\n  <time datetime="2015-10-30T17:46:32Z">Oct 30, 2015</time>\n</div>\n\n<div class="title">\n  <a href="https://github.com/gareth53">gareth53</a> pushed to <a href="https://github.com/gareth53/grogan/tree/master">master</a> at <a href="https://github.com/gareth53/grogan">gareth53/grogan</a>\n</div>\n\n<div class="details">\n  <a href="https://github.com/gareth53"><img alt="@gareth53" class="gravatar" height="30" src="https://avatars1.githubusercontent.com/u/39545?v=3&amp;s=60" width="30" /></a>\n\n    <div class="commits ">\n      <ul>\n        <li>\n          <span title="Gareth Senior">\n            <img alt="" height="16" src="https://2.gravatar.com/avatar/eb7287caf2279f1c30f7afee9cb7e75c?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="16" />\n          </span>\n          <code><a href="https://github.com/gareth53/grogan/commit/26d81474b809877a83b55da562effd5a15613807">26d8147</a></code>\n          <div class="message">\n            <blockquote>\n              massive HACK to get a demo prepared for the team\n            </blockquote>\n          </div>\n        </li>\n      </ul>\n    </div>\n</div>	tag:github.com,2008:PushEvent/3293183149	261-gareth53-pushed-to-master-at-gareth53grogan				
247	7	https://www.mixcloud.com/gareth53/grunge-is-a-dirty-word/	Grunge Is A Dirty Word	2010-05-29 22:02:29+01		<div style="clear: both; height: 3px; width: 300;"></div><p style="display: block; font-size: 11px; font-family: 'Open Sans', Helvetica, Arial, sans-serif; margin: 0; padding: 3px 4px; color: #999; width: 300;"><a href="https://www.mixcloud.com/gareth53/grunge-is-a-dirty-word/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=resource_link" style="color: #808080; font-weight: bold;" target="_blank">Grunge Is A Dirty Word</a><span> by </span><a href="https://www.mixcloud.com/gareth53/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=profile_link" style="color: #808080; font-weight: bold;" target="_blank">Gareth53</a><span> on </span><a href="https://www.mixcloud.com/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=homepage_link" style="color: #808080; font-weight: bold;" target="_blank"> Mixcloud</a></p><div style="clear: both; height: 3px;"></div>	https://www.mixcloud.com/gareth53/grunge-is-a-dirty-word/	247-grunge-is-a-dirty-word				
248	7	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-8/	The Nick And Gareth Podcast #8	2009-06-10 12:13:31+01		<div style="clear: both; height: 3px; width: 300;"></div><p style="display: block; font-size: 11px; font-family: 'Open Sans', Helvetica, Arial, sans-serif; margin: 0; padding: 3px 4px; color: #999; width: 300;"><a href="https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-8/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=resource_link" style="color: #808080; font-weight: bold;" target="_blank">The Nick and Gareth Podcast #8</a><span> by </span><a href="https://www.mixcloud.com/gareth53/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=profile_link" style="color: #808080; font-weight: bold;" target="_blank">Gareth53</a><span> on </span><a href="https://www.mixcloud.com/?utm_source=widget&amp;utm_medium=web&amp;utm_campaign=base_links&amp;utm_term=homepage_link" style="color: #808080; font-weight: bold;" target="_blank"> Mixcloud</a></p><div style="clear: both; height: 3px;"></div>	https://www.mixcloud.com/gareth53/the-nick-and-gareth-podcast-8/	248-the-nick-and-gareth-podcast-8				
618	14	http://www.garminconnect.com/users/gareth.senior/	1 steps	2016-01-07 08:39:10+00								
329	12	http://strava.com/activities/448300719	Morning Run	2015-11-11 07:38:27+00		Run (Barnet): Distance: 4.4km, Elevation Gain: 0m, Moving Time: 00:22:05, Average Speed: 11.9km/h	http://strava.com/activities/448300719	329-morning-run				
315	9	https://github.com/gareth53/gareth53_v2/compare/fb70223e96...c6d12e4324	gareth53 pushed to master at gareth53/gareth53_v2	2015-12-14 18:04:14+00		<!-- push -->\n<span class="mega-octicon octicon-git-commit"></span>\n\n<div class="time">\n  <time datetime="2015-12-14T18:04:14Z">Dec 14, 2015</time>\n</div>\n\n<div class="title">\n  <a href="https://github.com/gareth53">gareth53</a> pushed to <a href="https://github.com/gareth53/gareth53_v2/tree/master">master</a> at <a href="https://github.com/gareth53/gareth53_v2">gareth53/gareth53_v2</a>\n</div>\n\n<div class="details">\n  <a href="https://github.com/gareth53"><img alt="@gareth53" class="gravatar" height="30" src="https://avatars1.githubusercontent.com/u/39545?v=3&amp;s=60" width="30" /></a>\n\n    <div class="commits ">\n      <ul>\n        <li>\n          <span title="Gareth Senior">\n            <img alt="" height="16" src="https://2.gravatar.com/avatar/eb7287caf2279f1c30f7afee9cb7e75c?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="16" />\n          </span>\n          <code><a href="https://github.com/gareth53/gareth53_v2/commit/c6d12e432442dea7c39b8d7a277978c0adccf917">c6d12e4</a></code>\n          <div class="message">\n            <blockquote>\n              added a basic DRF serializer, plus a MixCloud parser that outputs RSS…\n            </blockquote>\n          </div>\n        </li>\n        <li>\n          <span title="Gareth Senior">\n            <img alt="" height="16" src="https://2.gravatar.com/avatar/eb7287caf2279f1c30f7afee9cb7e75c?d=https%3A%2F%2Fassets-cdn.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png&amp;r=x&amp;s=140" width="16" />\n          </span>\n          <code><a href="https://github.com/gareth53/gareth53_v2/commit/9442a22a27f3a2d28910f00f323f15ea1c6a22df">9442a22</a></code>\n          <div class="message">\n            <blockquote>\n              upgrade to Django 1.9\n            </blockquote>\n          </div>\n        </li>\n        <li class="more"><a href="https://github.com/gareth53/gareth53_v2/compare/fb70223e96...c6d12e4324">View comparison for these 2 commits &raquo;</a></li>\n      </ul>\n    </div>\n</div>	tag:github.com,2008:PushEvent/3441343058	315-gareth53-pushed-to-master-at-gareth53gareth53_				
330	12	http://strava.com/activities/448300808	Morning Run	2015-11-08 09:36:30+00		Run (Barnet, England): Distance: 4.3km, Elevation Gain: 59m, Moving Time: 00:28:09, Average Speed: 9.1km/h	http://strava.com/activities/448300808	330-morning-run				
301	5	https://vice.com/read/i-catfished-hundreds-of-boys-to-learn-about-the-male-sex?utm_source=vicetwitterus	I Catfished Hundreds of Boys to Understand the Male Sex	2015-12-16 18:24:30+00			https://vice.com/read/i-catfished-hundreds-of-boys-to-learn-about-the-male-sex?utm_source=vicetwitterus	301-i-catfished-hundreds-of-boys-to-understand-the				
331	12	http://strava.com/activities/448300890	Morning Run	2015-11-07 09:01:07+00		Run (London): Distance: 5.5km, Elevation Gain: 40m, Moving Time: 00:27:03, Average Speed: 12.3km/h	http://strava.com/activities/448300890	331-morning-run				
303	5	http://theguardian.com/uk-news/2015/nov/20/lisa-jones-girlfriend-of-undercover-police-office-mark-kennedy-interview?utm_source=pocket&utm_medium=email&utm_campaign=pockethits	Lisa Jones, girlfriend of undercover policeman Mark Kennedy: ‘I thought I knew him better than anyone’	2015-12-15 08:58:04+00			http://theguardian.com/uk-news/2015/nov/20/lisa-jones-girlfriend-of-undercover-police-office-mark-kennedy-interview?utm_source=pocket&utm_medium=email&utm_campaign=pockethits	303-lisa-jones-girlfriend-of-undercover-policeman-				
332	12	http://strava.com/activities/448300994	Morning Run	2015-11-01 09:24:19+00		Run (Barnet, England): Distance: 5.5km, Elevation Gain: 78m, Moving Time: 00:31:55, Average Speed: 10.3km/h	http://strava.com/activities/448300994	332-morning-run				
333	12	http://strava.com/activities/448301112	Morning Run	2015-10-31 08:35:03+00		Run (London): Distance: 3.4km, Elevation Gain: 83m, Moving Time: 00:18:59, Average Speed: 10.9km/h	http://strava.com/activities/448301112	333-morning-run				
334	12	http://strava.com/activities/448301183	Morning Run	2015-10-29 08:30:27+00		Run (London): Distance: 3.0km, Elevation Gain: 12m, Moving Time: 00:15:15, Average Speed: 12.0km/h	http://strava.com/activities/448301183	334-morning-run				
335	12	http://strava.com/activities/448301277	Morning Run	2015-10-29 07:51:12+00		Run (Barnet): Distance: 1.1km, Elevation Gain: 0m, Moving Time: 00:06:09, Average Speed: 11.2km/h	http://strava.com/activities/448301277	335-morning-run				
336	12	http://strava.com/activities/448301375	Morning Run	2015-10-27 07:45:14+00		Run (Barnet): Distance: 4.3km, Elevation Gain: 0m, Moving Time: 00:23:23, Average Speed: 11.1km/h	http://strava.com/activities/448301375	336-morning-run				
337	12	http://strava.com/activities/448301523	Morning Run	2015-10-25 09:16:24+00		Run (Barnet, England): Distance: 5.0km, Elevation Gain: 62m, Moving Time: 00:28:39, Average Speed: 10.5km/h	http://strava.com/activities/448301523	337-morning-run				
338	12	http://strava.com/activities/448301637	Morning Run	2015-10-21 06:26:27+01		Run (Barnet): Distance: 6.4km, Elevation Gain: 0m, Moving Time: 00:33:10, Average Speed: 11.6km/h	http://strava.com/activities/448301637	338-morning-run				
339	12	http://strava.com/activities/448301734	Morning Walk	2015-10-18 09:17:12+01		Walk (Barnet, England): Distance: 5.3km, Elevation Gain: 62m, Moving Time: 01:03:19, Average Speed: 5.0km/h	http://strava.com/activities/448301734	339-morning-walk				
340	12	http://strava.com/activities/448301828	Morning Run	2015-10-17 08:03:27+01		Run (London): Distance: 5.3km, Elevation Gain: 39m, Moving Time: 00:25:52, Average Speed: 12.4km/h	http://strava.com/activities/448301828	340-morning-run				
341	12	http://strava.com/activities/448301941	Afternoon Run	2015-10-16 14:54:27+01		Run (Barnet): Distance: 5.3km, Elevation Gain: 44m, Moving Time: 00:31:09, Average Speed: 10.2km/h	http://strava.com/activities/448301941	341-afternoon-run				
342	12	http://strava.com/activities/448302046	Afternoon Run	2015-10-13 12:31:49+01		Run (London, England): Distance: 4.7km, Elevation Gain: 28m, Moving Time: 00:24:18, Average Speed: 11.5km/h	http://strava.com/activities/448302046	342-afternoon-run				
343	12	http://strava.com/activities/448302138	Morning Walk	2015-10-11 07:56:36+01		Walk (Barnet, England): Distance: 5.3km, Elevation Gain: 57m, Moving Time: 00:51:11, Average Speed: 6.2km/h	http://strava.com/activities/448302138	343-morning-walk				
344	12	http://strava.com/activities/448302254	Morning Run	2015-10-10 07:55:33+01		Run (Barnet): Distance: 11.5km, Elevation Gain: 128m, Moving Time: 00:56:43, Average Speed: 12.2km/h	http://strava.com/activities/448302254	344-morning-run				
345	12	http://strava.com/activities/448302332	Morning Run	2015-10-08 07:04:27+01		Run (Barnet): Distance: 7.6km, Elevation Gain: 55m, Moving Time: 00:40:37, Average Speed: 11.2km/h	http://strava.com/activities/448302332	345-morning-run				
346	12	http://strava.com/activities/448302416	Morning Run	2015-10-06 06:35:07+01		Run (Barnet): Distance: 4.4km, Elevation Gain: 0m, Moving Time: 00:22:14, Average Speed: 12.0km/h	http://strava.com/activities/448302416	346-morning-run				
\.


--
-- Name: lifestream_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('lifestream_item_id_seq', 868, true);


--
-- Data for Name: lifestream_source; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY lifestream_source (id, name, slug, url, last_check, last_update, image, description, profile, website, active, username, password, item_summary_template) FROM stdin;
13	Netflix	netflix	http://www.gareth53.co.uk/	\N	\N		Netflix is ace. The user interface is not. But it remains ace and better than Amazon Prime  in my opinion.			t			{{ items|length}} view{{ items|pluralize }} on <a href="{{ source.get_absolute_url }}">Netflix</a>
2	delicious	delicious	http://feeds.delicious.com/v2/rss/gareth53	2015-12-26 11:24:21.50406+00	2015-12-16 12:41:06+00		Bookmarks. I use it more for giving web content a "thumbs up". I rarely search thru my account for links, maybe I should be smarter about it...			t			{{ items|length }} bookmark{{ items|pluralize}} using <a href="{{ source.get_absolute_url }}">{{ source }}</a>
14	Garmin Connect	garmin	http://audioboom.com/users/1011/boos/favourites.rss	\N	\N		I got a GPS watch. It tracks daily step counts and is a helpful running companion			t			Step{{ items|pluralize }} tracked
8	Goodreads	goodreads	http://www.goodreads.com/review/list_rss/353006?key=dcd4dc3d9ec642e49244ee70ed3b3eacbfd210f8&shelf=read	2015-12-26 11:24:32.438832+00	2015-06-05 13:17:07+01		I don't read many traditional books. I barely read any fiction. But I like to track the few books that I do manage to consume			t			I read a book! (via Goodreads)
5	Pocket	pocket	http://getpocket.com/users/gareth53/feed/read	2015-12-27 18:42:43.893142+00	2015-12-22 15:10:11+00		For reading online content offline, mostly on my commute.			t			{{items|length}} read{{ items|pluralize }} using <a href="{{ source.get_absolute_url }}">Pocket</a>
3	Flickr	flickr	http://api.flickr.com/services/feeds/photos_public.gne?id=40517523@N00&lang=en-us&format=rss_200	2015-12-26 11:24:26.450746+00	2015-05-07 08:40:22+01		Mostly for holiday snaps if I'm honest. Flickr seemed more important before phones got cameras			t			I uploaded {{ items|length }} photo{{ items|pluralize }} to <a href="{{ source.get_absolute_url }}">flickr</a>.
9	GitHub	github	https://github.com/gareth53.atom	2015-12-26 11:24:43.094263+00	2015-12-15 17:42:44+00		No massive open-source projects, but I often code for recreation.			t			{{ items|length }} commit{{ items|pluralize }} to <a href="{{ source.get_absolute_url }}">{{ source.name }}</a>
7	Mixcloud	mixcloud	http://bits.meloncholy.com/mixcloud-rss/gareth53	2015-12-26 11:24:37.304119+00	2012-10-08 21:07:49+01		Online DJ mixes and radio content. A podcast I recorded with m'colleague Nick Peters is up there			t			A uploaded new mix on <a href="https://www.mixcloud.com/gareth53/">Mixcloud</a>
10	Vimeo Videos	vimeo-videos	http://vimeo.com/user5479400/videos/rss	2015-12-26 11:24:40.209322+00	2010-12-14 09:56:45+00		I might upload more video to my Vimeo channel one day. Well.... I *might*			t			I uploaded video{{ items|pluralize }} to <a href="{{ source.get_absolute_url }}">Vimeo</a>
11	Vimeo Viewing	vimeo-views	http://vimeo.com/user5479400/likes/rss	2015-12-26 11:24:48.787546+00	2015-12-11 16:08:01+00		YouTube won the war didn't it? I liked Vimeo as a brand and it seemed to attract content of a distinct class and strata. I still like it, I don't use it much...			t			I watched {{ items|pluralize:'a, some' }} video{{ items|pluralize }} on <a href="{{ source.get_absolute_url }}">Vimeo</a>
12	Strava	strava	http://feedmyride.net/rides/9374023	2015-12-26 11:24:46.390518+00	2015-12-13 09:03:59+00		For tracking biking activities. I sync RunKeeper activities to Strava too.			t			{{ items|length }} activit{{ items|pluralize:"y,ies" }} via <a href="{{ source.get_absolute_url }}">Strava</a>
1	AudioBoom	audioboom	http://audioboom.com/users/1011/boos/favourites.rss	2015-12-26 11:24:51.091465+00	2015-04-11 17:33:59+01		Online portal for shortform radio content - upon launch it was styled as an "audio twitter".		http://www.audioboom.fm/	t			{{ items|length }} listen{{ items|pluralize }} on AudioBoom
6	Wordpress	wordpress	http://gareth53.wordpress.com/feed/	2015-12-26 11:24:28.842516+00	2015-08-08 14:42:45+01		I built a blog engine in Django (everybody did!).I then realised I had little impulse to blog and ended up maintaining a platform I wasn't using. Blogging via Wordpress now - the most popular blogging platform on t;internet			t			Blog alert! (via <a href="{{ source.get_absolute_url }}">WordPress</a)
\.


--
-- Name: lifestream_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('lifestream_source_id_seq', 14, true);


--
-- Data for Name: south_migrationhistory; Type: TABLE DATA; Schema: public; Owner: gareth53
--

COPY south_migrationhistory (id, app_name, migration, applied) FROM stdin;
1	lifestream	0001_initial	2015-12-11 14:21:14.71843+00
2	lifestream	0002_initial_fixture_load	2015-12-11 14:21:14.738919+00
3	articles	0001_initial	2015-12-11 14:21:14.817723+00
4	blog	0001_initial	2015-12-11 14:21:14.90204+00
\.


--
-- Name: south_migrationhistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gareth53
--

SELECT pg_catalog.setval('south_migrationhistory_id_seq', 4, true);


--
-- Name: articles_article_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY articles_article
    ADD CONSTRAINT articles_article_pkey PRIMARY KEY (id);


--
-- Name: articles_promo_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY articles_promo
    ADD CONSTRAINT articles_promo_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_blogcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY blog_blogcategory
    ADD CONSTRAINT blog_blogcategory_pkey PRIMARY KEY (id);


--
-- Name: blog_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY blog_entry
    ADD CONSTRAINT blog_entry_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_pkey PRIMARY KEY (id);


--
-- Name: django_redirect_site_id_old_path_key; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_site_id_old_path_key UNIQUE (site_id, old_path);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: lifestream_item_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY lifestream_item
    ADD CONSTRAINT lifestream_item_pkey PRIMARY KEY (id);


--
-- Name: lifestream_source_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY lifestream_source
    ADD CONSTRAINT lifestream_source_pkey PRIMARY KEY (id);


--
-- Name: south_migrationhistory_pkey; Type: CONSTRAINT; Schema: public; Owner: gareth53; Tablespace: 
--

ALTER TABLE ONLY south_migrationhistory
    ADD CONSTRAINT south_migrationhistory_pkey PRIMARY KEY (id);


--
-- Name: articles_article_pod_promos_id; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX articles_article_pod_promos_id ON articles_article USING btree (pod_promos_id);


--
-- Name: articles_article_slug; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX articles_article_slug ON articles_article USING btree (slug);


--
-- Name: articles_article_slug_like; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX articles_article_slug_like ON articles_article USING btree (slug varchar_pattern_ops);


--
-- Name: articles_promo_article_link_id; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX articles_promo_article_link_id ON articles_promo USING btree (article_link_id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_blogcategory_slug; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX blog_blogcategory_slug ON blog_blogcategory USING btree (slug);


--
-- Name: blog_blogcategory_slug_like; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX blog_blogcategory_slug_like ON blog_blogcategory USING btree (slug varchar_pattern_ops);


--
-- Name: blog_entry_category_id; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX blog_entry_category_id ON blog_entry USING btree (category_id);


--
-- Name: blog_entry_slug; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX blog_entry_slug ON blog_entry USING btree (slug);


--
-- Name: blog_entry_slug_like; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX blog_entry_slug_like ON blog_entry USING btree (slug varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_redirect_old_path; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX django_redirect_old_path ON django_redirect USING btree (old_path);


--
-- Name: django_redirect_old_path_like; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX django_redirect_old_path_like ON django_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: django_redirect_site_id; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX django_redirect_site_id ON django_redirect USING btree (site_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: lifestream_item_feed_id; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX lifestream_item_feed_id ON lifestream_item USING btree (feed_id);


--
-- Name: lifestream_item_slug; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX lifestream_item_slug ON lifestream_item USING btree (slug);


--
-- Name: lifestream_item_slug_like; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX lifestream_item_slug_like ON lifestream_item USING btree (slug varchar_pattern_ops);


--
-- Name: lifestream_source_slug; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX lifestream_source_slug ON lifestream_source USING btree (slug);


--
-- Name: lifestream_source_slug_like; Type: INDEX; Schema: public; Owner: gareth53; Tablespace: 
--

CREATE INDEX lifestream_source_slug_like ON lifestream_source USING btree (slug varchar_pattern_ops);


--
-- Name: article_link_id_refs_id_1c908c0959ed5bba; Type: FK CONSTRAINT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY articles_promo
    ADD CONSTRAINT article_link_id_refs_id_1c908c0959ed5bba FOREIGN KEY (article_link_id) REFERENCES articles_article(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: category_id_refs_id_966cd8180d802e2; Type: FK CONSTRAINT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY blog_entry
    ADD CONSTRAINT category_id_refs_id_966cd8180d802e2 FOREIGN KEY (category_id) REFERENCES blog_blogcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_redirect_site_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_site_id_fkey FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: feed_id_refs_id_7816ca66c22bc44b; Type: FK CONSTRAINT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY lifestream_item
    ADD CONSTRAINT feed_id_refs_id_7816ca66c22bc44b FOREIGN KEY (feed_id) REFERENCES lifestream_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pod_promos_id_refs_id_7e5d049395e833e8; Type: FK CONSTRAINT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY articles_article
    ADD CONSTRAINT pod_promos_id_refs_id_7e5d049395e833e8 FOREIGN KEY (pod_promos_id) REFERENCES articles_promo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: gareth53
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: gareth.senior
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "gareth.senior";
GRANT ALL ON SCHEMA public TO "gareth.senior";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

