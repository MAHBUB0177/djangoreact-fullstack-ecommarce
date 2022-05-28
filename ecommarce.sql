--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3
-- Dumped by pg_dump version 13.3

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
-- Name: ecommarce1; Type: SCHEMA; Schema: -; Owner: ecommarce1
--

CREATE SCHEMA ecommarce1;


ALTER SCHEMA ecommarce1 OWNER TO ecommarce1;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_customuser; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.account_customuser (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL
);


ALTER TABLE public.account_customuser OWNER TO ecommerce;

--
-- Name: account_customuser_groups; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.account_customuser_groups (
    id integer NOT NULL,
    customuser_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.account_customuser_groups OWNER TO ecommerce;

--
-- Name: account_customuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.account_customuser_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_customuser_groups_id_seq OWNER TO ecommerce;

--
-- Name: account_customuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.account_customuser_groups_id_seq OWNED BY public.account_customuser_groups.id;


--
-- Name: account_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.account_customuser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_customuser_id_seq OWNER TO ecommerce;

--
-- Name: account_customuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.account_customuser_id_seq OWNED BY public.account_customuser.id;


--
-- Name: account_customuser_user_permissions; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.account_customuser_user_permissions (
    id integer NOT NULL,
    customuser_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.account_customuser_user_permissions OWNER TO ecommerce;

--
-- Name: account_customuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.account_customuser_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_customuser_user_permissions_id_seq OWNER TO ecommerce;

--
-- Name: account_customuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.account_customuser_user_permissions_id_seq OWNED BY public.account_customuser_user_permissions.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ecommerce;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ecommerce;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ecommerce;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ecommerce;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ecommerce;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ecommerce;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO ecommerce;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO ecommerce;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ecommerce;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ecommerce;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ecommerce;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ecommerce;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ecommerce;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ecommerce;

--
-- Name: shop_brand; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.shop_brand (
    id integer NOT NULL,
    title character varying(150) NOT NULL,
    logo character varying(100),
    details text,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.shop_brand OWNER TO ecommerce;

--
-- Name: shop_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.shop_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_brand_id_seq OWNER TO ecommerce;

--
-- Name: shop_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.shop_brand_id_seq OWNED BY public.shop_brand.id;


--
-- Name: shop_cart; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.shop_cart (
    id integer NOT NULL,
    total integer NOT NULL,
    complit boolean NOT NULL,
    date timestamp with time zone NOT NULL,
    customer_id integer NOT NULL,
    CONSTRAINT shop_cart_total_check CHECK ((total >= 0))
);


ALTER TABLE public.shop_cart OWNER TO ecommerce;

--
-- Name: shop_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.shop_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_cart_id_seq OWNER TO ecommerce;

--
-- Name: shop_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.shop_cart_id_seq OWNED BY public.shop_cart.id;


--
-- Name: shop_cartproduct; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.shop_cartproduct (
    id integer NOT NULL,
    quantity integer NOT NULL,
    total integer NOT NULL,
    cart_id integer NOT NULL,
    CONSTRAINT shop_cartproduct_quantity_check CHECK ((quantity >= 0)),
    CONSTRAINT shop_cartproduct_total_check CHECK ((total >= 0))
);


ALTER TABLE public.shop_cartproduct OWNER TO ecommerce;

--
-- Name: shop_cartproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.shop_cartproduct_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_cartproduct_id_seq OWNER TO ecommerce;

--
-- Name: shop_cartproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.shop_cartproduct_id_seq OWNED BY public.shop_cartproduct.id;


--
-- Name: shop_cartproduct_product; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.shop_cartproduct_product (
    id integer NOT NULL,
    cartproduct_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.shop_cartproduct_product OWNER TO ecommerce;

--
-- Name: shop_cartproduct_product_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.shop_cartproduct_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_cartproduct_product_id_seq OWNER TO ecommerce;

--
-- Name: shop_cartproduct_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.shop_cartproduct_product_id_seq OWNED BY public.shop_cartproduct_product.id;


--
-- Name: shop_category; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.shop_category (
    id integer NOT NULL,
    title character varying(150) NOT NULL,
    image character varying(100),
    details text,
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.shop_category OWNER TO ecommerce;

--
-- Name: shop_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.shop_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_category_id_seq OWNER TO ecommerce;

--
-- Name: shop_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.shop_category_id_seq OWNED BY public.shop_category.id;


--
-- Name: shop_customer; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.shop_customer (
    id integer NOT NULL,
    name character varying(150),
    mobile character varying(16) NOT NULL,
    address text,
    username character varying(150),
    user_id integer NOT NULL,
    prof_image character varying(100)
);


ALTER TABLE public.shop_customer OWNER TO ecommerce;

--
-- Name: shop_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.shop_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_customer_id_seq OWNER TO ecommerce;

--
-- Name: shop_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.shop_customer_id_seq OWNED BY public.shop_customer.id;


--
-- Name: shop_order; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.shop_order (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    mobile character varying(16) NOT NULL,
    address text NOT NULL,
    email character varying(160) NOT NULL,
    order_status character varying(100) NOT NULL,
    date timestamp with time zone NOT NULL,
    cart_id integer NOT NULL
);


ALTER TABLE public.shop_order OWNER TO ecommerce;

--
-- Name: shop_order_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.shop_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_order_id_seq OWNER TO ecommerce;

--
-- Name: shop_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.shop_order_id_seq OWNED BY public.shop_order.id;


--
-- Name: shop_product; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.shop_product (
    id integer NOT NULL,
    title character varying(150) NOT NULL,
    image character varying(100) NOT NULL,
    oldprice integer,
    price integer NOT NULL,
    discount integer,
    details text NOT NULL,
    tegs text,
    "time" timestamp with time zone NOT NULL,
    brand_id integer,
    CONSTRAINT shop_product_discount_check CHECK ((discount >= 0)),
    CONSTRAINT shop_product_oldprice_check CHECK ((oldprice >= 0)),
    CONSTRAINT shop_product_price_check CHECK ((price >= 0))
);


ALTER TABLE public.shop_product OWNER TO ecommerce;

--
-- Name: shop_product_category; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.shop_product_category (
    id integer NOT NULL,
    product_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.shop_product_category OWNER TO ecommerce;

--
-- Name: shop_product_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.shop_product_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_product_category_id_seq OWNER TO ecommerce;

--
-- Name: shop_product_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.shop_product_category_id_seq OWNED BY public.shop_product_category.id;


--
-- Name: shop_product_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.shop_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_product_id_seq OWNER TO ecommerce;

--
-- Name: shop_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.shop_product_id_seq OWNED BY public.shop_product.id;


--
-- Name: shop_productview; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.shop_productview (
    id integer NOT NULL,
    view integer NOT NULL,
    product_id integer NOT NULL,
    CONSTRAINT shop_productview_view_check CHECK ((view >= 0))
);


ALTER TABLE public.shop_productview OWNER TO ecommerce;

--
-- Name: shop_productview_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.shop_productview_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_productview_id_seq OWNER TO ecommerce;

--
-- Name: shop_productview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.shop_productview_id_seq OWNED BY public.shop_productview.id;


--
-- Name: shop_profile; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.shop_profile (
    id integer NOT NULL,
    prof_image character varying(100),
    prouser_id integer NOT NULL
);


ALTER TABLE public.shop_profile OWNER TO ecommerce;

--
-- Name: shop_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.shop_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_profile_id_seq OWNER TO ecommerce;

--
-- Name: shop_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.shop_profile_id_seq OWNED BY public.shop_profile.id;


--
-- Name: shop_review; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.shop_review (
    id integer NOT NULL,
    title text NOT NULL,
    customer_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.shop_review OWNER TO ecommerce;

--
-- Name: shop_review_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.shop_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_review_id_seq OWNER TO ecommerce;

--
-- Name: shop_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.shop_review_id_seq OWNED BY public.shop_review.id;


--
-- Name: shop_slider; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.shop_slider (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    details text NOT NULL,
    image character varying(100) NOT NULL,
    url text NOT NULL,
    product_id integer
);


ALTER TABLE public.shop_slider OWNER TO ecommerce;

--
-- Name: shop_slider_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.shop_slider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_slider_id_seq OWNER TO ecommerce;

--
-- Name: shop_slider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.shop_slider_id_seq OWNED BY public.shop_slider.id;


--
-- Name: shop_trendingproduct; Type: TABLE; Schema: public; Owner: ecommerce
--

CREATE TABLE public.shop_trendingproduct (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    products_id integer NOT NULL
);


ALTER TABLE public.shop_trendingproduct OWNER TO ecommerce;

--
-- Name: shop_trendingproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: ecommerce
--

CREATE SEQUENCE public.shop_trendingproduct_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_trendingproduct_id_seq OWNER TO ecommerce;

--
-- Name: shop_trendingproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ecommerce
--

ALTER SEQUENCE public.shop_trendingproduct_id_seq OWNED BY public.shop_trendingproduct.id;


--
-- Name: account_customuser id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.account_customuser ALTER COLUMN id SET DEFAULT nextval('public.account_customuser_id_seq'::regclass);


--
-- Name: account_customuser_groups id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.account_customuser_groups ALTER COLUMN id SET DEFAULT nextval('public.account_customuser_groups_id_seq'::regclass);


--
-- Name: account_customuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.account_customuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.account_customuser_user_permissions_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: shop_brand id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_brand ALTER COLUMN id SET DEFAULT nextval('public.shop_brand_id_seq'::regclass);


--
-- Name: shop_cart id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_cart ALTER COLUMN id SET DEFAULT nextval('public.shop_cart_id_seq'::regclass);


--
-- Name: shop_cartproduct id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_cartproduct ALTER COLUMN id SET DEFAULT nextval('public.shop_cartproduct_id_seq'::regclass);


--
-- Name: shop_cartproduct_product id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_cartproduct_product ALTER COLUMN id SET DEFAULT nextval('public.shop_cartproduct_product_id_seq'::regclass);


--
-- Name: shop_category id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_category ALTER COLUMN id SET DEFAULT nextval('public.shop_category_id_seq'::regclass);


--
-- Name: shop_customer id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_customer ALTER COLUMN id SET DEFAULT nextval('public.shop_customer_id_seq'::regclass);


--
-- Name: shop_order id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_order ALTER COLUMN id SET DEFAULT nextval('public.shop_order_id_seq'::regclass);


--
-- Name: shop_product id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_product ALTER COLUMN id SET DEFAULT nextval('public.shop_product_id_seq'::regclass);


--
-- Name: shop_product_category id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_product_category ALTER COLUMN id SET DEFAULT nextval('public.shop_product_category_id_seq'::regclass);


--
-- Name: shop_productview id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_productview ALTER COLUMN id SET DEFAULT nextval('public.shop_productview_id_seq'::regclass);


--
-- Name: shop_profile id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_profile ALTER COLUMN id SET DEFAULT nextval('public.shop_profile_id_seq'::regclass);


--
-- Name: shop_review id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_review ALTER COLUMN id SET DEFAULT nextval('public.shop_review_id_seq'::regclass);


--
-- Name: shop_slider id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_slider ALTER COLUMN id SET DEFAULT nextval('public.shop_slider_id_seq'::regclass);


--
-- Name: shop_trendingproduct id; Type: DEFAULT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_trendingproduct ALTER COLUMN id SET DEFAULT nextval('public.shop_trendingproduct_id_seq'::regclass);


--
-- Data for Name: account_customuser; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.account_customuser (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, email) FROM stdin;
1	pbkdf2_sha256$216000$xYVNfhvY7qCY$dIRWAc/OeYWLri/1IEc9uoumXtW9xqY0Id7MRbq8HHw=	2022-03-02 19:57:39.392229+06	t			t	t	2022-02-27 21:50:48.96035+06	ma01776879@gmail.com
21	pbkdf2_sha256$216000$9FAfGtu9VefO$ujWabyFS9uUD5aZSx6iTwEEkzG1KMh1pP8LahrjjByY=	2022-04-01 20:52:39.027132+06	t			t	t	2022-04-01 20:51:42.836335+06	mahabub9283@gmail.com
24	pbkdf2_sha256$216000$MpmMz7LGFV3z$wZU1dUYpyIWqVWlC85vGEL/uGFsEXdv6L4duFqWUBZQ=	\N	f			f	t	2022-04-03 21:30:06.000819+06	admin@gmail.com
25	pbkdf2_sha256$216000$ZsTiMhjTvmOS$Sp0YEWEquvvU6wie4OpFPrDB1PZax0BzJDuCJUFOu5w=	\N	f			f	t	2022-04-14 15:19:12.684068+06	mahabub122@gmail.com
26	pbkdf2_sha256$216000$U34vTtsW6GmT$6gofUmKIZkMxpRbgr4oKrrka9UT+Lecg1DAlRErP2dk=	2022-04-14 15:25:15.25616+06	t			t	t	2022-04-14 15:24:49.335671+06	mahabub00@gmai.com
27	pbkdf2_sha256$216000$LK4zSDpS42YY$odNyrjHtlEkHV+7PxuEMlP+kV7Nt3bB4BFGNBVmAKJs=	\N	t			t	t	2022-05-23 22:52:08.011386+06	mahbub@gmail.com
\.


--
-- Data for Name: account_customuser_groups; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.account_customuser_groups (id, customuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: account_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.account_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
77	Can add log entry	25	add_logentry
78	Can change log entry	25	change_logentry
79	Can delete log entry	25	delete_logentry
80	Can view log entry	25	view_logentry
81	Can add permission	26	add_permission
82	Can change permission	26	change_permission
83	Can delete permission	26	delete_permission
84	Can view permission	26	view_permission
85	Can add group	27	add_group
86	Can change group	27	change_group
87	Can delete group	27	delete_group
88	Can view group	27	view_group
89	Can add content type	28	add_contenttype
90	Can change content type	28	change_contenttype
91	Can delete content type	28	delete_contenttype
92	Can view content type	28	view_contenttype
93	Can add session	29	add_session
94	Can change session	29	change_session
95	Can delete session	29	delete_session
96	Can view session	29	view_session
97	Can add Token	30	add_token
98	Can change Token	30	change_token
99	Can delete Token	30	delete_token
100	Can view Token	30	view_token
101	Can add token	31	add_tokenproxy
102	Can change token	31	change_tokenproxy
103	Can delete token	31	delete_tokenproxy
104	Can view token	31	view_tokenproxy
105	Can add user	32	add_customuser
106	Can change user	32	change_customuser
107	Can delete user	32	delete_customuser
108	Can view user	32	view_customuser
109	Can add customer	24	add_customer
110	Can change customer	24	change_customer
111	Can delete customer	24	delete_customer
112	Can view customer	24	view_customer
113	Can add brand	22	add_brand
114	Can change brand	22	change_brand
115	Can delete brand	22	delete_brand
116	Can view brand	22	view_brand
117	Can add cart	33	add_cart
118	Can change cart	33	change_cart
119	Can delete cart	33	delete_cart
120	Can view cart	33	view_cart
121	Can add category	21	add_category
122	Can change category	21	change_category
123	Can delete category	21	delete_category
124	Can view category	21	view_category
125	Can add product	20	add_product
126	Can change product	20	change_product
127	Can delete product	20	delete_product
128	Can view product	20	view_product
129	Can add trending product	23	add_trendingproduct
130	Can change trending product	23	change_trendingproduct
131	Can delete trending product	23	delete_trendingproduct
132	Can view trending product	23	view_trendingproduct
133	Can add slider	34	add_slider
134	Can change slider	34	change_slider
135	Can delete slider	34	delete_slider
136	Can view slider	34	view_slider
137	Can add review	35	add_review
138	Can change review	35	change_review
139	Can delete review	35	delete_review
140	Can view review	35	view_review
141	Can add product view	36	add_productview
142	Can change product view	36	change_productview
143	Can delete product view	36	delete_productview
144	Can view product view	36	view_productview
145	Can add order	37	add_order
146	Can change order	37	change_order
147	Can delete order	37	delete_order
148	Can view order	37	view_order
149	Can add cart product	38	add_cartproduct
150	Can change cart product	38	change_cartproduct
151	Can delete cart product	38	delete_cartproduct
152	Can view cart product	38	view_cartproduct
153	Can add profile	39	add_profile
154	Can change profile	39	change_profile
155	Can delete profile	39	delete_profile
156	Can view profile	39	view_profile
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
e9fd58a9efc2cea7f4d502d1ea8a53f49bb0f74e	2022-02-27 21:50:49.161031+06	1
7160f8425806c496bd3a02d8c3097453d23d3816	2022-04-01 20:51:43.168828+06	21
7c02cfcaa062646dd8227ed2b444fb9496c6bea3	2022-04-03 21:30:07.218976+06	24
edd90a3052b1db872a1fa8971069d62becdf45d2	2022-04-14 15:19:13.645821+06	25
e5a9b475655f543deccbbf2a2a7f147550f1d97c	2022-04-14 15:24:49.538956+06	26
c9c023ac7209e3413ad5a17009dc6845c50dbd5e	2022-05-23 22:52:09.401202+06	27
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-02-27 21:53:00.982983+06	1	category1	1	[{"added": {}}]	21	1
2	2022-02-27 21:54:17.876864+06	1	Arong	1	[{"added": {}}]	22	1
3	2022-02-27 21:55:50.706776+06	1	product1	1	[{"added": {}}]	20	1
4	2022-02-27 22:01:47.25499+06	1	TrendingProduct object (1)	1	[{"added": {}}]	23	1
5	2022-03-02 20:00:50.461275+06	2	Eassy	1	[{"added": {}}]	22	1
6	2022-03-02 20:01:16.917088+06	3	Police	1	[{"added": {}}]	22	1
7	2022-03-02 20:01:44.140124+06	4	Addidas	1	[{"added": {}}]	22	1
8	2022-03-02 20:02:07.048376+06	5	Raymond	1	[{"added": {}}]	22	1
9	2022-03-02 20:02:36.124423+06	6	Nike	1	[{"added": {}}]	22	1
10	2022-03-02 20:04:25.816547+06	2	Women Fashion	1	[{"added": {}}]	21	1
11	2022-03-02 20:05:14.063812+06	3	Means collection	1	[{"added": {}}]	21	1
12	2022-03-02 20:06:51.081044+06	2	Gaints T-shirt	1	[{"added": {}}]	20	1
13	2022-03-02 20:07:25.96944+06	3	Shirt	1	[{"added": {}}]	20	1
14	2022-03-02 20:08:07.17016+06	4	blezer	1	[{"added": {}}]	20	1
15	2022-03-02 20:08:49.458983+06	5	Shoes	1	[{"added": {}}]	20	1
16	2022-03-02 20:35:35.211133+06	3	ma009@gmail.com	2	[{"changed": {"fields": ["Name", "Mobile", "Prof image", "Address"]}}]	24	1
17	2022-03-02 21:26:39.962836+06	1	profile object (1)	1	[{"added": {}}]	39	1
18	2022-03-03 20:16:18.510614+06	2	ma01776879@gmail.com	2	[{"changed": {"fields": ["Name", "Mobile", "Prof image", "Address"]}}]	24	1
19	2022-03-03 20:29:33.181676+06	4	Winter-collection	1	[{"added": {}}]	21	1
20	2022-03-03 20:30:01.277719+06	5	Summer-Collection	1	[{"added": {}}]	21	1
21	2022-03-03 20:30:27.831251+06	6	Trend-Collection	1	[{"added": {}}]	21	1
22	2022-03-03 20:31:12.344295+06	7	Latest-Collection	1	[{"added": {}}]	21	1
23	2022-03-03 20:31:39.796587+06	1	Modern-Collection	2	[{"changed": {"fields": ["Title"]}}]	21	1
24	2022-03-03 20:33:18.688783+06	6	prodect2	1	[{"added": {}}]	20	1
25	2022-03-03 20:34:04.278563+06	7	product3	1	[{"added": {}}]	20	1
26	2022-03-03 20:34:42.399834+06	8	product4	1	[{"added": {}}]	20	1
27	2022-03-03 20:35:18.534683+06	9	product5	1	[{"added": {}}]	20	1
28	2022-03-03 20:36:09.325801+06	10	product6	1	[{"added": {}}]	20	1
29	2022-03-03 20:36:50.111426+06	11	product7	1	[{"added": {}}]	20	1
30	2022-03-03 20:37:50.034293+06	7	Titan	1	[{"added": {}}]	22	1
31	2022-03-03 20:38:49.56734+06	12	product8	1	[{"added": {}}]	20	1
32	2022-03-03 20:39:32.254443+06	13	product9	1	[{"added": {}}]	20	1
33	2022-03-03 20:40:08.228414+06	14	product10	1	[{"added": {}}]	20	1
34	2022-03-03 20:40:41.444008+06	15	product11	1	[{"added": {}}]	20	1
35	2022-03-03 20:41:18.615914+06	16	product12	1	[{"added": {}}]	20	1
36	2022-03-03 20:41:55.155932+06	17	product13	1	[{"added": {}}]	20	1
37	2022-03-03 20:42:28.046374+06	18	product14	1	[{"added": {}}]	20	1
38	2022-03-03 20:43:07.79277+06	19	product15	1	[{"added": {}}]	20	1
39	2022-03-03 20:43:43.864923+06	20	product16	1	[{"added": {}}]	20	1
40	2022-03-03 20:44:29.238644+06	21	product17	1	[{"added": {}}]	20	1
41	2022-03-03 20:45:03.071346+06	22	product19	1	[{"added": {}}]	20	1
42	2022-03-03 20:45:37.074195+06	23	product20	1	[{"added": {}}]	20	1
43	2022-03-03 20:46:11.268714+06	24	product21	1	[{"added": {}}]	20	1
44	2022-03-03 20:46:45.32405+06	25	product22	1	[{"added": {}}]	20	1
45	2022-03-03 20:47:20.91652+06	26	product23	1	[{"added": {}}]	20	1
46	2022-03-03 20:47:57.00613+06	27	product25	1	[{"added": {}}]	20	1
47	2022-03-03 20:48:34.353119+06	28	product26	1	[{"added": {}}]	20	1
48	2022-03-03 20:49:06.210775+06	29	product27	1	[{"added": {}}]	20	1
49	2022-03-03 20:50:15.119417+06	30	product28	1	[{"added": {}}]	20	1
50	2022-03-05 20:45:21.810005+06	1	ma009@gmail.com	1	[{"added": {}}]	33	1
51	2022-03-05 20:45:41.012324+06	2	ma01776879@gmail.com	1	[{"added": {}}]	33	1
71	2022-04-01 20:54:07.143895+06	13	ma@gmail.com	3		32	21
72	2022-04-01 20:54:41.479909+06	14	rohman@gmail.com	3		32	21
73	2022-04-01 20:56:04.245968+06	2	ma01776879@gmail.com	3		24	21
74	2022-04-14 15:26:41.345306+06	8	Review object (8)	1	[{"added": {}}]	35	26
75	2022-04-14 15:26:54.100413+06	9	Review object (9)	1	[{"added": {}}]	35	26
76	2022-04-14 15:27:05.876598+06	10	Review object (10)	1	[{"added": {}}]	35	26
77	2022-04-14 15:27:21.266971+06	11	Review object (11)	1	[{"added": {}}]	35	26
78	2022-04-14 15:27:36.826929+06	12	Review object (12)	1	[{"added": {}}]	35	26
79	2022-04-14 15:28:46.069585+06	27	mahabub00@gmai.com	2	[{"changed": {"fields": ["Name", "Mobile", "Prof image", "Address"]}}]	24	26
80	2022-04-14 15:32:33.314784+06	13	Review object (13)	1	[{"added": {}}]	35	26
81	2022-04-14 15:32:45.374249+06	14	Review object (14)	1	[{"added": {}}]	35	26
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
20	shop	product
21	shop	category
22	shop	brand
23	shop	trendingproduct
24	shop	customer
25	admin	logentry
26	auth	permission
27	auth	group
28	contenttypes	contenttype
29	sessions	session
30	authtoken	token
31	authtoken	tokenproxy
32	account	customuser
33	shop	cart
34	shop	slider
35	shop	review
36	shop	productview
37	shop	order
38	shop	cartproduct
39	shop	profile
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-02-27 21:41:29.25983+06
2	contenttypes	0002_remove_content_type_name	2022-02-27 21:41:29.441671+06
3	auth	0001_initial	2022-02-27 21:41:29.684753+06
4	auth	0002_alter_permission_name_max_length	2022-02-27 21:41:30.282256+06
5	auth	0003_alter_user_email_max_length	2022-02-27 21:41:30.294769+06
6	auth	0004_alter_user_username_opts	2022-02-27 21:41:30.304117+06
7	auth	0005_alter_user_last_login_null	2022-02-27 21:41:30.313945+06
8	auth	0006_require_contenttypes_0002	2022-02-27 21:41:30.316996+06
9	auth	0007_alter_validators_add_error_messages	2022-02-27 21:41:30.328045+06
10	auth	0008_alter_user_username_max_length	2022-02-27 21:41:30.336198+06
11	auth	0009_alter_user_last_name_max_length	2022-02-27 21:41:30.346173+06
12	auth	0010_alter_group_name_max_length	2022-02-27 21:41:30.428106+06
13	auth	0011_update_proxy_permissions	2022-02-27 21:41:30.44202+06
14	auth	0012_alter_user_first_name_max_length	2022-02-27 21:41:30.453479+06
15	account	0001_initial	2022-02-27 21:41:30.670533+06
16	admin	0001_initial	2022-02-27 21:41:31.105404+06
17	admin	0002_logentry_remove_auto_add	2022-02-27 21:41:31.213745+06
18	admin	0003_logentry_add_action_flag_choices	2022-02-27 21:41:31.226709+06
19	authtoken	0001_initial	2022-02-27 21:41:31.376497+06
20	authtoken	0002_auto_20160226_1747	2022-02-27 21:41:31.672411+06
21	authtoken	0003_tokenproxy	2022-02-27 21:41:31.682189+06
22	sessions	0001_initial	2022-02-27 21:41:31.811868+06
23	shop	0001_initial	2022-02-27 21:41:32.081729+06
24	shop	0002_brand_cart_cartproduct_category_order_product_productview_review_slider_trendingproduct	2022-02-27 21:41:33.12617+06
25	shop	0003_customer_prof_image	2022-03-02 20:34:03.766808+06
26	shop	0004_profile	2022-03-02 21:21:26.013199+06
27	shop	0005_auto_20220302_2140	2022-03-02 21:41:11.302154+06
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
2ad4smckzd65iqo5ja19sbtq3lisqqr8	.eJxVjEEOwiAQRe_C2hCmQBlcuu8ZyACjVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3EWIE6_W6T04LqDfKd6azK1ui5zlLsiD9rl1DI_L4f7d1Col2_tcRgjaG8zIXilyTvSjNZdE2P2lFAhAmYwgArYGWBvMNqR2DiiQbw_w6Y3Kg:1nOLpK:whT38ZnSgsYgWSnW6SOoE8EMivOMJj_jBKwpkq-nNIE	2022-03-13 21:51:14.95901+06
bgreeljfdg0blmp1e019mavlgy0s5r63	.eJxVjEEOwiAQRe_C2hCmQBlcuu8ZyACjVA0kpV0Z765NutDtf-_9lwi0rSVsnZcwZ3EWIE6_W6T04LqDfKd6azK1ui5zlLsiD9rl1DI_L4f7d1Col2_tcRgjaG8zIXilyTvSjNZdE2P2lFAhAmYwgArYGWBvMNqR2DiiQbw_w6Y3Kg:1nPPU3:h1DZ3oVFk2cnsaFQk9G8GPvOeoVEJgkUprsvq-bVQ24	2022-03-16 19:57:39.542037+06
vr80g472199ddd6nf4ivomy8hfhsnte5	.eJxVjEEOwiAQRe_C2hCgFByX7j0DYYZBqgaS0q6MdzckXej2v_f-W4S4byXsndewJHERVpx-N4z05DpAesR6b5Ja3dYF5VDkQbu8tcSv6-H-HZTYy6iRrTIZDCdSqFHlKc9m9mcwXmmkKVsGIvCgXQJHmjV7m2PSTkFGFp8v9gA4aw:1nSezx:GvN4xghoMlVASMUKzLRb8Oeiv_Npx6kbeASYD34nINo	2022-03-25 19:08:01.381924+06
fiya5vah8yhnkak2u94859aps9tma58c	.eJxVjDEOwjAMRe-SGUWp0xrDyN4zRHZsaAE1UtNOiLtDpQ6w_vfef7nE6zKktdqcRnVnB407_I7C-WHTRvTO0634XKZlHsVvit9p9X1Re1529-9g4Dp8azOIEAOJhpbyFfHYCCqZROsyayNAehLtQscUY1BRaQGNABGZJLv3BxWIOIo:1naIdj:MUDwRGtSaUjBxe4zbrAm9E5huHbpm5ApBy5UL41wlpA	2022-04-15 20:52:39.037009+06
h2hwr7bnthw5v7mclthto139eksn4obm	.eJxVjEsOwiAUAO_C2hA-fQ9w6b5nIHweUjU0Ke3KeHdD0oVuZybzZj4ce_VHp80vmV2ZQnb5hTGkJ7Vh8iO0-8rT2vZtiXwk_LSdz2um1-1s_wY19Dq-4IzUVFDrXBSqFKUBS84CIQUEoY2GKVgJ5GJGAVYVxCyKnUrRzrHPF-gjN0I:1nevj1:tJbXmiLeeGe5uFxyfPrch5UilVIJabL43A-k6y1jqgQ	2022-04-28 15:25:15.26015+06
\.


--
-- Data for Name: shop_brand; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.shop_brand (id, title, logo, details, date) FROM stdin;
1	Arong	logo/Arong_PXicJub.png	good	2022-02-27 21:54:17.871879+06
2	Eassy	logo/eassy_swfMXxp.jpg		2022-03-02 20:00:49.865774+06
3	Police	logo/police1_wWaJ4cx.jpg		2022-03-02 20:01:16.893993+06
4	Addidas	logo/adidas_suInsxs.png		2022-03-02 20:01:44.136135+06
5	Raymond	logo/raymond_6YLzWZi.png		2022-03-02 20:02:07.043388+06
6	Nike	logo/nike2.jpg		2022-03-02 20:02:36.121429+06
7	Titan	logo/titan_Q6Pnmpe.jpg	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available	2022-03-03 20:37:49.970742+06
\.


--
-- Data for Name: shop_cart; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.shop_cart (id, total, complit, date, customer_id) FROM stdin;
\.


--
-- Data for Name: shop_cartproduct; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.shop_cartproduct (id, quantity, total, cart_id) FROM stdin;
\.


--
-- Data for Name: shop_cartproduct_product; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.shop_cartproduct_product (id, cartproduct_id, product_id) FROM stdin;
\.


--
-- Data for Name: shop_category; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.shop_category (id, title, image, details, date) FROM stdin;
2	Women Fashion	category/images_9.jpg		2022-03-02 20:04:25.759438+06
3	Means collection	category/images_15.jpg		2022-03-02 20:05:14.061815+06
4	Winter-collection	category/download_6.jpg	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available	2022-03-03 20:29:33.144191+06
5	Summer-Collection	category/images_17.jpg	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available	2022-03-03 20:30:01.27306+06
6	Trend-Collection	category/download_2.jpg	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available	2022-03-03 20:30:27.828258+06
7	Latest-Collection	category/images_13.jpg	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available	2022-03-03 20:31:12.338941+06
1	Modern-Collection	category/nike2.jpg	good	2022-02-27 21:53:00.978994+06
\.


--
-- Data for Name: shop_customer; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.shop_customer (id, name, mobile, address, username, user_id, prof_image) FROM stdin;
22	\N		\N	customer22	21	
25	\N	01776879668	\N	customer29	24	
26	\N		\N	customer26	25	
27	mahbub alam	01776879668	Dhaka,Dhanmondi32.	customer27	26	profile/mahbub_2_x4kpyW6.jpg
28	\N		\N	customer28	27	
\.


--
-- Data for Name: shop_order; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.shop_order (id, name, mobile, address, email, order_status, date, cart_id) FROM stdin;
\.


--
-- Data for Name: shop_product; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.shop_product (id, title, image, oldprice, price, discount, details, tegs, "time", brand_id) FROM stdin;
1	product1	product/images_14_2ZmdCgC.jpg	320	250	5	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-02-27 21:55:50.59853+06	1
2	Gaints T-shirt	product/download_3_w0cefig.jpg	380	250	5	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-02 20:06:50.940716+06	1
3	Shirt	product/download_1_JLDqyQu.jpg	1200	1000	5	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-02 20:07:25.960462+06	4
4	blezer	product/download_7_bpkjVQq.jpg	2200	1850	3	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-02 20:08:07.151164+06	5
5	Shoes	product/download_18_54Idb6h.jpg	1550	1200	5	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-02 20:08:49.449006+06	4
6	prodect2	product/download_1_G8UELNW.jpg	2000	1200	3	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:33:18.535781+06	2
7	product3	product/download_2_fgJh1cC.jpg	\N	1500	3	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:34:04.260069+06	1
8	product4	product/download_4_HpkFgMC.jpg	\N	1000	2	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:34:42.390983+06	2
9	product5	product/download_5_vw45zfC.jpg	1550	1200	4	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:35:18.518686+06	2
10	product6	product/download_6_TRZTGKo.jpg	3200	2500	4	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:36:09.28181+06	3
11	product7	product/download_7_DnyODuo.jpg	\N	2300	4	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:36:50.07955+06	5
12	product8	product/download_8_A9FFaBy.jpg	30000	25000	5	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:38:49.551381+06	7
13	product9	product/download_9_qxtgzX3.jpg	2000	1750	5	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:39:32.245404+06	7
14	product10	product/download_11_ufbF2rl.jpg	1200	1000	\N	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:40:08.20249+06	7
15	product11	product/download_10_iiRIaAF.jpg	\N	1200	2	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:40:41.43403+06	6
16	product12	product/download_12_R37MgRl.jpg	1550	1250	5	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:41:18.601903+06	7
17	product13	product/download_14_FH8Fpw8.jpg	2200	1950	5	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:41:55.146922+06	4
18	product14	product/download_15_cx4gr7h.jpg	1200	1100	5	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:42:28.031415+06	4
19	product15	product/download_17_GqXIeTE.jpg	2300	2000	3	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:43:07.780802+06	6
20	product16	product/download_18_JX5OTJD.jpg	1890	1200	3	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:43:43.854236+06	6
21	product17	product/images_1_IPQIr7f.jpg	1600	1400	3	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:44:29.212263+06	1
22	product19	product/images_2_egLZJ1l.jpg	\N	1500	3	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:45:03.060375+06	1
23	product20	product/images_3_O3nnjNZ.jpg	1660	1550	3	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:45:37.051649+06	2
24	product21	product/images_6_4fibIXD.jpg	2200	2000	5	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:46:11.252758+06	2
25	product22	product/images_7.jpg	2200	1850	4	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:46:45.289213+06	2
26	product23	product/images_9_HJUMnLY.jpg	\N	1290	2	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:47:20.907613+06	1
27	product25	product/images_11_Dq0Tw1G.jpg	2300	2100	5	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:47:56.994161+06	5
28	product26	product/images_12.jpg	\N	1200	2	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:48:34.343508+06	5
29	product27	product/images_21_r0GbNdZ.jpg	\N	2200	\N	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:49:06.199803+06	5
30	product28	product/images_29.jpg	2100	1760	5	In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available		2022-03-03 20:50:15.1093+06	5
\.


--
-- Data for Name: shop_product_category; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.shop_product_category (id, product_id, category_id) FROM stdin;
1	1	1
2	2	3
3	3	3
4	4	3
5	5	3
6	6	3
7	6	4
8	6	5
9	6	7
10	7	1
11	7	3
12	7	5
13	7	6
14	7	7
15	8	3
16	8	4
17	8	5
18	8	7
19	9	3
20	9	5
21	9	6
22	10	3
23	10	4
24	10	7
25	11	1
26	11	3
27	11	4
28	11	6
29	12	1
30	12	3
31	12	5
32	12	6
33	13	3
34	13	4
35	13	5
36	13	7
37	14	3
38	14	4
39	14	7
40	15	2
41	15	3
42	15	4
43	16	2
44	16	3
45	16	4
46	16	6
47	17	2
48	17	3
49	17	4
50	17	7
51	18	3
52	18	4
53	18	5
54	18	7
55	19	1
56	19	3
57	19	4
58	19	6
59	19	7
60	20	2
61	20	3
62	20	6
63	20	7
64	21	2
65	21	4
66	21	5
67	21	7
68	22	2
69	22	4
70	22	6
71	22	7
72	23	2
73	23	5
74	23	6
75	23	7
76	24	2
77	24	4
78	24	6
79	24	7
80	25	1
81	25	2
82	25	5
83	25	6
84	26	1
85	26	2
86	26	4
87	26	7
88	27	1
89	27	3
90	27	4
91	27	7
92	28	1
93	28	3
94	28	4
95	28	6
96	29	3
97	29	4
98	29	6
99	29	7
100	30	3
101	30	4
102	30	6
103	30	7
\.


--
-- Data for Name: shop_productview; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.shop_productview (id, view, product_id) FROM stdin;
3	1	28
4	1	16
12	3	30
14	1	10
15	1	13
16	3	7
5	2	17
7	2	3
11	4	22
10	2	23
9	7	6
6	14	25
13	6	21
17	5	11
18	2	14
8	3	24
1	41	1
2	13	4
\.


--
-- Data for Name: shop_profile; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.shop_profile (id, prof_image, prouser_id) FROM stdin;
1	logo/FB_IMG_15579512835675053.jpg	1
\.


--
-- Data for Name: shop_review; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.shop_review (id, title, customer_id, product_id) FROM stdin;
8	wonderfull	27	6
9	nice	27	6
10	nice	27	14
11	wonderfull	27	14
12	gorgeous	27	14
13	nice	27	6
14	wonderfull	27	6
\.


--
-- Data for Name: shop_slider; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.shop_slider (id, name, details, image, url, product_id) FROM stdin;
1	summer fashion	summer fashion	slider/shoping5_xQUubR7.jpg	#	\N
2	winter fashion	winter fashion	slider/shoping6_JehvFun.jpg	#	\N
3	latest collection	latest product	slider/shoping4.jpg	#	\N
\.


--
-- Data for Name: shop_trendingproduct; Type: TABLE DATA; Schema: public; Owner: ecommerce
--

COPY public.shop_trendingproduct (id, date, products_id) FROM stdin;
1	2022-02-27 22:01:47.251002+06	1
\.


--
-- Name: account_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.account_customuser_groups_id_seq', 1, false);


--
-- Name: account_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.account_customuser_id_seq', 27, true);


--
-- Name: account_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.account_customuser_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 156, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 81, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 39, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);


--
-- Name: shop_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.shop_brand_id_seq', 7, true);


--
-- Name: shop_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.shop_cart_id_seq', 2, true);


--
-- Name: shop_cartproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.shop_cartproduct_id_seq', 1, false);


--
-- Name: shop_cartproduct_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.shop_cartproduct_product_id_seq', 1, false);


--
-- Name: shop_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.shop_category_id_seq', 7, true);


--
-- Name: shop_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.shop_customer_id_seq', 28, true);


--
-- Name: shop_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.shop_order_id_seq', 1, false);


--
-- Name: shop_product_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.shop_product_category_id_seq', 103, true);


--
-- Name: shop_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.shop_product_id_seq', 30, true);


--
-- Name: shop_productview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.shop_productview_id_seq', 18, true);


--
-- Name: shop_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.shop_profile_id_seq', 1, true);


--
-- Name: shop_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.shop_review_id_seq', 14, true);


--
-- Name: shop_slider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.shop_slider_id_seq', 3, true);


--
-- Name: shop_trendingproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ecommerce
--

SELECT pg_catalog.setval('public.shop_trendingproduct_id_seq', 1, true);


--
-- Name: account_customuser account_customuser_email_key; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.account_customuser
    ADD CONSTRAINT account_customuser_email_key UNIQUE (email);


--
-- Name: account_customuser_groups account_customuser_groups_customuser_id_group_id_7e51db7b_uniq; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.account_customuser_groups
    ADD CONSTRAINT account_customuser_groups_customuser_id_group_id_7e51db7b_uniq UNIQUE (customuser_id, group_id);


--
-- Name: account_customuser_groups account_customuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.account_customuser_groups
    ADD CONSTRAINT account_customuser_groups_pkey PRIMARY KEY (id);


--
-- Name: account_customuser account_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.account_customuser
    ADD CONSTRAINT account_customuser_pkey PRIMARY KEY (id);


--
-- Name: account_customuser_user_permissions account_customuser_user__customuser_id_permission_650e378f_uniq; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.account_customuser_user_permissions
    ADD CONSTRAINT account_customuser_user__customuser_id_permission_650e378f_uniq UNIQUE (customuser_id, permission_id);


--
-- Name: account_customuser_user_permissions account_customuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.account_customuser_user_permissions
    ADD CONSTRAINT account_customuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: shop_brand shop_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_brand
    ADD CONSTRAINT shop_brand_pkey PRIMARY KEY (id);


--
-- Name: shop_cart shop_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_cart
    ADD CONSTRAINT shop_cart_pkey PRIMARY KEY (id);


--
-- Name: shop_cartproduct shop_cartproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_cartproduct
    ADD CONSTRAINT shop_cartproduct_pkey PRIMARY KEY (id);


--
-- Name: shop_cartproduct_product shop_cartproduct_product_cartproduct_id_product_i_67d04e40_uniq; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_cartproduct_product
    ADD CONSTRAINT shop_cartproduct_product_cartproduct_id_product_i_67d04e40_uniq UNIQUE (cartproduct_id, product_id);


--
-- Name: shop_cartproduct_product shop_cartproduct_product_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_cartproduct_product
    ADD CONSTRAINT shop_cartproduct_product_pkey PRIMARY KEY (id);


--
-- Name: shop_category shop_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_category
    ADD CONSTRAINT shop_category_pkey PRIMARY KEY (id);


--
-- Name: shop_customer shop_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_customer
    ADD CONSTRAINT shop_customer_pkey PRIMARY KEY (id);


--
-- Name: shop_customer shop_customer_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_customer
    ADD CONSTRAINT shop_customer_user_id_key UNIQUE (user_id);


--
-- Name: shop_customer shop_customer_username_key; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_customer
    ADD CONSTRAINT shop_customer_username_key UNIQUE (username);


--
-- Name: shop_order shop_order_cart_id_key; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_cart_id_key UNIQUE (cart_id);


--
-- Name: shop_order shop_order_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_pkey PRIMARY KEY (id);


--
-- Name: shop_product_category shop_product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_product_category
    ADD CONSTRAINT shop_product_category_pkey PRIMARY KEY (id);


--
-- Name: shop_product_category shop_product_category_product_id_category_id_d7d3b465_uniq; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_product_category
    ADD CONSTRAINT shop_product_category_product_id_category_id_d7d3b465_uniq UNIQUE (product_id, category_id);


--
-- Name: shop_product shop_product_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_pkey PRIMARY KEY (id);


--
-- Name: shop_productview shop_productview_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_productview
    ADD CONSTRAINT shop_productview_pkey PRIMARY KEY (id);


--
-- Name: shop_productview shop_productview_product_id_key; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_productview
    ADD CONSTRAINT shop_productview_product_id_key UNIQUE (product_id);


--
-- Name: shop_profile shop_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_profile
    ADD CONSTRAINT shop_profile_pkey PRIMARY KEY (id);


--
-- Name: shop_profile shop_profile_prouser_id_key; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_profile
    ADD CONSTRAINT shop_profile_prouser_id_key UNIQUE (prouser_id);


--
-- Name: shop_review shop_review_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_review
    ADD CONSTRAINT shop_review_pkey PRIMARY KEY (id);


--
-- Name: shop_slider shop_slider_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_slider
    ADD CONSTRAINT shop_slider_pkey PRIMARY KEY (id);


--
-- Name: shop_trendingproduct shop_trendingproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_trendingproduct
    ADD CONSTRAINT shop_trendingproduct_pkey PRIMARY KEY (id);


--
-- Name: account_customuser_email_a15d8618_like; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX account_customuser_email_a15d8618_like ON public.account_customuser USING btree (email varchar_pattern_ops);


--
-- Name: account_customuser_groups_customuser_id_b6c60904; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX account_customuser_groups_customuser_id_b6c60904 ON public.account_customuser_groups USING btree (customuser_id);


--
-- Name: account_customuser_groups_group_id_2be9f6d7; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX account_customuser_groups_group_id_2be9f6d7 ON public.account_customuser_groups USING btree (group_id);


--
-- Name: account_customuser_user_permissions_customuser_id_03bcc114; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX account_customuser_user_permissions_customuser_id_03bcc114 ON public.account_customuser_user_permissions USING btree (customuser_id);


--
-- Name: account_customuser_user_permissions_permission_id_f4aec423; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX account_customuser_user_permissions_permission_id_f4aec423 ON public.account_customuser_user_permissions USING btree (permission_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: shop_cart_customer_id_f4c598f5; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX shop_cart_customer_id_f4c598f5 ON public.shop_cart USING btree (customer_id);


--
-- Name: shop_cartproduct_cart_id_d14ea5d2; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX shop_cartproduct_cart_id_d14ea5d2 ON public.shop_cartproduct USING btree (cart_id);


--
-- Name: shop_cartproduct_product_cartproduct_id_3e77efb9; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX shop_cartproduct_product_cartproduct_id_3e77efb9 ON public.shop_cartproduct_product USING btree (cartproduct_id);


--
-- Name: shop_cartproduct_product_product_id_b928ce86; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX shop_cartproduct_product_product_id_b928ce86 ON public.shop_cartproduct_product USING btree (product_id);


--
-- Name: shop_customer_username_d8d0987f_like; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX shop_customer_username_d8d0987f_like ON public.shop_customer USING btree (username varchar_pattern_ops);


--
-- Name: shop_product_brand_id_505fec11; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX shop_product_brand_id_505fec11 ON public.shop_product USING btree (brand_id);


--
-- Name: shop_product_category_category_id_9635f39e; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX shop_product_category_category_id_9635f39e ON public.shop_product_category USING btree (category_id);


--
-- Name: shop_product_category_product_id_deb8d294; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX shop_product_category_product_id_deb8d294 ON public.shop_product_category USING btree (product_id);


--
-- Name: shop_review_customer_id_a570316d; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX shop_review_customer_id_a570316d ON public.shop_review USING btree (customer_id);


--
-- Name: shop_review_product_id_f74dddfd; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX shop_review_product_id_f74dddfd ON public.shop_review USING btree (product_id);


--
-- Name: shop_slider_product_id_698e2fe4; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX shop_slider_product_id_698e2fe4 ON public.shop_slider USING btree (product_id);


--
-- Name: shop_trendingproduct_products_id_ae1c3d0f; Type: INDEX; Schema: public; Owner: ecommerce
--

CREATE INDEX shop_trendingproduct_products_id_ae1c3d0f ON public.shop_trendingproduct USING btree (products_id);


--
-- Name: account_customuser_groups account_customuser_g_customuser_id_b6c60904_fk_account_c; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.account_customuser_groups
    ADD CONSTRAINT account_customuser_g_customuser_id_b6c60904_fk_account_c FOREIGN KEY (customuser_id) REFERENCES public.account_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_customuser_groups account_customuser_groups_group_id_2be9f6d7_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.account_customuser_groups
    ADD CONSTRAINT account_customuser_groups_group_id_2be9f6d7_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_customuser_user_permissions account_customuser_u_customuser_id_03bcc114_fk_account_c; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.account_customuser_user_permissions
    ADD CONSTRAINT account_customuser_u_customuser_id_03bcc114_fk_account_c FOREIGN KEY (customuser_id) REFERENCES public.account_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_customuser_user_permissions account_customuser_u_permission_id_f4aec423_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.account_customuser_user_permissions
    ADD CONSTRAINT account_customuser_u_permission_id_f4aec423_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_account_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_account_customuser_id FOREIGN KEY (user_id) REFERENCES public.account_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_account_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_account_customuser_id FOREIGN KEY (user_id) REFERENCES public.account_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_cart shop_cart_customer_id_f4c598f5_fk_shop_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_cart
    ADD CONSTRAINT shop_cart_customer_id_f4c598f5_fk_shop_customer_id FOREIGN KEY (customer_id) REFERENCES public.shop_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_cartproduct shop_cartproduct_cart_id_d14ea5d2_fk_shop_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_cartproduct
    ADD CONSTRAINT shop_cartproduct_cart_id_d14ea5d2_fk_shop_cart_id FOREIGN KEY (cart_id) REFERENCES public.shop_cart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_cartproduct_product shop_cartproduct_pro_cartproduct_id_3e77efb9_fk_shop_cart; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_cartproduct_product
    ADD CONSTRAINT shop_cartproduct_pro_cartproduct_id_3e77efb9_fk_shop_cart FOREIGN KEY (cartproduct_id) REFERENCES public.shop_cartproduct(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_cartproduct_product shop_cartproduct_product_product_id_b928ce86_fk_shop_product_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_cartproduct_product
    ADD CONSTRAINT shop_cartproduct_product_product_id_b928ce86_fk_shop_product_id FOREIGN KEY (product_id) REFERENCES public.shop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_customer shop_customer_user_id_7e6c4129_fk_account_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_customer
    ADD CONSTRAINT shop_customer_user_id_7e6c4129_fk_account_customuser_id FOREIGN KEY (user_id) REFERENCES public.account_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_order shop_order_cart_id_5b16e4f1_fk_shop_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_order
    ADD CONSTRAINT shop_order_cart_id_5b16e4f1_fk_shop_cart_id FOREIGN KEY (cart_id) REFERENCES public.shop_cart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_product shop_product_brand_id_505fec11_fk_shop_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_product
    ADD CONSTRAINT shop_product_brand_id_505fec11_fk_shop_brand_id FOREIGN KEY (brand_id) REFERENCES public.shop_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_product_category shop_product_category_category_id_9635f39e_fk_shop_category_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_product_category
    ADD CONSTRAINT shop_product_category_category_id_9635f39e_fk_shop_category_id FOREIGN KEY (category_id) REFERENCES public.shop_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_product_category shop_product_category_product_id_deb8d294_fk_shop_product_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_product_category
    ADD CONSTRAINT shop_product_category_product_id_deb8d294_fk_shop_product_id FOREIGN KEY (product_id) REFERENCES public.shop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_productview shop_productview_product_id_85ab4ab9_fk_shop_product_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_productview
    ADD CONSTRAINT shop_productview_product_id_85ab4ab9_fk_shop_product_id FOREIGN KEY (product_id) REFERENCES public.shop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_profile shop_profile_prouser_id_9b891bc3_fk_account_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_profile
    ADD CONSTRAINT shop_profile_prouser_id_9b891bc3_fk_account_customuser_id FOREIGN KEY (prouser_id) REFERENCES public.account_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_review shop_review_customer_id_a570316d_fk_shop_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_review
    ADD CONSTRAINT shop_review_customer_id_a570316d_fk_shop_customer_id FOREIGN KEY (customer_id) REFERENCES public.shop_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_review shop_review_product_id_f74dddfd_fk_shop_product_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_review
    ADD CONSTRAINT shop_review_product_id_f74dddfd_fk_shop_product_id FOREIGN KEY (product_id) REFERENCES public.shop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_slider shop_slider_product_id_698e2fe4_fk_shop_product_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_slider
    ADD CONSTRAINT shop_slider_product_id_698e2fe4_fk_shop_product_id FOREIGN KEY (product_id) REFERENCES public.shop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shop_trendingproduct shop_trendingproduct_products_id_ae1c3d0f_fk_shop_product_id; Type: FK CONSTRAINT; Schema: public; Owner: ecommerce
--

ALTER TABLE ONLY public.shop_trendingproduct
    ADD CONSTRAINT shop_trendingproduct_products_id_ae1c3d0f_fk_shop_product_id FOREIGN KEY (products_id) REFERENCES public.shop_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

