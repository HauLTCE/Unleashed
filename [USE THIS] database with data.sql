--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-08-09 21:10:12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5313 (class 1262 OID 57831)
-- Name: Unleashed; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "Unleashed" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "Unleashed" OWNER TO postgres;

\connect "Unleashed"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 5314 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 57832)
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    brand_id integer NOT NULL,
    brand_name character varying(255),
    brand_description text,
    brand_image_url character varying(255),
    brand_website_url character varying(255),
    brand_created_at timestamp with time zone,
    brand_updated_at timestamp with time zone
);


ALTER TABLE public.brand OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 57837)
-- Name: brand_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brand_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.brand_brand_id_seq OWNER TO postgres;

--
-- TOC entry 5315 (class 0 OID 0)
-- Dependencies: 218
-- Name: brand_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brand_brand_id_seq OWNED BY public.brand.brand_id;


--
-- TOC entry 219 (class 1259 OID 57838)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    user_id character varying NOT NULL,
    variation_id integer NOT NULL,
    cart_quantity integer
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 57843)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    category_name character varying(255),
    category_description text,
    category_image_url character varying(255),
    category_created_at timestamp with time zone,
    category_updated_at timestamp with time zone
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 57848)
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_category_id_seq OWNER TO postgres;

--
-- TOC entry 5316 (class 0 OID 0)
-- Dependencies: 221
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- TOC entry 222 (class 1259 OID 57849)
-- Name: chat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat (
    chat_id integer NOT NULL,
    user_id character varying(255),
    chat_created_at timestamp with time zone
);


ALTER TABLE public.chat OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 57852)
-- Name: chat_chat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_chat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chat_chat_id_seq OWNER TO postgres;

--
-- TOC entry 5317 (class 0 OID 0)
-- Dependencies: 223
-- Name: chat_chat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_chat_id_seq OWNED BY public.chat.chat_id;


--
-- TOC entry 224 (class 1259 OID 57853)
-- Name: color; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.color (
    color_id integer NOT NULL,
    color_name character varying,
    color_hex_code character varying
);


ALTER TABLE public.color OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 57858)
-- Name: color_color_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.color_color_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.color_color_id_seq OWNER TO postgres;

--
-- TOC entry 5318 (class 0 OID 0)
-- Dependencies: 225
-- Name: color_color_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.color_color_id_seq OWNED BY public.color.color_id;


--
-- TOC entry 226 (class 1259 OID 57859)
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment (
    comment_id integer NOT NULL,
    review_id integer,
    comment_content text,
    comment_created_at timestamp with time zone,
    comment_updated_at timestamp with time zone
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 57864)
-- Name: comment_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comment_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comment_comment_id_seq OWNER TO postgres;

--
-- TOC entry 5319 (class 0 OID 0)
-- Dependencies: 227
-- Name: comment_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comment_comment_id_seq OWNED BY public.comment.comment_id;


--
-- TOC entry 228 (class 1259 OID 57865)
-- Name: comment_parent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comment_parent (
    comment_id integer,
    comment_parent_id integer
);


ALTER TABLE public.comment_parent OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 57868)
-- Name: discount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount (
    discount_id integer NOT NULL,
    discount_status_id integer,
    discount_type_id integer,
    discount_code character varying(20) NOT NULL,
    discount_value numeric(10,2),
    discount_description text,
    discount_rank_requirement integer,
    discount_minimum_order_value numeric(10,2),
    discount_maximum_value numeric(10,2),
    discount_usage_limit integer,
    discount_start_date timestamp with time zone,
    discount_end_date timestamp with time zone,
    discount_created_at timestamp with time zone,
    discount_updated_at timestamp with time zone,
    discount_usage_count integer
);


ALTER TABLE public.discount OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 57873)
-- Name: discount_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.discount_discount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.discount_discount_id_seq OWNER TO postgres;

--
-- TOC entry 5320 (class 0 OID 0)
-- Dependencies: 230
-- Name: discount_discount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.discount_discount_id_seq OWNED BY public.discount.discount_id;


--
-- TOC entry 231 (class 1259 OID 57874)
-- Name: discount_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_status (
    discount_status_id integer NOT NULL,
    discount_status_name character varying
);


ALTER TABLE public.discount_status OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 57879)
-- Name: discount_status_discount_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.discount_status_discount_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.discount_status_discount_status_id_seq OWNER TO postgres;

--
-- TOC entry 5321 (class 0 OID 0)
-- Dependencies: 232
-- Name: discount_status_discount_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.discount_status_discount_status_id_seq OWNED BY public.discount_status.discount_status_id;


--
-- TOC entry 233 (class 1259 OID 57880)
-- Name: discount_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discount_type (
    discount_type_id integer NOT NULL,
    discount_type_name character varying
);


ALTER TABLE public.discount_type OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 57885)
-- Name: discount_type_discount_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.discount_type_discount_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.discount_type_discount_type_id_seq OWNER TO postgres;

--
-- TOC entry 5322 (class 0 OID 0)
-- Dependencies: 234
-- Name: discount_type_discount_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.discount_type_discount_type_id_seq OWNED BY public.discount_type.discount_type_id;


--
-- TOC entry 235 (class 1259 OID 57886)
-- Name: feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedback (
    feedback_id integer NOT NULL,
    topic_id integer,
    feedback_email character varying,
    feedback_content text,
    feedback_created_at timestamp with time zone,
    is_feedback_resolved boolean
);


ALTER TABLE public.feedback OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 57891)
-- Name: feedback_feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feedback_feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feedback_feedback_id_seq OWNER TO postgres;

--
-- TOC entry 5323 (class 0 OID 0)
-- Dependencies: 236
-- Name: feedback_feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feedback_feedback_id_seq OWNED BY public.feedback.feedback_id;


--
-- TOC entry 237 (class 1259 OID 57892)
-- Name: message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message (
    message_id integer NOT NULL,
    chat_id integer,
    sender_id character varying(255),
    message_text text,
    message_send_at timestamp with time zone,
    message_image_url character varying(255),
    is_message_edited boolean,
    is_message_deleted boolean
);


ALTER TABLE public.message OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 57897)
-- Name: message_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.message_message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.message_message_id_seq OWNER TO postgres;

--
-- TOC entry 5324 (class 0 OID 0)
-- Dependencies: 238
-- Name: message_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.message_message_id_seq OWNED BY public.message.message_id;


--
-- TOC entry 239 (class 1259 OID 57898)
-- Name: notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification (
    notification_id integer NOT NULL,
    user_id_sender character varying(255),
    notification_title character varying,
    notification_content text,
    is_notification_draft boolean,
    notification_created_at timestamp with time zone,
    notification_updated_at timestamp with time zone
);


ALTER TABLE public.notification OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 57903)
-- Name: notification_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notification_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notification_notification_id_seq OWNER TO postgres;

--
-- TOC entry 5325 (class 0 OID 0)
-- Dependencies: 240
-- Name: notification_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notification_notification_id_seq OWNED BY public.notification.notification_id;


--
-- TOC entry 241 (class 1259 OID 57904)
-- Name: notification_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notification_user (
    notification_id integer,
    user_id character varying,
    is_notification_viewed boolean,
    is_notification_deleted boolean
);


ALTER TABLE public.notification_user OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 57909)
-- Name: order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."order" (
    order_id character varying NOT NULL,
    user_id character varying,
    order_status_id integer,
    payment_method_id integer,
    shipping_method_id integer,
    discount_id integer,
    incharge_employee_id character varying,
    order_date timestamp with time zone,
    order_total_amount numeric(10,2),
    order_tracking_number character varying(50),
    order_note text,
    order_billing_address character varying(255),
    order_expected_delivery_date timestamp with time zone,
    order_transaction_reference character varying(255),
    order_tax numeric(3,2),
    order_created_at timestamp with time zone,
    order_updated_at timestamp with time zone
);


ALTER TABLE public."order" OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 57914)
-- Name: order_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_status (
    order_status_id integer NOT NULL,
    order_status_name character varying
);


ALTER TABLE public.order_status OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 57919)
-- Name: order_status_order_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_status_order_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_status_order_status_id_seq OWNER TO postgres;

--
-- TOC entry 5326 (class 0 OID 0)
-- Dependencies: 244
-- Name: order_status_order_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_status_order_status_id_seq OWNED BY public.order_status.order_status_id;


--
-- TOC entry 245 (class 1259 OID 57920)
-- Name: order_variation_single; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_variation_single (
    order_id character varying NOT NULL,
    variation_single_id integer NOT NULL,
    sale_id integer,
    variation_price_at_purchase numeric(10,2) NOT NULL
);


ALTER TABLE public.order_variation_single OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 57925)
-- Name: payment_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_method (
    payment_method_id integer NOT NULL,
    payment_method_name character varying
);


ALTER TABLE public.payment_method OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 57930)
-- Name: payment_method_payment_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_method_payment_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_method_payment_method_id_seq OWNER TO postgres;

--
-- TOC entry 5327 (class 0 OID 0)
-- Dependencies: 247
-- Name: payment_method_payment_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_method_payment_method_id_seq OWNED BY public.payment_method.payment_method_id;


--
-- TOC entry 248 (class 1259 OID 57931)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_id character varying NOT NULL,
    brand_id integer,
    product_status_id integer,
    product_name character varying,
    product_code character varying,
    product_description text,
    product_created_at timestamp with time zone,
    product_updated_at timestamp with time zone
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 57936)
-- Name: product_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_category (
    product_id character varying,
    category_id integer
);


ALTER TABLE public.product_category OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 57941)
-- Name: product_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_status (
    product_status_id integer NOT NULL,
    product_status_name character varying
);


ALTER TABLE public.product_status OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 57946)
-- Name: product_status_product_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_status_product_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_status_product_status_id_seq OWNER TO postgres;

--
-- TOC entry 5328 (class 0 OID 0)
-- Dependencies: 251
-- Name: product_status_product_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_status_product_status_id_seq OWNED BY public.product_status.product_status_id;


--
-- TOC entry 252 (class 1259 OID 57947)
-- Name: provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provider (
    provider_id integer NOT NULL,
    provider_name character varying(255),
    provider_image_url character varying(255),
    provider_email character varying(255),
    provider_phone character varying(12),
    provider_address character varying(255),
    provider_created_at timestamp with time zone,
    provider_updated_at timestamp with time zone
);


ALTER TABLE public.provider OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 57952)
-- Name: provider_provider_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provider_provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.provider_provider_id_seq OWNER TO postgres;

--
-- TOC entry 5329 (class 0 OID 0)
-- Dependencies: 253
-- Name: provider_provider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provider_provider_id_seq OWNED BY public.provider.provider_id;


--
-- TOC entry 254 (class 1259 OID 57953)
-- Name: rank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rank (
    rank_id integer NOT NULL,
    rank_name character varying,
    rank_num integer,
    rank_payment_requirement numeric(10,2),
    rank_base_discount numeric(3,2)
);


ALTER TABLE public.rank OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 57958)
-- Name: rank_rank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rank_rank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rank_rank_id_seq OWNER TO postgres;

--
-- TOC entry 5330 (class 0 OID 0)
-- Dependencies: 255
-- Name: rank_rank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rank_rank_id_seq OWNED BY public.rank.rank_id;


--
-- TOC entry 256 (class 1259 OID 57959)
-- Name: review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review (
    review_id integer NOT NULL,
    product_id character varying,
    user_id character varying,
    order_id character varying,
    review_rating integer
);


ALTER TABLE public.review OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 57964)
-- Name: review_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.review_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.review_review_id_seq OWNER TO postgres;

--
-- TOC entry 5331 (class 0 OID 0)
-- Dependencies: 257
-- Name: review_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.review_review_id_seq OWNED BY public.review.review_id;


--
-- TOC entry 258 (class 1259 OID 57965)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    role_id integer NOT NULL,
    role_name character varying
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 57970)
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.role_role_id_seq OWNER TO postgres;

--
-- TOC entry 5332 (class 0 OID 0)
-- Dependencies: 259
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.role_role_id_seq OWNED BY public.role.role_id;


--
-- TOC entry 260 (class 1259 OID 57971)
-- Name: sale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale (
    sale_id integer NOT NULL,
    sale_type_id integer,
    sale_status_id integer,
    sale_value numeric(10,2),
    sale_start_date timestamp with time zone,
    sale_end_date timestamp with time zone,
    sale_created_at timestamp with time zone,
    sale_updated_at timestamp with time zone
);


ALTER TABLE public.sale OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 57974)
-- Name: sale_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale_product (
    sale_id integer NOT NULL,
    product_id character varying NOT NULL
);


ALTER TABLE public.sale_product OWNER TO postgres;

--
-- TOC entry 262 (class 1259 OID 57979)
-- Name: sale_sale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sale_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sale_sale_id_seq OWNER TO postgres;

--
-- TOC entry 5333 (class 0 OID 0)
-- Dependencies: 262
-- Name: sale_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sale_sale_id_seq OWNED BY public.sale.sale_id;


--
-- TOC entry 263 (class 1259 OID 57980)
-- Name: sale_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale_status (
    sale_status_id integer NOT NULL,
    sale_status_name character varying
);


ALTER TABLE public.sale_status OWNER TO postgres;

--
-- TOC entry 264 (class 1259 OID 57985)
-- Name: sale_status_sale_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sale_status_sale_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sale_status_sale_status_id_seq OWNER TO postgres;

--
-- TOC entry 5334 (class 0 OID 0)
-- Dependencies: 264
-- Name: sale_status_sale_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sale_status_sale_status_id_seq OWNED BY public.sale_status.sale_status_id;


--
-- TOC entry 265 (class 1259 OID 57986)
-- Name: sale_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale_type (
    sale_type_id integer NOT NULL,
    sale_type_name character varying
);


ALTER TABLE public.sale_type OWNER TO postgres;

--
-- TOC entry 266 (class 1259 OID 57991)
-- Name: sale_type_sale_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sale_type_sale_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sale_type_sale_type_id_seq OWNER TO postgres;

--
-- TOC entry 5335 (class 0 OID 0)
-- Dependencies: 266
-- Name: sale_type_sale_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sale_type_sale_type_id_seq OWNED BY public.sale_type.sale_type_id;


--
-- TOC entry 267 (class 1259 OID 57992)
-- Name: shipping_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_method (
    shipping_method_id integer NOT NULL,
    shipping_method_name character varying
);


ALTER TABLE public.shipping_method OWNER TO postgres;

--
-- TOC entry 268 (class 1259 OID 57997)
-- Name: shipping_method_shipping_method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_method_shipping_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shipping_method_shipping_method_id_seq OWNER TO postgres;

--
-- TOC entry 5336 (class 0 OID 0)
-- Dependencies: 268
-- Name: shipping_method_shipping_method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_method_shipping_method_id_seq OWNED BY public.shipping_method.shipping_method_id;


--
-- TOC entry 269 (class 1259 OID 57998)
-- Name: size; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.size (
    size_id integer NOT NULL,
    size_name character varying
);


ALTER TABLE public.size OWNER TO postgres;

--
-- TOC entry 270 (class 1259 OID 58003)
-- Name: size_size_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.size_size_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.size_size_id_seq OWNER TO postgres;

--
-- TOC entry 5337 (class 0 OID 0)
-- Dependencies: 270
-- Name: size_size_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.size_size_id_seq OWNED BY public.size.size_id;


--
-- TOC entry 271 (class 1259 OID 58004)
-- Name: stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock (
    stock_id integer NOT NULL,
    stock_name character varying,
    stock_address character varying
);


ALTER TABLE public.stock OWNER TO postgres;

--
-- TOC entry 272 (class 1259 OID 58009)
-- Name: stock_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_stock_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_stock_id_seq OWNER TO postgres;

--
-- TOC entry 5338 (class 0 OID 0)
-- Dependencies: 272
-- Name: stock_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_stock_id_seq OWNED BY public.stock.stock_id;


--
-- TOC entry 273 (class 1259 OID 58010)
-- Name: stock_variation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_variation (
    variation_id integer NOT NULL,
    stock_id integer NOT NULL,
    stock_quantity integer
);


ALTER TABLE public.stock_variation OWNER TO postgres;

--
-- TOC entry 274 (class 1259 OID 58013)
-- Name: topic; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.topic (
    topic_id integer NOT NULL,
    topic_name character varying
);


ALTER TABLE public.topic OWNER TO postgres;

--
-- TOC entry 275 (class 1259 OID 58018)
-- Name: topic_topic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.topic_topic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.topic_topic_id_seq OWNER TO postgres;

--
-- TOC entry 5339 (class 0 OID 0)
-- Dependencies: 275
-- Name: topic_topic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.topic_topic_id_seq OWNED BY public.topic.topic_id;


--
-- TOC entry 276 (class 1259 OID 58019)
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    transaction_id integer NOT NULL,
    stock_id integer,
    variation_id integer,
    provider_id integer,
    incharge_employee_id character varying,
    transaction_type_id integer,
    transaction_quantity integer,
    transaction_date date,
    transaction_product_price numeric(10,2)
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- TOC entry 277 (class 1259 OID 58024)
-- Name: transaction_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_transaction_id_seq OWNER TO postgres;

--
-- TOC entry 5340 (class 0 OID 0)
-- Dependencies: 277
-- Name: transaction_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_transaction_id_seq OWNED BY public.transaction.transaction_id;


--
-- TOC entry 278 (class 1259 OID 58025)
-- Name: transaction_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_type (
    transaction_type_id integer NOT NULL,
    transaction_type_name character varying
);


ALTER TABLE public.transaction_type OWNER TO postgres;

--
-- TOC entry 279 (class 1259 OID 58030)
-- Name: transaction_type_transaction_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_type_transaction_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaction_type_transaction_type_id_seq OWNER TO postgres;

--
-- TOC entry 5341 (class 0 OID 0)
-- Dependencies: 279
-- Name: transaction_type_transaction_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_type_transaction_type_id_seq OWNED BY public.transaction_type.transaction_type_id;


--
-- TOC entry 280 (class 1259 OID 58031)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    user_id character varying NOT NULL,
    role_id integer,
    is_user_enabled boolean,
    user_google_id character varying,
    user_username character varying,
    user_password character varying,
    user_fullname character varying,
    user_email character varying,
    user_phone character varying(12),
    user_birthdate character varying,
    user_address character varying,
    user_image character varying,
    user_current_payment_method character varying,
    user_created_at timestamp with time zone,
    user_updated_at timestamp with time zone
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 281 (class 1259 OID 58036)
-- Name: user_discount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_discount (
    user_id character varying NOT NULL,
    discount_id integer NOT NULL,
    is_discount_used boolean NOT NULL,
    discount_used_at timestamp with time zone
);


ALTER TABLE public.user_discount OWNER TO postgres;

--
-- TOC entry 282 (class 1259 OID 58041)
-- Name: user_rank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_rank (
    user_id character varying NOT NULL,
    rank_id integer NOT NULL,
    money_spent numeric(10,2),
    rank_status smallint NOT NULL,
    rank_expire_date date NOT NULL,
    rank_created_date timestamp with time zone NOT NULL,
    rank_updated_date timestamp with time zone NOT NULL
);


ALTER TABLE public.user_rank OWNER TO postgres;

--
-- TOC entry 283 (class 1259 OID 58046)
-- Name: variation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variation (
    variation_id integer NOT NULL,
    product_id character varying,
    size_id integer,
    color_id integer,
    variation_image character varying,
    variation_price numeric(10,2)
);


ALTER TABLE public.variation OWNER TO postgres;

--
-- TOC entry 284 (class 1259 OID 58051)
-- Name: variation_single; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variation_single (
    variation_single_id integer NOT NULL,
    variation_single_code character varying,
    is_variation_single_bought boolean
);


ALTER TABLE public.variation_single OWNER TO postgres;

--
-- TOC entry 285 (class 1259 OID 58056)
-- Name: variation_single_variation_single_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.variation_single_variation_single_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.variation_single_variation_single_id_seq OWNER TO postgres;

--
-- TOC entry 5342 (class 0 OID 0)
-- Dependencies: 285
-- Name: variation_single_variation_single_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.variation_single_variation_single_id_seq OWNED BY public.variation_single.variation_single_id;


--
-- TOC entry 286 (class 1259 OID 58057)
-- Name: variation_variation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.variation_variation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.variation_variation_id_seq OWNER TO postgres;

--
-- TOC entry 5343 (class 0 OID 0)
-- Dependencies: 286
-- Name: variation_variation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.variation_variation_id_seq OWNED BY public.variation.variation_id;


--
-- TOC entry 287 (class 1259 OID 58058)
-- Name: wishlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wishlist (
    user_id character varying,
    product_id character varying
);


ALTER TABLE public.wishlist OWNER TO postgres;

--
-- TOC entry 4934 (class 2604 OID 58063)
-- Name: brand brand_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand ALTER COLUMN brand_id SET DEFAULT nextval('public.brand_brand_id_seq'::regclass);


--
-- TOC entry 4935 (class 2604 OID 58064)
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- TOC entry 4936 (class 2604 OID 58065)
-- Name: chat chat_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat ALTER COLUMN chat_id SET DEFAULT nextval('public.chat_chat_id_seq'::regclass);


--
-- TOC entry 4937 (class 2604 OID 58066)
-- Name: color color_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color ALTER COLUMN color_id SET DEFAULT nextval('public.color_color_id_seq'::regclass);


--
-- TOC entry 4938 (class 2604 OID 58067)
-- Name: comment comment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment ALTER COLUMN comment_id SET DEFAULT nextval('public.comment_comment_id_seq'::regclass);


--
-- TOC entry 4939 (class 2604 OID 58068)
-- Name: discount discount_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount ALTER COLUMN discount_id SET DEFAULT nextval('public.discount_discount_id_seq'::regclass);


--
-- TOC entry 4940 (class 2604 OID 58069)
-- Name: discount_status discount_status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_status ALTER COLUMN discount_status_id SET DEFAULT nextval('public.discount_status_discount_status_id_seq'::regclass);


--
-- TOC entry 4941 (class 2604 OID 58070)
-- Name: discount_type discount_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_type ALTER COLUMN discount_type_id SET DEFAULT nextval('public.discount_type_discount_type_id_seq'::regclass);


--
-- TOC entry 4942 (class 2604 OID 58071)
-- Name: feedback feedback_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback ALTER COLUMN feedback_id SET DEFAULT nextval('public.feedback_feedback_id_seq'::regclass);


--
-- TOC entry 4943 (class 2604 OID 58072)
-- Name: message message_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message ALTER COLUMN message_id SET DEFAULT nextval('public.message_message_id_seq'::regclass);


--
-- TOC entry 4944 (class 2604 OID 58073)
-- Name: notification notification_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification ALTER COLUMN notification_id SET DEFAULT nextval('public.notification_notification_id_seq'::regclass);


--
-- TOC entry 4945 (class 2604 OID 58074)
-- Name: order_status order_status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status ALTER COLUMN order_status_id SET DEFAULT nextval('public.order_status_order_status_id_seq'::regclass);


--
-- TOC entry 4946 (class 2604 OID 58075)
-- Name: payment_method payment_method_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method ALTER COLUMN payment_method_id SET DEFAULT nextval('public.payment_method_payment_method_id_seq'::regclass);


--
-- TOC entry 4947 (class 2604 OID 58076)
-- Name: product_status product_status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_status ALTER COLUMN product_status_id SET DEFAULT nextval('public.product_status_product_status_id_seq'::regclass);


--
-- TOC entry 4948 (class 2604 OID 58077)
-- Name: provider provider_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provider ALTER COLUMN provider_id SET DEFAULT nextval('public.provider_provider_id_seq'::regclass);


--
-- TOC entry 4949 (class 2604 OID 58078)
-- Name: rank rank_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rank ALTER COLUMN rank_id SET DEFAULT nextval('public.rank_rank_id_seq'::regclass);


--
-- TOC entry 4950 (class 2604 OID 58079)
-- Name: review review_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review ALTER COLUMN review_id SET DEFAULT nextval('public.review_review_id_seq'::regclass);


--
-- TOC entry 4951 (class 2604 OID 58080)
-- Name: role role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN role_id SET DEFAULT nextval('public.role_role_id_seq'::regclass);


--
-- TOC entry 4952 (class 2604 OID 58081)
-- Name: sale sale_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale ALTER COLUMN sale_id SET DEFAULT nextval('public.sale_sale_id_seq'::regclass);


--
-- TOC entry 4953 (class 2604 OID 58082)
-- Name: sale_status sale_status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_status ALTER COLUMN sale_status_id SET DEFAULT nextval('public.sale_status_sale_status_id_seq'::regclass);


--
-- TOC entry 4954 (class 2604 OID 58083)
-- Name: sale_type sale_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_type ALTER COLUMN sale_type_id SET DEFAULT nextval('public.sale_type_sale_type_id_seq'::regclass);


--
-- TOC entry 4955 (class 2604 OID 58084)
-- Name: shipping_method shipping_method_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method ALTER COLUMN shipping_method_id SET DEFAULT nextval('public.shipping_method_shipping_method_id_seq'::regclass);


--
-- TOC entry 4956 (class 2604 OID 58085)
-- Name: size size_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.size ALTER COLUMN size_id SET DEFAULT nextval('public.size_size_id_seq'::regclass);


--
-- TOC entry 4957 (class 2604 OID 58086)
-- Name: stock stock_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock ALTER COLUMN stock_id SET DEFAULT nextval('public.stock_stock_id_seq'::regclass);


--
-- TOC entry 4958 (class 2604 OID 58087)
-- Name: topic topic_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topic ALTER COLUMN topic_id SET DEFAULT nextval('public.topic_topic_id_seq'::regclass);


--
-- TOC entry 4959 (class 2604 OID 58088)
-- Name: transaction transaction_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction ALTER COLUMN transaction_id SET DEFAULT nextval('public.transaction_transaction_id_seq'::regclass);


--
-- TOC entry 4960 (class 2604 OID 58089)
-- Name: transaction_type transaction_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_type ALTER COLUMN transaction_type_id SET DEFAULT nextval('public.transaction_type_transaction_type_id_seq'::regclass);


--
-- TOC entry 4961 (class 2604 OID 58090)
-- Name: variation variation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variation ALTER COLUMN variation_id SET DEFAULT nextval('public.variation_variation_id_seq'::regclass);


--
-- TOC entry 4962 (class 2604 OID 58091)
-- Name: variation_single variation_single_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variation_single ALTER COLUMN variation_single_id SET DEFAULT nextval('public.variation_single_variation_single_id_seq'::regclass);


--
-- TOC entry 5237 (class 0 OID 57832)
-- Dependencies: 217
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.brand (brand_id, brand_name, brand_description, brand_image_url, brand_website_url, brand_created_at, brand_updated_at) VALUES (1, 'Lumina Threads', 'Comfort that glows from within', 'https://i.ibb.co/rGXQ1pjk/Generated-Image-March-24-2025-10-26-AM-png.jpg', 'luminathreads.ae.com', '2025-03-24 10:46:54.800541+07', '2025-03-24 11:25:08.548537+07') ON CONFLICT DO NOTHING;
INSERT INTO public.brand (brand_id, brand_name, brand_description, brand_image_url, brand_website_url, brand_created_at, brand_updated_at) VALUES (2, 'Arcadian', 'Your journey, your style', 'https://i.ibb.co/rKVjMfH7/Generated-Image-March-24-2025-10-54-AM-png.jpg', 'arcadian.ae.com', '2025-03-24 10:58:49.460802+07', '2025-03-24 11:25:28.233418+07') ON CONFLICT DO NOTHING;
INSERT INTO public.brand (brand_id, brand_name, brand_description, brand_image_url, brand_website_url, brand_created_at, brand_updated_at) VALUES (3, 'Outliners', 'Beyond the ordinary', 'https://i.ibb.co/201DZWBJ/Generated-Image-March-24-2025-11-01-AM-png.jpg', 'outliners.ae.com', '2025-03-24 11:01:49.919577+07', '2025-03-24 11:25:40.085171+07') ON CONFLICT DO NOTHING;
INSERT INTO public.brand (brand_id, brand_name, brand_description, brand_image_url, brand_website_url, brand_created_at, brand_updated_at) VALUES (4, 'Refined', 'For moments that matter', 'https://i.ibb.co/cKBmBccx/Generated-Image-March-24-2025-11-06-AM-png.jpg', 'refined.ae.com', '2025-03-24 11:07:09.275629+07', '2025-03-24 11:25:54.388561+07') ON CONFLICT DO NOTHING;
INSERT INTO public.brand (brand_id, brand_name, brand_description, brand_image_url, brand_website_url, brand_created_at, brand_updated_at) VALUES (5, 'Velocity', 'Gear up', 'https://i.ibb.co/XrkYqftL/Generated-Image-March-24-2025-11-08-AM-png.jpg', 'velocity.ae.com', '2025-03-24 11:09:30.344642+07', '2025-03-24 11:26:10.616183+07') ON CONFLICT DO NOTHING;
INSERT INTO public.brand (brand_id, brand_name, brand_description, brand_image_url, brand_website_url, brand_created_at, brand_updated_at) VALUES (6, 'Lune', 'Captivating as the moon', 'https://i.ibb.co/xS7nnVNS/Generated-Image-March-24-2025-11-20-AM-png-1.jpg', 'lune.ae.com', '2025-03-24 11:21:31.735862+07', '2025-03-24 11:26:34.503443+07') ON CONFLICT DO NOTHING;


--
-- TOC entry 5239 (class 0 OID 57838)
-- Dependencies: 219
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5240 (class 0 OID 57843)
-- Dependencies: 220
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (category_id, category_name, category_description, category_image_url, category_created_at, category_updated_at) VALUES (1, 'Everyday Essentials', 'The foundational pieces for daily wear', 'https://i.ibb.co/39dy39M5/Generated-Image-March-24-2025-11-31-AM-png.jpg', '2025-03-24 11:31:21.845161+07', '2025-03-24 11:31:21.845161+07') ON CONFLICT DO NOTHING;
INSERT INTO public.category (category_id, category_name, category_description, category_image_url, category_created_at, category_updated_at) VALUES (2, 'Professional Attire', 'Formal clothing designed for the workplace or professional settings.', 'https://i.ibb.co/S4386SNn/Generated-Image-March-24-2025-11-35-AM-png.jpg', '2025-03-24 11:36:10.376096+07', '2025-03-24 11:36:10.376096+07') ON CONFLICT DO NOTHING;
INSERT INTO public.category (category_id, category_name, category_description, category_image_url, category_created_at, category_updated_at) VALUES (3, 'Casual Collective', 'Designed for ultimate comfort and relaxation at home.', 'https://i.ibb.co/ccXgbzxC/14.png', '2025-03-24 11:38:24.565035+07', '2025-03-24 11:38:24.565035+07') ON CONFLICT DO NOTHING;


--
-- TOC entry 5242 (class 0 OID 57849)
-- Dependencies: 222
-- Data for Name: chat; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5244 (class 0 OID 57853)
-- Dependencies: 224
-- Data for Name: color; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (1, 'Red', '#FF0000') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (2, 'Yellow', '#FFFF00') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (3, 'Blue', '#0000FF') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (4, 'Green', '#008000') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (5, 'Orange', '#FFA500') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (6, 'Purple', '#800080') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (7, 'Pink', '#FFC0CB') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (8, 'Brown', '#A52A2A') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (9, 'Black', '#000000') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (10, 'White', '#FFFFFF') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (11, 'Gray', '#808080') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (12, 'Cyan', '#00FFFF') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (13, 'Magenta', '#FF00FF') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (14, 'Lime', '#00FF00') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (15, 'Teal', '#008080') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (16, 'Olive', '#808000') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (17, 'Maroon', '#800000') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (18, 'Navy', '#000080') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (19, 'Silver', '#C0C0C0') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (20, 'Gold', '#FFD700') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (21, 'Indigo', '#4B0082') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (22, 'Violet', '#EE82EE') ON CONFLICT DO NOTHING;
INSERT INTO public.color (color_id, color_name, color_hex_code) VALUES (23, 'Turquoise', '#40E0D0') ON CONFLICT DO NOTHING;


--
-- TOC entry 5246 (class 0 OID 57859)
-- Dependencies: 226
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.comment (comment_id, review_id, comment_content, comment_created_at, comment_updated_at) VALUES (3, 3, 'Good product', '2025-03-31 15:49:48.338375+07', '2025-03-31 15:49:48.338375+07') ON CONFLICT DO NOTHING;
INSERT INTO public.comment (comment_id, review_id, comment_content, comment_created_at, comment_updated_at) VALUES (4, 4, 'Nice shirt!', '2025-03-31 15:50:48.705497+07', '2025-03-31 15:50:48.705497+07') ON CONFLICT DO NOTHING;
INSERT INTO public.comment (comment_id, review_id, comment_content, comment_created_at, comment_updated_at) VALUES (10, 5, 'Thank you!', '2025-04-09 09:46:59.741463+07', '2025-04-09 09:46:59.741463+07') ON CONFLICT DO NOTHING;
INSERT INTO public.comment (comment_id, review_id, comment_content, comment_created_at, comment_updated_at) VALUES (11, 6, 'Thank you!', '2025-04-09 09:47:08.442967+07', '2025-04-09 09:47:08.442967+07') ON CONFLICT DO NOTHING;
INSERT INTO public.comment (comment_id, review_id, comment_content, comment_created_at, comment_updated_at) VALUES (12, 6, 'I AM THE STORM THAT IS APPROACHING. PROVOKING. BLACK CLOUDs IN ISOLATION.', '2025-04-09 10:05:09.389198+07', '2025-04-09 10:05:09.389198+07') ON CONFLICT DO NOTHING;
INSERT INTO public.comment (comment_id, review_id, comment_content, comment_created_at, comment_updated_at) VALUES (13, 7, 'Hello. Áo rách rồi shop ơi.', '2025-07-24 13:17:30.750335+07', '2025-07-24 13:17:30.750335+07') ON CONFLICT DO NOTHING;


--
-- TOC entry 5248 (class 0 OID 57865)
-- Dependencies: 228
-- Data for Name: comment_parent; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.comment_parent (comment_id, comment_parent_id) VALUES (10, 4) ON CONFLICT DO NOTHING;
INSERT INTO public.comment_parent (comment_id, comment_parent_id) VALUES (11, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.comment_parent (comment_id, comment_parent_id) VALUES (12, 3) ON CONFLICT DO NOTHING;


--
-- TOC entry 5249 (class 0 OID 57868)
-- Dependencies: 229
-- Data for Name: discount; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.discount (discount_id, discount_status_id, discount_type_id, discount_code, discount_value, discount_description, discount_rank_requirement, discount_minimum_order_value, discount_maximum_value, discount_usage_limit, discount_start_date, discount_end_date, discount_created_at, discount_updated_at, discount_usage_count) VALUES (2, 1, 1, '0104VIP100', 100.00, 'Ngày 01 04 giảm 100%', 1, 0.00, 0.00, 100, '2025-04-09 15:05:00+07', '2025-04-09 15:08:00+07', '2025-04-08 15:06:12.005745+07', '2025-04-08 15:06:12.005745+07', 0) ON CONFLICT DO NOTHING;
INSERT INTO public.discount (discount_id, discount_status_id, discount_type_id, discount_code, discount_value, discount_description, discount_rank_requirement, discount_minimum_order_value, discount_maximum_value, discount_usage_limit, discount_start_date, discount_end_date, discount_created_at, discount_updated_at, discount_usage_count) VALUES (3, 1, 2, 'LUA', 666666.00, 'LUA', 1, 666666.00, NULL, 666666, '2025-04-09 06:06:00+07', '2025-06-06 18:06:00+07', '2025-04-08 15:07:16.177901+07', '2025-04-08 15:07:16.177901+07', 0) ON CONFLICT DO NOTHING;
INSERT INTO public.discount (discount_id, discount_status_id, discount_type_id, discount_code, discount_value, discount_description, discount_rank_requirement, discount_minimum_order_value, discount_maximum_value, discount_usage_limit, discount_start_date, discount_end_date, discount_created_at, discount_updated_at, discount_usage_count) VALUES (4, 1, 2, 'VIBECHECK', 1.00, '1', 1, 1.00, NULL, 1, '2025-04-10 15:08:00+07', '2025-05-09 15:08:00+07', '2025-04-08 15:08:25.999786+07', '2025-04-08 15:08:25.999786+07', 0) ON CONFLICT DO NOTHING;
INSERT INTO public.discount (discount_id, discount_status_id, discount_type_id, discount_code, discount_value, discount_description, discount_rank_requirement, discount_minimum_order_value, discount_maximum_value, discount_usage_limit, discount_start_date, discount_end_date, discount_created_at, discount_updated_at, discount_usage_count) VALUES (5, 1, 1, 'BERRYDELIGHT', 99.00, 'BERRY DELIGHT DEEP WITHIN', 1, 100.00, 10000.00, 1, '2025-04-23 15:08:00+07', '2025-04-23 15:09:00+07', '2025-04-08 15:09:21.256651+07', '2025-04-08 15:09:21.256651+07', 0) ON CONFLICT DO NOTHING;
INSERT INTO public.discount (discount_id, discount_status_id, discount_type_id, discount_code, discount_value, discount_description, discount_rank_requirement, discount_minimum_order_value, discount_maximum_value, discount_usage_limit, discount_start_date, discount_end_date, discount_created_at, discount_updated_at, discount_usage_count) VALUES (6, 1, 1, 'UNLEASHEDOFFICIAL', 30.00, 'Unleashed Official Launch', 1, 1.00, 1000000.00, 10000, '2025-04-08 15:13:00+07', '2025-04-30 03:11:00+07', '2025-04-08 15:11:53.129524+07', '2025-04-08 15:11:53.129524+07', 0) ON CONFLICT DO NOTHING;
INSERT INTO public.discount (discount_id, discount_status_id, discount_type_id, discount_code, discount_value, discount_description, discount_rank_requirement, discount_minimum_order_value, discount_maximum_value, discount_usage_limit, discount_start_date, discount_end_date, discount_created_at, discount_updated_at, discount_usage_count) VALUES (7, 1, 1, 'BRONZEPRICE', 30.00, 'Bronze Membership Discount', 2, 1.00, 10000000.00, 100, '2025-04-09 15:12:00+07', '2025-10-01 03:14:00+07', '2025-04-08 15:12:46.161275+07', '2025-04-08 15:12:46.161275+07', 0) ON CONFLICT DO NOTHING;
INSERT INTO public.discount (discount_id, discount_status_id, discount_type_id, discount_code, discount_value, discount_description, discount_rank_requirement, discount_minimum_order_value, discount_maximum_value, discount_usage_limit, discount_start_date, discount_end_date, discount_created_at, discount_updated_at, discount_usage_count) VALUES (8, 1, 2, 'VIRGIL', 942.00, 'I AM THE STORM THAT IS APPROACHING', 1, 0.00, NULL, 942, '2025-04-09 09:42:00+07', '2025-04-09 09:42:00+07', '2025-04-08 15:14:21.139593+07', '2025-04-08 15:14:21.139593+07', 0) ON CONFLICT DO NOTHING;
INSERT INTO public.discount (discount_id, discount_status_id, discount_type_id, discount_code, discount_value, discount_description, discount_rank_requirement, discount_minimum_order_value, discount_maximum_value, discount_usage_limit, discount_start_date, discount_end_date, discount_created_at, discount_updated_at, discount_usage_count) VALUES (9, 1, 1, 'discount101', 10.00, '10`1', 1, 1.00, 1.00, 999999, '2025-04-08 15:16:00+07', '2026-05-29 15:15:00+07', '2025-04-08 15:15:30.525941+07', '2025-04-08 15:15:30.525941+07', 0) ON CONFLICT DO NOTHING;
INSERT INTO public.discount (discount_id, discount_status_id, discount_type_id, discount_code, discount_value, discount_description, discount_rank_requirement, discount_minimum_order_value, discount_maximum_value, discount_usage_limit, discount_start_date, discount_end_date, discount_created_at, discount_updated_at, discount_usage_count) VALUES (1, 1, 1, 'mung1thang5', 12.00, 'mung 1 thang 5', 1, 100000.00, 500000.00, 123, '2025-03-31 15:40:00+07', '2025-04-02 15:40:00+07', '2025-03-31 15:41:26.561045+07', '2025-04-17 12:01:10.453742+07', 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 5251 (class 0 OID 57874)
-- Dependencies: 231
-- Data for Name: discount_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.discount_status (discount_status_id, discount_status_name) VALUES (1, 'INACTIVE') ON CONFLICT DO NOTHING;
INSERT INTO public.discount_status (discount_status_id, discount_status_name) VALUES (2, 'ACTIVE') ON CONFLICT DO NOTHING;
INSERT INTO public.discount_status (discount_status_id, discount_status_name) VALUES (3, 'EXPIRED') ON CONFLICT DO NOTHING;


--
-- TOC entry 5253 (class 0 OID 57880)
-- Dependencies: 233
-- Data for Name: discount_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.discount_type (discount_type_id, discount_type_name) VALUES (1, 'PERCENTAGE') ON CONFLICT DO NOTHING;
INSERT INTO public.discount_type (discount_type_id, discount_type_name) VALUES (2, 'FIXED AMOUNT') ON CONFLICT DO NOTHING;


--
-- TOC entry 5255 (class 0 OID 57886)
-- Dependencies: 235
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5257 (class 0 OID 57892)
-- Dependencies: 237
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5259 (class 0 OID 57898)
-- Dependencies: 239
-- Data for Name: notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.notification (notification_id, user_id_sender, notification_title, notification_content, is_notification_draft, notification_created_at, notification_updated_at) VALUES (3, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 'Thông báo 101', 'Đây là một thông báo', false, '2025-04-09 10:07:12.159669+07', '2025-04-09 10:07:12.159669+07') ON CONFLICT DO NOTHING;
INSERT INTO public.notification (notification_id, user_id_sender, notification_title, notification_content, is_notification_draft, notification_created_at, notification_updated_at) VALUES (4, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 'Sản phẩm mới, bạn đã xem chưa?', 'Chúng tôi vừa nhập về một sản phẩm mới, đó là @) !JD*!@&#. Đặt hàng ngay nếu bạn không muốn bỏ lỡ cơ hội được giảm 30% trong ngày đầu tiên.', false, '2025-04-09 10:08:54.464485+07', '2025-04-09 10:08:54.464485+07') ON CONFLICT DO NOTHING;
INSERT INTO public.notification (notification_id, user_id_sender, notification_title, notification_content, is_notification_draft, notification_created_at, notification_updated_at) VALUES (5, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 'CHAO EM', 'ANH DUNG DAY TU CHIEU', false, '2025-04-10 22:34:20.660476+07', '2025-04-10 22:34:20.660476+07') ON CONFLICT DO NOTHING;


--
-- TOC entry 5261 (class 0 OID 57904)
-- Dependencies: 241
-- Data for Name: notification_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.notification_user (notification_id, user_id, is_notification_viewed, is_notification_deleted) VALUES (3, 'f70b9947-6dc4-48cf-8dec-5897af562a96', false, false) ON CONFLICT DO NOTHING;
INSERT INTO public.notification_user (notification_id, user_id, is_notification_viewed, is_notification_deleted) VALUES (4, 'f70b9947-6dc4-48cf-8dec-5897af562a96', false, false) ON CONFLICT DO NOTHING;
INSERT INTO public.notification_user (notification_id, user_id, is_notification_viewed, is_notification_deleted) VALUES (3, '93b42024-4686-486d-b626-bd29589befbf', true, false) ON CONFLICT DO NOTHING;
INSERT INTO public.notification_user (notification_id, user_id, is_notification_viewed, is_notification_deleted) VALUES (4, '93b42024-4686-486d-b626-bd29589befbf', true, false) ON CONFLICT DO NOTHING;
INSERT INTO public.notification_user (notification_id, user_id, is_notification_viewed, is_notification_deleted) VALUES (5, 'e93a2eaf-1d11-42b7-8222-d2fb708f315c', false, false) ON CONFLICT DO NOTHING;
INSERT INTO public.notification_user (notification_id, user_id, is_notification_viewed, is_notification_deleted) VALUES (5, 'f70b9947-6dc4-48cf-8dec-5897af562a96', false, false) ON CONFLICT DO NOTHING;
INSERT INTO public.notification_user (notification_id, user_id, is_notification_viewed, is_notification_deleted) VALUES (5, '93b42024-4686-486d-b626-bd29589befbf', true, false) ON CONFLICT DO NOTHING;


--
-- TOC entry 5262 (class 0 OID 57909)
-- Dependencies: 242
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."order" (order_id, user_id, order_status_id, payment_method_id, shipping_method_id, discount_id, incharge_employee_id, order_date, order_total_amount, order_tracking_number, order_note, order_billing_address, order_expected_delivery_date, order_transaction_reference, order_tax, order_created_at, order_updated_at) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', '93b42024-4686-486d-b626-bd29589befbf', 4, 1, 1, NULL, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', '2025-04-10 15:57:22.308658+07', 55851000.00, 'TN9R3MOV74', '', '111, Hưng Hòa, Bàu Bàng, Bình Dương', '2025-04-17 15:57:22.308+07', '5442308', 0.05, '2025-04-10 15:57:22.309657+07', '2025-04-10 15:57:39.270412+07') ON CONFLICT DO NOTHING;
INSERT INTO public."order" (order_id, user_id, order_status_id, payment_method_id, shipping_method_id, discount_id, incharge_employee_id, order_date, order_total_amount, order_tracking_number, order_note, order_billing_address, order_expected_delivery_date, order_transaction_reference, order_tax, order_created_at, order_updated_at) VALUES ('55ae700c-10dd-4a6b-9509-94d22f3c2b29', '93b42024-4686-486d-b626-bd29589befbf', 3, 1, 1, NULL, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', '2025-04-10 22:23:31.015774+07', 229050.00, 'TNGNQTI7T6', '', '111, Hiếu Liêm, Bắc Tân Uyên, Bình Dương', '2025-04-17 22:23:31.015+07', '8611016', 0.05, '2025-04-10 22:23:31.021703+07', '2025-04-10 22:34:46.761731+07') ON CONFLICT DO NOTHING;
INSERT INTO public."order" (order_id, user_id, order_status_id, payment_method_id, shipping_method_id, discount_id, incharge_employee_id, order_date, order_total_amount, order_tracking_number, order_note, order_billing_address, order_expected_delivery_date, order_transaction_reference, order_tax, order_created_at, order_updated_at) VALUES ('1ad62489-b36d-405d-afab-1653398a58ee', '93b42024-4686-486d-b626-bd29589befbf', 3, 1, 1, NULL, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', '2025-03-31 15:56:10.257887+07', 1715000.00, 'TNHYPRL43D', '', '43, 1, Bạc Liêu, Bạc Liêu', '2025-04-07 15:56:10.257+07', '1370257', 0.05, '2025-03-31 15:56:10.258886+07', '2025-04-17 11:59:52.632825+07') ON CONFLICT DO NOTHING;
INSERT INTO public."order" (order_id, user_id, order_status_id, payment_method_id, shipping_method_id, discount_id, incharge_employee_id, order_date, order_total_amount, order_tracking_number, order_note, order_billing_address, order_expected_delivery_date, order_transaction_reference, order_tax, order_created_at, order_updated_at) VALUES ('3399c540-74b8-4240-8d99-e274a1ba8513', '93b42024-4686-486d-b626-bd29589befbf', 6, 1, 1, NULL, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', '2025-03-31 15:57:22.671086+07', 99999999.00, 'TNIWLJZ2GI', '', '345, Hoà Long, Bà Rịa, Bà Rịa - Vũng Tàu', '2025-04-07 15:57:22.671+07', '1442671', 0.05, '2025-03-31 15:57:22.673107+07', '2025-03-31 15:59:22.061623+07') ON CONFLICT DO NOTHING;
INSERT INTO public."order" (order_id, user_id, order_status_id, payment_method_id, shipping_method_id, discount_id, incharge_employee_id, order_date, order_total_amount, order_tracking_number, order_note, order_billing_address, order_expected_delivery_date, order_transaction_reference, order_tax, order_created_at, order_updated_at) VALUES ('8532780c-1727-45c8-9ac9-d1260f1f12e5', '93b42024-4686-486d-b626-bd29589befbf', 6, 1, 1, NULL, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', '2025-03-31 14:57:47.709098+07', 1630000.00, 'TN9B9QV1KN', 'nuh uh', '111, Khánh Bình, An Phú, An Giang', '2025-04-07 14:57:47.709+07', '7867710', 0.05, '2025-03-31 14:57:47.711099+07', '2025-04-17 12:00:09.836077+07') ON CONFLICT DO NOTHING;
INSERT INTO public."order" (order_id, user_id, order_status_id, payment_method_id, shipping_method_id, discount_id, incharge_employee_id, order_date, order_total_amount, order_tracking_number, order_note, order_billing_address, order_expected_delivery_date, order_transaction_reference, order_tax, order_created_at, order_updated_at) VALUES ('ba9bb4cf-34eb-4fc3-8433-d7bbda64688b', 'e93a2eaf-1d11-42b7-8222-d2fb708f315c', 5, 1, 1, NULL, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', '2025-04-09 13:25:59.830882+07', 890000.00, 'TNGCQALAKU', '', '1, Bình Mỹ, Bắc Tân Uyên, Bình Dương', '2025-04-16 13:25:59.83+07', '9959831', 0.05, '2025-04-09 13:25:59.832883+07', '2025-04-09 13:43:54.942377+07') ON CONFLICT DO NOTHING;
INSERT INTO public."order" (order_id, user_id, order_status_id, payment_method_id, shipping_method_id, discount_id, incharge_employee_id, order_date, order_total_amount, order_tracking_number, order_note, order_billing_address, order_expected_delivery_date, order_transaction_reference, order_tax, order_created_at, order_updated_at) VALUES ('7d30c625-bc2e-4d3f-b02c-03d0f1527f74', 'e93a2eaf-1d11-42b7-8222-d2fb708f315c', 6, 1, 1, NULL, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', '2025-04-09 13:20:03.628597+07', 3440000.00, 'TN7OBIGL7D', '', '111, An Lộc, Bình Long, Bình Phước', '2025-04-16 13:20:03.628+07', '9603629', 0.05, '2025-04-09 13:20:03.631612+07', '2025-04-09 13:44:06.734503+07') ON CONFLICT DO NOTHING;
INSERT INTO public."order" (order_id, user_id, order_status_id, payment_method_id, shipping_method_id, discount_id, incharge_employee_id, order_date, order_total_amount, order_tracking_number, order_note, order_billing_address, order_expected_delivery_date, order_transaction_reference, order_tax, order_created_at, order_updated_at) VALUES ('e22c8c3a-bc90-454e-b938-7f49aa86907b', 'ec9d2a8e-9c79-49b8-8521-7af1aec9884a', 4, 1, 1, NULL, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', '2025-07-24 13:16:00.810327+07', 882500.00, 'TN2EKWU9OW', '', 'axvwscqef, An Thới, Bình Thuỷ, Cần Thơ', '2025-07-31 13:16:00.81+07', '7760810', 0.05, '2025-07-24 13:16:00.811327+07', '2025-07-24 13:17:09.615239+07') ON CONFLICT DO NOTHING;
INSERT INTO public."order" (order_id, user_id, order_status_id, payment_method_id, shipping_method_id, discount_id, incharge_employee_id, order_date, order_total_amount, order_tracking_number, order_note, order_billing_address, order_expected_delivery_date, order_transaction_reference, order_tax, order_created_at, order_updated_at) VALUES ('ff3ba909-5d72-4388-a6ed-9ee863d168a4', '93b42024-4686-486d-b626-bd29589befbf', 4, 1, 1, NULL, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', '2025-04-10 15:55:31.939978+07', 2485998.00, 'TNNF9EL61V', '', '111, Bình Mỹ, Bắc Tân Uyên, Bình Dương', '2025-04-17 15:55:31.939+07', '5331939', 0.05, '2025-04-10 15:55:31.941978+07', '2025-04-10 15:56:40.140753+07') ON CONFLICT DO NOTHING;
INSERT INTO public."order" (order_id, user_id, order_status_id, payment_method_id, shipping_method_id, discount_id, incharge_employee_id, order_date, order_total_amount, order_tracking_number, order_note, order_billing_address, order_expected_delivery_date, order_transaction_reference, order_tax, order_created_at, order_updated_at) VALUES ('8726cf7e-51a8-4340-a7d5-c4dd85456668', 'ec9d2a8e-9c79-49b8-8521-7af1aec9884a', 7, 2, 1, NULL, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', '2025-07-24 13:15:23.119163+07', 882500.00, 'TNIIQA3LLW', 'Ship nhanh nhanh di shop oi', 'abc, An Bình, Ninh Kiều, Cần Thơ', '2025-07-31 13:15:23.119+07', '71425190', 0.05, '2025-07-24 13:15:23.121188+07', '2025-07-24 13:27:59.848855+07') ON CONFLICT DO NOTHING;


--
-- TOC entry 5263 (class 0 OID 57914)
-- Dependencies: 243
-- Data for Name: order_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_status (order_status_id, order_status_name) VALUES (1, 'PENDING') ON CONFLICT DO NOTHING;
INSERT INTO public.order_status (order_status_id, order_status_name) VALUES (2, 'PROCESSING') ON CONFLICT DO NOTHING;
INSERT INTO public.order_status (order_status_id, order_status_name) VALUES (5, 'CANCELLED') ON CONFLICT DO NOTHING;
INSERT INTO public.order_status (order_status_id, order_status_name) VALUES (6, 'RETURNED') ON CONFLICT DO NOTHING;
INSERT INTO public.order_status (order_status_id, order_status_name) VALUES (3, 'SHIPPING') ON CONFLICT DO NOTHING;
INSERT INTO public.order_status (order_status_id, order_status_name) VALUES (4, 'COMPLETED') ON CONFLICT DO NOTHING;
INSERT INTO public.order_status (order_status_id, order_status_name) VALUES (7, 'DENIED') ON CONFLICT DO NOTHING;
INSERT INTO public.order_status (order_status_id, order_status_name) VALUES (8, 'INSPECTION') ON CONFLICT DO NOTHING;
INSERT INTO public.order_status (order_status_id, order_status_name) VALUES (9, 'RETURNING') ON CONFLICT DO NOTHING;


--
-- TOC entry 5265 (class 0 OID 57920)
-- Dependencies: 245
-- Data for Name: order_variation_single; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('8532780c-1727-45c8-9ac9-d1260f1f12e5', 12, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('8532780c-1727-45c8-9ac9-d1260f1f12e5', 13, NULL, 415000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('8532780c-1727-45c8-9ac9-d1260f1f12e5', 14, NULL, 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('1ad62489-b36d-405d-afab-1653398a58ee', 15, NULL, 275000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('1ad62489-b36d-405d-afab-1653398a58ee', 16, NULL, 275000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('1ad62489-b36d-405d-afab-1653398a58ee', 17, NULL, 275000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('1ad62489-b36d-405d-afab-1653398a58ee', 18, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('3399c540-74b8-4240-8d99-e274a1ba8513', 19, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('7d30c625-bc2e-4d3f-b02c-03d0f1527f74', 20, NULL, 3400000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('ba9bb4cf-34eb-4fc3-8433-d7bbda64688b', 21, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('ff3ba909-5d72-4388-a6ed-9ee863d168a4', 22, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('ff3ba909-5d72-4388-a6ed-9ee863d168a4', 23, NULL, 1205998.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('ff3ba909-5d72-4388-a6ed-9ee863d168a4', 24, NULL, 390000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 25, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 26, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 27, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 28, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 29, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 30, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 31, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 32, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 33, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 34, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 35, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 36, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 37, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 38, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 39, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 40, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 41, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 42, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 43, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 44, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 45, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 46, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 47, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 48, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 49, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 50, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 51, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 52, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 53, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 54, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 55, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 56, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 57, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 58, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 59, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 60, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 61, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 62, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 63, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 64, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 65, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 66, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 67, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 68, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 69, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 70, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 71, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 72, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 73, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 74, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 75, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 76, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 77, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 78, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 79, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 80, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 81, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 82, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 83, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 84, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 85, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 86, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 87, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 88, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 89, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 90, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('0ab8dffb-ba91-4053-9ea9-733b42d1e49d', 91, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('55ae700c-10dd-4a6b-9509-94d22f3c2b29', 92, NULL, 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('8726cf7e-51a8-4340-a7d5-c4dd85456668', 93, NULL, 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.order_variation_single (order_id, variation_single_id, sale_id, variation_price_at_purchase) VALUES ('e22c8c3a-bc90-454e-b938-7f49aa86907b', 94, NULL, 850000.00) ON CONFLICT DO NOTHING;


--
-- TOC entry 5266 (class 0 OID 57925)
-- Dependencies: 246
-- Data for Name: payment_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payment_method (payment_method_id, payment_method_name) VALUES (1, 'COD') ON CONFLICT DO NOTHING;
INSERT INTO public.payment_method (payment_method_id, payment_method_name) VALUES (2, 'VNPAY') ON CONFLICT DO NOTHING;
INSERT INTO public.payment_method (payment_method_id, payment_method_name) VALUES (3, 'TRANSFER') ON CONFLICT DO NOTHING;


--
-- TOC entry 5268 (class 0 OID 57931)
-- Dependencies: 248
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('820f4f06-299a-4389-b10a-d1ff5ac4fd61', 1, 3, 'Đầm bầu CF W099002 Xanh đen', 'ĐẦM639', 'Tên sản phẩm: Đầm bầu CF W099002 Xanh đen

Thương hiệu: CF
Sản xuất tại: Việt Nam
Chất liệu : 90% cotton, 10% spandex
HƯỚNG DẪN SỬ DỤNG
- Hạn chế dùng sản phẩm giặt tẩy
- Không ngâm, giặt chung với sản phẩm ra màu
- Không giặt trong nước nóng trên 40°C
- Nên ủi/là mặt trái sản phẩm.', '2025-03-25 09:27:44.24953+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('3cb1ed73-0bef-447b-bb1a-798c3fd8ae82', 2, 3, 'Áo Khoác Phao Pakar Cổ Lót Lông', 'ÁOK857', 'Áo Khoác Phao Pakar Cổ Lót Lông , Chần bông dày dặn đầm tay, bo tay cản gió ấm áp, Hàng VNXK - AP21', '2025-03-25 09:31:01.043135+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('bc0bff38-a6d2-4cda-8b1d-c00576a97b84', 6, 3, 'Áo len mỏng cổ tim', 'ÁOL637', 'Áo len mỏng cổ tim', '2025-03-25 09:33:11.05889+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('50e55ab7-ee7b-44a8-b24a-6cf884805ef5', 2, 3, 'Quần Jogger Nam Thể Thao Pigofashion Cao Cấp JGN01', 'QUẦ148', 'Đường may chắc chắn, sắc xảo
Chất liệu thun nỉ thể thao mát co giãn 4 chiều , nhẹ co giãn vô cùng thoải mái
Túi có khóa kéo an toàn tiện lợi đựng ví da, điện thoại. Lưng dây rút kèm theo
Hàng giống hình 100% về kiểu dáng, màu sắc chênh lệch ko đáng kể do độ phân giải màn hình
Kiểu dáng đơn giản, dễ mặc, phù hợp nhiều lứa tuổi
Mặc chơi thể thao, dạo phố cùng bạn bè

Hướng dẫn sử dụng, bảo quản
- Giặt những sản phẩm cùng gam màu với nhau lần giặt đầu tiên.
- Hạn chế dùng chất tẩy đậm đặc.
- Ủi và sấy ở nhiệt độ thích hợp.
- Khuyến khích lộn mặt trái khi phơi để giữ sản phẩm bền màu hơn.', '2025-03-25 09:37:41.269978+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('26312fd9-fa41-4969-a74b-8150e99b7c21', 6, 3, 'CHÂN VÁY DÁNG XÒE VINTAGE JS23-031', 'CHÂ887', 'CHÂN VÁY DÁNG XÒE VINTAGE JS23-031', '2025-03-25 09:40:00.971785+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('c684b9d2-af82-4244-af0b-efe997b1b874', 2, 3, 'Áo Thun Ba Lỗ Tập Gym Nam Chuyên Dụng Navy BB630', 'ÁOT269', 'Áo thun ba lỗ tập gym nam chuyên dụng Navy là một trong những sản phẩm được nhiều người ưa chuộng khi luyện tập thể hình. Áo thun ba lỗ có thiết kế đơn giản nhưng vẫn tôn lên vóc dáng cơ bắp của nam giới. Áo thun ba lỗ còn có khả năng thấm hút mồ hôi tốt, giúp bạn luôn thoải mái và khô ráo khi tập luyện. Áo thun ba lỗ tập gym nam chuyên dụng nam Navy có nhiều màu sắc và kích cỡ để bạn lựa chọn phù hợp với sở thích và phong cách của mình.', '2025-03-25 09:43:06.934838+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('9ab230b2-3a53-4f6c-ac03-6cad5108522a', 3, 3, 'Áo sơ mi nam dài tay kẻ họa tiết Max Coopy', 'ÁOS196', 'Áo sơ mi nam dài tay kẻ họa tiết Max Coopy hàng xuất khẩu chất liệu cotton cao cấp, mềm mại, đàn hồi tốt, thiết kế độc đáo, thể hiện gu thời trang cá tính', '2025-03-25 09:45:55.653892+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('fdad041b-7ba6-4e24-9522-c418ce9a54ea', 3, 3, 'Quần Short Kaki Trắng', 'QUẦ252', 'Quần Short Kaki Trắng', '2025-03-25 09:48:47.132107+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('279468c9-9960-4b47-9919-dfd308fd19b4', 2, 3, 'ÁO DA NAM BIKER AM22-07', 'ÁOD607', 'Áo khoác da nam phong cách Biker AM22-07 là sản phẩm cao cấp với chất liệu da dê thật bền bỉ, mềm mại mang tới cảm giác thoải mái cho các chàng trai đam mê phong cách mạnh mẽ và thời thượng.

Da áo: Da dê cao cấp, bền bỉ và mềm mại, với độ đàn hồi tốt mang đến cảm giác thoải mái khi sử dụng.
Lót trong: Lót lụa mềm mại, bóng mượt cho cảm giác mát mẻ, thoải mái khi tiếp xúc, cọ sát.
Phụ kiện: Dây kéo, khóa, nút YKK chính hãng nổi tiếng thế giới của Nhật Bản được Davinet bảo hành trọn đời. Đường may sắc nét, tinh tế với sợi chỉ siêu bền của thương hiệu Aman đến từ cộng hòa Đức.', '2025-03-25 09:52:06.647366+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('98ff4f0c-fac2-45bb-b186-73365fb7a675', 6, 3, 'Đầm Maxi Voan Hoa Tay Dài Nhúng Eo Ngực', 'ĐẦM375', 'Chất liệu voan tơ mềm, mượt, may 2 lớp, mặt thoải mái freesize từ 42-53kg vừa, tùy chiều cao.', '2025-03-26 09:10:11.381473+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('79994f72-c1c8-460e-acf4-906e3d0924c5', 1, 3, 'Áo polo nam cổ V Vee Polo mềm mịn thoáng mát ', 'ÁOP310', 'Nguồn gốc xuất xứ: Việt Nam
- Chất liệu: 100% Organic Cotton
+ Mềm mịn, thoáng mát, thấm hút mồ hôi tốt và thân thiện với làn da
+ Cổ V basic dễ phối đồ, lịch sự nhưng vẫn thoải mái
- Form: Slim
+ Ôm gọn cơ thể, chỉn chu thanh lịch', '2025-03-26 10:11:59.088456+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('3f131de4-ff0d-445a-a4f6-9764ab4f38db', 3, 3, 'Quần Jeans Ống Loe Rộng Dáng Rũ', 'QUẦ269', 'Thiết kế cạp ôm sát hơn quanh phần hông, với kiểu dáng rộng tôn dáng và loe dần bắt đầu từ phần đầu gối. Đường may viền tương phản với phần giữa tạo nên sự thon gọn. Chất liệu denim mềm mại, rũ làm từ hỗn hợp cotton và lyocell. Nhẹ và thoáng khí, với kiểu dáng rộng, bồng bềnh.', '2025-03-26 10:14:53.785111+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('a0d10b39-4841-463e-a9a6-0280ed3b77e8', 6, 3, 'Chân váy jeans dáng dài chữ a', 'CHÂ154', 'Dù là người theo đuổi phong cách nhẹ nhàng hay năng động thì chân váy jeans dáng dài midi chính là một gợi ý không thể bỏ qua dành cho nàng. Ưu điểm của chân váy jeans chính là sự trẻ trung, năng động, dễ thương và rất tôn dáng. Dáng váy ôm nhẹ ở eo và xòe dần xuống tùng váy như chữ a, giúp tạo cho người mặc cảm giác thoải mái cũng như mỗi bước đi trở nên uyển chuyển hơn. Ngoài ra, vải jeans có đặc tính bền bỉ, không dễ bị mòn rách, ít nhăn nên vô cùng dễ mặc. Phía trước và sau đều được may 2 túi tạo nên sự năng động. Khi diện mẫu chân váy jeans dáng dài midi này, K&K Fashion gợi ý nàng nên phối cùng những chiếc áo croptop hay sơ vin gọn gàng để cân đối vóc dáng giúp những cô nàng nấm lùn “ăn gian” được một ít chiều cao và những cô nàng có phần mũm mĩm cũng tự tin khi trông thon gọn hơn rất nhiều.', '2025-03-26 10:16:34.616884+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('c2fcd566-4584-4cdb-9179-97bdc4782386', 4, 2, 'Áo Sơ Mi Lụa Cổ Vest', 'ÁOS868', 'Sơ mi Tay Ngắn Cổ Vest Thời Trang Unisex Vải Lụa Chéo mềm mại', '2025-03-28 10:44:38.318866+07', '2025-03-28 10:44:38.318866+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('49c158a0-180e-44aa-b60f-43a2c65fc9c6', 6, NULL, 'Chân váy dài xếp ly phong cách retro', 'CHÂ434', 'Chân váy dài xếp ly phong cách retro', '2025-03-25 09:24:13.287107+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('2ae28f8e-b734-409d-9d88-0c7e5e19686d', 6, 3, 'Đầm body thun gân tăm áo cổ tròn tay dài from dáng dài xẻ tà', 'ĐẦM605', 'Đầm body thun gân tăm áo cổ tròn tay dài from dáng dài xẻ tà sang chảnh thời trang nữ BONUCCI', '2025-03-26 10:18:59.44258+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('f8402d8b-5f94-43de-a4ab-455a70510d31', 3, 3, 'Áo khoác nhung tăm cao cấp – LD2052', 'ÁOK679', 'Áo khoác nhung tâm của LADOS mang đến diện mạo mới, sử dụng chất liệu nhung sang trọng, dễ dàng ứng dụng trong nhiều hoàn cảnh thời trang khác nhau.', '2025-03-26 10:26:00.27479+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('1886bf1b-e995-4d65-a440-89da1f27555d', 4, 3, 'Áo len tăm Uniqlo cổ 3 phân Nhật Bản', 'ÁOL823', 'Áo len tăm Uniqlo nữ làm từ sợi len dài mềm mịn, không bị xù hay dão khi giặt. Cổ cao 3 phân bảo vệ cổ bạn ấm ấp trong mùa đông giá lạnh mà không gây khó chịu, thiết kế ôm gọn tôn dáng người mặc.', '2025-03-26 10:30:16.054432+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('cca9fa22-8db7-4c19-90ff-1c0e96e69754', 4, 3, 'Quần Tây Tím Than Tối Chống Nhăn, Co Giãn', 'QUẦ868', 'Chất liệu: 69% Poly, 29% Rayon, 2% Spandex

Kiểu dáng: Ống đứng ôm vừa, tôn dáng người mặc

Thiết kế: Basic, phần cạp có cúc cài trước, bên trong có móc cài giúp định vị phần cạp, giữ form dáng

Ưu điểm: Bền màu, chống nhăn, chống nhàu, thấm hút mồ hôi tốt, co giãn tốt', '2025-03-26 10:33:58.255792+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('a51db439-45fd-42ce-bfe0-234ff577f198', 2, 3, 'Áo sơ mi ngắn tay vải jersey Regular Fit', 'ÁOS006', 'Áo sơ mi ngắn tay bằng jersey vân nổi có cổ bẻ, nẹp khuy liền, cầu vai phía sau và vạt ngang có đường xẻ ở mỗi bên. Dáng vừa để mặc thoải mái và tạo dáng cổ điển.', '2025-03-26 10:36:11.929245+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('1422e857-9ff5-4f92-9ec3-746dbcda9d58', 5, 3, 'Quần baggy jean', 'QUẦ213', 'Quần jean dáng baggy bằng vải denim, có 5 túi và một chiếc jacron da in nổi SANDRO ở mặt sau. Loại vải denim này sử dụng quy trình giặt giúp giảm 95% lượng nước tiêu thụ và giảm đáng kể việc sử dụng năng lượng và hóa chất so với các kỹ thuật giặt thông thường.', '2025-03-26 10:38:17.018839+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('d39cc00b-af08-4e0a-9906-d2c81adcda2c', 4, 3, 'Váy sơ mi form dáng chữ A họa tiết kẻ caro', 'VÁY373', 'Váy sơ mi form dáng chữ A thanh lịch, thiết kế cổ bẻ sơ mi. kết hợp với họa tiết kẻ caro và bản phối màu quốc dân giúp tạo nên tổng thể trẻ trung nhưng vẫn giữ được nét thanh lịch. Mặc đi làm hay đi chơi đều vô cùng phù hợp.', '2025-03-26 10:39:59.187328+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('bb02cab9-3428-4be6-8c00-1280243b104d', 1, 3, 'Đầm Vải Pha Linen Dáng Relax', 'ĐẦM918', '51% Visco, 32% Lanh, 17% Bông', '2025-03-26 10:41:14.173327+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('907278fc-e183-45a6-8da5-46cd0e3409c3', 4, 3, 'Đầm sơ mi xếp tầng midi cổ bẻ tay ngắn phối thắt lưng thanh lịch', 'ĐẦM799', 'Sức hút vượt thời gian của sắc đen cá tính cùng phong cách White On White một lần nữa làm xao xuyến những tín đồ thời trang. Được thiết kế với phom dáng xòe tinh tế, kết hợp cùng các chi tiết khoét lỗ hình hoa độc đáo trên thân áo tạo nên điểm nhấn ấn tượng, chiếc đầm từ nhà GIGI sẽ là item lý tưởng dành cho những cô nàng yêu thích phong cách Minimalis.', '2025-03-26 10:43:31.18123+07', '2025-03-26 10:46:04.323167+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('ae780342-3f8f-4396-bf6a-9d9e72737f36', 6, 3, 'Áo Thun Polo Thể Thao', 'ÁOT109', 'CHẤT LIỆU: Vải Cá Sấu Piqué 98% Cotton, 2% spandex. Sớ vải to, thấm hút mồ hôi tốt, dày dặn, giữ form tốt. Công nghệ Wash nóng định hình, hạn chế co rút và giữ form bền đẹp. Độ bền cao.
', '2025-03-26 13:36:22.646193+07', '2025-03-26 13:53:16.764017+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('2842603c-4acc-401a-bab0-2cddccf6782d', 2, 3, 'Váy Babydoll Linen', 'VÁY079', 'Chiếc đầm được may từ chất liệu vải linen cao cấp với độ thoáng mát cũng như độ đứng dáng cao. Dáng đầm dài vừa phải cùng những đường xếp ly phần ngực cho tổng thể lịch sự và nữ tính.', '2025-03-26 14:00:01.522221+07', '2025-03-26 14:37:05.58675+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('72fb5f06-7af1-41e5-a8a6-d5391a33d6ad', 3, 3, 'Áo Len Cardigan Ngắn', 'ÁOL748', 'Áo khoác len cardigan nữ', '2025-03-26 14:05:10.333258+07', '2025-03-26 14:37:05.58675+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('8baeb037-71d2-42e5-a25a-b4840a63a7ce', 2, 3, 'Quần Culottes Kaki', 'QUẦ035', '
Loại sản phẩm: Quần culottes
Phong cách: Feminine - Dịu dàng nữ tính', '2025-03-26 14:09:32.962382+07', '2025-03-26 14:37:05.58675+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('ec6f1767-c99d-4c7b-88b7-f98c1c8e3df9', 5, 3, 'Váy Jean Dài', 'VÁY381', 'Dù là người theo đuổi phong cách nhẹ nhàng hay năng động thì chân váy jeans dáng dài midi chính là một gợi ý không thể bỏ qua dành cho nàng. ', '2025-03-26 14:13:55.064983+07', '2025-03-26 14:37:05.58675+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('7915da52-436f-438d-a61f-53917f2b41c4', 5, 3, 'Áo Khoác Jean Nữ', 'ÁOK685', 'Áo khoác denim wash.
Form dáng ngắn và thẳng.
Thêu thủ công, đính sequin và hạt ở thân áo
Chỉ may màu tương phản.
Cổ áo classic.
Tay dài.
Hai túi hộp vá trước ngực có nắp.
Cài nút.', '2025-03-26 14:19:19.726914+07', '2025-03-26 14:37:05.58675+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('3a569c04-4731-4040-9908-cee6db27e58c', 2, 3, 'Áo Thun Ba Lỗ Cotton', 'ÁOT069', 'Áo ba lỗ cổ tròn, có lỗ khoét tay kiểu Mỹ, được trang trí bằng thêu trên ngực.

Áo ba lỗ nữ Sandro
Lỗ tay áo kiểu Mỹ
Cổ tròn
Hình thêu SANDRO.', '2025-03-26 14:22:33.23183+07', '2025-03-26 14:37:05.58675+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('1ff680b4-91cc-408f-a218-63e4cd6d8aa6', 4, 3, 'Váy Midi', 'VÁY398', 'Chân váy chữ A dáng xòe bằng vải faille pha cotton với túi phía trước.
Cạp cao
Hai túi phía trước
Cài khóa kéo bên hông
Mặt trong được may lót cùng tông', '2025-03-26 14:25:54.716947+07', '2025-03-26 14:37:05.58675+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('da1dc78e-d36f-489c-bb49-5b628ef4ad1c', 1, 3, 'Áo Khoác Trench Coat Dáng Dài Đinh Tán', 'ÁOK402', 'Mùa này, studio tôn vinh tinh thần lễ hội và sự thanh lịch vượt thời gian của thời trang Pháp. Như một lời ca ngợi sự quyến rũ và tinh tế, mỗi món đồ thể hiện không khí của một bữa tiệc và cảm giác hân hoan, tái định nghĩa sự thanh lịch với một chút táo bạo. ', '2025-03-26 14:31:28.322769+07', '2025-03-26 14:37:05.58675+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('a85b0278-bab3-49dc-9c18-01d5d4ad0286', 1, 3, 'Áo len cổ chữ V', 'ÁOL705', 'Áo len cổ chữ V', '2025-03-26 14:34:36.803218+07', '2025-03-26 14:37:05.58675+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('477f06d7-1367-43c7-926a-fbd2094e0acf', 5, 3, 'Quần Jogger Box', 'QUẦ261', 'Quần Jogger Box', '2025-03-26 14:40:40.112896+07', '2025-03-26 15:02:31.402619+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('cdb65655-7c94-4522-9516-530d2761f91b', 2, 3, 'Chân váy dài Broderie Anglaise', 'CHÂ268', 'Chân váy dài xếp nếp có viền ren và viền Broderie Anglaise, cài cúc và xẻ phía trước.', '2025-03-26 14:44:19.09443+07', '2025-03-26 15:02:31.402619+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('e460c599-1ef0-4c1a-9648-dfeae7feefb1', 1, 3, 'Áo Sơ Mi Tay Dài Trơn', 'ÁOS490', 'Áo sơ mi có cổ áo cổ điển, tay dài với cổ tay cài nút, cài nút ở phía trước và gấu áo sơ mi.

Áo sơ mi nam Sandro
Cổ áo sơ mi
Tay dài có khuy cài
Gấu áo sơ mi
Kiểu dáng cổ điển', '2025-03-26 14:48:21.558641+07', '2025-03-26 15:02:31.402619+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('1a29569b-9380-4eb5-bbd7-3aa8d916e24b', 2, 3, 'Quần Short Jean Nam', 'QUẦ256', 'Quần short dáng vừa bằng cotton mềm dệt chéo với nẹp khoá kéo và khuy, túi chéo hai bên và túi sau mổ viền.', '2025-03-26 14:55:19.115793+07', '2025-03-26 15:02:31.402619+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('02053d99-8994-4427-ae03-6ce440278760', 6, 3, 'Áo Khoác Da Lộn', 'ÁOK293', 'Được thiết kế theo đúng form chuẩn của nam giới Việt Nam', '2025-03-26 15:01:32.261841+07', '2025-03-26 15:02:31.402619+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('30c08de4-c0e7-45cb-aec4-db4bde17c3ab', 5, 2, 'Áo Thun Cổ Tròn Basic Nam', 'ÁOT876', 'Màu sắc phong cách, năng động. ', '2025-03-28 10:50:37.246532+07', '2025-03-28 10:50:37.246532+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('cb25da06-3b1f-417a-8bc3-6961aee8843b', 4, 3, 'Quần jeans lửng suông rộng denim Nhật Bản', 'QUẦ920', 'Quần jeans dáng lửng ống suông rộng làm từ vải denim Nhật Bản.
Mác da KENZO Paris ở mặt sau.
Cúc KENZO Paris.
Đường khâu ở túi sau hình Núi Phú Sĩ.
Quần denim Kuroki Nhật Bản.
Hai túi trước', '2025-03-26 15:05:47.122604+07', '2025-03-26 15:07:25.870385+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('4cb234f7-db1f-4140-a9b8-86fd6056d987', 1, 3, 'Váy Jean Dáng Xòe', 'VÁY959', 'Thành phần vải: 100% Cotton
Xuất xứ thương hiệu: Ý
Sản xuất tại: Thổ Nhĩ Kỳ
Thiết kế cạp cao kèm đỉa thắt lưng

Ba túi phía trước
Khóa kéo zip và nút cài tròn
Cạp cao, dáng xòe nữ tính', '2025-03-26 15:09:59.868129+07', '2025-03-26 15:36:59.027584+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('7baecb0e-c6b0-4c3f-b2dd-b0900254784d', 4, 3, 'Áo Khoác Nhung', 'ÁOK008', 'Áo Khoác Nhung', '2025-03-26 15:19:19.658949+07', '2025-03-26 15:36:59.027584+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('04a67658-96c5-457c-97a6-4b1eb8a94583', 6, 3, 'Áo len cashmere cổ tròn', 'ÁOL697', 'Áo len dệt gân với họa tiết đan cáp, làm từ chất liệu len pha lông cừu và cashmere, cổ tròn và tay dài.

Áo len đan nữ Sandro
Chất liệu len pha lông cừu và cashmere
Hiệu ứng xếp lớp ở phần gấu áo hai mép
Cổ tròn
Tay dài', '2025-03-26 15:20:47.467109+07', '2025-03-26 15:36:59.027584+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('2ecbd902-1bfd-4b4c-a23d-b01dfefe702d', 5, 3, 'QUẦN GOLF WAAC NAM ESSENTIAL SUMMER PANTS', 'QUẦ731', 'QUẦN GOLF WAAC NAM ESSENTIAL SUMMER PANTS', '2025-03-26 15:23:34.419298+07', '2025-03-26 15:36:59.027584+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('cc41ada9-ac4e-4d87-8227-c265ade04f73', 5, 3, 'QUẦN NỈ BASIC BIO WASHING', 'QUẦ940', 'QUẦN NỈ BASIC BIO WASHING', '2025-03-26 15:26:18.550623+07', '2025-03-26 15:36:59.027584+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('f1c3c854-8007-4ce9-b43e-176b62058d81', 4, 3, 'Đầm Linen Nút Gỗ', 'ĐẦM879', 'Vải linen luôn toát lên vẻ đẹp thanh thuần, mộc mạc. Được kết hợp với hàng nút gỗ nâu, chiếc đầm linen càng gợi lên cảm giác êm dịu, quen thuộc. Bên cạnh đó, đầm còn có họa tiết hoa cỏ thêu tay xinh xắn làm điểm nhấn, tạo thêm chút điểm nhấn mỗi khi bạn diện lên.', '2025-03-26 15:28:13.932383+07', '2025-03-26 15:36:59.027584+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('f2ecb711-38fe-4d31-b140-2a51aef473e9', 3, 3, 'Đầm Sơ Mi Dáng Dài', 'ĐẦM273', 'Đầm midi cotton họa tiết sọc cổ điển .


Cổ áo sơ mi classic
Eo bo chun
Tay dài
Khuy cài tay áo
Chân váy bèo xếp ly
Họa tiết kẻ sọc
Chất liệu cotton
Chiều dài đầm tính từ vai: 111.25 cm', '2025-03-26 15:30:28.997506+07', '2025-03-26 15:36:59.027584+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('01e8f17c-8a59-4c9a-a529-adb40ef77240', 2, 3, 'Áo khoác kimono dáng ngắn', 'ÁOK556', 'Áo khoác kimono dáng ngắn.
Vải cotton có lớp lót satin
Tay áo kiểu kimono ở phía sau.
Móc cài cổ
Tab vai
Túi bên hông.
Khóa đôi
Một túi bên trong.
Dây điều chỉnh cổ tay.
Nhãn KENZO Paris ở phía sau.
Các nút được khắc.', '2025-03-26 15:32:13.678781+07', '2025-03-26 15:36:59.027584+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('91ca633b-397b-4545-a6fd-e1b028e28d2a', 3, 3, 'Đầm maxi phối dây hở lưng', 'ĐẦM392', 'Đầm maxi có dây buộc, đường viền cổ khoét và hở lưng có dây buộc chéo.

Đầm maxi sọc nữ Sandro
Dây đai mảnh có thể điều chỉnh
Hở lưng có dây buộc chéo
Đường viền cổ khoét
Đầm xòe nhẹ', '2025-03-26 15:34:44.24314+07', '2025-03-26 15:36:59.027584+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('a69b7ea4-c0c9-45a6-9bf1-fffb44efa600', 1, 2, 'Áo Thun Nam Trơn Basic', 'ÁOT364', 'Áo Thun Slimfit Basic And Beyond là biểu tượng của sự tối giản và độc đáo. Nó là sự kết hợp hoàn hảo giữa sự đơn giản của kiểu dáng và sự độc đáo của chất liệu và màu sắc.', '2025-03-27 08:20:44.201731+07', '2025-03-27 08:20:44.201731+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('92019d2d-80f9-40c2-ace1-3dbbfe3dc9f1', 2, 2, 'Áo Sơ Mi OXFORD', 'ÁOS890', 'Oxford Shirt
Một trong 3 màu sơ mi oxford mới về, chất vải mềm, dày dặn và thấm hút. ', '2025-03-27 08:30:32.635913+07', '2025-03-27 08:30:32.635913+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('31b936d2-b0ef-48ea-b657-4e2fef7a97c0', 3, 2, 'Quần Jean Slimfit ', 'QUẦ043', 'Quần Jean Slim-fit sở hữu các đường cắt may gọn gàng, ôm theo dọc theo chiều dài chân, phần ống rộng ở bắp đùi và thu nhỏ dần xuống cổ chân một cách thon gọn, vừa phải. Thiết kế jean mới nhất này không quá bó sát, và không túm ống.', '2025-03-27 08:42:45.389505+07', '2025-03-27 08:42:45.389505+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('fc98f0cf-7948-4d4a-aa03-2ab9e6d2148a', 4, 2, 'Váy Xòe Hoa Nhí', 'VÁY761', 'Họa tiết hoa nhí luôn mang đến hình ảnh trẻ trung, tươi mới nhưng không kém phần ngọt ngào và dịu dàng cho người mặc. Một điều đặc biệt rằng chỉ với chiếc váy hoa nhí đơn giản cũng sẽ khiến bạn trở thành cô nàng thanh lịch. ', '2025-03-27 08:51:18.852946+07', '2025-03-27 08:51:18.852946+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('cf8ed606-568c-4245-ac22-f3f4b620464f', 4, 2, 'Đầm Dự Tiệc Lụa', 'ĐẦM173', 'Dáng xòe, kéo khóa sau lưng, mí ngực, hoa quấn, tay cộc phối voan tơ.', '2025-03-27 08:59:43.472331+07', '2025-03-27 08:59:43.472331+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('b23dd277-6fd5-4764-9579-40ac01904b09', 5, 2, 'Áo Phao Nam Bomber Cổ Mũ', 'ÁOP815', 'Áo phao nam bomber cổ mũ là một lựa chọn hoàn hảo cho mùa đông, kết hợp giữa phong cách thời trang và khả năng giữ ấm vượt trội. Với thiết kế bomber hiện đại, áo mang lại vẻ ngoài trẻ trung, năng động, phù hợp với nhiều phong cách khác nhau.', '2025-03-27 09:06:28.745542+07', '2025-03-27 09:06:28.745542+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('89b8e8aa-08c5-4a4c-a686-5f0c5adec07f', 6, 2, 'Áo Hoodie Nỉ Da Cá', 'ÁOH891', 'Áo hoodie mẫu áo thời trang được ưa chuộng mỗi khi mùa đông về. Sự đa di năng, có thể mix được nhiều phong cách khiến mẫu áo trở thành item bất hủ.', '2025-03-27 09:10:28.405327+07', '2025-03-27 09:10:28.405327+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('eb84fd4d-b305-45f6-b1b9-c1082c267d56', 1, 2, 'Quần Tây Ống Đứng Công Sở', 'QUẦ992', 'Vải tuyết mưa loại 1 hàng vitex, có độ co dãn, bền màu
Không nhăn và không bám bụi, không bị xù lông sau một thời gian dài sử dụng.', '2025-03-27 09:15:26.196694+07', '2025-03-27 09:15:26.196694+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('63f61d12-4c4a-48b9-bc44-989b923e37a6', 2, 2, 'Chân Váy Bút Chì Lưng Cao', 'CHÂ346', 'Chân váy bút chì lưng cao là một item thời trang thanh lịch, tôn dáng, phù hợp với nhiều hoàn cảnh khác nhau, từ công sở đến sự kiện quan trọng. Với thiết kế ôm sát cơ thể, chân váy bút chì giúp tôn lên đường cong quyến rũ của phái đẹp, đặc biệt là vòng eo và vòng hông.', '2025-03-27 09:20:57.85484+07', '2025-03-27 09:20:57.85484+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('812569da-3866-4dde-90a4-562d7fc86ecc', 3, 2, 'Áo Croptop Gân Tăm', 'ÁOC009', 'Áo croptop gân tăm là một item thời trang được nhiều cô gái yêu thích nhờ thiết kế trẻ trung, năng động và khả năng tôn dáng vượt trội. Với kiểu dáng ngắn trên eo, áo giúp khoe khéo vòng eo thon gọn, tạo hiệu ứng kéo dài đôi chân, mang đến vẻ ngoài quyến rũ nhưng vẫn đầy cá tính.', '2025-03-27 09:28:35.877136+07', '2025-03-27 09:28:35.877136+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('7b78a866-78c9-4724-8b19-d309e2c3aeb2', 5, 2, 'Áo Sơ Mi Linen Tay Ngắn', 'ÁOS169', 'Chất liệu linen nổi bật với đặc tính nhẹ nhàng, thoáng mát và khả năng thấm hút tốt. Linen là một loại vải bền, có độ bóng tự nhiên và mang lại cảm giác mát mẻ cho người mặc, đặc biệt thích hợp trong điều kiện thời tiết nóng ẩm.', '2025-03-27 09:31:41.283277+07', '2025-03-27 09:31:41.283277+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('1b309565-8b21-407f-8fed-9f1c4807b8f1', 4, 2, 'Quần Short Jean Rách', 'QUẦ062', 'Dòng quần shorts trên gối, phù hợp để mặc cả ở nhà và dạo phố.
Có đến 3 gam màu khác nhau cho ae dễ dàng chọn lựa: Trắng, Xanh Nhạt, Xám Đậm
Chi tiết cào rách ngang đùi siêu bụi.
Form Slim ôm người, tôn dáng', '2025-03-27 09:34:32.48362+07', '2025-03-27 09:34:32.48362+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('211fdb78-13fb-446c-85ec-589333e8a628', 5, 2, 'Váy Maxi Voan Tầng', 'VÁY117', 'Những items váy tầng không những đem đến cho nàng sự quý phái và sang trọng mà còn có cả sự trẻ trung và cá tính. Nàng có chiếc váy tầng nào trong tủ đồ chưa? Váy xếp tầng mặc với áo gì?', '2025-03-27 09:39:58.689379+07', '2025-03-27 09:39:58.689379+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('2f72a228-1e9a-4846-a736-04cbf8dfacd6', 6, 2, 'Đầm Suông Linen Thoáng Mát', 'ĐẦM314', '-Đầm được thiết kế thanh nhã với kiểu dáng trẻ trung
-Đầm được may từ chất liệu cao cấp cho cảm giác mềm mại, thoáng mát và vô cùng dễ chịu khi mặc.
-Dễ dàng bảo quản, giặt ủi, chất liệu mau khô
-Màu sắc tươi tắn, trẻ trung giúp phái đẹp them tự tin mỗi khi xuống phố', '2025-03-27 09:46:51.582137+07', '2025-03-27 09:46:51.582137+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('c89d3191-7ffc-4ef1-bb01-e7711115bf4c', 3, 2, 'Áo Khoác Cardigan Len', 'ÁOK975', 'Áo khoác cardigan len là một item thời trang không thể thiếu trong tủ đồ của phái đẹp, mang đến sự ấm áp, thoải mái nhưng vẫn rất thời trang. Với chất liệu len mềm mại, áo cardigan giúp giữ ấm tốt mà không gây cảm giác nặng nề hay bí bách. ', '2025-03-27 09:50:19.33489+07', '2025-03-27 09:50:19.33489+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('214cbcec-a0ae-41dc-92eb-a5a6c36bd073', 3, 2, 'Áo Sweater Cổ Tròn', 'ÁOS540', 'Áo sweater cổ tròn là một item thời trang phổ biến, phù hợp với cả nam và nữ nhờ thiết kế đơn giản nhưng vẫn phong cách và dễ phối đồ. Với kiểu dáng rộng rãi, thoải mái, áo sweater mang lại cảm giác ấm áp trong những ngày thời tiết se lạnh.', '2025-03-27 09:55:25.897579+07', '2025-03-27 09:55:25.897579+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('7ed46c5f-14d0-464f-b556-4b1adedfd10d', 6, 2, 'Quần Kaki Túi Hộp', 'QUẦ621', 'Quần được thiết kế kiểu dáng jogger đầy cá tính, kết hợp cùng cạp chun luồn dây dệt, túi ốp hai bên khiến phù hợp với mọi chàng trang. Đồng thời, quần cũng được làm từ chất liệu cotton spandex cao cấp, giúp các chàng mặc lên vô cùng thoải mái, dễ chịu, có được trải nghiệm hoàn hảo nhất.', '2025-03-27 09:58:48.536438+07', '2025-03-27 09:58:48.536438+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('5318360f-802c-4684-97b2-516616f56a82', 3, 2, 'Chân Váy Jean Chữ A', 'CHÂ026', 'Chất liệu jean bền bỉ, chắc chắn nhưng vẫn mang lại cảm giác thoải mái khi mặc, phù hợp với cả mùa hè và mùa đông. Các mẫu chân váy jean chữ A thường có nhiều kiểu dáng đa dạng như cài cúc trước, có túi, rách nhẹ hoặc phối màu, giúp người mặc dễ dàng lựa chọn theo sở thích.', '2025-03-27 10:04:12.543145+07', '2025-03-27 10:04:12.543145+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('2ff201ad-e170-4cdd-921c-b705c276ee27', 4, 2, 'Áo Hai Dây Lụa Satin', 'ÁOH796', 'Áo hai dây lụa satin là một item thời trang sang trọng, tinh tế, mang lại vẻ đẹp quyến rũ nhưng vẫn thanh lịch cho người mặc. Với chất liệu lụa satin mềm mại, bóng nhẹ, áo tạo hiệu ứng bắt sáng tự nhiên, giúp tôn lên làn da và vóc dáng.', '2025-03-27 10:08:31.412475+07', '2025-03-27 10:08:31.412475+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('0e7f984f-9540-4a17-9aa3-9cb6cd993fe8', 2, 2, 'Áo Sơ Mi Caro Oversize', 'ÁOS751', 'Nếu các quý ông đang truy tìm mẫu áo sơ mi rộng rãi mà vẫn phù hợp với môi trường công sở thì không thể bỏ qua item áo sơ mi oversize nam. Hãy xem xét những yếu tố như cổ áo sơ mi, tay áo, túi áo và cầu vai có cân xứng không.', '2025-03-27 10:14:20.735252+07', '2025-03-27 10:14:20.735252+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('15b0d792-cb3d-4d3d-87c4-cf138d464594', 1, 2, 'Quần Jogger Thể Thao', 'QUẦ631', 'Quần jogger thể thao là một item thời trang hiện đại, tiện dụng, phù hợp cho cả nam và nữ yêu thích phong cách năng động, thoải mái. Với thiết kế đặc trưng là phần ống quần thu nhỏ dần và bo chun ở cổ chân, quần jogger giúp tạo dáng gọn gàng, linh hoạt khi vận động.', '2025-03-27 10:22:36.311463+07', '2025-03-27 10:22:36.311463+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('edfd36c9-0c51-447d-ae88-2218fbefaa90', 5, 2, 'Váy Yếm Jean Năng Động', 'VÁY867', 'Váy yếm jean năng động là một item thời trang trẻ trung, cá tính và dễ phối đồ, phù hợp với nhiều phong cách khác nhau. Với thiết kế yếm đặc trưng, váy mang lại vẻ ngoài tươi tắn, năng động nhưng vẫn giữ được nét nữ tính, đáng yêu.', '2025-03-27 10:27:10.722338+07', '2025-03-27 10:27:10.722338+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('2e83611d-de60-4650-a5d6-911eea3102ef', 4, 2, 'Đầm Bodycon Ôm Sát', 'ĐẦM840', 'Đầm body hai dây có ưu điểm là mang lại sự gợi cảm cho những cô nàng muốn khoe bờ vai gầy và xương quai xanh quyến rũ. Trong khi đó, item này cũng rất siêu tôn dáng, khoe trọn 3 vòng và hai quay mảnh mang lại sự mảnh mai và làm nổi bật xương quai xanh hấp dẫn người khác phái.', '2025-03-27 10:31:21.254974+07', '2025-03-27 10:31:21.254974+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('559291e6-380c-494c-ab1c-ec7ced7b8169', 2, 2, 'Áo Khoác Dạ Tweed', 'ÁOK285', 'Mùa đông là mùa lên ngôi của những chiếc áo dạ tweed thời thượng, chưa bao giờ có dấu hiệu hạ nhiệt. Nếu như đang tìm kiếm những mẫu áo dạ tweed thanh lịch, hottrend thì chắc chắn nàng sẽ không thể ngó lơ bộ sưu tập sành điệu cùng những cách phối đồ hợp thời dưới đây. ', '2025-03-27 10:34:33.703223+07', '2025-03-27 10:34:33.703223+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('eaea7367-f097-47e5-8490-714311bbaa61', 6, 2, 'Áo Thun Tay Lỡ Form Rộng', 'ÁOT806', 'Trong thời đại hiện đại, áo thun nữ tay lỡ đã trở thành một phần không thể thiếu trong tủ đồ của phụ nữ. Không chỉ là một xu hướng thời trang mà áo thun nữ tay lỡ còn là biểu tượng cho sự thoải mái, năng động và phong cách cá nhân của người mặc.', '2025-03-27 10:40:59.149029+07', '2025-03-27 10:40:59.149029+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('07b3b92f-4f32-4aaa-87fc-1f94379922b6', 4, 2, 'Quần Jeans Ống Loe Vintage', 'QUẦ960', 'THÔNG TIN SẢN PHẨM -Chất liệu : Jeans cotton -Kiểu lưng: Lưng cao -Xuất xứ: Việt Nam', '2025-03-28 08:06:51.031128+07', '2025-03-28 08:06:51.031128+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('82c8797c-32ed-44fc-808b-8e82a0f59c63', 3, 2, 'Váy Midi Linen Cúc Gỗ', 'VÁY077', 'Tên: Đầm Váy Vintage cúc gỗ chất Linen hàng QC 2 lớp, dáng dài qua gối.
Cổ V tay ngắn, thắt eo thanh lịch, trang nhã. Đầm phong cách Vintage
Kiểu dáng đơn giản phù hợp đi chơi, đi cafe, dự tiệc, công sở.
Chất liệu: Linen.
Màu sắc: 2 màu
Kích Thước: Size S/M/L/XL/XXL', '2025-03-28 08:17:04.960485+07', '2025-03-28 08:17:04.960485+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('abf1d210-8f1e-4753-a6f6-54301c1e7e8b', 1, 2, 'Đầm Trắng Tiểu Thư', 'ĐẦM561', 'CHẤT LIỆU SẢN PHẨM VÁY TRẮNG TIỂU THƯ ĐẦM TRẮNG DỰ TIỆC CHẤT LIỆU COTTON HÀN CAO CẤP MỀM MỊN 2 LỚP
Vải Cotton Hàn : Đặc tính mềm mại, độ bền cao, thấm hút mồ hôi tốt phù hợp với mọi dáng người, trong mọi điều kiện thời tiết.', '2025-03-28 08:24:31.812649+07', '2025-03-28 08:24:31.812649+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('884017ca-050f-4734-9867-9abbcc69095f', 5, 2, 'Áo Khoác Phao Siêu Nhẹ', 'ÁOK501', 'Sản phẩm Áo Khoác Phao Nam Nữ Unisex Hàng Trần Bông 3 Lớp Dày Dặn', '2025-03-28 08:27:58.714937+07', '2025-03-28 08:27:58.714937+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('9fb025b2-93f3-4b6f-b8c8-cf29b2afa1d3', 6, 2, 'Áo Len Tăm Cổ Lọ', 'ÁOL193', 'Áo cổ lọ chất len tâm dáng ôm body siêu đẹp', '2025-03-28 08:34:23.988197+07', '2025-03-28 08:34:23.988197+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('33a3f2e0-34a1-446f-ac8d-47cad6b02e2c', 2, 2, 'Quần Âu Hàn Quốc', 'QUẦ667', 'Quần âu Hàn Quốc với chất liệu đa dạng, mẫu mã phong phú, giá cả phải chăng.

– Cung cấp kích thước sản phẩm từ size S đến XXXL.', '2025-03-28 08:39:30.19789+07', '2025-03-28 08:39:30.19789+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('577ba438-3c53-42fe-8e76-c6316a41ad2a', 1, 2, 'Chân Váy Tennis Xếp Ly', 'CHÂ353', 'THÔNG TIN SẢN PHẨM : - Thương hiệu: SUITS BY CHAN - Phân loại: Chân váy - Chất liệu: Màu vàng chất Tex Nhật kẻ sọc, màu đen chất Tex nhung, váy lót quần - Kiểu dáng: Dáng A, xếp li - Màu sắc: Vàng, đen - Size: S-M-L - Xuất xứ: Việt Nam', '2025-03-28 08:42:54.823065+07', '2025-03-28 08:42:54.823065+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('ee5cd1d0-0fa2-443d-b1cd-7b1924d82eaf', 3, 2, 'Áo Bra Top Tập Gym', 'ÁOB267', 'Áo bra tập gym AB30029 kiểu dáng thời trang, màu sắc trẻ trung cho bạn tự tin khoe cá tính. Áo bra 2 dây vải co giãn, thoáng mát, vận động thoải mái.', '2025-03-28 08:45:54.404974+07', '2025-03-28 08:45:54.404974+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('de7e8253-967c-48c0-a769-c76576b90858', 4, 2, 'Áo Sơ Mi Kiểu Cổ Đức', 'ÁOS332', 'Áo sơ mi nữ màu trắng dài tay dáng rộng thêu ngựa phong cách mới Kiểu dáng: Dáng rộng Màu sắc: Trắng Chất liệu: Chất đanh mịn, dày dặn đứng form', '2025-03-28 08:49:40.630026+07', '2025-03-28 08:49:40.630026+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('adac3ca4-2933-47a0-8b48-ba1789ccbc73', 4, 2, 'Quần Baggy Vải Mềm', 'QUẦ862', 'Quần baggy dáng lửng, xếp ly trước cực trendy. Dễ phối đồ. chất jean mềm nhẹ không co giãn.', '2025-03-28 08:53:21.836334+07', '2025-03-28 08:53:21.836334+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('b9996556-674e-448c-972a-5c69bbf0b5b7', 5, 2, 'Áo Khoác Blazer Thanh Lịch', 'ÁOK336', 'Áo blazer nam TUTO5 Menswear AVN01 - áo vest công sở cao cấp có đệm vai thanh lịch, trang trọng phong cách hàn quốc', '2025-03-28 08:58:16.982421+07', '2025-03-28 08:58:16.982421+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('defa44c9-4940-424f-be58-9dd3d3fd0bfa', 6, 2, 'Áo Polo Cotton Trắng New Ways', 'ÁOP613', 'THÔNG TIN SẢN PHẨM
Xuất xứ: Việt Nam
Gia công: Việt Nam
cotton mềm mịn, thoáng mát', '2025-03-28 09:05:25.474166+07', '2025-03-28 09:05:25.474166+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('f1ee256d-e6b3-42ae-9b51-f726264a7b1c', 1, 2, 'Váy Babydoll tay bồng hở lưng bigsize FAE BABYDOLL', 'VÁY388', 'Phong cách nhẹ nhàng nhưng không kém phần sang chảnh.', '2025-03-28 09:12:15.030256+07', '2025-03-28 09:12:15.030256+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('69aea3d9-ea29-4a1d-81ec-35536caf4bac', 2, 2, 'Áo khoác gió in nam nữ khóa chống nước vải poly chắn gió mưa', 'ÁOK808', 'Áo khoác gió được làm từ chất liệu cao cấp, chống nước tuyệt đối nhưng vẫn đảm bảo độ thoáng khí, giúp bạn luôn cảm thấy thoải mái dù phải hoạt động nhiều.', '2025-03-28 09:17:16.830957+07', '2025-03-28 09:17:16.830957+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('1719e5a0-1715-4391-a66d-fddc45f0ddf7', 3, 2, 'Áo Len Cardigan Dệt Kim', 'ÁOL071', 'Áo khoác len cardigan nữ dệt kim', '2025-03-28 09:22:12.005918+07', '2025-03-28 09:22:12.005918+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('fbd3f0d3-23e7-4da7-a14f-3b24921d73bc', 4, 2, 'Quần culottes ống suông xếp ly cotton lạnh', 'QUẦ359', 'Quần culottes ống suông xếp ly cotton lạnh là biểu tượng của sự thanh lịch hiện đại, mang đến vẻ đẹp tinh tế và cảm giác thoải mái tuyệt đối cho người mặc. Thiết kế cạp cao ôm nhẹ vòng eo và dáng ống rộng xếp một ly phía trước.', '2025-03-28 09:26:13.706574+07', '2025-03-28 09:26:13.706574+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('e26f83c9-8541-453f-bde2-7859649a7ba5', 5, 2, 'Chân Váy Jean ngắn Chữ A MIAA Cạp cao', 'CHÂ659', 'Chân Váy Jean ngắn Chữ A MIAA Cạp cao dáng ngắn tôn dáng chân váy bò có quần trong bảo hộ chất bò denim co giãn', '2025-03-28 09:29:11.434048+07', '2025-03-28 09:29:11.434048+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('6f944e1d-7c31-46b9-8194-bb4a8714c91f', 6, 2, 'Chân váy công sở nữ WVN021K4', 'CHÂ605', 'Chân váy nữ WVN021K4 sở hữu nhiều gam màu basic tối giản, dễ dàng phối đồ', '2025-03-28 09:34:51.995256+07', '2025-03-28 09:34:51.995256+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('b41b8255-19cf-4e13-b4a3-a8baceb7f772', 1, 2, 'Áo Khoác Kaki Nam Túi Hộp Màu Xanh Rêu / Đen - Mã AK8003', 'ÁOK444', 'Áo khoác kaki nam túi hộp màu xanh rêu / đen mã AK8003 được làm bằng chất liệu vải kaki 2 lớp dày dặn, bền đẹp, mang phong cách khỏe mạnh,', '2025-03-28 09:40:01.398992+07', '2025-03-28 09:40:01.398992+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('4a55e546-048b-40a5-b9f0-7dd31664f91e', 2, 2, 'ÁO THUN CROP TOP NGẮN TAY MÀU ĐEN TRƠN', 'ÁOT086', 'ÁO THUN CROP TOP NGẮN TAY MÀU ĐEN CHẤT LIỆU COTTON 4 CHIỀU MÁT, THẤM HÚT MỒ HÔI. FORM ÁO TRẺ TRUNG, NĂNG ĐỘNG KHI PHỐI CÙNG JEAN', '2025-03-28 09:45:09.327456+07', '2025-03-28 09:45:09.327456+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('4a11431a-ed35-4c0c-9a12-ba6a8a9bf12c', 4, 2, 'Váy Liền Nhung Kẻ Váy Ngắn Chữ A Xếp Ly Kiểu Tây Trẻ Trung', 'VÁY532', 'Vải/Chất Liệu: Vải Nhung/Polyester (Sợi Polyester)
Phong Cách: Đơn Giản Đi Lại/Phiên Bản Hàn Quốc', '2025-03-28 09:48:53.511307+07', '2025-03-28 09:48:53.511307+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('6a0c33f2-df2a-48d5-bbec-14bcd0507156', 5, 2, 'Áo Khoác Mùa Đông Nữ Lông Cừu Lót Dày Rời Phiên Bản Hàn Quốc Có Mũ Trùm Đầu Áo Lông Màu Trơn', 'ÁOK496', 'Thông tin sản phẩm:
 Màu: Hồng, Trắng
 Kích thước: M / L / XL / XXL', '2025-03-28 09:57:48.373826+07', '2025-03-28 09:57:48.373826+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('0c89dc33-d903-456a-af2d-b239a9c6fcaa', 5, 2, 'Áo Len Mỏng Cổ Lọ', 'ÁOL087', 'THÔNG TIN SẢN PHẨM ÁO LEN NAM 
- Chất liệu: Len cotton
- Áo len có thể kết hợp với nhiều trang phục khác nhau: quần jean, quần âu, giày tây, giày thể thao...
- Sản phẩm có thể giặt máy thoải mái', '2025-03-28 10:03:19.427294+07', '2025-03-28 10:03:19.427294+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('29682969-b269-45ba-8cd6-340c477b12fb', 6, 2, 'Quần Tây Nam Slimfit Đen QTA0031', 'QUẦ829', 'Quần Tây nam Kenta với form dáng vừa vặn, sang trọng đầy lịch lãm. Thích hợp mặc đi làm, đi chơi, lót trong sắc nét, tạo cảm giác thoải mái khi di chuyển, làm việc', '2025-03-28 10:07:48.683039+07', '2025-03-28 10:07:48.683039+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('251c1491-0bf9-414c-829e-fa252f16037e', 5, 2, 'Chân váy ngắn xếp tầng', 'CHÂ129', 'Chân váy ngắn xếp nếp ở eo, có dây rút ở hai bên.

Chân váy ngắn nhún bèo nữ Sandro
Dây rút bên hông
Vải quấn
Khóa kéo bên hông', '2025-03-28 10:10:52.191166+07', '2025-03-28 10:10:52.191166+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('ae583c6d-ecca-465b-8bac-1fe47ec306fc', 3, 2, 'Áo sơ mi lụa,tay bồng,cổ vest', 'ÁOS558', 'Chiếc áo lụa của những khoảnh khắc LÃNG MẠN nhất... 
Của sự DỊU NHẸ, nhưng cũng ĐỘC ĐÁO nhất... ', '2025-03-28 10:15:54.527745+07', '2025-03-28 10:15:54.527745+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('591039af-57ad-4cd8-a082-1ccabb8ff889', 4, 2, 'Áo vest nam, áo blazer nam 2 cúc Hàn Quốc kẻ caro màu nâu đỏ sang trọng ADK0011', 'ÁOV604', 'Thích hợp mặc đi chơi, đi làm cơ quan, hay đi sự kiện, dự tiệc, đám cưới,... làm quà tặng.', '2025-03-28 10:19:03.597669+07', '2025-03-28 10:19:03.597669+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('750b7fa5-f0df-45bc-8f9f-4c3f55d364c5', 1, 2, 'Áo Thun Croptop Cotton', 'ÁOT591', 'Áo thun dệt kim là dòng trang phục thường ngày không thể nào thiếu. Chất liệu Cotton thấm hút mồ hôi tốt với độ co dãn cao, dễ hoạt động thoải mái trong mùa Hè', '2025-03-28 10:28:32.263178+07', '2025-03-28 10:28:32.263178+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('a7609ca5-2e02-46b0-9a9b-4d85b5b10180', 4, 2, 'Quần Jeans Rách Ống Loe', 'QUẦ869', 'QUẦN JEAN ỐNG LOE LƯNG CAO RÁCH GỐI ĐAN DÂY - PHONG CÁCH HÀN QUỐC 
Chiếc quần must-have giúp đôi chân dài miên man!
', '2025-03-28 10:34:44.100934+07', '2025-03-28 10:34:44.100934+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('8ae50a79-4ab4-4f11-b6f6-3ede056b3861', 3, 2, 'Váy Ngắn Xòe', 'VÁY197', 'Chân Váy Đen Dáng Xòe Ngắn Xếp Tầng Dành Cho Nữ
Chân váy có thể kết hợp với áo croptop, baby tee, áo thun, áo phồng đều rất xinh nha các nàng
', '2025-03-28 10:36:09.044037+07', '2025-03-28 10:36:09.044037+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('6e9ea8ca-19c6-4336-a8e0-6e89f549ff86', 6, 2, 'Đầm Hai Dây Ngắn', 'ĐẦM875', 'Váy ngắn thời trang sexy Váy ngắn đi biển, dự tiệc', '2025-03-28 10:37:22.899458+07', '2025-03-28 10:37:22.899458+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('00a18e32-8f07-4f14-8b1b-f53ea18c45c4', 5, 2, 'Áo Khoác Lông Vũ', 'ÁOK469', 'Với chất liệu vải cao cấp được thiết kế chuyên biệt cho các hoạt động thể thao, dã ngoại, đi chơi', '2025-03-28 10:39:14.397089+07', '2025-03-28 10:39:14.397089+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('634539a5-4e65-4c8b-82dd-c40eb5335e8e', 4, 2, 'Quần Tây Nam Ống Côn', 'QUẦ149', 'Tùy thể trạng và sở thích mặc ôm hay thoải mái chọn size theo ý thích', '2025-03-28 10:41:19.551817+07', '2025-03-28 10:41:19.551817+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('2c4bd4ca-9d10-456e-ab9c-b010c61e5e4e', 1, 2, 'Áo Len Mỏng Cổ Rùa', 'ÁOL451', 'Sử dụng các loại vải chất lượng cao và tay nghề thủ công tuyệt vời làm nền tảng. Mỗi quần áo đều được kiểm tra chất lượng nghiêm ngặt để đảm bảo rằng bạn mang đến cho bạn kết cấu tuyệt vời và sự thoải mái', '2025-03-28 10:40:19.300148+07', '2025-03-28 10:40:19.300148+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('a3595a6c-4db2-4632-aaba-aea9050a1cf0', 2, 2, 'Áo Khoác Nỉ Lót Lông', 'ÁOK494', 'Áo nỉ lót lông cừu Uniqlo Nhật Bản  là mẫu sản phẩm bán chạy nhất mùa Đông. Áo khoác nỉ ấm áp tạo form đẹp được kết hợp lót lông siêu mềm mại cho cảm giác êm ái mà vẫn dày dặn nam tính.', '2025-03-28 10:49:36.263578+07', '2025-03-28 10:49:36.263578+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('384fe950-3185-479f-806a-1fe5f0245447', 3, 2, 'Đầm Công Sở Suông', 'ĐẦM244', 'Đầm công sở đơn giản, dễ mặc, dễ phối giúp nàng thoải mái hoạt động đặc biệt kiểu đầm này không hề kén người mặc lại vô cùng phóng khoáng để ứng dụng trong nhiều hoàn cảnh khác nhau', '2025-03-28 10:53:36.640792+07', '2025-03-28 10:53:36.640792+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('bbcd04bc-f47b-49fd-aad4-c8c2db72383a', 5, 2, 'Áo Khoác Blazer Dạ', 'ÁOK146', 'Áo Blazer Nữ Dáng Dài Áo Vest Nữ Blazer Dạ Form Rộng Dáng Dài Kiểu Hàn Quốc Áo Dạ Nữ Áo Khoác Nữ Mùa Đông AD2475', '2025-03-28 10:54:28.063151+07', '2025-03-28 10:54:28.063151+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('d36fc981-b20a-4040-bb9b-c8713e83f794', 1, 2, 'Chân Váy Xếp Ly Ngắn', 'CHÂ326', 'Chân váy xếp ly, chân váy tennis là một trong những items kinh điển trong tủ đồ của tất cả chị em phụ nữ. Thiếu đi chân váy là thiếu đi sự điệu đà nữ tính, thiếu đi một nét đặc trưng của con gái.', '2025-03-28 10:42:17.597107+07', '2025-03-28 10:42:17.597107+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('dd4d0170-74ef-4a34-8074-aa5195614516', 3, 2, 'Áo Tập Yoga Ba Lỗ', 'ÁOT283', 'Mẫu áo thun thể thao thiết kế với kiểu dáng ba lỗ cổ tim, áo tạo nên sự thanh lịch và kín đáo cho mọi quý cô', '2025-03-28 10:43:23.929476+07', '2025-03-28 10:43:23.929476+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('02c16f34-f5d2-4104-9704-93b2533b22f6', 2, 2, 'Quần Jogger Thun', 'QUẦ515', 'Màu sắc phong cách, năng động. Bạn chỉ cần khoác lên người một chiếc áo phông trắng + giày sneaker màu trắng đi kèm với chiếc quần này là đã khiến bao ánh mắt trầm trồ.', '2025-03-28 10:46:26.449559+07', '2025-03-28 10:46:26.449559+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('6329e694-c528-46a0-b4cd-f1ee68cf8b23', 5, 2, 'Váy Yếm Kaki', 'VÁY739', 'Váy yếm kaki dáng suông dài MORAN Hàn Quốc', '2025-03-28 10:47:25.136013+07', '2025-03-28 10:47:25.136013+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('864807b4-6990-4d46-9257-b6d61e08f5c6', 1, 2, 'Quần Jeans Ống Đứng Đen', 'QUẦ355', '#quanjeans #quanbaggy #quanbaggyjeans #quần #quầnjeans #quầnbaggy #quầnáo #quanshort', '2025-03-28 10:51:40.315108+07', '2025-03-28 10:51:40.315108+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('f2b1fdc7-2ba1-4dac-9a72-998a83247e14', 5, 2, 'Áo Len Oversize Ngắn', 'ÁOL509', 'Áo len', '2025-03-28 10:55:22.584965+07', '2025-03-28 10:55:22.584965+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('77b81ea0-172e-4c3e-bee7-b0cc44755f19', 6, 2, 'Đầm Ôm Body Gân Tăm', 'ĐẦM479', 'Với những sản phẩm chất liệu lụa, ren, có phụ kiện không nên giặt sản phẩm cùng với các sản phẩm cầu kì khác như: Có móc, có khóa cứng, có nhiều họa tiết …. ', '2025-03-28 10:48:39.698261+07', '2025-03-28 10:48:39.698261+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('6ef80eb5-2ee6-4930-9d32-f297e5ba970c', 2, 2, 'Váy Midi Voan Trơn', 'VÁY749', 'Với chất liệu voan lụa nên chân váy rất mềm mại theo dáng người, cực mịn và mát. Đảm bảo các bạn nhận hàng sẽ ưng ngay từ khi chạm vào chất vải.', '2025-03-28 10:52:41.967207+07', '2025-03-28 10:52:41.967207+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('0dffebc4-a339-419a-8468-d3041c93aeed', 4, 2, 'Quần Kaki Ống Côn Nam', 'QUẦ828', 'Quần kaki nam là mẫu quần jogger ống côn lên form dáng rất đẹp', '2025-03-28 10:56:43.028151+07', '2025-03-28 10:56:43.028151+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('635d8f68-d4d7-441a-aa96-68a18e4b2136', 3, 2, 'Chân Váy Bút Chì Da', 'CHÂ023', 'Đây là chất liệu bền đẹp mềm mịn, ít nhăn, không bai, không xù, lên from dáng chuẩn', '2025-03-28 10:57:42.923536+07', '2025-03-28 10:57:42.923536+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('e28e9c37-d55d-458f-89d7-e21727485d3f', 5, 2, 'Áo Bra Thể Thao', 'ÁOB202', 'Áo ngực thể thao AS NIKE SWOOSH BRA PAD với lớp đệm có thể tháo rời đã được thiết kế để bạn thấy thoải mãi nhất trong khi bạn tập luyện. Sản phẩm này được làm từ ít nhất 50% sợi polyester tái chế. ', '2025-03-28 10:58:41.417598+07', '2025-03-28 10:58:41.417598+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('39a06d7b-e026-4397-8e05-3bee26c22ead', 4, 3, 'Áo Sơ Mi Linen Cộc Tay', 'ÁOS366', 'Áo sơ mi nữ cộc tay form rộng linen LAHSTORE tay hến cổ bẻ 2 túi ngực', '2025-03-28 10:59:34.076903+07', '2025-03-28 11:01:21.122083+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('3121a13a-b113-49bb-8fa3-1f2e4c5a5b0a', 1, 3, 'Quần Baggy Vải Tuyết Mưa', 'QUẦ928', 'Mặc đi làm đi chơi rất đẹp
Mặc đứng dáng siêu xinh
', '2025-03-28 11:00:35.755045+07', '2025-03-28 11:01:21.122083+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('3121a13a-b113-49bb-8fa3-1f2e4c5a5b0b', NULL, 3, 'Funny', 'FUN333', 'Nuh uh', '2025-04-03 21:38:33.818+07', '2025-04-03 21:38:36.468+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('dba0a531-2021-4ae9-8a96-ee795a8bdb61', 3, NULL, 'OJT FSoft Academy', 'OJT813', 'PASS MON!!!! PASS THEM MON NUA!!!!!', '2025-04-10 22:27:56.578828+07', '2025-04-10 22:28:28.68192+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('b0579bfb-9b5e-4d99-81e9-b15bb2ba56ee', 1, 3, 'Áo Thể Thao Nam Ba Lổ Năng Động – LD9181', 'ÁOT408', 'Vải poly thoáng mát, co giãn tốt, thấm hút mồ hôi,.
Form regular fit, tôn dáng.
Chất vải mềm mại, nhẹ, không gây bí bách.
Áo thể thao gam màu thời trang, năng động.', '2025-03-25 09:18:33.191441+07', '2025-04-17 12:00:24.71549+07') ON CONFLICT DO NOTHING;
INSERT INTO public.product (product_id, brand_id, product_status_id, product_name, product_code, product_description, product_created_at, product_updated_at) VALUES ('a2e98027-f414-47ee-9a39-c64aca1419c7', 2, 3, 'Áo Khoác Jean Denim Nam AMANLAB', 'ÁOK157', 'Chi tiết Áo khoác jean denim nam, jacket jean wax luxury phong cách bụi bặm cá tính, cao cấp

Chất liệu: chất vải jean thấm hút mồ hôi nhanh, cảm giác vô cùng ấm áp vào mùa đông. Có thể mặc khoác ngoài áo thun, áo phông đều đẹp

Hàng còn nguyên tem mác, cực sang chảnh

Họa tiết basic, khách hàng phối quần jeans, kaki, short đều đẹp. Mặc dạo phố, du lịch hay đến các buổi tiệc đều mang đến sự tự tin đẳng cấp dành cho khách hàng.', '2025-03-24 16:13:55.030237+07', '2025-07-24 13:25:57.187983+07') ON CONFLICT DO NOTHING;


--
-- TOC entry 5269 (class 0 OID 57936)
-- Dependencies: 249
-- Data for Name: product_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_category (product_id, category_id) VALUES ('49c158a0-180e-44aa-b60f-43a2c65fc9c6', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('820f4f06-299a-4389-b10a-d1ff5ac4fd61', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('3cb1ed73-0bef-447b-bb1a-798c3fd8ae82', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('bc0bff38-a6d2-4cda-8b1d-c00576a97b84', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('50e55ab7-ee7b-44a8-b24a-6cf884805ef5', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('26312fd9-fa41-4969-a74b-8150e99b7c21', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('c684b9d2-af82-4244-af0b-efe997b1b874', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('9ab230b2-3a53-4f6c-ac03-6cad5108522a', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('fdad041b-7ba6-4e24-9522-c418ce9a54ea', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('fdad041b-7ba6-4e24-9522-c418ce9a54ea', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('279468c9-9960-4b47-9919-dfd308fd19b4', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('279468c9-9960-4b47-9919-dfd308fd19b4', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('98ff4f0c-fac2-45bb-b186-73365fb7a675', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('79994f72-c1c8-460e-acf4-906e3d0924c5', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('3f131de4-ff0d-445a-a4f6-9764ab4f38db', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('3f131de4-ff0d-445a-a4f6-9764ab4f38db', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('a0d10b39-4841-463e-a9a6-0280ed3b77e8', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('a0d10b39-4841-463e-a9a6-0280ed3b77e8', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('2ae28f8e-b734-409d-9d88-0c7e5e19686d', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('2ae28f8e-b734-409d-9d88-0c7e5e19686d', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('f8402d8b-5f94-43de-a4ab-455a70510d31', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('1886bf1b-e995-4d65-a440-89da1f27555d', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('1886bf1b-e995-4d65-a440-89da1f27555d', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('cca9fa22-8db7-4c19-90ff-1c0e96e69754', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('cca9fa22-8db7-4c19-90ff-1c0e96e69754', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('a51db439-45fd-42ce-bfe0-234ff577f198', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('a51db439-45fd-42ce-bfe0-234ff577f198', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('1422e857-9ff5-4f92-9ec3-746dbcda9d58', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('d39cc00b-af08-4e0a-9906-d2c81adcda2c', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('d39cc00b-af08-4e0a-9906-d2c81adcda2c', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('bb02cab9-3428-4be6-8c00-1280243b104d', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('907278fc-e183-45a6-8da5-46cd0e3409c3', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('907278fc-e183-45a6-8da5-46cd0e3409c3', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('ae780342-3f8f-4396-bf6a-9d9e72737f36', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('2842603c-4acc-401a-bab0-2cddccf6782d', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('72fb5f06-7af1-41e5-a8a6-d5391a33d6ad', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('72fb5f06-7af1-41e5-a8a6-d5391a33d6ad', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('8baeb037-71d2-42e5-a25a-b4840a63a7ce', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('8baeb037-71d2-42e5-a25a-b4840a63a7ce', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('8baeb037-71d2-42e5-a25a-b4840a63a7ce', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('ec6f1767-c99d-4c7b-88b7-f98c1c8e3df9', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('ec6f1767-c99d-4c7b-88b7-f98c1c8e3df9', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('7915da52-436f-438d-a61f-53917f2b41c4', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('3a569c04-4731-4040-9908-cee6db27e58c', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('3a569c04-4731-4040-9908-cee6db27e58c', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('1ff680b4-91cc-408f-a218-63e4cd6d8aa6', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('1ff680b4-91cc-408f-a218-63e4cd6d8aa6', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('1ff680b4-91cc-408f-a218-63e4cd6d8aa6', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('da1dc78e-d36f-489c-bb49-5b628ef4ad1c', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('a85b0278-bab3-49dc-9c18-01d5d4ad0286', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('a85b0278-bab3-49dc-9c18-01d5d4ad0286', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('477f06d7-1367-43c7-926a-fbd2094e0acf', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('cdb65655-7c94-4522-9516-530d2761f91b', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('cdb65655-7c94-4522-9516-530d2761f91b', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('e460c599-1ef0-4c1a-9648-dfeae7feefb1', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('e460c599-1ef0-4c1a-9648-dfeae7feefb1', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('e460c599-1ef0-4c1a-9648-dfeae7feefb1', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('1a29569b-9380-4eb5-bbd7-3aa8d916e24b', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('1a29569b-9380-4eb5-bbd7-3aa8d916e24b', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('02053d99-8994-4427-ae03-6ce440278760', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('02053d99-8994-4427-ae03-6ce440278760', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('cb25da06-3b1f-417a-8bc3-6961aee8843b', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('cb25da06-3b1f-417a-8bc3-6961aee8843b', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('cb25da06-3b1f-417a-8bc3-6961aee8843b', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('4cb234f7-db1f-4140-a9b8-86fd6056d987', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('4cb234f7-db1f-4140-a9b8-86fd6056d987', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('7baecb0e-c6b0-4c3f-b2dd-b0900254784d', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('7baecb0e-c6b0-4c3f-b2dd-b0900254784d', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('04a67658-96c5-457c-97a6-4b1eb8a94583', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('2ecbd902-1bfd-4b4c-a23d-b01dfefe702d', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('cc41ada9-ac4e-4d87-8227-c265ade04f73', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('f1c3c854-8007-4ce9-b43e-176b62058d81', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('f1c3c854-8007-4ce9-b43e-176b62058d81', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('f2ecb711-38fe-4d31-b140-2a51aef473e9', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('f2ecb711-38fe-4d31-b140-2a51aef473e9', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('f2ecb711-38fe-4d31-b140-2a51aef473e9', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('01e8f17c-8a59-4c9a-a529-adb40ef77240', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('01e8f17c-8a59-4c9a-a529-adb40ef77240', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('91ca633b-397b-4545-a6fd-e1b028e28d2a', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('91ca633b-397b-4545-a6fd-e1b028e28d2a', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('91ca633b-397b-4545-a6fd-e1b028e28d2a', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('a69b7ea4-c0c9-45a6-9bf1-fffb44efa600', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('92019d2d-80f9-40c2-ace1-3dbbfe3dc9f1', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('31b936d2-b0ef-48ea-b657-4e2fef7a97c0', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('fc98f0cf-7948-4d4a-aa03-2ab9e6d2148a', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('cf8ed606-568c-4245-ac22-f3f4b620464f', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('b23dd277-6fd5-4764-9579-40ac01904b09', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('89b8e8aa-08c5-4a4c-a686-5f0c5adec07f', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('eb84fd4d-b305-45f6-b1b9-c1082c267d56', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('63f61d12-4c4a-48b9-bc44-989b923e37a6', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('812569da-3866-4dde-90a4-562d7fc86ecc', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('7b78a866-78c9-4724-8b19-d309e2c3aeb2', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('1b309565-8b21-407f-8fed-9f1c4807b8f1', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('211fdb78-13fb-446c-85ec-589333e8a628', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('2f72a228-1e9a-4846-a736-04cbf8dfacd6', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('c89d3191-7ffc-4ef1-bb01-e7711115bf4c', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('214cbcec-a0ae-41dc-92eb-a5a6c36bd073', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('7ed46c5f-14d0-464f-b556-4b1adedfd10d', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('5318360f-802c-4684-97b2-516616f56a82', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('2ff201ad-e170-4cdd-921c-b705c276ee27', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('0e7f984f-9540-4a17-9aa3-9cb6cd993fe8', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('15b0d792-cb3d-4d3d-87c4-cf138d464594', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('edfd36c9-0c51-447d-ae88-2218fbefaa90', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('2e83611d-de60-4650-a5d6-911eea3102ef', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('559291e6-380c-494c-ab1c-ec7ced7b8169', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('eaea7367-f097-47e5-8490-714311bbaa61', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('07b3b92f-4f32-4aaa-87fc-1f94379922b6', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('82c8797c-32ed-44fc-808b-8e82a0f59c63', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('abf1d210-8f1e-4753-a6f6-54301c1e7e8b', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('884017ca-050f-4734-9867-9abbcc69095f', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('9fb025b2-93f3-4b6f-b8c8-cf29b2afa1d3', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('33a3f2e0-34a1-446f-ac8d-47cad6b02e2c', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('577ba438-3c53-42fe-8e76-c6316a41ad2a', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('ee5cd1d0-0fa2-443d-b1cd-7b1924d82eaf', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('de7e8253-967c-48c0-a769-c76576b90858', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('adac3ca4-2933-47a0-8b48-ba1789ccbc73', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('b9996556-674e-448c-972a-5c69bbf0b5b7', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('b9996556-674e-448c-972a-5c69bbf0b5b7', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('defa44c9-4940-424f-be58-9dd3d3fd0bfa', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('f1ee256d-e6b3-42ae-9b51-f726264a7b1c', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('69aea3d9-ea29-4a1d-81ec-35536caf4bac', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('69aea3d9-ea29-4a1d-81ec-35536caf4bac', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('1719e5a0-1715-4391-a66d-fddc45f0ddf7', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('1719e5a0-1715-4391-a66d-fddc45f0ddf7', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('fbd3f0d3-23e7-4da7-a14f-3b24921d73bc', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('fbd3f0d3-23e7-4da7-a14f-3b24921d73bc', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('e26f83c9-8541-453f-bde2-7859649a7ba5', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('e26f83c9-8541-453f-bde2-7859649a7ba5', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('6f944e1d-7c31-46b9-8194-bb4a8714c91f', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('6f944e1d-7c31-46b9-8194-bb4a8714c91f', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('b41b8255-19cf-4e13-b4a3-a8baceb7f772', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('4a55e546-048b-40a5-b9f0-7dd31664f91e', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('4a11431a-ed35-4c0c-9a12-ba6a8a9bf12c', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('4a11431a-ed35-4c0c-9a12-ba6a8a9bf12c', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('6a0c33f2-df2a-48d5-bbec-14bcd0507156', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('0c89dc33-d903-456a-af2d-b239a9c6fcaa', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('0c89dc33-d903-456a-af2d-b239a9c6fcaa', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('29682969-b269-45ba-8cd6-340c477b12fb', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('29682969-b269-45ba-8cd6-340c477b12fb', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('29682969-b269-45ba-8cd6-340c477b12fb', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('251c1491-0bf9-414c-829e-fa252f16037e', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('251c1491-0bf9-414c-829e-fa252f16037e', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('ae583c6d-ecca-465b-8bac-1fe47ec306fc', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('ae583c6d-ecca-465b-8bac-1fe47ec306fc', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('591039af-57ad-4cd8-a082-1ccabb8ff889', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('591039af-57ad-4cd8-a082-1ccabb8ff889', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('750b7fa5-f0df-45bc-8f9f-4c3f55d364c5', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('a7609ca5-2e02-46b0-9a9b-4d85b5b10180', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('a7609ca5-2e02-46b0-9a9b-4d85b5b10180', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('8ae50a79-4ab4-4f11-b6f6-3ede056b3861', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('6e9ea8ca-19c6-4336-a8e0-6e89f549ff86', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('00a18e32-8f07-4f14-8b1b-f53ea18c45c4', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('00a18e32-8f07-4f14-8b1b-f53ea18c45c4', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('2c4bd4ca-9d10-456e-ab9c-b010c61e5e4e', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('2c4bd4ca-9d10-456e-ab9c-b010c61e5e4e', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('634539a5-4e65-4c8b-82dd-c40eb5335e8e', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('d36fc981-b20a-4040-bb9b-c8713e83f794', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('d36fc981-b20a-4040-bb9b-c8713e83f794', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('dd4d0170-74ef-4a34-8074-aa5195614516', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('c2fcd566-4584-4cdb-9179-97bdc4782386', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('c2fcd566-4584-4cdb-9179-97bdc4782386', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('02c16f34-f5d2-4104-9704-93b2533b22f6', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('02c16f34-f5d2-4104-9704-93b2533b22f6', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('6329e694-c528-46a0-b4cd-f1ee68cf8b23', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('77b81ea0-172e-4c3e-bee7-b0cc44755f19', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('a3595a6c-4db2-4632-aaba-aea9050a1cf0', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('a3595a6c-4db2-4632-aaba-aea9050a1cf0', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('30c08de4-c0e7-45cb-aec4-db4bde17c3ab', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('30c08de4-c0e7-45cb-aec4-db4bde17c3ab', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('864807b4-6990-4d46-9257-b6d61e08f5c6', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('864807b4-6990-4d46-9257-b6d61e08f5c6', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('6ef80eb5-2ee6-4930-9d32-f297e5ba970c', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('6ef80eb5-2ee6-4930-9d32-f297e5ba970c', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('384fe950-3185-479f-806a-1fe5f0245447', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('384fe950-3185-479f-806a-1fe5f0245447', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('bbcd04bc-f47b-49fd-aad4-c8c2db72383a', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('bbcd04bc-f47b-49fd-aad4-c8c2db72383a', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('f2b1fdc7-2ba1-4dac-9a72-998a83247e14', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('f2b1fdc7-2ba1-4dac-9a72-998a83247e14', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('0dffebc4-a339-419a-8468-d3041c93aeed', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('0dffebc4-a339-419a-8468-d3041c93aeed', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('635d8f68-d4d7-441a-aa96-68a18e4b2136', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('635d8f68-d4d7-441a-aa96-68a18e4b2136', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('e28e9c37-d55d-458f-89d7-e21727485d3f', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('39a06d7b-e026-4397-8e05-3bee26c22ead', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('39a06d7b-e026-4397-8e05-3bee26c22ead', 2) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('3121a13a-b113-49bb-8fa3-1f2e4c5a5b0a', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('3121a13a-b113-49bb-8fa3-1f2e4c5a5b0a', 3) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('dba0a531-2021-4ae9-8a96-ee795a8bdb61', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('b0579bfb-9b5e-4d99-81e9-b15bb2ba56ee', 1) ON CONFLICT DO NOTHING;
INSERT INTO public.product_category (product_id, category_id) VALUES ('a2e98027-f414-47ee-9a39-c64aca1419c7', 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 5270 (class 0 OID 57941)
-- Dependencies: 250
-- Data for Name: product_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_status (product_status_id, product_status_name) VALUES (1, 'OUT OF STOCK') ON CONFLICT DO NOTHING;
INSERT INTO public.product_status (product_status_id, product_status_name) VALUES (2, 'IMPORTING') ON CONFLICT DO NOTHING;
INSERT INTO public.product_status (product_status_id, product_status_name) VALUES (3, 'AVAILABLE') ON CONFLICT DO NOTHING;
INSERT INTO public.product_status (product_status_id, product_status_name) VALUES (4, 'RUNNING OUT') ON CONFLICT DO NOTHING;
INSERT INTO public.product_status (product_status_id, product_status_name) VALUES (5, 'NEW') ON CONFLICT DO NOTHING;


--
-- TOC entry 5272 (class 0 OID 57947)
-- Dependencies: 252
-- Data for Name: provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.provider (provider_id, provider_name, provider_image_url, provider_email, provider_phone, provider_address, provider_created_at, provider_updated_at) VALUES (2, 'Eldoria', 'https://i.ibb.co/WppfkbNB/Generated-Image-March-25-2025-9-08-AM-png.jpg', 'eldoria@ae.com', '0987654321', 'Eldoria, Aerithreria', '2025-03-25 09:03:48.830246+07', '2025-03-25 09:13:40.139549+07') ON CONFLICT DO NOTHING;
INSERT INTO public.provider (provider_id, provider_name, provider_image_url, provider_email, provider_phone, provider_address, provider_created_at, provider_updated_at) VALUES (3, 'ABC', 'https://i.ibb.co/v6BJL1k3/EN-Terra-Investment-Masterclass-teaser.png', 'abc@abc.abc', '0123456787', 'Can Tho', '2025-04-10 22:33:37.759721+07', '2025-04-10 22:33:48.416494+07') ON CONFLICT DO NOTHING;


--
-- TOC entry 5274 (class 0 OID 57953)
-- Dependencies: 254
-- Data for Name: rank; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rank (rank_id, rank_name, rank_num, rank_payment_requirement, rank_base_discount) VALUES (1, 'Unranked', 1, 0.00, 0.00) ON CONFLICT DO NOTHING;
INSERT INTO public.rank (rank_id, rank_name, rank_num, rank_payment_requirement, rank_base_discount) VALUES (2, 'Bronze', 2, 1000000.00, 0.02) ON CONFLICT DO NOTHING;
INSERT INTO public.rank (rank_id, rank_name, rank_num, rank_payment_requirement, rank_base_discount) VALUES (3, 'Silver', 3, 5000000.00, 0.05) ON CONFLICT DO NOTHING;
INSERT INTO public.rank (rank_id, rank_name, rank_num, rank_payment_requirement, rank_base_discount) VALUES (4, 'Gold', 4, 10000000.00, 0.07) ON CONFLICT DO NOTHING;
INSERT INTO public.rank (rank_id, rank_name, rank_num, rank_payment_requirement, rank_base_discount) VALUES (5, 'Diamond', 5, 30000000.00, 0.10) ON CONFLICT DO NOTHING;


--
-- TOC entry 5276 (class 0 OID 57959)
-- Dependencies: 256
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.review (review_id, product_id, user_id, order_id, review_rating) VALUES (3, 'f8402d8b-5f94-43de-a4ab-455a70510d31', '93b42024-4686-486d-b626-bd29589befbf', '8532780c-1727-45c8-9ac9-d1260f1f12e5', 5) ON CONFLICT DO NOTHING;
INSERT INTO public.review (review_id, product_id, user_id, order_id, review_rating) VALUES (4, 'c684b9d2-af82-4244-af0b-efe997b1b874', 'f70b9947-6dc4-48cf-8dec-5897af562a96', '3399c540-74b8-4240-8d99-e274a1ba8513', 4) ON CONFLICT DO NOTHING;
INSERT INTO public.review (review_id, product_id, user_id, order_id, review_rating) VALUES (5, 'c684b9d2-af82-4244-af0b-efe997b1b874', 'e43dff5d-7cac-45c7-a699-81b48beb33ef', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.review (review_id, product_id, user_id, order_id, review_rating) VALUES (6, 'f8402d8b-5f94-43de-a4ab-455a70510d31', 'e43dff5d-7cac-45c7-a699-81b48beb33ef', NULL, NULL) ON CONFLICT DO NOTHING;
INSERT INTO public.review (review_id, product_id, user_id, order_id, review_rating) VALUES (7, 'a2e98027-f414-47ee-9a39-c64aca1419c7', 'ec9d2a8e-9c79-49b8-8521-7af1aec9884a', 'e22c8c3a-bc90-454e-b938-7f49aa86907b', 4) ON CONFLICT DO NOTHING;


--
-- TOC entry 5278 (class 0 OID 57965)
-- Dependencies: 258
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role (role_id, role_name) VALUES (1, 'ADMIN') ON CONFLICT DO NOTHING;
INSERT INTO public.role (role_id, role_name) VALUES (2, 'CUSTOMER') ON CONFLICT DO NOTHING;
INSERT INTO public.role (role_id, role_name) VALUES (3, 'STAFF') ON CONFLICT DO NOTHING;


--
-- TOC entry 5280 (class 0 OID 57971)
-- Dependencies: 260
-- Data for Name: sale; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sale (sale_id, sale_type_id, sale_status_id, sale_value, sale_start_date, sale_end_date, sale_created_at, sale_updated_at) VALUES (7, 1, 3, 12.00, '2025-03-30 15:42:00+07', '2025-04-03 15:42:00+07', '2025-03-31 15:43:02.862846+07', '2025-04-08 16:21:01.699188+07') ON CONFLICT DO NOTHING;
INSERT INTO public.sale (sale_id, sale_type_id, sale_status_id, sale_value, sale_start_date, sale_end_date, sale_created_at, sale_updated_at) VALUES (8, 2, 3, 666666.00, '2025-04-09 16:21:00+07', '2025-04-09 16:21:00+07', '2025-04-08 16:21:18.105668+07', '2025-04-10 22:34:27.513082+07') ON CONFLICT DO NOTHING;
INSERT INTO public.sale (sale_id, sale_type_id, sale_status_id, sale_value, sale_start_date, sale_end_date, sale_created_at, sale_updated_at) VALUES (9, 1, 3, 21.00, '2025-04-21 16:21:00+07', '2025-05-21 16:21:00+07', '2025-04-08 16:21:38.618492+07', '2025-05-23 13:55:07.097316+07') ON CONFLICT DO NOTHING;


--
-- TOC entry 5281 (class 0 OID 57974)
-- Dependencies: 261
-- Data for Name: sale_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sale_product (sale_id, product_id) VALUES (7, '279468c9-9960-4b47-9919-dfd308fd19b4') ON CONFLICT DO NOTHING;
INSERT INTO public.sale_product (sale_id, product_id) VALUES (7, 'f8402d8b-5f94-43de-a4ab-455a70510d31') ON CONFLICT DO NOTHING;
INSERT INTO public.sale_product (sale_id, product_id) VALUES (9, '3121a13a-b113-49bb-8fa3-1f2e4c5a5b0a') ON CONFLICT DO NOTHING;
INSERT INTO public.sale_product (sale_id, product_id) VALUES (9, '50e55ab7-ee7b-44a8-b24a-6cf884805ef5') ON CONFLICT DO NOTHING;
INSERT INTO public.sale_product (sale_id, product_id) VALUES (9, 'b0579bfb-9b5e-4d99-81e9-b15bb2ba56ee') ON CONFLICT DO NOTHING;
INSERT INTO public.sale_product (sale_id, product_id) VALUES (9, '3a569c04-4731-4040-9908-cee6db27e58c') ON CONFLICT DO NOTHING;
INSERT INTO public.sale_product (sale_id, product_id) VALUES (9, 'a85b0278-bab3-49dc-9c18-01d5d4ad0286') ON CONFLICT DO NOTHING;
INSERT INTO public.sale_product (sale_id, product_id) VALUES (9, '3f131de4-ff0d-445a-a4f6-9764ab4f38db') ON CONFLICT DO NOTHING;
INSERT INTO public.sale_product (sale_id, product_id) VALUES (9, 'a51db439-45fd-42ce-bfe0-234ff577f198') ON CONFLICT DO NOTHING;


--
-- TOC entry 5283 (class 0 OID 57980)
-- Dependencies: 263
-- Data for Name: sale_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sale_status (sale_status_id, sale_status_name) VALUES (1, 'INACTIVE') ON CONFLICT DO NOTHING;
INSERT INTO public.sale_status (sale_status_id, sale_status_name) VALUES (2, 'ACTIVE') ON CONFLICT DO NOTHING;
INSERT INTO public.sale_status (sale_status_id, sale_status_name) VALUES (3, 'EXPIRED') ON CONFLICT DO NOTHING;


--
-- TOC entry 5285 (class 0 OID 57986)
-- Dependencies: 265
-- Data for Name: sale_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sale_type (sale_type_id, sale_type_name) VALUES (1, 'PERCENTAGE') ON CONFLICT DO NOTHING;
INSERT INTO public.sale_type (sale_type_id, sale_type_name) VALUES (2, 'FIXED AMOUNT') ON CONFLICT DO NOTHING;


--
-- TOC entry 5287 (class 0 OID 57992)
-- Dependencies: 267
-- Data for Name: shipping_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.shipping_method (shipping_method_id, shipping_method_name) VALUES (1, 'EXPRESS') ON CONFLICT DO NOTHING;
INSERT INTO public.shipping_method (shipping_method_id, shipping_method_name) VALUES (2, 'STANDARD') ON CONFLICT DO NOTHING;


--
-- TOC entry 5289 (class 0 OID 57998)
-- Dependencies: 269
-- Data for Name: size; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.size (size_id, size_name) VALUES (1, 'S') ON CONFLICT DO NOTHING;
INSERT INTO public.size (size_id, size_name) VALUES (2, 'M') ON CONFLICT DO NOTHING;
INSERT INTO public.size (size_id, size_name) VALUES (3, 'L') ON CONFLICT DO NOTHING;
INSERT INTO public.size (size_id, size_name) VALUES (4, 'XL') ON CONFLICT DO NOTHING;
INSERT INTO public.size (size_id, size_name) VALUES (5, 'XXL') ON CONFLICT DO NOTHING;
INSERT INTO public.size (size_id, size_name) VALUES (6, 'XXXL') ON CONFLICT DO NOTHING;


--
-- TOC entry 5291 (class 0 OID 58004)
-- Dependencies: 271
-- Data for Name: stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stock (stock_id, stock_name, stock_address) VALUES (1, 'Unleashed VL', 'Bình Minh, Vĩnh Long') ON CONFLICT DO NOTHING;
INSERT INTO public.stock (stock_id, stock_name, stock_address) VALUES (2, 'Unleashed CT', 'Ninh Kiều, Cần Thơ') ON CONFLICT DO NOTHING;
INSERT INTO public.stock (stock_id, stock_name, stock_address) VALUES (3, 'Unleashed ST', 'Sóc Trăng, Sóc Trăng') ON CONFLICT DO NOTHING;
INSERT INTO public.stock (stock_id, stock_name, stock_address) VALUES (4, 'Unleashed DT', 'Châu Thành, Đồng Tháp') ON CONFLICT DO NOTHING;
INSERT INTO public.stock (stock_id, stock_name, stock_address) VALUES (5, 'Unleashed BL', 'Bảo Lộc, Lâm Đồng') ON CONFLICT DO NOTHING;


--
-- TOC entry 5293 (class 0 OID 58010)
-- Dependencies: 273
-- Data for Name: stock_variation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (43, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (44, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (45, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (46, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (48, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (51, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (52, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (53, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (54, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (55, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (56, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (57, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (58, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (59, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (60, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (61, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (62, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (63, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (64, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (65, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (66, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (67, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (68, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (69, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (70, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (71, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (73, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (74, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (75, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (76, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (77, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (78, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (79, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (80, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (81, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (83, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (84, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (85, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (87, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (88, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (89, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (90, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (91, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (92, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (93, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (94, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (95, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (96, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (97, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (98, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (99, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (100, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (101, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (102, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (103, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (104, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (105, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (106, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (107, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (108, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (109, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (110, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (111, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (112, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (113, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (114, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (115, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (116, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (117, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (118, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (47, 1, 1000) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (120, 1, 50) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (121, 1, 50) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (122, 1, 50) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (123, 1, 50) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (124, 1, 50) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (125, 1, 50) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (126, 1, 50) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (127, 1, 50) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (128, 1, 10) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (130, 1, 10) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (131, 1, 10) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (132, 1, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (133, 1, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (134, 1, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (135, 1, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (136, 1, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (137, 1, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (138, 1, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (139, 1, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (140, 1, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (141, 1, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (142, 1, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (143, 1, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (144, 1, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (145, 1, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (146, 1, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (147, 1, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (148, 1, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (149, 1, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (150, 1, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (151, 1, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (152, 1, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (153, 1, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (154, 1, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (155, 1, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (156, 1, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (157, 1, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (158, 1, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (157, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (158, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (159, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (160, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (161, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (162, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (163, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (164, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (165, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (166, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (167, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (168, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (169, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (170, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (171, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (172, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (173, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (174, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (175, 2, 20) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (176, 5, 10) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (167, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (168, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (170, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (171, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (172, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (174, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (175, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (176, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (177, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (179, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (180, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (181, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (182, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (183, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (186, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (187, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (188, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (189, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (190, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (191, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (192, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (193, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (194, 4, 100) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (195, 4, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (196, 4, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (197, 4, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (198, 4, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (199, 4, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (200, 4, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (201, 4, 40) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (202, 4, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (203, 4, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (204, 4, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (205, 4, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (206, 4, 30) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (636, 1, 177) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (637, 1, 144) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (638, 1, 175) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (639, 1, 15) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (640, 1, 17) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (41, 1, 1010) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (50, 1, 999) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (72, 1, 1010) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (49, 1, 997) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (119, 1, 50) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (177, 5, 9) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (82, 1, 999) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (42, 1, 932) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (646, 1, -1) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (641, 1, 125) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (642, 1, 155) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (643, 1, 102) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (644, 1, 145) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (645, 1, 241) ON CONFLICT DO NOTHING;
INSERT INTO public.stock_variation (variation_id, stock_id, stock_quantity) VALUES (86, 1, 1000) ON CONFLICT DO NOTHING;


--
-- TOC entry 5294 (class 0 OID 58013)
-- Dependencies: 274
-- Data for Name: topic; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.topic (topic_id, topic_name) VALUES (1, 'Website navigation') ON CONFLICT DO NOTHING;
INSERT INTO public.topic (topic_id, topic_name) VALUES (2, 'Product presentation') ON CONFLICT DO NOTHING;
INSERT INTO public.topic (topic_id, topic_name) VALUES (3, 'Order & Checkout') ON CONFLICT DO NOTHING;
INSERT INTO public.topic (topic_id, topic_name) VALUES (4, 'Shipping & Delivery') ON CONFLICT DO NOTHING;
INSERT INTO public.topic (topic_id, topic_name) VALUES (5, 'Return policies') ON CONFLICT DO NOTHING;
INSERT INTO public.topic (topic_id, topic_name) VALUES (6, 'Others') ON CONFLICT DO NOTHING;


--
-- TOC entry 5296 (class 0 OID 58019)
-- Dependencies: 276
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (20, 1, 41, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (21, 1, 42, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (22, 1, 43, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 85000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (23, 1, 44, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 85000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (24, 1, 45, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 85000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (25, 1, 46, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 85000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (26, 1, 47, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 275000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (27, 1, 48, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 275000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (28, 1, 49, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 275000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (29, 1, 50, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (30, 1, 51, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (31, 1, 52, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (32, 1, 53, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (33, 1, 54, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (34, 1, 55, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (35, 1, 56, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (36, 1, 57, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 265000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (37, 1, 58, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 265000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (38, 1, 59, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (39, 1, 60, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (40, 1, 61, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (41, 1, 62, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (42, 1, 63, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 679000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (43, 1, 64, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 245000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (44, 1, 65, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 245000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (45, 1, 66, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (46, 1, 67, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (47, 1, 68, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (48, 1, 69, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 220000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (49, 1, 70, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 220000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (50, 1, 71, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 220000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (51, 1, 72, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 3400000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (52, 1, 73, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 225000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (53, 1, 74, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 225000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (54, 1, 75, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 265000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (55, 1, 76, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 265000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (56, 1, 77, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 265000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (57, 1, 78, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 265000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (58, 1, 79, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 980000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (59, 1, 80, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 980000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (60, 1, 81, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 980000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (61, 1, 82, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 390000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (62, 1, 83, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 390000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (63, 1, 84, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 169000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (64, 1, 85, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 169000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (65, 1, 86, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (66, 1, 87, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (67, 1, 88, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (68, 1, 89, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (69, 1, 90, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (70, 1, 91, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (71, 1, 92, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (72, 1, 93, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (73, 1, 94, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (74, 1, 95, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (75, 1, 96, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (76, 1, 97, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (77, 1, 98, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (78, 1, 99, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (79, 1, 100, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (80, 1, 101, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 435000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (81, 1, 102, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 435000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (82, 1, 103, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 435000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (83, 1, 104, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 435000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (84, 1, 105, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 435000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (85, 1, 106, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 435000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (86, 1, 107, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 599000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (87, 1, 108, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 599000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (88, 1, 109, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 499000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (89, 1, 110, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 499000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (90, 1, 111, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 499000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (91, 1, 112, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 499000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (92, 1, 113, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 5780000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (93, 1, 114, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 1150000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (94, 1, 115, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 980000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (95, 1, 116, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 980000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (96, 1, 117, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 1990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (97, 1, 118, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1000, '2025-03-26', 1990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (98, 1, 119, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 50, '2025-03-26', 415000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (99, 1, 120, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 50, '2025-03-26', 415000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (100, 1, 121, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 50, '2025-03-26', 415000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (101, 1, 122, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 50, '2025-03-26', 400000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (102, 1, 123, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 50, '2025-03-26', 400000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (103, 1, 124, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 50, '2025-03-26', 400000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (104, 1, 125, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 50, '2025-03-26', 420000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (105, 1, 126, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 50, '2025-03-26', 420000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (106, 1, 127, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 50, '2025-03-26', 420000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (107, 1, 128, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 10, '2025-03-26', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (108, 1, 130, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 10, '2025-03-26', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (109, 1, 131, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 10, '2025-03-26', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (110, 1, 132, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 30, '2025-03-26', 210000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (111, 1, 133, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 30, '2025-03-26', 210000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (112, 1, 134, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 30, '2025-03-26', 210000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (113, 1, 135, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 30, '2025-03-26', 300000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (114, 1, 136, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 30, '2025-03-26', 300000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (115, 1, 137, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 30, '2025-03-26', 390000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (116, 1, 138, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 30, '2025-03-26', 390000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (117, 1, 139, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 30, '2025-03-26', 390000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (118, 1, 140, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 30, '2025-03-26', 10220000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (119, 1, 141, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 30, '2025-03-26', 10220000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (120, 1, 142, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 240000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (121, 1, 143, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 240000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (122, 1, 144, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 240000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (123, 1, 145, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 240000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (124, 1, 146, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 240000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (125, 1, 147, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 240000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (126, 1, 148, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 15900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (127, 1, 149, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 15900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (128, 1, 150, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 15900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (129, 1, 151, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 15900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (130, 1, 152, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 15900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (131, 1, 153, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 15900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (132, 1, 154, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 5, '2025-03-26', 14760000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (133, 1, 155, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 5, '2025-03-26', 14760000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (134, 1, 156, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 5, '2025-03-26', 14760000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (135, 1, 157, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 5, '2025-03-26', 250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (136, 1, 158, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 5, '2025-03-26', 250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (137, 2, 157, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (138, 2, 158, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (139, 2, 159, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 2010000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (140, 2, 160, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 2010000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (141, 2, 161, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 2010000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (142, 2, 162, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 2010000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (143, 2, 163, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 11420000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (144, 2, 164, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 11420000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (145, 2, 165, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 11420000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (146, 2, 166, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 11420000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (147, 2, 167, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 5350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (148, 2, 168, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 5350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (149, 2, 169, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 5350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (150, 2, 170, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 5350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (151, 2, 171, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 499000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (152, 2, 172, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 499000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (153, 2, 173, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (154, 2, 174, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (155, 2, 175, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 20, '2025-03-26', 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (156, 5, 176, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 10, '2025-03-26', 12060000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (157, 5, 177, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 10, '2025-03-26', 12060000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (158, 4, 167, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 5350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (159, 4, 168, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 5350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (160, 4, 170, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 5350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (161, 4, 171, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 499000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (162, 4, 172, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 499000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (163, 4, 174, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (164, 4, 175, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (165, 4, 176, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 12060000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (166, 4, 177, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 12060000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (167, 4, 179, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 5793000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (168, 4, 180, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 5793000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (169, 4, 181, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 3140000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (170, 4, 182, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 3140000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (171, 4, 183, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 3140000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (172, 4, 186, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 7290000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (173, 4, 187, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 7290000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (174, 4, 188, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 7290000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (175, 4, 189, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 7362000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (176, 4, 190, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 7362000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (177, 4, 191, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 7362000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (178, 4, 192, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 7362000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (179, 4, 193, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 2460000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (180, 4, 194, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 100, '2025-03-26', 2460000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (181, 4, 195, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 650000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (182, 4, 196, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 650000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (183, 4, 197, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 650000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (184, 4, 198, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 10220000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (185, 4, 199, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 10220000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (186, 4, 200, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 10220000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (187, 4, 201, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 40, '2025-03-26', 10220000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (188, 4, 202, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 30, '2025-03-26', 27520000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (189, 4, 203, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 30, '2025-03-26', 27520000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (190, 4, 204, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 30, '2025-03-26', 10540000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (191, 4, 205, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 30, '2025-03-26', 10540000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (192, 4, 206, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 30, '2025-03-26', 10540000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (193, 1, 636, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 177, '2025-03-28', 215250.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (194, 1, 637, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 144, '2025-03-28', 215250.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (195, 1, 638, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 175, '2025-03-28', 215250.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (196, 1, 639, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 15, '2025-03-28', 215250.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (197, 1, 640, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 17, '2025-03-28', 215250.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (198, 1, 641, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 124, '2025-03-28', 79000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (199, 1, 642, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 154, '2025-03-28', 79000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (200, 1, 643, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 101, '2025-03-28', 79000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (201, 1, 644, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 144, '2025-03-28', 79000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (202, 1, 645, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 240, '2025-03-28', 79000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (203, 1, 41, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 10, '2025-03-31', 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (204, 1, 72, 2, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 10, '2025-03-31', 3400000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (205, 1, 41, 3, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1, '2025-04-10', 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (206, 1, 42, 3, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1, '2025-04-10', 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (207, 1, 641, 3, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1, '2025-04-10', 79000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (208, 1, 642, 3, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1, '2025-04-10', 79000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (209, 1, 643, 3, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1, '2025-04-10', 79000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (210, 1, 644, 3, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1, '2025-04-10', 79000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.transaction (transaction_id, stock_id, variation_id, provider_id, incharge_employee_id, transaction_type_id, transaction_quantity, transaction_date, transaction_product_price) VALUES (211, 1, 645, 3, 'e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, 1, '2025-04-10', 79000.00) ON CONFLICT DO NOTHING;


--
-- TOC entry 5298 (class 0 OID 58025)
-- Dependencies: 278
-- Data for Name: transaction_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.transaction_type (transaction_type_id, transaction_type_name) VALUES (1, 'IN') ON CONFLICT DO NOTHING;
INSERT INTO public.transaction_type (transaction_type_id, transaction_type_name) VALUES (2, 'OUT') ON CONFLICT DO NOTHING;


--
-- TOC entry 5300 (class 0 OID 58031)
-- Dependencies: 280
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."user" (user_id, role_id, is_user_enabled, user_google_id, user_username, user_password, user_fullname, user_email, user_phone, user_birthdate, user_address, user_image, user_current_payment_method, user_created_at, user_updated_at) VALUES ('5a53b431-ec19-4631-a43b-91e3e619170b', 3, true, NULL, 'staff123', '$2a$10$DfuCOI0wCBin3fleL8KCJe4qGlJbOC.eM7rz5basGg4fSGzFoXbHy', 'Staffu-chan', 'staff@staff.com', '0896679121', NULL, '', 'https://i.ibb.co/bMvPJ8dL/14.png', NULL, '2025-02-18 10:37:56.859+07', '2025-02-18 10:37:56.859+07') ON CONFLICT DO NOTHING;
INSERT INTO public."user" (user_id, role_id, is_user_enabled, user_google_id, user_username, user_password, user_fullname, user_email, user_phone, user_birthdate, user_address, user_image, user_current_payment_method, user_created_at, user_updated_at) VALUES ('f70b9947-6dc4-48cf-8dec-5897af562a96', 2, true, '116707575224928530083', 'khanhnbce180070@fpt.edu.vn', '$2a$10$9rS08Mz9XC5FzNb5yJkQ1esXgFdPTmBTzIndK8Qa3qPt4Nnv627Lm', 'Nguyen Buu Khanh (K18 CT)', 'khanhnbce180070@fpt.edu.vn', NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJOLSKyzKIARSYf8JRYxgzhoPzARr-27pMoZPBJIh6iGr5Vag=s96-c', NULL, '2025-03-27 08:36:54.172412+07', '2025-03-27 08:36:54.172412+07') ON CONFLICT DO NOTHING;
INSERT INTO public."user" (user_id, role_id, is_user_enabled, user_google_id, user_username, user_password, user_fullname, user_email, user_phone, user_birthdate, user_address, user_image, user_current_payment_method, user_created_at, user_updated_at) VALUES ('93b42024-4686-486d-b626-bd29589befbf', 2, true, '110384002791577902840', 'letrunghau2244@gmail.com', '$2a$10$UD0lznaed3y0eNUTmhJwcOLD0t7wolsNqTHv/wEgzNj1GWWEa03Aa', 'Hau', 'letrunghau2244@gmail.com', NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocLTn2Mw5SYzovFWfQ3AZmfY7W-UO-QT43WAnhXFM17xeMEYM4jw=s96-c', NULL, '2025-03-31 14:55:13.05076+07', '2025-03-31 14:55:13.051817+07') ON CONFLICT DO NOTHING;
INSERT INTO public."user" (user_id, role_id, is_user_enabled, user_google_id, user_username, user_password, user_fullname, user_email, user_phone, user_birthdate, user_address, user_image, user_current_payment_method, user_created_at, user_updated_at) VALUES ('e93a2eaf-1d11-42b7-8222-d2fb708f315c', 2, true, '116004321398421572707', 'gdownload327@gmail.com', '$2a$10$K5Qpe7ywoWD5.fVJT2AO4uAi810ky5UgTSdqnZyzquiItP7d7c2FW', 'Hau Le', 'gdownload327@gmail.com', NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJHgXW_PZ0J1vtV3QLVEwFmVaV20CtU1km1ibqTKnM94LMBQg=s96-c', NULL, '2025-04-09 10:38:20.300367+07', '2025-04-09 10:38:20.300367+07') ON CONFLICT DO NOTHING;
INSERT INTO public."user" (user_id, role_id, is_user_enabled, user_google_id, user_username, user_password, user_fullname, user_email, user_phone, user_birthdate, user_address, user_image, user_current_payment_method, user_created_at, user_updated_at) VALUES ('e43dff5d-7cac-45c7-a699-81b48beb33ef', 1, true, NULL, 'admin123', '$2a$10$wEpm7dyhEnwQJyafwPhIXOWbB/O8JEW9Fi4910ZECm2lolkJj4dmy', 'HauLT', 'admin123@unleashed.com', '0896679121', NULL, '', 'https://i.ibb.co/M5crZDR8/z6197539031181-4fe25592444b34aee49431f0658e8846.jpg', NULL, '2025-02-17 15:28:13.38+07', '2025-02-27 16:01:28.338067+07') ON CONFLICT DO NOTHING;
INSERT INTO public."user" (user_id, role_id, is_user_enabled, user_google_id, user_username, user_password, user_fullname, user_email, user_phone, user_birthdate, user_address, user_image, user_current_payment_method, user_created_at, user_updated_at) VALUES ('eca1c6f0-3c38-44e3-a346-51037cbed9e3', 3, false, NULL, 'Staff123', '$2a$10$pUisgSVc8fWLNDpgBhDFH.EH7mcheNHxacxcwDm7smbOlkt8r/jgG', 'STAFF', 'staff123@unleashed.com', '0123456788', NULL, 'An Giang, An Phú, An Phú', 'https://i.ibb.co/cK4xgnwV/Gnkcm9-UXc-AEpn04.png', NULL, '2025-04-10 22:32:00.796673+07', '2025-04-10 22:32:16.895502+07') ON CONFLICT DO NOTHING;
INSERT INTO public."user" (user_id, role_id, is_user_enabled, user_google_id, user_username, user_password, user_fullname, user_email, user_phone, user_birthdate, user_address, user_image, user_current_payment_method, user_created_at, user_updated_at) VALUES ('aeefb1ca-d277-49ef-8bad-f5012e3ca123', 2, true, NULL, 'swd392test', '$2a$10$MCsK8LL16RA2i/jP66uiku7nEvUFxX9BInngy3o5TrmUMZzG6bJZu', 'swd test', 'swd392test@swd392test.swd392test', '0896679121', NULL, NULL, NULL, NULL, '2025-07-24 13:19:49.562936+07', '2025-07-24 13:24:36.044257+07') ON CONFLICT DO NOTHING;
INSERT INTO public."user" (user_id, role_id, is_user_enabled, user_google_id, user_username, user_password, user_fullname, user_email, user_phone, user_birthdate, user_address, user_image, user_current_payment_method, user_created_at, user_updated_at) VALUES ('85e1a5bf-0f9f-4460-b403-a0138490cce0', 2, true, NULL, 'SWD392TEST123', '$2a$10$xZdZL4rnSFZiT4zg1rLS5.0y3BdxDqPnwdXA6MaWPI2BaTlMJxpK.', 'hello', 'SWD392TEST123@SWD392TEST123.a', '0123456789', NULL, NULL, NULL, NULL, '2025-07-24 13:21:45.714907+07', '2025-07-24 13:24:44.200162+07') ON CONFLICT DO NOTHING;
INSERT INTO public."user" (user_id, role_id, is_user_enabled, user_google_id, user_username, user_password, user_fullname, user_email, user_phone, user_birthdate, user_address, user_image, user_current_payment_method, user_created_at, user_updated_at) VALUES ('ec9d2a8e-9c79-49b8-8521-7af1aec9884a', 2, true, '109105137150521987059', 'noreply.hault@gmail.com', '$2a$10$7FfAll3AZQzlQbw7tsvUdevlBFdM5Zzm.2nmIsrJGOugiQyVRnKYm', 'Hau Le', 'noreply.hault@gmail.com', NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocKpeLeAyVdynzrpUeaSKuNMMP3YZ71qwyVSyaqMTz0Fxq_z1w=s96-c', NULL, '2025-07-24 13:14:02.322589+07', '2025-07-24 13:29:49.136712+07') ON CONFLICT DO NOTHING;
INSERT INTO public."user" (user_id, role_id, is_user_enabled, user_google_id, user_username, user_password, user_fullname, user_email, user_phone, user_birthdate, user_address, user_image, user_current_payment_method, user_created_at, user_updated_at) VALUES ('47f3a8a5-30c0-4b49-bd23-1396e89823c4', 2, false, '110661913958434601384', 'chitoanime@gmail.com', '$2a$10$NKbdtdmwFH.YXQRNYPfNkuZJKYKjV9dSkuZSYqPI.2k4gcGRjEltC', 'CMusic', 'chitoanime@gmail.com', NULL, NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocJTWCsc8dvYRb7yHJW7xyaZ7YPYfti4Xw4-agqUj-D0Hr8IvHL8=s96-c', NULL, '2025-08-09 21:07:12.220061+07', '2025-08-09 21:07:20.510713+07') ON CONFLICT DO NOTHING;


--
-- TOC entry 5301 (class 0 OID 58036)
-- Dependencies: 281
-- Data for Name: user_discount; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_discount (user_id, discount_id, is_discount_used, discount_used_at) VALUES ('93b42024-4686-486d-b626-bd29589befbf', 1, true, '2025-03-31 15:57:22.687188+07') ON CONFLICT DO NOTHING;
INSERT INTO public.user_discount (user_id, discount_id, is_discount_used, discount_used_at) VALUES ('93b42024-4686-486d-b626-bd29589befbf', 5, false, NULL) ON CONFLICT DO NOTHING;


--
-- TOC entry 5302 (class 0 OID 58041)
-- Dependencies: 282
-- Data for Name: user_rank; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_rank (user_id, rank_id, money_spent, rank_status, rank_expire_date, rank_created_date, rank_updated_date) VALUES ('e93a2eaf-1d11-42b7-8222-d2fb708f315c', 1, -3440000.00, 1, '2025-04-09', '2025-04-09 10:38:27.970903+07', '2025-04-09 10:38:27.970903+07') ON CONFLICT DO NOTHING;
INSERT INTO public.user_rank (user_id, rank_id, money_spent, rank_status, rank_expire_date, rank_created_date, rank_updated_date) VALUES ('93b42024-4686-486d-b626-bd29589befbf', 3, 57494998.00, -1, '2026-04-10', '2025-03-31 15:49:22.433922+07', '2025-03-31 15:49:22.433922+07') ON CONFLICT DO NOTHING;


--
-- TOC entry 5303 (class 0 OID 58046)
-- Dependencies: 283
-- Data for Name: variation; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (41, 'a2e98027-f414-47ee-9a39-c64aca1419c7', 6, 15, 'https://i.ibb.co/hFPSHt6g/image-2025-03-24-161342756.png', 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (42, 'a2e98027-f414-47ee-9a39-c64aca1419c7', 5, 15, 'https://i.ibb.co/qFghj69Z/image-2025-03-24-161330541.png', 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (43, 'b0579bfb-9b5e-4d99-81e9-b15bb2ba56ee', 5, 9, 'https://i.ibb.co/nN3nM8b9/image-2025-03-25-091647084.png', 85000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (44, 'b0579bfb-9b5e-4d99-81e9-b15bb2ba56ee', 6, 9, 'https://i.ibb.co/ZRJG2SSk/image-2025-03-25-091708268.png', 85000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (45, 'b0579bfb-9b5e-4d99-81e9-b15bb2ba56ee', 5, 10, 'https://i.ibb.co/xKYmNCDB/image-2025-03-25-091817945.png', 85000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (46, 'b0579bfb-9b5e-4d99-81e9-b15bb2ba56ee', 6, 10, 'https://i.ibb.co/W4RHTwS6/image-2025-03-25-091829248.png', 85000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (47, '49c158a0-180e-44aa-b60f-43a2c65fc9c6', 5, 9, 'https://i.ibb.co/RkVkhFnN/image-2025-03-25-092314773.png', 275000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (48, '49c158a0-180e-44aa-b60f-43a2c65fc9c6', 5, 10, 'https://i.ibb.co/wZ4FZVNf/image-2025-03-25-092333640.png', 275000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (49, '49c158a0-180e-44aa-b60f-43a2c65fc9c6', 5, 15, 'https://i.ibb.co/600xWqQc/image-2025-03-25-092353850.png', 275000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (50, '820f4f06-299a-4389-b10a-d1ff5ac4fd61', 2, 11, 'https://i.ibb.co/9mWyRVWY/image-2025-03-25-092652985.png', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (51, '820f4f06-299a-4389-b10a-d1ff5ac4fd61', 3, 11, 'https://i.ibb.co/4n5t4nqd/image-2025-03-25-092703258.png', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (52, '820f4f06-299a-4389-b10a-d1ff5ac4fd61', 4, 11, 'https://i.ibb.co/LzggLKGj/image-2025-03-25-092714261.png', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (53, '820f4f06-299a-4389-b10a-d1ff5ac4fd61', 5, 11, 'https://i.ibb.co/3mVC4BFk/image-2025-03-25-092725953.png', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (54, '820f4f06-299a-4389-b10a-d1ff5ac4fd61', 6, 11, 'https://i.ibb.co/BKLt9mgG/image-2025-03-25-092736890.png', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (55, '3cb1ed73-0bef-447b-bb1a-798c3fd8ae82', 5, 9, 'https://i.ibb.co/k6Dk5LtY/image-2025-03-25-092959319.png', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (56, '3cb1ed73-0bef-447b-bb1a-798c3fd8ae82', 5, 10, 'https://i.ibb.co/5hZjw3KH/image-2025-03-25-093023336.png', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (57, 'bc0bff38-a6d2-4cda-8b1d-c00576a97b84', 4, 7, 'https://i.ibb.co/PzYYmfJV/image-2025-03-25-093230034.png', 265000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (58, 'bc0bff38-a6d2-4cda-8b1d-c00576a97b84', 4, 11, 'https://i.ibb.co/QvS16zQB/image-2025-03-25-093301678.png', 265000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (59, '50e55ab7-ee7b-44a8-b24a-6cf884805ef5', 4, 9, 'https://i.ibb.co/4gKhV3Px/image-2025-03-25-093646343.png', 350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (60, '50e55ab7-ee7b-44a8-b24a-6cf884805ef5', 5, 9, 'https://i.ibb.co/HpNfwx7G/image-2025-03-25-093658049.png', 350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (61, '50e55ab7-ee7b-44a8-b24a-6cf884805ef5', 4, 18, 'https://i.ibb.co/k2mFNv9Q/image-2025-03-25-093724885.png', 350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (62, '50e55ab7-ee7b-44a8-b24a-6cf884805ef5', 5, 18, 'https://i.ibb.co/4wwDB3qq/image-2025-03-25-093734733.png', 350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (63, '26312fd9-fa41-4969-a74b-8150e99b7c21', 4, 8, 'https://i.ibb.co/pD1HnfP/image-2025-03-25-093933883.png', 679000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (64, 'c684b9d2-af82-4244-af0b-efe997b1b874', 5, 15, 'https://i.ibb.co/NdQ5f3Cg/image-2025-03-25-094243087.png', 245000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (65, 'c684b9d2-af82-4244-af0b-efe997b1b874', 5, 10, 'https://i.ibb.co/fVZwHshF/image-2025-03-25-094300429.png', 245000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (66, '9ab230b2-3a53-4f6c-ac03-6cad5108522a', 1, 11, 'https://i.ibb.co/TqTZB2Z8/image-2025-03-25-094509241.png', 350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (67, '9ab230b2-3a53-4f6c-ac03-6cad5108522a', 2, 11, 'https://i.ibb.co/BV97zCrj/image-2025-03-25-094525086.png', 350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (68, '9ab230b2-3a53-4f6c-ac03-6cad5108522a', 3, 11, 'https://i.ibb.co/J9Gw0qm/image-2025-03-25-094548138.png', 350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (69, 'fdad041b-7ba6-4e24-9522-c418ce9a54ea', 2, 10, 'https://i.ibb.co/G3c0hRs6/image-2025-03-25-094807697.png', 220000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (70, 'fdad041b-7ba6-4e24-9522-c418ce9a54ea', 3, 10, 'https://i.ibb.co/4nk1Pq7m/image-2025-03-25-094819012.png', 220000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (71, 'fdad041b-7ba6-4e24-9522-c418ce9a54ea', 4, 10, 'https://i.ibb.co/spd97RNP/image-2025-03-25-094834534.png', 220000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (72, '279468c9-9960-4b47-9919-dfd308fd19b4', 5, 9, 'https://i.ibb.co/bRQJW5CZ/image-2025-03-25-095200930.png', 3400000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (73, '98ff4f0c-fac2-45bb-b186-73365fb7a675', 2, 7, 'https://i.ibb.co/67q03Jbx/image-2025-03-26-090721274.png', 225000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (74, '98ff4f0c-fac2-45bb-b186-73365fb7a675', 3, 7, 'https://i.ibb.co/YF10GzCd/image-2025-03-26-090948903.png', 225000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (75, '79994f72-c1c8-460e-acf4-906e3d0924c5', 1, 10, 'https://i.ibb.co/nNyZM1w4/image-2025-03-26-101120471.png', 265000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (76, '79994f72-c1c8-460e-acf4-906e3d0924c5', 2, 10, 'https://i.ibb.co/hxjNGYJ4/image-2025-03-26-101131040.png', 265000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (77, '79994f72-c1c8-460e-acf4-906e3d0924c5', 3, 10, 'https://i.ibb.co/Lz83y6bR/image-2025-03-26-101141342.png', 265000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (78, '79994f72-c1c8-460e-acf4-906e3d0924c5', 4, 10, 'https://i.ibb.co/VRd6wBs/image-2025-03-26-101150325.png', 265000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (79, '3f131de4-ff0d-445a-a4f6-9764ab4f38db', 1, 18, 'https://i.ibb.co/xq5M0Sx3/image-2025-03-26-101428437.png', 980000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (80, '3f131de4-ff0d-445a-a4f6-9764ab4f38db', 2, 18, 'https://i.ibb.co/TMPdDkgx/image-2025-03-26-101439109.png', 980000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (81, '3f131de4-ff0d-445a-a4f6-9764ab4f38db', 3, 18, 'https://i.ibb.co/Q7LLZnCZ/image-2025-03-26-101450605.png', 980000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (82, 'a0d10b39-4841-463e-a9a6-0280ed3b77e8', 1, 11, 'https://i.ibb.co/NhZDx5K/image-2025-03-26-101608128.png', 390000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (83, 'a0d10b39-4841-463e-a9a6-0280ed3b77e8', 2, 11, 'https://i.ibb.co/tp4ymvYy/image-2025-03-26-101627600.png', 390000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (84, '2ae28f8e-b734-409d-9d88-0c7e5e19686d', 1, 9, 'https://i.ibb.co/JjckG85m/image-2025-03-26-101837669.png', 169000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (85, '2ae28f8e-b734-409d-9d88-0c7e5e19686d', 2, 9, 'https://i.ibb.co/BHdT6Mcf/image-2025-03-26-101853493.png', 169000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (86, 'f8402d8b-5f94-43de-a4ab-455a70510d31', 2, 9, 'https://i.ibb.co/Tx9xxvjK/image-2025-03-26-102207156.png', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (87, 'f8402d8b-5f94-43de-a4ab-455a70510d31', 3, 9, 'https://i.ibb.co/ZRqPmYcr/image-2025-03-26-102251168.png', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (88, 'f8402d8b-5f94-43de-a4ab-455a70510d31', 4, 9, 'https://i.ibb.co/tT2V4NWp/image-2025-03-26-102300869.png', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (89, 'f8402d8b-5f94-43de-a4ab-455a70510d31', 2, 18, 'https://i.ibb.co/8gBMjn7R/image-2025-03-26-102315407.png', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (90, 'f8402d8b-5f94-43de-a4ab-455a70510d31', 3, 18, 'https://i.ibb.co/wFQg0LY4/image-2025-03-26-102325999.png', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (91, 'f8402d8b-5f94-43de-a4ab-455a70510d31', 4, 18, 'https://i.ibb.co/7dRRx3Br/image-2025-03-26-102335847.png', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (92, 'f8402d8b-5f94-43de-a4ab-455a70510d31', 2, 10, 'https://i.ibb.co/cKX3XDgH/image-2025-03-26-102351157.png', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (93, 'f8402d8b-5f94-43de-a4ab-455a70510d31', 3, 10, 'https://i.ibb.co/tp4mDXS1/image-2025-03-26-102359806.png', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (94, 'f8402d8b-5f94-43de-a4ab-455a70510d31', 4, 10, 'https://i.ibb.co/5XL8BRXN/image-2025-03-26-102425085.png', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (95, 'f8402d8b-5f94-43de-a4ab-455a70510d31', 2, 20, 'https://i.ibb.co/hxKXk2F4/image-2025-03-26-102439758.png', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (96, 'f8402d8b-5f94-43de-a4ab-455a70510d31', 3, 20, 'https://i.ibb.co/TM3hDk0F/image-2025-03-26-102448638.png', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (97, 'f8402d8b-5f94-43de-a4ab-455a70510d31', 4, 20, 'https://i.ibb.co/zhZ31tHG/image-2025-03-26-102510565.png', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (98, 'f8402d8b-5f94-43de-a4ab-455a70510d31', 2, 8, 'https://i.ibb.co/ZRyH4trt/image-2025-03-26-102526028.png', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (99, 'f8402d8b-5f94-43de-a4ab-455a70510d31', 3, 8, 'https://i.ibb.co/zh8F4vby/image-2025-03-26-102536779.png', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (100, 'f8402d8b-5f94-43de-a4ab-455a70510d31', 4, 8, 'https://i.ibb.co/DDTy1GTp/image-2025-03-26-102545837.png', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (101, '1886bf1b-e995-4d65-a440-89da1f27555d', 1, 9, 'https://i.ibb.co/bjVtCvzD/image-2025-03-26-102904237.png', 435000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (102, '1886bf1b-e995-4d65-a440-89da1f27555d', 2, 9, 'https://i.ibb.co/jkTn90FZ/image-2025-03-26-102917238.png', 435000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (103, '1886bf1b-e995-4d65-a440-89da1f27555d', 3, 9, 'https://i.ibb.co/XkW02N6t/image-2025-03-26-102928317.png', 435000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (104, '1886bf1b-e995-4d65-a440-89da1f27555d', 1, 1, 'https://i.ibb.co/XZFN4jLG/image-2025-03-26-102951460.png', 435000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (105, '1886bf1b-e995-4d65-a440-89da1f27555d', 2, 1, 'https://i.ibb.co/x82jMNkt/image-2025-03-26-103000461.png', 435000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (106, '1886bf1b-e995-4d65-a440-89da1f27555d', 3, 1, 'https://i.ibb.co/8L1SW0TT/image-2025-03-26-103011295.png', 435000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (107, 'cca9fa22-8db7-4c19-90ff-1c0e96e69754', 1, 9, 'https://i.ibb.co/YBC6bPP3/image-2025-03-26-103343151.png', 599000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (108, 'cca9fa22-8db7-4c19-90ff-1c0e96e69754', 2, 9, 'https://i.ibb.co/V028w13d/image-2025-03-26-103352324.png', 599000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (109, 'a51db439-45fd-42ce-bfe0-234ff577f198', 3, 10, 'https://i.ibb.co/QF6m3K9f/image-2025-03-26-103526432.png', 499000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (110, 'a51db439-45fd-42ce-bfe0-234ff577f198', 4, 10, 'https://i.ibb.co/VpgNLxz8/image-2025-03-26-103535953.png', 499000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (111, 'a51db439-45fd-42ce-bfe0-234ff577f198', 3, 8, 'https://i.ibb.co/fd9GvnXn/image-2025-03-26-103605642.png', 499000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (112, 'a51db439-45fd-42ce-bfe0-234ff577f198', 4, 8, 'https://i.ibb.co/V0tx3MQ3/image-2025-03-26-103607209.png', 499000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (114, 'd39cc00b-af08-4e0a-9906-d2c81adcda2c', 2, 8, 'https://i.ibb.co/1GbZzfsr/image-2025-03-26-103952678.png', 1150000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (115, 'bb02cab9-3428-4be6-8c00-1280243b104d', 2, 11, 'https://i.ibb.co/HfMMcyNw/image-2025-03-26-104101093.png', 980000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (116, 'bb02cab9-3428-4be6-8c00-1280243b104d', 3, 11, 'https://i.ibb.co/5XppFH01/image-2025-03-26-104111029.png', 980000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (117, '907278fc-e183-45a6-8da5-46cd0e3409c3', 2, 10, 'https://i.ibb.co/p6yWk2Lb/image-2025-03-26-104302880.png', 1990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (118, '907278fc-e183-45a6-8da5-46cd0e3409c3', 3, 10, 'https://i.ibb.co/YBBRXSDX/image-2025-03-26-104326910.png', 1990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (119, 'ae780342-3f8f-4396-bf6a-9d9e72737f36', 1, 1, 'https://i.ibb.co/zHmhRVMG/dsc05958-9c0b425c06284065bdb5628e376f1f9b-master.jpg', 415000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (120, 'ae780342-3f8f-4396-bf6a-9d9e72737f36', 2, 1, 'https://i.ibb.co/hJGRLGQx/dsc05958-9c0b425c06284065bdb5628e376f1f9b-master.jpg', 415000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (121, 'ae780342-3f8f-4396-bf6a-9d9e72737f36', 3, 1, 'https://i.ibb.co/r8QpxcR/dsc05958-9c0b425c06284065bdb5628e376f1f9b-master.jpg', 415000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (122, 'ae780342-3f8f-4396-bf6a-9d9e72737f36', 1, 9, 'https://i.ibb.co/8LYgwtby/ao-thun-polo-nam-cao-cap-basic-pique-1.webp', 400000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (123, 'ae780342-3f8f-4396-bf6a-9d9e72737f36', 2, 9, 'https://i.ibb.co/wZBYWjPC/ao-thun-polo-nam-cao-cap-basic-pique-1.webp', 400000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (124, 'ae780342-3f8f-4396-bf6a-9d9e72737f36', 3, 9, 'https://i.ibb.co/HLccN4Xh/ao-thun-polo-nam-cao-cap-basic-pique-1.webp', 400000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (125, 'ae780342-3f8f-4396-bf6a-9d9e72737f36', 1, 10, 'https://i.ibb.co/tygTPLB/img-3877-fca8dd51d0c947cc9a20e081dcdcea4f-1024x1024.webp', 420000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (126, 'ae780342-3f8f-4396-bf6a-9d9e72737f36', 2, 10, 'https://i.ibb.co/9F0vxGR/img-3877-fca8dd51d0c947cc9a20e081dcdcea4f-1024x1024.webp', 420000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (127, 'ae780342-3f8f-4396-bf6a-9d9e72737f36', 3, 10, 'https://i.ibb.co/Y7VmgtNv/img-3877-fca8dd51d0c947cc9a20e081dcdcea4f-1024x1024.webp', 420000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (128, '2842603c-4acc-401a-bab0-2cddccf6782d', 4, 5, 'https://i.ibb.co/LFhJqXy/1647352432-10179-11-f1-w767-h1105.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (129, '2842603c-4acc-401a-bab0-2cddccf6782d', 1, 5, 'https://i.ibb.co/JFpz9MP1/1647352432-10179-11-f1-w767-h1105.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (130, '2842603c-4acc-401a-bab0-2cddccf6782d', 2, 5, 'https://i.ibb.co/k6vp5ggM/1647352432-10179-11-f1-w767-h1105.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (131, '2842603c-4acc-401a-bab0-2cddccf6782d', 3, 5, 'https://i.ibb.co/3yh22mFh/1647352432-10179-11-f1-w767-h1105.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (132, '72fb5f06-7af1-41e5-a8a6-d5391a33d6ad', 1, 11, 'https://i.ibb.co/k6wr8xDV/61880-ao-len-cardigan-nu-ngan-2.jpg', 210000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (133, '72fb5f06-7af1-41e5-a8a6-d5391a33d6ad', 2, 9, 'https://i.ibb.co/Z6pNPLYL/61880-ao-len-cardigan-nu-ngan-1.jpg', 210000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (134, '72fb5f06-7af1-41e5-a8a6-d5391a33d6ad', 1, 10, 'https://i.ibb.co/27KSZj1c/61880-ao-len-cardigan-nu-ngan-4.jpg', 210000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (142, '3a569c04-4731-4040-9908-cee6db27e58c', 1, 9, 'https://i.ibb.co/vCxKMNtn/Sandro-SFPTS01459-20-V-P-1.webp', 240000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (136, '8baeb037-71d2-42e5-a25a-b4840a63a7ce', 2, 9, 'https://i.ibb.co/NcFG5cf/3-2-768x768.jpg', 300000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (135, '8baeb037-71d2-42e5-a25a-b4840a63a7ce', 1, 9, 'https://i.ibb.co/zhL40h3R/3-2-768x768.jpg', 300000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (137, 'ec6f1767-c99d-4c7b-88b7-f98c1c8e3df9', 1, 3, 'https://i.ibb.co/DgH1p2Ss/chan-vay-jeans-dang-dai-chu-a-cv06-18.webp', 390000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (138, 'ec6f1767-c99d-4c7b-88b7-f98c1c8e3df9', 2, 3, 'https://i.ibb.co/JFkd9F3J/chan-vay-jeans-dang-dai-chu-a-cv06-18.webp', 390000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (139, 'ec6f1767-c99d-4c7b-88b7-f98c1c8e3df9', 3, 3, 'https://i.ibb.co/JwfrYxSG/chan-vay-jeans-dang-dai-chu-a-cv06-18.webp', 390000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (143, '3a569c04-4731-4040-9908-cee6db27e58c', 2, 9, 'https://i.ibb.co/qFWPwFLG/Sandro-SFPTS01459-20-V-P-1.webp', 240000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (144, '3a569c04-4731-4040-9908-cee6db27e58c', 3, 9, 'https://i.ibb.co/VcD9L8wr/Sandro-SFPTS01459-20-V-P-1.webp', 240000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (145, '3a569c04-4731-4040-9908-cee6db27e58c', 1, 10, 'https://i.ibb.co/WNCC8k4v/Sandro-SFPTS01459-10-V-P-1.webp', 240000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (146, '3a569c04-4731-4040-9908-cee6db27e58c', 2, 10, 'https://i.ibb.co/d4dhZGvD/Sandro-SFPTS01459-10-V-P-1.webp', 240000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (147, '3a569c04-4731-4040-9908-cee6db27e58c', 3, 10, 'https://i.ibb.co/DPWZLTFX/Sandro-SFPTS01459-10-V-P-1.webp', 240000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (140, '7915da52-436f-438d-a61f-53917f2b41c4', 3, 3, 'https://i.ibb.co/LXSnXPp3/Maje-MFPBL00730-0201-F-P-1-1.webp', 102198.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (149, '1ff680b4-91cc-408f-a218-63e4cd6d8aa6', 2, 1, 'https://i.ibb.co/LXz2kRzR/1191192-000-6699d71ea3cc5.jpg', 1590000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (148, '1ff680b4-91cc-408f-a218-63e4cd6d8aa6', 1, 1, 'https://i.ibb.co/TGKdNYb/1191192-000-6699d71ea3cc5.jpg', 158999.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (157, 'a85b0278-bab3-49dc-9c18-01d5d4ad0286', 3, 9, 'https://i.ibb.co/5grMdFMh/Sandro-SFPPU01552-20-V-P-1-7.webp', 250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (309, '5318360f-802c-4684-97b2-516616f56a82', 1, 9, 'https://i.ibb.co/xSbt2vhR/5-den-vje11026.jpg', 900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (158, 'a85b0278-bab3-49dc-9c18-01d5d4ad0286', 4, 9, 'https://i.ibb.co/wZHrZLy4/Sandro-SFPPU01552-20-V-P-1-7.webp', 250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (159, '477f06d7-1367-43c7-926a-fbd2094e0acf', 2, 9, 'https://i.ibb.co/gZT3Gz9B/25-SS-BT-LP-LG-BOP-BLK-002.webp', 2010000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (160, '477f06d7-1367-43c7-926a-fbd2094e0acf', 3, 9, 'https://i.ibb.co/5XJt6KJL/25-SS-BT-LP-LG-BOP-BLK-002.webp', 2010000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (161, '477f06d7-1367-43c7-926a-fbd2094e0acf', 2, 10, 'https://i.ibb.co/wZ1KyQ3b/25-SS-BT-LP-LG-BOP-MEL-002.webp', 2010000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (162, '477f06d7-1367-43c7-926a-fbd2094e0acf', 3, 10, 'https://i.ibb.co/k6kJbftr/25-SS-BT-LP-LG-BOP-MEL-002.webp', 2010000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (167, 'e460c599-1ef0-4c1a-9648-dfeae7feefb1', 3, 9, 'https://i.ibb.co/P8vVHpX/Sandro-SHPCM01300-23-H-P.webp', 5350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (168, 'e460c599-1ef0-4c1a-9648-dfeae7feefb1', 4, 9, 'https://i.ibb.co/XrBqMGD1/Sandro-SHPCM01300-23-H-P.webp', 5350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (169, 'e460c599-1ef0-4c1a-9648-dfeae7feefb1', 3, 3, 'https://i.ibb.co/CykKS0s/Sandro-SHPCM01300-D343-H-P.webp', 5350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (170, 'e460c599-1ef0-4c1a-9648-dfeae7feefb1', 4, 3, 'https://i.ibb.co/ZpTw6FNw/Sandro-SHPCM01300-D343-H-P.webp', 5350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (171, '1a29569b-9380-4eb5-bbd7-3aa8d916e24b', 3, 10, 'https://i.ibb.co/B5tXcQyG/68400eb6effc63996fe4de2550703e80ddc78920.jpg', 499000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (172, '1a29569b-9380-4eb5-bbd7-3aa8d916e24b', 4, 10, 'https://i.ibb.co/WvSb3gcz/68400eb6effc63996fe4de2550703e80ddc78920.jpg', 499000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (173, '02053d99-8994-4427-ae03-6ce440278760', 4, 9, 'https://i.ibb.co/0RGSMvRx/fwcl002-54051885860-o-f039b7a5f6564fe1bf741bdb0e264591-master.webp', 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (174, '02053d99-8994-4427-ae03-6ce440278760', 4, 8, 'https://i.ibb.co/vxNsWsrv/thiet-ke-chua-co-ten-6-036a37f6aca94d57beaa829d4cc501d4-master.webp', 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (175, '02053d99-8994-4427-ae03-6ce440278760', 4, 10, 'https://i.ibb.co/6xGxMM9/fwcl002-dcr-54051763649-o-7762c51f1bb44dad834bbcb7eab4d47c-master.jpg', 850000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (178, '4cb234f7-db1f-4140-a9b8-86fd6056d987', 2, 3, 'https://i.ibb.co/CssZZG0X/1182483-000-66949cb7ab6e3.jpg', 5793000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (179, '4cb234f7-db1f-4140-a9b8-86fd6056d987', 3, 3, 'https://i.ibb.co/4wc6sqgm/1182483-000-66949cb7ab6e3.jpg', 5793000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (180, '4cb234f7-db1f-4140-a9b8-86fd6056d987', 5, 3, 'https://i.ibb.co/7xQ07PXZ/1182483-000-66949cb7ab6e3.jpg', 5793000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (181, '7baecb0e-c6b0-4c3f-b2dd-b0900254784d', 3, 18, 'https://i.ibb.co/LhcKQCsb/000-ADLV-23-FW-JKLNVR-NVY-002-1-3.webp', 3140000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (182, '7baecb0e-c6b0-4c3f-b2dd-b0900254784d', 4, 18, 'https://i.ibb.co/spq0GCQW/000-ADLV-23-FW-JKLNVR-NVY-002-1-3.webp', 3140000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (183, '7baecb0e-c6b0-4c3f-b2dd-b0900254784d', 5, 18, 'https://i.ibb.co/Y41hgxfW/000-ADLV-23-FW-JKLNVR-NVY-002-1-3.webp', 3140000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (184, '7baecb0e-c6b0-4c3f-b2dd-b0900254784d', 3, 7, 'https://i.ibb.co/9k2GqGvc/000-ADLV-23-FW-JKLNVR-PNK-002-1-3.webp', 3140000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (185, '7baecb0e-c6b0-4c3f-b2dd-b0900254784d', 4, 7, 'https://i.ibb.co/TDsfT3pw/000-ADLV-23-FW-JKLNVR-PNK-002-1-3.webp', 3140000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (186, '04a67658-96c5-457c-97a6-4b1eb8a94583', 3, 7, 'https://i.ibb.co/Gf4yT6HB/Sandro-SFPPU02323-16-F-P.webp', 7290000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (187, '04a67658-96c5-457c-97a6-4b1eb8a94583', 4, 7, 'https://i.ibb.co/KcxQDXdJ/Sandro-SFPPU02323-16-F-P.webp', 7290000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (188, '04a67658-96c5-457c-97a6-4b1eb8a94583', 5, 7, 'https://i.ibb.co/xKFjTPQS/Sandro-SFPPU02323-16-F-P.webp', 7290000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (189, '2ecbd902-1bfd-4b4c-a23d-b01dfefe702d', 4, 9, 'https://i.ibb.co/21KmgF5Z/quan-the-thao-waac-nam-essential-summer-pants-dai-golf-956-667x.webp', 7362000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (190, '2ecbd902-1bfd-4b4c-a23d-b01dfefe702d', 5, 9, 'https://i.ibb.co/prMy89R5/quan-the-thao-waac-nam-essential-summer-pants-dai-golf-956-667x.webp', 7362000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (191, '2ecbd902-1bfd-4b4c-a23d-b01dfefe702d', 4, 10, 'https://i.ibb.co/7J0mSPvj/quan-the-thao-waac-nam-essential-summer-pants-dai-golf-820-667x.webp', 7362000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (192, '2ecbd902-1bfd-4b4c-a23d-b01dfefe702d', 5, 10, 'https://i.ibb.co/hRvr6jDH/quan-the-thao-waac-nam-essential-summer-pants-dai-golf-820-667x.webp', 7362000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (193, 'cc41ada9-ac4e-4d87-8227-c265ade04f73', 4, 11, 'https://i.ibb.co/nN7ZjvXG/24-FW-BT-LP-LG-BBP-GRY-002.webp', 2460000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (194, 'cc41ada9-ac4e-4d87-8227-c265ade04f73', 5, 11, 'https://i.ibb.co/Y4Mn9YrS/24-FW-BT-LP-LG-BBP-GRY-002.webp', 2460000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (195, 'f1c3c854-8007-4ce9-b43e-176b62058d81', 2, 2, 'https://i.ibb.co/xKbk4g4h/10294-24-F1.webp', 650000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (196, 'f1c3c854-8007-4ce9-b43e-176b62058d81', 3, 2, 'https://i.ibb.co/NdrB7b0Z/10294-24-F1.webp', 650000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (197, 'f1c3c854-8007-4ce9-b43e-176b62058d81', 4, 2, 'https://i.ibb.co/Lz5XnHJg/10294-24-F1.webp', 650000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (156, 'da1dc78e-d36f-489c-bb49-5b628ef4ad1c', 6, 10, 'https://i.ibb.co/m5TJ5B57/Maje-MFPOU01206-0130-F-P.webp', 1475998.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (155, 'da1dc78e-d36f-489c-bb49-5b628ef4ad1c', 5, 10, 'https://i.ibb.co/8SdRmPS/Maje-MFPOU01206-0130-F-P.webp', 1475999.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (151, '1ff680b4-91cc-408f-a218-63e4cd6d8aa6', 4, 1, 'https://i.ibb.co/PGGNmvpz/1191192-000-6699d71ea3cc5.jpg', 1589997.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (152, '1ff680b4-91cc-408f-a218-63e4cd6d8aa6', 5, 1, 'https://i.ibb.co/dJDt7StB/1191192-000-6699d71ea3cc5.jpg', 1590000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (153, '1ff680b4-91cc-408f-a218-63e4cd6d8aa6', 6, 1, 'https://i.ibb.co/7Njppgwc/1191192-000-6699d71ea3cc5.jpg', 1589998.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (150, '1ff680b4-91cc-408f-a218-63e4cd6d8aa6', 3, 1, 'https://i.ibb.co/LztJBkdn/1191192-000-6699d71ea3cc5.jpg', 1589998.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (176, 'cb25da06-3b1f-417a-8bc3-6961aee8843b', 5, 18, 'https://i.ibb.co/q3GM3Tj9/FF55-DP2016-I1-DM-P-01.webp', 1205999.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (177, 'cb25da06-3b1f-417a-8bc3-6961aee8843b', 4, 18, 'https://i.ibb.co/8HzwGVG/FF55-DP2016-I1-DM-P-01.webp', 1205998.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (198, 'f2ecb711-38fe-4d31-b140-2a51aef473e9', 3, 12, 'https://i.ibb.co/CpSy0J8J/Maje-MFPRO03768-D041-F-P-1-2.webp', 1022000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (200, 'f2ecb711-38fe-4d31-b140-2a51aef473e9', 5, 12, 'https://i.ibb.co/RpNq9Pzr/Maje-MFPRO03768-D041-F-P-1-2.webp', 1021998.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (199, 'f2ecb711-38fe-4d31-b140-2a51aef473e9', 4, 12, 'https://i.ibb.co/27x218nT/Maje-MFPRO03768-D041-F-P-1-2.webp', 1022000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (201, 'f2ecb711-38fe-4d31-b140-2a51aef473e9', 6, 12, 'https://i.ibb.co/208DCPs3/Maje-MFPRO03768-D041-F-P-1-2.webp', 1021998.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (163, 'cdb65655-7c94-4522-9516-530d2761f91b', 4, 9, 'https://i.ibb.co/T6j0M7r/Sandro-SFPJU01106-20-V-P-1-2.webp', 1142000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (166, 'cdb65655-7c94-4522-9516-530d2761f91b', 5, 10, 'https://i.ibb.co/HLkqCXyw/Sandro-SFPJU01106-10-V-P-1-6.webp', 1141999.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (164, 'cdb65655-7c94-4522-9516-530d2761f91b', 5, 9, 'https://i.ibb.co/prL3PHwb/Sandro-SFPJU01106-20-V-P-1-2.webp', 1142000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (202, '01e8f17c-8a59-4c9a-a529-adb40ef77240', 2, 10, 'https://i.ibb.co/Y42bhVHM/FE62-MA2189-OI-11-P-01-1-6.webp', 2751998.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (207, 'a69b7ea4-c0c9-45a6-9bf1-fffb44efa600', 1, 9, 'https://i.ibb.co/5XKRCrhs/id-005732a-7dcd441b2c36492eaf3fb09341f3ceab-master.jpg', 2500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (208, 'a69b7ea4-c0c9-45a6-9bf1-fffb44efa600', 3, 9, 'https://i.ibb.co/b5hXyDbb/id-005732a-7dcd441b2c36492eaf3fb09341f3ceab-master.jpg', 2500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (310, '5318360f-802c-4684-97b2-516616f56a82', 2, 9, 'https://i.ibb.co/rRzdCZP1/5-den-vje11026.jpg', 900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (209, 'a69b7ea4-c0c9-45a6-9bf1-fffb44efa600', 5, 9, 'https://i.ibb.co/S4NcQtB8/id-005732a-7dcd441b2c36492eaf3fb09341f3ceab-master.jpg', 2500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (210, 'a69b7ea4-c0c9-45a6-9bf1-fffb44efa600', 2, 10, 'https://i.ibb.co/hRnSxrzN/id-005752a-454d13b855f34c1280587f5fd52ed679-master.jpg', 2500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (211, 'a69b7ea4-c0c9-45a6-9bf1-fffb44efa600', 5, 10, 'https://i.ibb.co/XRNPPWC/id-005752a-454d13b855f34c1280587f5fd52ed679-master.jpg', 2500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (212, 'a69b7ea4-c0c9-45a6-9bf1-fffb44efa600', 6, 10, 'https://i.ibb.co/hRnSxrzN/id-005752a-454d13b855f34c1280587f5fd52ed679-master.jpg', 2500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (213, '92019d2d-80f9-40c2-ace1-3dbbfe3dc9f1', 1, 20, 'https://i.ibb.co/GQN7DxZ7/542-vagn.jpg', 4500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (214, '92019d2d-80f9-40c2-ace1-3dbbfe3dc9f1', 3, 20, 'https://i.ibb.co/xSTS6MK3/542-vagn.jpg', 4500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (215, '92019d2d-80f9-40c2-ace1-3dbbfe3dc9f1', 5, 20, 'https://i.ibb.co/YFxT5sHk/542-vagn.jpg', 4500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (216, '92019d2d-80f9-40c2-ace1-3dbbfe3dc9f1', 2, 11, 'https://i.ibb.co/bqB4kqd/542-than.jpg', 4500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (217, '92019d2d-80f9-40c2-ace1-3dbbfe3dc9f1', 4, 11, 'https://i.ibb.co/67rrMNyc/542-than.jpg', 4500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (218, '92019d2d-80f9-40c2-ace1-3dbbfe3dc9f1', 6, 11, 'https://i.ibb.co/WpzCdmDh/542-than.jpg', 4500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (219, '31b936d2-b0ef-48ea-b657-4e2fef7a97c0', 1, 9, 'https://i.ibb.co/LXzVMrJs/20231129-Zz5sdl8kx-G.jpg', 2745000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (220, '31b936d2-b0ef-48ea-b657-4e2fef7a97c0', 3, 9, 'https://i.ibb.co/V0NKdKkB/20231129-Zz5sdl8kx-G.jpg', 2745000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (221, '31b936d2-b0ef-48ea-b657-4e2fef7a97c0', 2, 9, 'https://i.ibb.co/Kp6MSTPY/20231129-Zz5sdl8kx-G.jpg', 2745000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (222, '31b936d2-b0ef-48ea-b657-4e2fef7a97c0', 4, 18, 'https://i.ibb.co/5gkm77JN/20240618-94ncqj2h.jpg', 2745000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (223, '31b936d2-b0ef-48ea-b657-4e2fef7a97c0', 5, 18, 'https://i.ibb.co/rKHVQWtH/20240618-94ncqj2h.jpg', 2745000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (224, '31b936d2-b0ef-48ea-b657-4e2fef7a97c0', 6, 18, 'https://i.ibb.co/qYx1srzt/20240618-94ncqj2h.jpg', 2745000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (225, 'fc98f0cf-7948-4d4a-aa03-2ab9e6d2148a', 1, 10, 'https://i.ibb.co/0yngFWWD/vay-hoa-nhi-dang-dai-17-635831a343ce4ae289a1c418bdea1cdc.webp', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (226, 'fc98f0cf-7948-4d4a-aa03-2ab9e6d2148a', 2, 10, 'https://i.ibb.co/PGLbYpm8/vay-hoa-nhi-dang-dai-17-635831a343ce4ae289a1c418bdea1cdc.webp', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (227, 'fc98f0cf-7948-4d4a-aa03-2ab9e6d2148a', 3, 10, 'https://i.ibb.co/HTGxsPn1/vay-hoa-nhi-dang-dai-17-635831a343ce4ae289a1c418bdea1cdc.webp', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (228, 'fc98f0cf-7948-4d4a-aa03-2ab9e6d2148a', 4, 12, 'https://i.ibb.co/Zpf8sZ2G/vay-hoa-nhi-dang-dai-19-fcb9fc56ad21433ab8b2b06135521d17.jpg', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (229, 'fc98f0cf-7948-4d4a-aa03-2ab9e6d2148a', 5, 12, 'https://i.ibb.co/6cZDDkMC/vay-hoa-nhi-dang-dai-19-fcb9fc56ad21433ab8b2b06135521d17.jpg', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (230, 'fc98f0cf-7948-4d4a-aa03-2ab9e6d2148a', 6, 12, 'https://i.ibb.co/CfHNTTp/vay-hoa-nhi-dang-dai-19-fcb9fc56ad21433ab8b2b06135521d17.jpg', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (231, 'cf8ed606-568c-4245-ac22-f3f4b620464f', 1, 9, 'https://i.ibb.co/G4p5v6wF/l63l24h042-40777465-1-7691665c455043c79cf1b6890edd616f.jpg', 2990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (232, 'cf8ed606-568c-4245-ac22-f3f4b620464f', 2, 9, 'https://i.ibb.co/JRQX9b7D/l63l24h042-40777465-1-7691665c455043c79cf1b6890edd616f.jpg', 2990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (233, 'cf8ed606-568c-4245-ac22-f3f4b620464f', 3, 9, 'https://i.ibb.co/5hMFKmwV/l63l24h042-40777465-1-7691665c455043c79cf1b6890edd616f.jpg', 2990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (234, 'cf8ed606-568c-4245-ac22-f3f4b620464f', 4, 1, 'https://i.ibb.co/Ps10LRXN/l63l24h042-40777465-4-467870ada37245aa96d38811336b7747.jpg', 2990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (235, 'cf8ed606-568c-4245-ac22-f3f4b620464f', 5, 1, 'https://i.ibb.co/QFMFX6cn/l63l24h042-40777465-4-467870ada37245aa96d38811336b7747.jpg', 2990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (236, 'cf8ed606-568c-4245-ac22-f3f4b620464f', 6, 1, 'https://i.ibb.co/FkW44807/l63l24h042-40777465-4-467870ada37245aa96d38811336b7747.jpg', 2990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (237, 'b23dd277-6fd5-4764-9579-40ac01904b09', 1, 9, 'https://i.ibb.co/S4gp1vBL/l75p20t039-35899833-1-6c39930bd80f4a39bcf47ebcbc29cb71.jpg', 1990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (238, 'b23dd277-6fd5-4764-9579-40ac01904b09', 2, 9, 'https://i.ibb.co/rftMHDLb/l75p20t039-35899833-1-6c39930bd80f4a39bcf47ebcbc29cb71.jpg', 1990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (239, 'b23dd277-6fd5-4764-9579-40ac01904b09', 3, 9, 'https://i.ibb.co/PZF6T93z/l75p20t039-35899833-1-6c39930bd80f4a39bcf47ebcbc29cb71.jpg', 1990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (240, 'b23dd277-6fd5-4764-9579-40ac01904b09', 4, 8, 'https://i.ibb.co/kshv2THj/l75p20t039-s4100-2-c5dc47a786f040fb95fcb277173025ec.jpg', 1990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (241, 'b23dd277-6fd5-4764-9579-40ac01904b09', 5, 8, 'https://i.ibb.co/5XkB4SnJ/l75p20t039-s4100-2-c5dc47a786f040fb95fcb277173025ec.jpg', 1990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (242, 'b23dd277-6fd5-4764-9579-40ac01904b09', 6, 8, 'https://i.ibb.co/Nd1NMPSK/l75p20t039-s4100-2-c5dc47a786f040fb95fcb277173025ec.jpg', 1990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (243, '89b8e8aa-08c5-4a4c-a686-5f0c5adec07f', 1, 10, 'https://i.ibb.co/zh6F530b/ao-hoodie-trang-4.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (244, '89b8e8aa-08c5-4a4c-a686-5f0c5adec07f', 2, 10, 'https://i.ibb.co/LzdCf3HY/ao-hoodie-trang-4.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (245, '89b8e8aa-08c5-4a4c-a686-5f0c5adec07f', 3, 10, 'https://i.ibb.co/Rpfcx7jq/ao-hoodie-trang-4.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (246, '89b8e8aa-08c5-4a4c-a686-5f0c5adec07f', 4, 9, 'https://i.ibb.co/bg9j79nb/ao-hoodie-den-6.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (247, '89b8e8aa-08c5-4a4c-a686-5f0c5adec07f', 5, 9, 'https://i.ibb.co/S474tvZV/ao-hoodie-den-6.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (248, '89b8e8aa-08c5-4a4c-a686-5f0c5adec07f', 6, 9, 'https://i.ibb.co/TDfBMGsK/ao-hoodie-den-6.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (249, 'eb84fd4d-b305-45f6-b1b9-c1082c267d56', 1, 8, 'https://i.ibb.co/hxHcFM4Q/quan-tay-nu-ong-dung-gia-re.jpg', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (250, 'eb84fd4d-b305-45f6-b1b9-c1082c267d56', 2, 8, 'https://i.ibb.co/8ncjjY3d/quan-tay-nu-ong-dung-gia-re.jpg', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (251, 'eb84fd4d-b305-45f6-b1b9-c1082c267d56', 3, 8, 'https://i.ibb.co/HfS27b2N/quan-tay-nu-ong-dung-gia-re.jpg', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (252, 'eb84fd4d-b305-45f6-b1b9-c1082c267d56', 4, 9, 'https://i.ibb.co/TD1Z7PH7/quan-tay-nu-ong-dung-dep.jpg', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (253, 'eb84fd4d-b305-45f6-b1b9-c1082c267d56', 5, 9, 'https://i.ibb.co/Nd6BByDx/quan-tay-nu-ong-dung-dep.jpg', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (254, 'eb84fd4d-b305-45f6-b1b9-c1082c267d56', 6, 9, 'https://i.ibb.co/BKjxfHwk/quan-tay-nu-ong-dung-dep.jpg', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (255, '63f61d12-4c4a-48b9-bc44-989b923e37a6', 1, 9, 'https://i.ibb.co/nswd9M8s/chan-vay-LF4-CV01-4-768x1152.webp', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (204, '91ca633b-397b-4545-a6fd-e1b028e28d2a', 2, 10, 'https://i.ibb.co/chmYYBdS/Sandro-SFPRO04202-11-F-P.webp', 1053999.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (205, '91ca633b-397b-4545-a6fd-e1b028e28d2a', 3, 10, 'https://i.ibb.co/1YtsMj40/Sandro-SFPRO04202-11-F-P.webp', 1054000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (206, '91ca633b-397b-4545-a6fd-e1b028e28d2a', 4, 10, 'https://i.ibb.co/jPY5jWxP/Sandro-SFPRO04202-11-F-P.webp', 1054000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (256, '63f61d12-4c4a-48b9-bc44-989b923e37a6', 2, 9, 'https://i.ibb.co/vRGdDwS/chan-vay-LF4-CV01-4-768x1152.webp', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (257, '63f61d12-4c4a-48b9-bc44-989b923e37a6', 3, 9, 'https://i.ibb.co/SXm9yW1f/chan-vay-LF4-CV01-4-768x1152.webp', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (258, '63f61d12-4c4a-48b9-bc44-989b923e37a6', 4, 10, 'https://i.ibb.co/PG0sDjnK/chan-vay-lfcv5108-16-luperi.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (259, '63f61d12-4c4a-48b9-bc44-989b923e37a6', 5, 10, 'https://i.ibb.co/DDwdhK5g/chan-vay-lfcv5108-16-luperi.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (260, '63f61d12-4c4a-48b9-bc44-989b923e37a6', 6, 10, 'https://i.ibb.co/pvKF1wKw/chan-vay-lfcv5108-16-luperi.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (261, '812569da-3866-4dde-90a4-562d7fc86ecc', 1, 9, 'https://i.ibb.co/sdDz9ydQ/55.jpg', 1990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (262, '812569da-3866-4dde-90a4-562d7fc86ecc', 2, 9, 'https://i.ibb.co/JWBzWK8R/55.jpg', 1990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (263, '812569da-3866-4dde-90a4-562d7fc86ecc', 3, 9, 'https://i.ibb.co/wxGJjCW/55.jpg', 1990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (264, '812569da-3866-4dde-90a4-562d7fc86ecc', 4, 8, 'https://i.ibb.co/wFBJJ3n9/lareinabra-ab-118-3.webp', 1990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (265, '812569da-3866-4dde-90a4-562d7fc86ecc', 5, 8, 'https://i.ibb.co/VcgJNYmP/lareinabra-ab-118-3.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (266, '812569da-3866-4dde-90a4-562d7fc86ecc', 6, 8, 'https://i.ibb.co/pvhcTdPz/lareinabra-ab-118-3.webp', 1990000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (267, '7b78a866-78c9-4724-8b19-d309e2c3aeb2', 1, 10, 'https://i.ibb.co/cWdvdTp/160-ao-somi-240-1-25a4065cb297483fa1da338259309219-1024x1024.jpg', 3190000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (268, '7b78a866-78c9-4724-8b19-d309e2c3aeb2', 2, 10, 'https://i.ibb.co/3y4QJSWr/160-ao-somi-240-1-25a4065cb297483fa1da338259309219-1024x1024.jpg', 3190000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (269, '7b78a866-78c9-4724-8b19-d309e2c3aeb2', 3, 10, 'https://i.ibb.co/S4X0Mg0C/160-ao-somi-240-1-25a4065cb297483fa1da338259309219-1024x1024.jpg', 3190000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (270, '7b78a866-78c9-4724-8b19-d309e2c3aeb2', 4, 8, 'https://i.ibb.co/s9Yd63kw/160-ao-somi-240-7-1963689bf2bb40b892d724ade3eeb001-1024x1024.jpg', 3190000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (271, '7b78a866-78c9-4724-8b19-d309e2c3aeb2', 5, 8, 'https://i.ibb.co/4g8YVX68/160-ao-somi-240-7-1963689bf2bb40b892d724ade3eeb001-1024x1024.jpg', 3190000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (272, '7b78a866-78c9-4724-8b19-d309e2c3aeb2', 6, 8, 'https://i.ibb.co/8gb6jzfZ/160-ao-somi-240-7-1963689bf2bb40b892d724ade3eeb001-1024x1024.jpg', 3190000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (273, '1b309565-8b21-407f-8fed-9f1c4807b8f1', 1, 10, 'https://i.ibb.co/DDd4FyNz/160-short-jean-3m-2-aae9bf376c1c4b05bb54177f6161f93c-1024x1024.jpg', 3900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (274, '1b309565-8b21-407f-8fed-9f1c4807b8f1', 2, 10, 'https://i.ibb.co/sJpWwG2Y/160-short-jean-3m-2-aae9bf376c1c4b05bb54177f6161f93c-1024x1024.jpg', 3900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (275, '1b309565-8b21-407f-8fed-9f1c4807b8f1', 3, 10, 'https://i.ibb.co/WdPYYG6/160-short-jean-3m-2-aae9bf376c1c4b05bb54177f6161f93c-1024x1024.jpg', 3900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (276, '1b309565-8b21-407f-8fed-9f1c4807b8f1', 4, 3, 'https://i.ibb.co/XxYKHfMS/160-short-jean-3m-10-597c1d2de81844a8af6e0b3fb97df10f-1024x1024.jpg', 3900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (277, '1b309565-8b21-407f-8fed-9f1c4807b8f1', 5, 3, 'https://i.ibb.co/7JN3rxsy/160-short-jean-3m-10-597c1d2de81844a8af6e0b3fb97df10f-1024x1024.jpg', 3900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (278, '1b309565-8b21-407f-8fed-9f1c4807b8f1', 6, 3, 'https://i.ibb.co/RGy7r4tw/160-short-jean-3m-10-597c1d2de81844a8af6e0b3fb97df10f-1024x1024.jpg', 3900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (279, '211fdb78-13fb-446c-85ec-589333e8a628', 1, 12, 'https://i.ibb.co/TBXcghKs/vay-tang-dep-5.webp', 1000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (280, '211fdb78-13fb-446c-85ec-589333e8a628', 2, 12, 'https://i.ibb.co/bjccnTm6/vay-tang-dep-5.webp', 1000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (281, '211fdb78-13fb-446c-85ec-589333e8a628', 3, 12, 'https://i.ibb.co/fVHYZ7xc/vay-tang-dep-5.webp', 1000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (282, '211fdb78-13fb-446c-85ec-589333e8a628', 4, 7, 'https://i.ibb.co/jPNdt0c7/vay-tang-dep-19.webp', 1000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (283, '211fdb78-13fb-446c-85ec-589333e8a628', 6, 7, 'https://i.ibb.co/3yjt06S0/vay-tang-dep-19.webp', 1000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (284, '211fdb78-13fb-446c-85ec-589333e8a628', 5, 7, 'https://i.ibb.co/3yjt06S0/vay-tang-dep-19.webp', 1000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (285, '2f72a228-1e9a-4846-a736-04cbf8dfacd6', 1, 2, 'https://i.ibb.co/kVyjX84T/718ca66a3eaccb83c393297543d19661-resize-w900-nl.webp', 2690000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (286, '2f72a228-1e9a-4846-a736-04cbf8dfacd6', 2, 2, 'https://i.ibb.co/gLqcGBR0/718ca66a3eaccb83c393297543d19661-resize-w900-nl.webp', 2690000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (287, '2f72a228-1e9a-4846-a736-04cbf8dfacd6', 3, 2, 'https://i.ibb.co/675jZ7fP/718ca66a3eaccb83c393297543d19661-resize-w900-nl.webp', 2690000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (288, '2f72a228-1e9a-4846-a736-04cbf8dfacd6', 4, 10, 'https://i.ibb.co/HDjscbKf/86742bf94bbf7cec200350b993a4dcdb-resize-w900-nl.webp', 2690000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (289, '2f72a228-1e9a-4846-a736-04cbf8dfacd6', 5, 10, 'https://i.ibb.co/HpYWhcNB/86742bf94bbf7cec200350b993a4dcdb-resize-w900-nl.webp', 2690000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (290, '2f72a228-1e9a-4846-a736-04cbf8dfacd6', 6, 10, 'https://i.ibb.co/Q773hFNZ/86742bf94bbf7cec200350b993a4dcdb-resize-w900-nl.webp', 2690000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (291, 'c89d3191-7ffc-4ef1-bb01-e7711115bf4c', 1, 7, 'https://i.ibb.co/XgJVMmK/cc675a5f9f28d6d1dbfe4e9c92af8165-resize-w900-nl.webp', 2775230.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (292, 'c89d3191-7ffc-4ef1-bb01-e7711115bf4c', 2, 7, 'https://i.ibb.co/Fr0vnYg/cc675a5f9f28d6d1dbfe4e9c92af8165-resize-w900-nl.webp', 2775230.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (293, 'c89d3191-7ffc-4ef1-bb01-e7711115bf4c', 3, 7, 'https://i.ibb.co/spSvJLQw/cc675a5f9f28d6d1dbfe4e9c92af8165-resize-w900-nl.webp', 2775230.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (294, 'c89d3191-7ffc-4ef1-bb01-e7711115bf4c', 4, 10, 'https://i.ibb.co/b5GRnG23/015f1f29236e4476dec247e9071b59c6.webp', 2775230.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (295, 'c89d3191-7ffc-4ef1-bb01-e7711115bf4c', 5, 10, 'https://i.ibb.co/TxVwKcYT/015f1f29236e4476dec247e9071b59c6.webp', 2775230.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (296, 'c89d3191-7ffc-4ef1-bb01-e7711115bf4c', 6, 10, 'https://i.ibb.co/jvBnXSm9/015f1f29236e4476dec247e9071b59c6.webp', 2775230.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (297, '214cbcec-a0ae-41dc-92eb-a5a6c36bd073', 1, 10, 'https://i.ibb.co/20N6wyBq/res6d0b081306628aec2731da8ecb79e066fr.png', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (298, '214cbcec-a0ae-41dc-92eb-a5a6c36bd073', 2, 10, 'https://i.ibb.co/rRWmW4fL/res6d0b081306628aec2731da8ecb79e066fr.png', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (299, '214cbcec-a0ae-41dc-92eb-a5a6c36bd073', 3, 10, 'https://i.ibb.co/Ld2Rf8x1/res6d0b081306628aec2731da8ecb79e066fr.png', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (300, '214cbcec-a0ae-41dc-92eb-a5a6c36bd073', 4, 7, 'https://i.ibb.co/p6jcrnTD/resf7bc9d2fc7b7fb9dea29bc014b2969edfr.png', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (301, '214cbcec-a0ae-41dc-92eb-a5a6c36bd073', 5, 7, 'https://i.ibb.co/zTdgPBvp/resf7bc9d2fc7b7fb9dea29bc014b2969edfr.png', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (302, '214cbcec-a0ae-41dc-92eb-a5a6c36bd073', 6, 7, 'https://i.ibb.co/GQLKfP4y/resf7bc9d2fc7b7fb9dea29bc014b2969edfr.png', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (303, '7ed46c5f-14d0-464f-b556-4b1adedfd10d', 1, 4, 'https://i.ibb.co/xKqWCWsx/mau-quan-kaki-tui-hop-nam-1345-855.webp', 1250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (304, '7ed46c5f-14d0-464f-b556-4b1adedfd10d', 3, 4, 'https://i.ibb.co/Tx8fHZvK/mau-quan-kaki-tui-hop-nam-1345-855.webp', 1250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (305, '7ed46c5f-14d0-464f-b556-4b1adedfd10d', 2, 4, 'https://i.ibb.co/kVWtv7wg/mau-quan-kaki-tui-hop-nam-1345-855.webp', 1250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (306, '7ed46c5f-14d0-464f-b556-4b1adedfd10d', 4, 9, 'https://i.ibb.co/5xBDFytP/vi-sao-quan-kaki-tui-hop-nam-cao-cap-duoc-ua-chuong.webp', 1250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (327, '15b0d792-cb3d-4d3d-87c4-cf138d464594', 1, 9, 'https://i.ibb.co/FkWdbjpD/24-CMAW-QJ003-Den-3.jpg', 1300000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (307, '7ed46c5f-14d0-464f-b556-4b1adedfd10d', 5, 9, 'https://i.ibb.co/j9p26bX7/vi-sao-quan-kaki-tui-hop-nam-cao-cap-duoc-ua-chuong.webp', 1250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (308, '7ed46c5f-14d0-464f-b556-4b1adedfd10d', 6, 9, 'https://i.ibb.co/7tMqfYVM/vi-sao-quan-kaki-tui-hop-nam-cao-cap-duoc-ua-chuong.webp', 1250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (311, '5318360f-802c-4684-97b2-516616f56a82', 3, 9, 'https://i.ibb.co/Y4YXWRvw/5-den-vje11026.jpg', 900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (312, '5318360f-802c-4684-97b2-516616f56a82', 4, 16, 'https://i.ibb.co/pj81nmY7/5-be-vje11026.jpg', 900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (313, '5318360f-802c-4684-97b2-516616f56a82', 5, 16, 'https://i.ibb.co/3y5WmTzh/5-be-vje11026.jpg', 900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (314, '5318360f-802c-4684-97b2-516616f56a82', 6, 16, 'https://i.ibb.co/TMC80vgs/5-be-vje11026.jpg', 900000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (315, '2ff201ad-e170-4cdd-921c-b705c276ee27', 1, 10, 'https://i.ibb.co/rKFNkVvK/ao-hai-day-7cd8bd616674469da38fc5592330c668.webp', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (316, '2ff201ad-e170-4cdd-921c-b705c276ee27', 2, 10, 'https://i.ibb.co/qF0nKDDL/ao-hai-day-7cd8bd616674469da38fc5592330c668.webp', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (317, '2ff201ad-e170-4cdd-921c-b705c276ee27', 3, 10, 'https://i.ibb.co/LDv9mMPC/ao-hai-day-7cd8bd616674469da38fc5592330c668.webp', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (318, '2ff201ad-e170-4cdd-921c-b705c276ee27', 4, 9, 'https://i.ibb.co/XZZm9rMN/ao-hai-day-dep-ed3d986954a34acca39aa417467ee9b0.webp', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (319, '2ff201ad-e170-4cdd-921c-b705c276ee27', 5, 9, 'https://i.ibb.co/kTjtV61/ao-hai-day-dep-ed3d986954a34acca39aa417467ee9b0.webp', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (320, '2ff201ad-e170-4cdd-921c-b705c276ee27', 6, 9, 'https://i.ibb.co/hRsvwnFS/ao-hai-day-dep-ed3d986954a34acca39aa417467ee9b0.webp', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (321, '0e7f984f-9540-4a17-9aa3-9cb6cd993fe8', 1, 9, 'https://i.ibb.co/99bbgHX0/04786103800-1-p.jpg', 1050000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (322, '0e7f984f-9540-4a17-9aa3-9cb6cd993fe8', 2, 9, 'https://i.ibb.co/Q3ph4Ctb/04786103800-1-p.jpg', 1050000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (323, '0e7f984f-9540-4a17-9aa3-9cb6cd993fe8', 3, 9, 'https://i.ibb.co/8nmFj1Hq/04786103800-1-p.jpg', 1050000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (324, '0e7f984f-9540-4a17-9aa3-9cb6cd993fe8', 4, 3, 'https://i.ibb.co/jxVSDHY/02614369400-1-p.jpg', 1050000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (325, '0e7f984f-9540-4a17-9aa3-9cb6cd993fe8', 5, 3, 'https://i.ibb.co/vv4GQsWY/02614369400-1-p.jpg', 1050000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (326, '0e7f984f-9540-4a17-9aa3-9cb6cd993fe8', 6, 3, 'https://i.ibb.co/wrs7d3H7/02614369400-1-p.jpg', 1050000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (328, '15b0d792-cb3d-4d3d-87c4-cf138d464594', 2, 9, 'https://i.ibb.co/Rp894XPL/24-CMAW-QJ003-Den-3.jpg', 1300000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (329, '15b0d792-cb3d-4d3d-87c4-cf138d464594', 3, 9, 'https://i.ibb.co/bMvrBHSp/24-CMAW-QJ003-Den-3.jpg', 1300000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (330, '15b0d792-cb3d-4d3d-87c4-cf138d464594', 4, 4, 'https://i.ibb.co/DgQPm0y5/quan-jogger-ecc-warp-knitting-xanh-reu-2.webp', 1300000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (331, '15b0d792-cb3d-4d3d-87c4-cf138d464594', 5, 4, 'https://i.ibb.co/yFYKx7Gz/quan-jogger-ecc-warp-knitting-xanh-reu-2.webp', 1300000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (332, '15b0d792-cb3d-4d3d-87c4-cf138d464594', 6, 4, 'https://i.ibb.co/7dRJRDXB/quan-jogger-ecc-warp-knitting-xanh-reu-2.webp', 1300000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (333, 'edfd36c9-0c51-447d-ae88-2218fbefaa90', 1, 3, 'https://i.ibb.co/4nxRTd63/vay-yem-4.webp', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (334, 'edfd36c9-0c51-447d-ae88-2218fbefaa90', 2, 3, 'https://i.ibb.co/TMcCN51t/vay-yem-4.webp', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (335, 'edfd36c9-0c51-447d-ae88-2218fbefaa90', 3, 3, 'https://i.ibb.co/Jjth2YjL/vay-yem-4.webp', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (336, 'edfd36c9-0c51-447d-ae88-2218fbefaa90', 4, 9, 'https://i.ibb.co/GQM77HkN/vay-yem-1-e1636204906644.webp', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (337, 'edfd36c9-0c51-447d-ae88-2218fbefaa90', 5, 9, 'https://i.ibb.co/GQM77HkN/vay-yem-1-e1636204906644.webp', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (338, 'edfd36c9-0c51-447d-ae88-2218fbefaa90', 6, 9, 'https://i.ibb.co/G4N3FgTg/vay-yem-1-e1636204906644.webp', 1350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (339, '2e83611d-de60-4650-a5d6-911eea3102ef', 1, 9, 'https://i.ibb.co/j9xk4gfk/z4302386603701-04a2ded2497412a0c34ca04d0534b448-81d1e93de400401885481e4149da579e-grande.webp', 155000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (340, '2e83611d-de60-4650-a5d6-911eea3102ef', 2, 9, 'https://i.ibb.co/j9xk4gfk/z4302386603701-04a2ded2497412a0c34ca04d0534b448-81d1e93de400401885481e4149da579e-grande.webp', 155000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (341, '2e83611d-de60-4650-a5d6-911eea3102ef', 3, 9, 'https://i.ibb.co/DfJFByWh/z4302386603701-04a2ded2497412a0c34ca04d0534b448-81d1e93de400401885481e4149da579e-grande.webp', 155000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (342, '2e83611d-de60-4650-a5d6-911eea3102ef', 4, 10, 'https://i.ibb.co/DDyLx4r3/6143d9ace19290be0529d7febf60686d.jpg', 155000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (343, '2e83611d-de60-4650-a5d6-911eea3102ef', 5, 10, 'https://i.ibb.co/hFxDGbyw/6143d9ace19290be0529d7febf60686d.jpg', 155000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (344, '2e83611d-de60-4650-a5d6-911eea3102ef', 6, 10, 'https://i.ibb.co/WNCvcZ1C/6143d9ace19290be0529d7febf60686d.jpg', 155000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (345, '559291e6-380c-494c-ab1c-ec7ced7b8169', 1, 10, 'https://i.ibb.co/LXdZGPz1/ao-tweed-1.jpg', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (346, '559291e6-380c-494c-ab1c-ec7ced7b8169', 2, 10, 'https://i.ibb.co/Tqc8PgW8/ao-tweed-1.jpg', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (347, '559291e6-380c-494c-ab1c-ec7ced7b8169', 3, 10, 'https://i.ibb.co/BKFfy2j4/ao-tweed-1.jpg', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (348, '559291e6-380c-494c-ab1c-ec7ced7b8169', 4, 7, 'https://i.ibb.co/kbV6Sqy/ao-tweed-4.jpg', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (349, '559291e6-380c-494c-ab1c-ec7ced7b8169', 5, 7, 'https://i.ibb.co/RTzRRMxW/ao-tweed-4.jpg', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (350, '559291e6-380c-494c-ab1c-ec7ced7b8169', 6, 7, 'https://i.ibb.co/d0HyrLBM/ao-tweed-4.jpg', 2000000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (351, 'eaea7367-f097-47e5-8490-714311bbaa61', 1, 3, 'https://i.ibb.co/Y4H0yhMN/ao-thun-nu-tay-lo-form-rong-ca-tinh-chu.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (352, 'eaea7367-f097-47e5-8490-714311bbaa61', 2, 3, 'https://i.ibb.co/B54NjrRY/ao-thun-nu-tay-lo-form-rong-ca-tinh-chu.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (353, 'eaea7367-f097-47e5-8490-714311bbaa61', 3, 3, 'https://i.ibb.co/Y4H0yhMN/ao-thun-nu-tay-lo-form-rong-ca-tinh-chu.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (354, 'eaea7367-f097-47e5-8490-714311bbaa61', 4, 10, 'https://i.ibb.co/359bnYz6/ao-thun-nu-tay-lo-form-rong-ca-tinh.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (355, 'eaea7367-f097-47e5-8490-714311bbaa61', 5, 10, 'https://i.ibb.co/67wjBCj4/ao-thun-nu-tay-lo-form-rong-ca-tinh.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (113, '1422e857-9ff5-4f92-9ec3-746dbcda9d58', 4, 11, 'https://i.ibb.co/n85q7dFf/image-2025-03-26-103810439.png', 578000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (141, '7915da52-436f-438d-a61f-53917f2b41c4', 4, 3, 'https://i.ibb.co/SDxQhSGN/Maje-MFPBL00730-0201-F-P-1-1.webp', 102200.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (154, 'da1dc78e-d36f-489c-bb49-5b628ef4ad1c', 4, 10, 'https://i.ibb.co/FqHsNnv2/Maje-MFPOU01206-0130-F-P.webp', 1476000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (165, 'cdb65655-7c94-4522-9516-530d2761f91b', 4, 10, 'https://i.ibb.co/bj5WVt6r/Sandro-SFPJU01106-10-V-P-1-6.webp', 1141998.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (203, '01e8f17c-8a59-4c9a-a529-adb40ef77240', 3, 10, 'https://i.ibb.co/fVY90Yxh/FE62-MA2189-OI-11-P-01-1-6.webp', 2752000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (356, 'eaea7367-f097-47e5-8490-714311bbaa61', 6, 10, 'https://i.ibb.co/359bnYz6/ao-thun-nu-tay-lo-form-rong-ca-tinh.jpg', 1500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (357, '07b3b92f-4f32-4aaa-87fc-1f94379922b6', 1, 11, 'https://i.ibb.co/TxSCwVz8/shopping.webp', 139000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (358, '07b3b92f-4f32-4aaa-87fc-1f94379922b6', 2, 11, 'https://i.ibb.co/XrQ1XC5J/shopping.webp', 139000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (359, '07b3b92f-4f32-4aaa-87fc-1f94379922b6', 3, 11, 'https://i.ibb.co/Swcv0DxJ/shopping.webp', 149000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (360, '07b3b92f-4f32-4aaa-87fc-1f94379922b6', 1, 19, 'https://i.ibb.co/8DjkMyYK/shopping-1.webp', 139000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (361, '07b3b92f-4f32-4aaa-87fc-1f94379922b6', 2, 19, 'https://i.ibb.co/C31cQtPG/shopping-1.webp', 139000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (362, '07b3b92f-4f32-4aaa-87fc-1f94379922b6', 3, 19, 'https://i.ibb.co/RTPkMFFL/shopping-1.webp', 149000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (363, '82c8797c-32ed-44fc-808b-8e82a0f59c63', 1, 19, 'https://i.ibb.co/6RJyVJdQ/vn-11134207-7r98o-lkkz39xpf7o0fe-resize-w900-nl.webp', 259000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (364, '82c8797c-32ed-44fc-808b-8e82a0f59c63', 2, 19, 'https://i.ibb.co/yBpSxBNh/vn-11134207-7r98o-lkkz39xpf7o0fe-resize-w900-nl.webp', 259000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (365, '82c8797c-32ed-44fc-808b-8e82a0f59c63', 3, 19, 'https://i.ibb.co/zWP7Cw8S/vn-11134207-7r98o-lkkz39xpf7o0fe-resize-w900-nl.webp', 269000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (366, '82c8797c-32ed-44fc-808b-8e82a0f59c63', 4, 19, 'https://i.ibb.co/ccGbp2N2/vn-11134207-7r98o-lkkz39xpf7o0fe-resize-w900-nl.webp', 269000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (367, '82c8797c-32ed-44fc-808b-8e82a0f59c63', 5, 19, 'https://i.ibb.co/zhXHQFKn/vn-11134207-7r98o-lkkz39xpf7o0fe-resize-w900-nl.webp', 279000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (368, 'abf1d210-8f1e-4753-a6f6-54301c1e7e8b', 1, 10, 'https://i.ibb.co/fV8htRqk/vn-11134201-7qukw-leuuds58cbd6d0-resize-w900-nl.webp', 185000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (369, 'abf1d210-8f1e-4753-a6f6-54301c1e7e8b', 2, 10, 'https://i.ibb.co/wkt27Pc/vn-11134201-7qukw-leuuds58cbd6d0-resize-w900-nl.webp', 185000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (370, 'abf1d210-8f1e-4753-a6f6-54301c1e7e8b', 3, 10, 'https://i.ibb.co/5WQwb02s/vn-11134201-7qukw-leuuds58cbd6d0-resize-w900-nl.webp', 185000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (371, 'abf1d210-8f1e-4753-a6f6-54301c1e7e8b', 4, 10, 'https://i.ibb.co/WN8TXDJc/vn-11134201-7qukw-leuuds58cbd6d0-resize-w900-nl.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (372, 'abf1d210-8f1e-4753-a6f6-54301c1e7e8b', 1, 9, 'https://i.ibb.co/whjKvBfH/vn-11134207-7r98o-lnjk6cpd0sqib9-resize-w900-nl.webp', 185000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (373, 'abf1d210-8f1e-4753-a6f6-54301c1e7e8b', 2, 9, 'https://i.ibb.co/x8tgGSJy/vn-11134207-7r98o-lnjk6cpd0sqib9-resize-w900-nl.webp', 185000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (374, 'abf1d210-8f1e-4753-a6f6-54301c1e7e8b', 3, 9, 'https://i.ibb.co/spf6t2TN/vn-11134207-7r98o-lnjk6cpd0sqib9-resize-w900-nl.webp', 185000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (375, 'abf1d210-8f1e-4753-a6f6-54301c1e7e8b', 4, 9, 'https://i.ibb.co/YBQP0vjj/vn-11134207-7r98o-lnjk6cpd0sqib9-resize-w900-nl.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (376, '884017ca-050f-4734-9867-9abbcc69095f', 1, 9, 'https://i.ibb.co/yBgJ59Sw/vn-11134207-7ras8-m20bcuxshejib8-resize-w900-nl.webp', 135000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (377, '884017ca-050f-4734-9867-9abbcc69095f', 2, 9, 'https://i.ibb.co/VpYvXZXd/vn-11134207-7ras8-m20bcuxshejib8-resize-w900-nl.webp', 135000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (378, '884017ca-050f-4734-9867-9abbcc69095f', 3, 9, 'https://i.ibb.co/ymNwvRXk/vn-11134207-7ras8-m20bcuxshejib8-resize-w900-nl.webp', 139000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (379, '884017ca-050f-4734-9867-9abbcc69095f', 4, 9, 'https://i.ibb.co/vC8MYZ2Z/vn-11134207-7ras8-m20bcuxshejib8-resize-w900-nl.webp', 139000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (380, '9fb025b2-93f3-4b6f-b8c8-cf29b2afa1d3', 1, 10, 'https://i.ibb.co/CqcYK1L/358969-ao-len-co-lo-nu-thu-dong-1.jpg', 270000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (381, '9fb025b2-93f3-4b6f-b8c8-cf29b2afa1d3', 2, 10, 'https://i.ibb.co/PvPc1C4D/358969-ao-len-co-lo-nu-thu-dong-1.jpg', 275000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (382, '9fb025b2-93f3-4b6f-b8c8-cf29b2afa1d3', 3, 10, 'https://i.ibb.co/h1FNXYKF/358969-ao-len-co-lo-nu-thu-dong-1.jpg', 280000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (383, '9fb025b2-93f3-4b6f-b8c8-cf29b2afa1d3', 1, 11, 'https://i.ibb.co/TD91tGjG/358969-ao-len-co-lo-nu-thu-dong-2.jpg', 270000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (384, '9fb025b2-93f3-4b6f-b8c8-cf29b2afa1d3', 2, 11, 'https://i.ibb.co/9kjwR0Pp/358969-ao-len-co-lo-nu-thu-dong-2.jpg', 275000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (385, '9fb025b2-93f3-4b6f-b8c8-cf29b2afa1d3', 3, 11, 'https://i.ibb.co/bRbh8ssY/358969-ao-len-co-lo-nu-thu-dong-2.jpg', 280000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (386, '9fb025b2-93f3-4b6f-b8c8-cf29b2afa1d3', 1, 2, 'https://i.ibb.co/kswBJ8GB/358969-ao-len-co-lo-nu-thu-dong-3.jpg', 270000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (387, '9fb025b2-93f3-4b6f-b8c8-cf29b2afa1d3', 2, 2, 'https://i.ibb.co/hF6y9mh5/358969-ao-len-co-lo-nu-thu-dong-3.jpg', 275000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (388, '9fb025b2-93f3-4b6f-b8c8-cf29b2afa1d3', 3, 2, 'https://i.ibb.co/JfwxKfD/358969-ao-len-co-lo-nu-thu-dong-3.jpg', 280000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (389, '9fb025b2-93f3-4b6f-b8c8-cf29b2afa1d3', 1, 1, 'https://i.ibb.co/B2f7sk5T/358969-ao-len-co-lo-nu-thu-dong-4.jpg', 270000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (390, '9fb025b2-93f3-4b6f-b8c8-cf29b2afa1d3', 2, 1, 'https://i.ibb.co/MxDGDdXW/358969-ao-len-co-lo-nu-thu-dong-4.jpg', 275000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (391, '9fb025b2-93f3-4b6f-b8c8-cf29b2afa1d3', 3, 1, 'https://i.ibb.co/B011dmK/358969-ao-len-co-lo-nu-thu-dong-4.jpg', 280000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (392, '33a3f2e0-34a1-446f-ac8d-47cad6b02e2c', 1, 9, 'https://i.ibb.co/27YbKq3F/quannudongphuc17.webp', 290000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (393, '33a3f2e0-34a1-446f-ac8d-47cad6b02e2c', 2, 9, 'https://i.ibb.co/spsfQrHZ/quannudongphuc17.webp', 290000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (394, '33a3f2e0-34a1-446f-ac8d-47cad6b02e2c', 3, 9, 'https://i.ibb.co/N2FfQrw1/quannudongphuc17.webp', 290000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (395, '33a3f2e0-34a1-446f-ac8d-47cad6b02e2c', 4, 9, 'https://i.ibb.co/hFZ2LZjK/quannudongphuc17.webp', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (396, '33a3f2e0-34a1-446f-ac8d-47cad6b02e2c', 5, 9, 'https://i.ibb.co/fYpXKyTR/quannudongphuc17.webp', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (397, '33a3f2e0-34a1-446f-ac8d-47cad6b02e2c', 6, 9, 'https://i.ibb.co/fYkKQqGL/quannudongphuc17.webp', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (398, '577ba438-3c53-42fe-8e76-c6316a41ad2a', 1, 2, 'https://i.ibb.co/TMzk9rLm/shopping-2.webp', 550000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (399, '577ba438-3c53-42fe-8e76-c6316a41ad2a', 2, 2, 'https://i.ibb.co/xS5VSVrv/shopping-2.webp', 550000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (400, '577ba438-3c53-42fe-8e76-c6316a41ad2a', 3, 2, 'https://i.ibb.co/nqKQN5CF/shopping-2.webp', 550000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (401, '577ba438-3c53-42fe-8e76-c6316a41ad2a', 4, 2, 'https://i.ibb.co/cSv0hHxP/shopping-2.webp', 560000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (402, '577ba438-3c53-42fe-8e76-c6316a41ad2a', 5, 2, 'https://i.ibb.co/cc4QDdYR/shopping-2.webp', 560000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (403, '577ba438-3c53-42fe-8e76-c6316a41ad2a', 6, 2, 'https://i.ibb.co/sJgxqZ3m/shopping-2.webp', 560000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (404, 'ee5cd1d0-0fa2-443d-b1cd-7b1924d82eaf', 1, 22, 'https://i.ibb.co/WNCjG1xg/ao-bra-tap-gym-ab30029-vai-thun-co-gian-4-chieu-hong-s-p081031-6447737832939-25042023133016.webp', 239000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (405, 'ee5cd1d0-0fa2-443d-b1cd-7b1924d82eaf', 2, 22, 'https://i.ibb.co/v518Hck/ao-bra-tap-gym-ab30029-vai-thun-co-gian-4-chieu-hong-s-p081031-6447737832939-25042023133016.webp', 239000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (406, 'ee5cd1d0-0fa2-443d-b1cd-7b1924d82eaf', 3, 22, 'https://i.ibb.co/Qx2R3PQ/ao-bra-tap-gym-ab30029-vai-thun-co-gian-4-chieu-hong-s-p081031-6447737832939-25042023133016.webp', 239000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (407, 'ee5cd1d0-0fa2-443d-b1cd-7b1924d82eaf', 1, 10, 'https://i.ibb.co/gMZW88dP/ao-bra-tap-gym-ab30029-mau-trang-kem-jpg-1682404058-25042023132738.webp', 239000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (408, 'ee5cd1d0-0fa2-443d-b1cd-7b1924d82eaf', 2, 10, 'https://i.ibb.co/8D6bWPJ2/ao-bra-tap-gym-ab30029-mau-trang-kem-jpg-1682404058-25042023132738.webp', 239000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (409, 'ee5cd1d0-0fa2-443d-b1cd-7b1924d82eaf', 3, 10, 'https://i.ibb.co/pr4rnhSW/ao-bra-tap-gym-ab30029-mau-trang-kem-jpg-1682404058-25042023132738.webp', 239000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (410, 'de7e8253-967c-48c0-a769-c76576b90858', 1, 10, 'https://i.ibb.co/Q7BBR849/shopping-3.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (411, 'de7e8253-967c-48c0-a769-c76576b90858', 2, 10, 'https://i.ibb.co/kVNwPWx8/shopping-3.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (412, 'de7e8253-967c-48c0-a769-c76576b90858', 3, 10, 'https://i.ibb.co/HfbYHSmH/shopping-3.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (413, 'de7e8253-967c-48c0-a769-c76576b90858', 1, 7, 'https://i.ibb.co/Z1Jn1VfD/vn-11134207-7ras8-m1mfgx8lsy1fad-resize-w900-nl.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (414, 'de7e8253-967c-48c0-a769-c76576b90858', 2, 7, 'https://i.ibb.co/Fb1Y1VvD/vn-11134207-7ras8-m1mfgx8lsy1fad-resize-w900-nl.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (415, 'de7e8253-967c-48c0-a769-c76576b90858', 3, 7, 'https://i.ibb.co/LXGJR7M6/vn-11134207-7ras8-m1mfgx8lsy1fad-resize-w900-nl.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (416, 'de7e8253-967c-48c0-a769-c76576b90858', 1, 3, 'https://i.ibb.co/rGZ5vqXy/vn-11134207-7ras8-m1mfgx8lsy1fad-resize-w900-nl.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (417, 'de7e8253-967c-48c0-a769-c76576b90858', 2, 3, 'https://i.ibb.co/JFQb1RDw/vn-11134207-7ras8-m1mfgx8lsy1fad-resize-w900-nl.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (418, 'de7e8253-967c-48c0-a769-c76576b90858', 3, 3, 'https://i.ibb.co/5Xb1n5Mm/vn-11134207-7ras8-m1mfgx8lsy1fad-resize-w900-nl.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (419, 'adac3ca4-2933-47a0-8b48-ba1789ccbc73', 1, 3, 'https://i.ibb.co/QFVBjvxP/8d6182f48c14198aa20df0c218185b8a.webp', 158000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (420, 'adac3ca4-2933-47a0-8b48-ba1789ccbc73', 2, 3, 'https://i.ibb.co/SXLQKj9k/8d6182f48c14198aa20df0c218185b8a.webp', 158000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (421, 'adac3ca4-2933-47a0-8b48-ba1789ccbc73', 3, 3, 'https://i.ibb.co/Mxwdv6mM/8d6182f48c14198aa20df0c218185b8a.webp', 158000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (422, 'adac3ca4-2933-47a0-8b48-ba1789ccbc73', 4, 3, 'https://i.ibb.co/21qJgDhy/8d6182f48c14198aa20df0c218185b8a.webp', 168000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (423, 'b9996556-674e-448c-972a-5c69bbf0b5b7', 1, 9, 'https://i.ibb.co/LXN8bvsV/shopping-4.webp', 349000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (424, 'b9996556-674e-448c-972a-5c69bbf0b5b7', 2, 9, 'https://i.ibb.co/BV5zXWHy/shopping-4.webp', 349000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (425, 'b9996556-674e-448c-972a-5c69bbf0b5b7', 3, 9, 'https://i.ibb.co/DP3kzBtq/shopping-4.webp', 349000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (426, 'b9996556-674e-448c-972a-5c69bbf0b5b7', 4, 9, 'https://i.ibb.co/Q3kN6Gr0/shopping-4.webp', 359000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (427, 'b9996556-674e-448c-972a-5c69bbf0b5b7', 5, 9, 'https://i.ibb.co/cSvYh9bg/shopping-4.webp', 359000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (428, 'defa44c9-4940-424f-be58-9dd3d3fd0bfa', 1, 10, 'https://i.ibb.co/y1cgFZ5/hau08448-2e7639e62b8247f69255e45dc7d15e51-master.webp', 499000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (429, 'defa44c9-4940-424f-be58-9dd3d3fd0bfa', 2, 10, 'https://i.ibb.co/mVmqT4N7/hau08448-2e7639e62b8247f69255e45dc7d15e51-master.webp', 499000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (430, 'defa44c9-4940-424f-be58-9dd3d3fd0bfa', 3, 10, 'https://i.ibb.co/5Vrb3DG/hau08448-2e7639e62b8247f69255e45dc7d15e51-master.webp', 499000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (431, 'defa44c9-4940-424f-be58-9dd3d3fd0bfa', 4, 10, 'https://i.ibb.co/wr0c02py/hau08448-2e7639e62b8247f69255e45dc7d15e51-master.webp', 529000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (432, 'defa44c9-4940-424f-be58-9dd3d3fd0bfa', 5, 10, 'https://i.ibb.co/3J1G77M/hau08448-2e7639e62b8247f69255e45dc7d15e51-master.webp', 529000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (433, 'f1ee256d-e6b3-42ae-9b51-f726264a7b1c', 3, 23, 'https://i.ibb.co/6RHWJNzB/aa30d14b10a8b116c402fe1517b73b1d-resize-w900-nl.webp', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (434, 'f1ee256d-e6b3-42ae-9b51-f726264a7b1c', 4, 23, 'https://i.ibb.co/chMcw1kb/aa30d14b10a8b116c402fe1517b73b1d-resize-w900-nl.webp', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (435, 'f1ee256d-e6b3-42ae-9b51-f726264a7b1c', 5, 23, 'https://i.ibb.co/rKYxJ9fd/aa30d14b10a8b116c402fe1517b73b1d-resize-w900-nl.webp', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (436, 'f1ee256d-e6b3-42ae-9b51-f726264a7b1c', 3, 9, 'https://i.ibb.co/h1nxV27Y/40785dd99b8a2762b6fc94fb9f172863-resize-w900-nl.webp', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (437, 'f1ee256d-e6b3-42ae-9b51-f726264a7b1c', 4, 9, 'https://i.ibb.co/CpHbRq6v/40785dd99b8a2762b6fc94fb9f172863-resize-w900-nl.webp', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (438, 'f1ee256d-e6b3-42ae-9b51-f726264a7b1c', 5, 9, 'https://i.ibb.co/Q30nXddC/40785dd99b8a2762b6fc94fb9f172863-resize-w900-nl.webp', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (439, 'f1ee256d-e6b3-42ae-9b51-f726264a7b1c', 3, 10, 'https://i.ibb.co/CsHv6D48/3797da6dc68deebc97283c71fc224d1b-resize-w900-nl.webp', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (440, 'f1ee256d-e6b3-42ae-9b51-f726264a7b1c', 4, 10, 'https://i.ibb.co/Rpx0ySDt/3797da6dc68deebc97283c71fc224d1b-resize-w900-nl.webp', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (441, 'f1ee256d-e6b3-42ae-9b51-f726264a7b1c', 5, 10, 'https://i.ibb.co/qMsc18yb/3797da6dc68deebc97283c71fc224d1b-resize-w900-nl.webp', 325000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (442, '69aea3d9-ea29-4a1d-81ec-35536caf4bac', 2, 10, 'https://i.ibb.co/s4fGBwv/vn-11134207-7r98o-lz8miwhavcy548.webp', 230000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (443, '69aea3d9-ea29-4a1d-81ec-35536caf4bac', 3, 10, 'https://i.ibb.co/hx9Fb4PN/vn-11134207-7r98o-lz8miwhavcy548.webp', 230000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (444, '69aea3d9-ea29-4a1d-81ec-35536caf4bac', 4, 10, 'https://i.ibb.co/PvqrLZfM/vn-11134207-7r98o-lz8miwhavcy548.webp', 230000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (445, '69aea3d9-ea29-4a1d-81ec-35536caf4bac', 2, 9, 'https://i.ibb.co/DD1m4gF0/vn-11134207-7r98o-lz8miwhkpc2545.webp', 230000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (446, '69aea3d9-ea29-4a1d-81ec-35536caf4bac', 3, 9, 'https://i.ibb.co/PzhyFjny/vn-11134207-7r98o-lz8miwhkpc2545.webp', 230000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (447, '69aea3d9-ea29-4a1d-81ec-35536caf4bac', 2, 11, 'https://i.ibb.co/W4KTSD4j/vn-11134207-7r98o-lz8miwhkpcblc7.webp', 230000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (448, '69aea3d9-ea29-4a1d-81ec-35536caf4bac', 4, 11, 'https://i.ibb.co/r2my73qY/vn-11134207-7r98o-lz8miwhkpcblc7.webp', 230000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (449, '1719e5a0-1715-4391-a66d-fddc45f0ddf7', 2, 10, 'https://i.ibb.co/Z1JpVXjK/801228-ao-khoac-len-cardigan-nu-det-kim-1.jpg', 330000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (450, '1719e5a0-1715-4391-a66d-fddc45f0ddf7', 3, 10, 'https://i.ibb.co/pjvKpfJz/801228-ao-khoac-len-cardigan-nu-det-kim-1.jpg', 330000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (451, '1719e5a0-1715-4391-a66d-fddc45f0ddf7', 4, 10, 'https://i.ibb.co/nNy7T743/801228-ao-khoac-len-cardigan-nu-det-kim-1.jpg', 330000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (452, '1719e5a0-1715-4391-a66d-fddc45f0ddf7', 2, 9, 'https://i.ibb.co/ksRN6XC2/801228-ao-khoac-len-cardigan-nu-det-kim-2.jpg', 330000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (453, '1719e5a0-1715-4391-a66d-fddc45f0ddf7', 3, 9, 'https://i.ibb.co/N6BfFWHh/801228-ao-khoac-len-cardigan-nu-det-kim-2.jpg', 330000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (454, '1719e5a0-1715-4391-a66d-fddc45f0ddf7', 4, 9, 'https://i.ibb.co/tPYVBn0V/801228-ao-khoac-len-cardigan-nu-det-kim-2.jpg', 330000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (455, 'fbd3f0d3-23e7-4da7-a14f-3b24921d73bc', 1, 2, 'https://i.ibb.co/QF0fnW8Z/600x900-1-59557e053f664d64b17e2afd12f3d8e7.jpg', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (456, 'fbd3f0d3-23e7-4da7-a14f-3b24921d73bc', 2, 2, 'https://i.ibb.co/7t6B1bL6/600x900-1-59557e053f664d64b17e2afd12f3d8e7.jpg', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (457, 'fbd3f0d3-23e7-4da7-a14f-3b24921d73bc', 3, 2, 'https://i.ibb.co/fdbN7WMy/600x900-1-59557e053f664d64b17e2afd12f3d8e7.jpg', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (458, 'fbd3f0d3-23e7-4da7-a14f-3b24921d73bc', 1, 9, 'https://i.ibb.co/GvpbzFzw/600x900-136-ee91d3d7027e4abf8096b76fbee0668a.jpg', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (459, 'fbd3f0d3-23e7-4da7-a14f-3b24921d73bc', 2, 9, 'https://i.ibb.co/N2crbWGZ/600x900-136-ee91d3d7027e4abf8096b76fbee0668a.jpg', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (460, 'fbd3f0d3-23e7-4da7-a14f-3b24921d73bc', 3, 9, 'https://i.ibb.co/YBmt5LqM/600x900-136-ee91d3d7027e4abf8096b76fbee0668a.jpg', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (461, 'e26f83c9-8541-453f-bde2-7859649a7ba5', 1, 9, 'https://i.ibb.co/kVk11gXV/vn-11134207-7r98o-lt0hv1qmuh7d5e.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (462, 'e26f83c9-8541-453f-bde2-7859649a7ba5', 2, 9, 'https://i.ibb.co/TBr2Z1QY/vn-11134207-7r98o-lt0hv1qmuh7d5e.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (463, 'e26f83c9-8541-453f-bde2-7859649a7ba5', 3, 9, 'https://i.ibb.co/3Y5kVFtJ/vn-11134207-7r98o-lt0hv1qmuh7d5e.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (464, 'e26f83c9-8541-453f-bde2-7859649a7ba5', 1, 11, 'https://i.ibb.co/W4M3LGBW/vn-11134207-7r98o-lt0hv1qmngd5c2.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (465, 'e26f83c9-8541-453f-bde2-7859649a7ba5', 2, 11, 'https://i.ibb.co/HfQPX18X/vn-11134207-7r98o-lt0hv1qmngd5c2.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (466, 'e26f83c9-8541-453f-bde2-7859649a7ba5', 3, 11, 'https://i.ibb.co/4R9JxsnJ/vn-11134207-7r98o-lt0hv1qmngd5c2.webp', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (467, '6f944e1d-7c31-46b9-8194-bb4a8714c91f', 1, 11, 'https://i.ibb.co/3m9hR5GS/WVN021-K4-3-G01-chan-vay-1.webp', 399000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (468, '6f944e1d-7c31-46b9-8194-bb4a8714c91f', 2, 11, 'https://i.ibb.co/nq5FNHMH/WVN021-K4-3-G01-chan-vay-1.webp', 399000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (469, '6f944e1d-7c31-46b9-8194-bb4a8714c91f', 3, 11, 'https://i.ibb.co/fGKp1p9y/WVN021-K4-3-G01-chan-vay-1.webp', 399000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (470, '6f944e1d-7c31-46b9-8194-bb4a8714c91f', 4, 11, 'https://i.ibb.co/3yPr7jyd/WVN021-K4-3-G01-chan-vay-1.webp', 399000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (471, '6f944e1d-7c31-46b9-8194-bb4a8714c91f', 1, 8, 'https://i.ibb.co/YTJN4g6p/WVN021-K4-3-C03-chan-vay-1.webp', 399000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (472, '6f944e1d-7c31-46b9-8194-bb4a8714c91f', 2, 8, 'https://i.ibb.co/RpLH8C6W/WVN021-K4-3-C03-chan-vay-1.webp', 399000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (473, '6f944e1d-7c31-46b9-8194-bb4a8714c91f', 3, 8, 'https://i.ibb.co/SwWdJd5T/WVN021-K4-3-C03-chan-vay-1.webp', 399000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (474, '6f944e1d-7c31-46b9-8194-bb4a8714c91f', 4, 8, 'https://i.ibb.co/7NjSvHfX/WVN021-K4-3-C03-chan-vay-1.webp', 399000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (475, 'b41b8255-19cf-4e13-b4a3-a8baceb7f772', 2, 4, 'https://i.ibb.co/rKTc8pPD/vn-11134207-7r98o-lyn4pt506nxd97.png', 500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (476, 'b41b8255-19cf-4e13-b4a3-a8baceb7f772', 3, 4, 'https://i.ibb.co/8gh2GxPn/vn-11134207-7r98o-lyn4pt506nxd97.png', 500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (477, 'b41b8255-19cf-4e13-b4a3-a8baceb7f772', 4, 4, 'https://i.ibb.co/GQ7XSt52/vn-11134207-7r98o-lyn4pt506nxd97.png', 500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (478, 'b41b8255-19cf-4e13-b4a3-a8baceb7f772', 5, 4, 'https://i.ibb.co/hkkSLFg/vn-11134207-7r98o-lyn4pt506nxd97.png', 500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (479, 'b41b8255-19cf-4e13-b4a3-a8baceb7f772', 6, 4, 'https://i.ibb.co/Q73m2THK/vn-11134207-7r98o-lyn4pt506nxd97.png', 500000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (480, '4a55e546-048b-40a5-b9f0-7dd31664f91e', 1, 9, 'https://i.ibb.co/zTC4HvNq/406563134-324497350370818-4530687341378535682-n-1-1714705562184.webp', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (481, '4a55e546-048b-40a5-b9f0-7dd31664f91e', 2, 9, 'https://i.ibb.co/H1dtHwR/406563134-324497350370818-4530687341378535682-n-1-1714705562184.webp', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (482, '4a55e546-048b-40a5-b9f0-7dd31664f91e', 3, 9, 'https://i.ibb.co/ycwXtQSd/406563134-324497350370818-4530687341378535682-n-1-1714705562184.webp', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (483, '4a55e546-048b-40a5-b9f0-7dd31664f91e', 4, 9, 'https://i.ibb.co/WNPG60jh/406563134-324497350370818-4530687341378535682-n-1-1714705562184.webp', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (484, '4a11431a-ed35-4c0c-9a12-ba6a8a9bf12c', 2, 8, 'https://i.ibb.co/277PPV32/sg-11134201-7rdy5-m1giq7rp2vsmd9.webp', 569000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (485, '4a11431a-ed35-4c0c-9a12-ba6a8a9bf12c', 3, 8, 'https://i.ibb.co/GQByJSTz/sg-11134201-7rdy5-m1giq7rp2vsmd9.webp', 569000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (486, '4a11431a-ed35-4c0c-9a12-ba6a8a9bf12c', 4, 8, 'https://i.ibb.co/20064SQh/sg-11134201-7rdy5-m1giq7rp2vsmd9.webp', 569000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (487, '4a11431a-ed35-4c0c-9a12-ba6a8a9bf12c', 5, 8, 'https://i.ibb.co/W4gMSM72/sg-11134201-7rdy5-m1giq7rp2vsmd9.webp', 569000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (488, '4a11431a-ed35-4c0c-9a12-ba6a8a9bf12c', 2, 9, 'https://i.ibb.co/Y4g4mWHF/sg-11134201-7rdw5-m1giqgog1hum6e.webp', 569000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (489, '4a11431a-ed35-4c0c-9a12-ba6a8a9bf12c', 3, 9, 'https://i.ibb.co/3mWRhLkq/sg-11134201-7rdw5-m1giqgog1hum6e.webp', 569000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (490, '4a11431a-ed35-4c0c-9a12-ba6a8a9bf12c', 4, 9, 'https://i.ibb.co/zhDMCwSf/sg-11134201-7rdw5-m1giqgog1hum6e.webp', 569000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (491, '4a11431a-ed35-4c0c-9a12-ba6a8a9bf12c', 5, 9, 'https://i.ibb.co/4n9gs8KM/sg-11134201-7rdw5-m1giqgog1hum6e.webp', 569000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (492, '6a0c33f2-df2a-48d5-bbec-14bcd0507156', 2, 7, 'https://i.ibb.co/Z1R5wNBN/sg-11134201-7rbnl-lp8u0x6vvqwu93.webp', 250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (493, '6a0c33f2-df2a-48d5-bbec-14bcd0507156', 3, 7, 'https://i.ibb.co/6JbkKtjP/sg-11134201-7rbnl-lp8u0x6vvqwu93.webp', 250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (494, '6a0c33f2-df2a-48d5-bbec-14bcd0507156', 4, 7, 'https://i.ibb.co/GvNMt3Sb/sg-11134201-7rbnl-lp8u0x6vvqwu93.webp', 250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (495, '6a0c33f2-df2a-48d5-bbec-14bcd0507156', 5, 7, 'https://i.ibb.co/3YVLQdtV/sg-11134201-7rbnl-lp8u0x6vvqwu93.webp', 250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (496, '6a0c33f2-df2a-48d5-bbec-14bcd0507156', 2, 10, 'https://i.ibb.co/G4tWT7tJ/sg-11134201-7rbnj-lp8u0uxv6b5q6c.webp', 250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (497, '6a0c33f2-df2a-48d5-bbec-14bcd0507156', 3, 10, 'https://i.ibb.co/BHcQpHs4/sg-11134201-7rbnj-lp8u0uxv6b5q6c.webp', 250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (498, '6a0c33f2-df2a-48d5-bbec-14bcd0507156', 4, 10, 'https://i.ibb.co/KgFxg1F/sg-11134201-7rbnj-lp8u0uxv6b5q6c.webp', 250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (499, '6a0c33f2-df2a-48d5-bbec-14bcd0507156', 5, 10, 'https://i.ibb.co/yFFSJQXH/sg-11134201-7rbnj-lp8u0uxv6b5q6c.webp', 250000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (500, '0c89dc33-d903-456a-af2d-b239a9c6fcaa', 2, 9, 'https://i.ibb.co/DfFhrj9V/9ac3dac7ea6c04d368c4da851a6f9c9a.webp', 119000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (501, '0c89dc33-d903-456a-af2d-b239a9c6fcaa', 3, 9, 'https://i.ibb.co/Q7CY93CQ/9ac3dac7ea6c04d368c4da851a6f9c9a.webp', 119000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (502, '0c89dc33-d903-456a-af2d-b239a9c6fcaa', 4, 9, 'https://i.ibb.co/zW9C7hXv/9ac3dac7ea6c04d368c4da851a6f9c9a.webp', 129000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (503, '0c89dc33-d903-456a-af2d-b239a9c6fcaa', 2, 11, 'https://i.ibb.co/tTsHXNLw/bec61503d5c926362484ba9d4dfcb319.webp', 119000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (504, '0c89dc33-d903-456a-af2d-b239a9c6fcaa', 3, 11, 'https://i.ibb.co/fbnr1t0/bec61503d5c926362484ba9d4dfcb319.webp', 119000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (505, '0c89dc33-d903-456a-af2d-b239a9c6fcaa', 4, 11, 'https://i.ibb.co/7dq628qZ/bec61503d5c926362484ba9d4dfcb319.webp', 129000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (506, '0c89dc33-d903-456a-af2d-b239a9c6fcaa', 2, 10, 'https://i.ibb.co/Fqj8vCYT/ddedfab238cd3a98ddf529216ad5b68d.webp', 119000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (507, '0c89dc33-d903-456a-af2d-b239a9c6fcaa', 3, 10, 'https://i.ibb.co/4n6vpR2G/ddedfab238cd3a98ddf529216ad5b68d.webp', 119000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (508, '0c89dc33-d903-456a-af2d-b239a9c6fcaa', 4, 10, 'https://i.ibb.co/xqLfDdrX/ddedfab238cd3a98ddf529216ad5b68d.webp', 129000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (509, '29682969-b269-45ba-8cd6-340c477b12fb', 1, 9, 'https://i.ibb.co/Qv4WDNMb/1-58935b007dc447e48067f200630ef2e8-master.webp', 320000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (510, '29682969-b269-45ba-8cd6-340c477b12fb', 2, 9, 'https://i.ibb.co/3XHQPj5/1-58935b007dc447e48067f200630ef2e8-master.webp', 320000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (511, '29682969-b269-45ba-8cd6-340c477b12fb', 3, 9, 'https://i.ibb.co/ksXQq6gf/1-58935b007dc447e48067f200630ef2e8-master.webp', 320000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (512, '29682969-b269-45ba-8cd6-340c477b12fb', 4, 9, 'https://i.ibb.co/23rDGPMh/1-58935b007dc447e48067f200630ef2e8-master.webp', 320000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (513, '29682969-b269-45ba-8cd6-340c477b12fb', 5, 9, 'https://i.ibb.co/dJzM3rM7/1-58935b007dc447e48067f200630ef2e8-master.webp', 320000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (577, '6329e694-c528-46a0-b4cd-f1ee68cf8b23', 1, 8, 'https://i.ibb.co/BVkk8snZ/24.png', 262000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (514, '29682969-b269-45ba-8cd6-340c477b12fb', 6, 9, 'https://i.ibb.co/JjXXGZXd/1-58935b007dc447e48067f200630ef2e8-master.webp', 320000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (515, '251c1491-0bf9-414c-829e-fa252f16037e', 2, 10, 'https://i.ibb.co/6JGXFmnK/Sandro-SFPJU01351-10-F-3.webp', 6320000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (516, '251c1491-0bf9-414c-829e-fa252f16037e', 3, 10, 'https://i.ibb.co/v4gjYFbS/Sandro-SFPJU01351-10-F-3.webp', 6350000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (517, '251c1491-0bf9-414c-829e-fa252f16037e', 4, 10, 'https://i.ibb.co/0jQ5DbfC/Sandro-SFPJU01351-10-F-3.webp', 6370000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (518, 'ae583c6d-ecca-465b-8bac-1fe47ec306fc', 1, 7, 'https://i.ibb.co/CpWFNm24/vn-11134207-7r98o-lkkg7cmd0cfe9c.webp', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (519, 'ae583c6d-ecca-465b-8bac-1fe47ec306fc', 2, 7, 'https://i.ibb.co/6709NrzR/vn-11134207-7r98o-lkkg7cmd0cfe9c.webp', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (520, 'ae583c6d-ecca-465b-8bac-1fe47ec306fc', 3, 7, 'https://i.ibb.co/0pfJ2R31/vn-11134207-7r98o-lkkg7cmd0cfe9c.webp', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (521, 'ae583c6d-ecca-465b-8bac-1fe47ec306fc', 4, 7, 'https://i.ibb.co/GQkXGTyj/vn-11134207-7r98o-lkkg7cmd0cfe9c.webp', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (522, 'ae583c6d-ecca-465b-8bac-1fe47ec306fc', 5, 7, 'https://i.ibb.co/DDwhGpX5/vn-11134207-7r98o-lkkg7cmd0cfe9c.webp', 299000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (523, '591039af-57ad-4cd8-a082-1ccabb8ff889', 2, 8, 'https://i.ibb.co/45Rb03J/shopping-5.webp', 699000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (524, '591039af-57ad-4cd8-a082-1ccabb8ff889', 3, 8, 'https://i.ibb.co/6Jq53rBR/shopping-5.webp', 699000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (525, '591039af-57ad-4cd8-a082-1ccabb8ff889', 4, 8, 'https://i.ibb.co/gZXpkN08/shopping-5.webp', 699000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (526, '591039af-57ad-4cd8-a082-1ccabb8ff889', 5, 8, 'https://i.ibb.co/k6vYTbT7/shopping-5.webp', 699000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (527, '750b7fa5-f0df-45bc-8f9f-4c3f55d364c5', 2, 5, 'https://i.ibb.co/QFrhqGRR/2.png', 184000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (528, '750b7fa5-f0df-45bc-8f9f-4c3f55d364c5', 3, 8, 'https://i.ibb.co/k7PN3CB/1.png', 184000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (529, '750b7fa5-f0df-45bc-8f9f-4c3f55d364c5', 3, 5, 'https://i.ibb.co/QFrhqGRR/2.png', 184000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (530, '750b7fa5-f0df-45bc-8f9f-4c3f55d364c5', 5, 5, 'https://i.ibb.co/QFrhqGRR/2.png', 184000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (531, '750b7fa5-f0df-45bc-8f9f-4c3f55d364c5', 2, 8, 'https://i.ibb.co/k7PN3CB/1.png', 184000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (532, 'a7609ca5-2e02-46b0-9a9b-4d85b5b10180', 1, 3, 'https://i.ibb.co/bRXv5S8k/3.png', 224000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (533, 'a7609ca5-2e02-46b0-9a9b-4d85b5b10180', 2, 3, 'https://i.ibb.co/1Yn4y4Ch/4.png', 224000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (534, 'a7609ca5-2e02-46b0-9a9b-4d85b5b10180', 3, 3, 'https://i.ibb.co/8g8PZJG2/5.png', 224000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (535, 'a7609ca5-2e02-46b0-9a9b-4d85b5b10180', 4, 3, 'https://i.ibb.co/Pvn4WQg9/4.png', 224000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (536, 'a7609ca5-2e02-46b0-9a9b-4d85b5b10180', 5, 3, 'https://i.ibb.co/gLPWknjR/3.png', 224000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (537, '8ae50a79-4ab4-4f11-b6f6-3ede056b3861', 1, 9, 'https://i.ibb.co/kgX9973k/6.png', 49000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (538, '8ae50a79-4ab4-4f11-b6f6-3ede056b3861', 2, 9, 'https://i.ibb.co/1GXwJTdZ/6.png', 49000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (539, '8ae50a79-4ab4-4f11-b6f6-3ede056b3861', 3, 9, 'https://i.ibb.co/chTktcWT/6.png', 49000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (540, '8ae50a79-4ab4-4f11-b6f6-3ede056b3861', 4, 9, 'https://i.ibb.co/MyMpgbGb/6.png', 49000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (541, '6e9ea8ca-19c6-4336-a8e0-6e89f549ff86', 1, 1, 'https://i.ibb.co/2Bk5T43/7.png', 375000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (542, '6e9ea8ca-19c6-4336-a8e0-6e89f549ff86', 2, 1, 'https://i.ibb.co/sdT5bTX7/7.png', 375000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (543, '6e9ea8ca-19c6-4336-a8e0-6e89f549ff86', 3, 1, 'https://i.ibb.co/CpD56HmV/7.png', 375000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (544, '6e9ea8ca-19c6-4336-a8e0-6e89f549ff86', 1, 9, 'https://i.ibb.co/fzjSBsK6/8.png', 375000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (545, '6e9ea8ca-19c6-4336-a8e0-6e89f549ff86', 3, 9, 'https://i.ibb.co/p7MsXRx/8.png', 375000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (546, '00a18e32-8f07-4f14-8b1b-f53ea18c45c4', 5, 9, 'https://i.ibb.co/7tmP9wYC/9.png', 1679300.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (547, '00a18e32-8f07-4f14-8b1b-f53ea18c45c4', 6, 9, 'https://i.ibb.co/QvkysHqT/9.png', 1679300.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (548, '00a18e32-8f07-4f14-8b1b-f53ea18c45c4', 4, 9, 'https://i.ibb.co/PZr4pjHJ/9.png', 1679300.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (549, '00a18e32-8f07-4f14-8b1b-f53ea18c45c4', 4, 8, 'https://i.ibb.co/SZZKQ0v/10.png', 1679300.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (550, '00a18e32-8f07-4f14-8b1b-f53ea18c45c4', 5, 8, 'https://i.ibb.co/27nR5z6K/10.png', 1679300.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (551, '2c4bd4ca-9d10-456e-ab9c-b010c61e5e4e', 4, 9, 'https://i.ibb.co/GvfNXYTt/11.png', 300888.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (552, '2c4bd4ca-9d10-456e-ab9c-b010c61e5e4e', 3, 9, 'https://i.ibb.co/xS8zRYnG/11.png', 300888.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (553, '2c4bd4ca-9d10-456e-ab9c-b010c61e5e4e', 5, 9, 'https://i.ibb.co/GQL5LHzh/11.png', 300888.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (554, '2c4bd4ca-9d10-456e-ab9c-b010c61e5e4e', 4, 10, 'https://i.ibb.co/nNszgCbV/12.png', 300888.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (555, '634539a5-4e65-4c8b-82dd-c40eb5335e8e', 4, 9, 'https://i.ibb.co/zhR4bZVF/14.png', 145000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (556, '634539a5-4e65-4c8b-82dd-c40eb5335e8e', 5, 9, 'https://i.ibb.co/fVbvLJv7/14.png', 145000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (557, '634539a5-4e65-4c8b-82dd-c40eb5335e8e', 3, 11, 'https://i.ibb.co/JW3PvWR6/13.png', 145000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (558, '634539a5-4e65-4c8b-82dd-c40eb5335e8e', 5, 11, 'https://i.ibb.co/4ZTDpsh3/13.png', 145000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (559, '634539a5-4e65-4c8b-82dd-c40eb5335e8e', 2, 11, 'https://i.ibb.co/5W80fFkR/13.png', 145000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (560, 'd36fc981-b20a-4040-bb9b-c8713e83f794', 1, 10, 'https://i.ibb.co/Rpx10d9X/15.png', 113000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (561, 'd36fc981-b20a-4040-bb9b-c8713e83f794', 2, 10, 'https://i.ibb.co/PGW3W2w5/15.png', 113000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (562, 'd36fc981-b20a-4040-bb9b-c8713e83f794', 3, 10, 'https://i.ibb.co/BHmtsX97/15.png', 113000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (563, 'd36fc981-b20a-4040-bb9b-c8713e83f794', 1, 9, 'https://i.ibb.co/Df8kGWsS/16.png', 113000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (564, 'd36fc981-b20a-4040-bb9b-c8713e83f794', 3, 9, 'https://i.ibb.co/Dfq02TVk/16.png', 113000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (565, 'dd4d0170-74ef-4a34-8074-aa5195614516', 1, 9, 'https://i.ibb.co/gbBm3MFV/17.png', 380000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (566, 'dd4d0170-74ef-4a34-8074-aa5195614516', 2, 9, 'https://i.ibb.co/LXtJgy16/17.png', 380000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (567, 'dd4d0170-74ef-4a34-8074-aa5195614516', 1, 7, 'https://i.ibb.co/1G4pFWKn/18.png', 380000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (568, 'dd4d0170-74ef-4a34-8074-aa5195614516', 2, 7, 'https://i.ibb.co/HfyV6pcj/18.png', 380000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (569, 'c2fcd566-4584-4cdb-9179-97bdc4782386', 2, 10, 'https://i.ibb.co/CKN69t7Z/19.png', 138000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (570, 'c2fcd566-4584-4cdb-9179-97bdc4782386', 1, 10, 'https://i.ibb.co/Cs4h1cG3/20.png', 138000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (571, 'c2fcd566-4584-4cdb-9179-97bdc4782386', 4, 9, 'https://i.ibb.co/N6g4zyF5/21.png', 138000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (572, 'c2fcd566-4584-4cdb-9179-97bdc4782386', 3, 9, 'https://i.ibb.co/N2m3yTkJ/21.png', 138000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (573, 'c2fcd566-4584-4cdb-9179-97bdc4782386', 3, 10, 'https://i.ibb.co/GfTWkhtp/19.png', 138000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (574, '02c16f34-f5d2-4104-9704-93b2533b22f6', 1, 9, 'https://i.ibb.co/BKBwnZX2/22.png', 130000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (575, '02c16f34-f5d2-4104-9704-93b2533b22f6', 2, 9, 'https://i.ibb.co/jvhhMncc/22.png', 130000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (576, '02c16f34-f5d2-4104-9704-93b2533b22f6', 3, 9, 'https://i.ibb.co/rKYD8V4g/23.png', 130000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (578, '6329e694-c528-46a0-b4cd-f1ee68cf8b23', 2, 8, 'https://i.ibb.co/tT50wRqw/24.png', 262000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (579, '6329e694-c528-46a0-b4cd-f1ee68cf8b23', 3, 8, 'https://i.ibb.co/Pvx7qWwd/24.png', 262000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (580, '6329e694-c528-46a0-b4cd-f1ee68cf8b23', 4, 8, 'https://i.ibb.co/NgT4yKBj/25.png', 262000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (596, '864807b4-6990-4d46-9257-b6d61e08f5c6', 2, 9, 'https://i.ibb.co/8n0fVCXR/32.png', 252000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (597, '864807b4-6990-4d46-9257-b6d61e08f5c6', 3, 9, 'https://i.ibb.co/hRpwmqKN/32.png', 252000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (598, '864807b4-6990-4d46-9257-b6d61e08f5c6', 4, 9, 'https://i.ibb.co/VWTMyPXb/32.png', 252000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (599, '864807b4-6990-4d46-9257-b6d61e08f5c6', 3, 3, 'https://i.ibb.co/W4zfxV7D/33.png', 252000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (600, '864807b4-6990-4d46-9257-b6d61e08f5c6', 4, 3, 'https://i.ibb.co/gb738XKH/33.png', 252000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (581, '77b81ea0-172e-4c3e-bee7-b0cc44755f19', 1, 5, 'https://i.ibb.co/v6R7TVqG/26.png', 99000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (582, '77b81ea0-172e-4c3e-bee7-b0cc44755f19', 2, 5, 'https://i.ibb.co/GQdgcv7V/26.png', 99000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (583, '77b81ea0-172e-4c3e-bee7-b0cc44755f19', 3, 5, 'https://i.ibb.co/ksPrdfVw/26.png', 99000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (584, '77b81ea0-172e-4c3e-bee7-b0cc44755f19', 1, 4, 'https://i.ibb.co/M5srfB07/27.png', 99000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (585, '77b81ea0-172e-4c3e-bee7-b0cc44755f19', 2, 4, 'https://i.ibb.co/8Fn5Vpg/27.png', 99000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (586, 'a3595a6c-4db2-4632-aaba-aea9050a1cf0', 3, 9, 'https://i.ibb.co/xtL2dQVZ/28.png', 950000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (587, 'a3595a6c-4db2-4632-aaba-aea9050a1cf0', 4, 9, 'https://i.ibb.co/3mJNqCQ3/28.png', 950000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (588, 'a3595a6c-4db2-4632-aaba-aea9050a1cf0', 3, 11, 'https://i.ibb.co/yB4Tk694/29.png', 950000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (589, 'a3595a6c-4db2-4632-aaba-aea9050a1cf0', 4, 11, 'https://i.ibb.co/0pF5MSwY/29.png', 950000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (590, 'a3595a6c-4db2-4632-aaba-aea9050a1cf0', 5, 11, 'https://i.ibb.co/BHMqptJF/29.png', 950000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (606, '384fe950-3185-479f-806a-1fe5f0245447', 1, 6, 'https://i.ibb.co/prybDfVb/36.png', 649000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (607, '384fe950-3185-479f-806a-1fe5f0245447', 2, 6, 'https://i.ibb.co/LdcV2fW4/36.png', 649000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (608, '384fe950-3185-479f-806a-1fe5f0245447', 3, 6, 'https://i.ibb.co/DHCWg51K/36.png', 649000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (609, '384fe950-3185-479f-806a-1fe5f0245447', 4, 6, 'https://i.ibb.co/wh2VjygQ/36.png', 649000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (610, '384fe950-3185-479f-806a-1fe5f0245447', 5, 6, 'https://i.ibb.co/Q3Mqpn4N/36.png', 649000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (611, 'bbcd04bc-f47b-49fd-aad4-c8c2db72383a', 2, 8, 'https://i.ibb.co/0RqLPs1C/37.png', 399000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (612, 'bbcd04bc-f47b-49fd-aad4-c8c2db72383a', 3, 8, 'https://i.ibb.co/Pzxxt2k0/37.png', 399000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (613, 'bbcd04bc-f47b-49fd-aad4-c8c2db72383a', 2, 11, 'https://i.ibb.co/TBdSrtcS/38.png', 399000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (614, 'bbcd04bc-f47b-49fd-aad4-c8c2db72383a', 3, 11, 'https://i.ibb.co/Q3g5Qnkw/38.png', 399000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (591, '30c08de4-c0e7-45cb-aec4-db4bde17c3ab', 2, 10, 'https://i.ibb.co/LWzY3KX/30.png', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (592, '30c08de4-c0e7-45cb-aec4-db4bde17c3ab', 3, 10, 'https://i.ibb.co/wGQDNwb/30.png', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (593, '30c08de4-c0e7-45cb-aec4-db4bde17c3ab', 2, 9, 'https://i.ibb.co/M52Sqc9H/31.png', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (594, '30c08de4-c0e7-45cb-aec4-db4bde17c3ab', 4, 9, 'https://i.ibb.co/9m0KVNGc/31.png', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (595, '30c08de4-c0e7-45cb-aec4-db4bde17c3ab', 5, 9, 'https://i.ibb.co/JFStNyG2/31.png', 199000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (601, '6ef80eb5-2ee6-4930-9d32-f297e5ba970c', 3, 9, 'https://i.ibb.co/BKy06hkj/34.png', 69000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (602, '6ef80eb5-2ee6-4930-9d32-f297e5ba970c', 4, 9, 'https://i.ibb.co/prn7ZP3R/34.png', 69000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (603, '6ef80eb5-2ee6-4930-9d32-f297e5ba970c', 2, 9, 'https://i.ibb.co/H3X4VcK/34.png', 69000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (604, '6ef80eb5-2ee6-4930-9d32-f297e5ba970c', 2, 10, 'https://i.ibb.co/dssmQfnB/35.png', 69000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (605, '6ef80eb5-2ee6-4930-9d32-f297e5ba970c', 4, 10, 'https://i.ibb.co/jP4hhZyX/35.png', 69000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (615, 'f2b1fdc7-2ba1-4dac-9a72-998a83247e14', 1, 3, 'https://i.ibb.co/4nVKdS1T/39.png', 235000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (616, 'f2b1fdc7-2ba1-4dac-9a72-998a83247e14', 2, 3, 'https://i.ibb.co/cKxNnbDD/39.png', 235000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (617, 'f2b1fdc7-2ba1-4dac-9a72-998a83247e14', 3, 3, 'https://i.ibb.co/LD314pMb/39.png', 235000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (618, 'f2b1fdc7-2ba1-4dac-9a72-998a83247e14', 1, 8, 'https://i.ibb.co/GQ1JyD6M/40.png', 235000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (619, 'f2b1fdc7-2ba1-4dac-9a72-998a83247e14', 4, 8, 'https://i.ibb.co/WvpH3Z2n/40.png', 235000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (620, '0dffebc4-a339-419a-8468-d3041c93aeed', 3, 9, 'https://i.ibb.co/HLCr7gCq/41.png', 159000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (621, '0dffebc4-a339-419a-8468-d3041c93aeed', 4, 9, 'https://i.ibb.co/S7J0VgRW/41.png', 159000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (622, '0dffebc4-a339-419a-8468-d3041c93aeed', 5, 9, 'https://i.ibb.co/WWW226Dj/42.png', 159000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (623, '0dffebc4-a339-419a-8468-d3041c93aeed', 6, 9, 'https://i.ibb.co/ks9JzjSW/42.png', 159000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (624, '0dffebc4-a339-419a-8468-d3041c93aeed', 1, 9, 'https://i.ibb.co/zC0V8jk/42.png', 159000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (625, '635d8f68-d4d7-441a-aa96-68a18e4b2136', 2, 9, 'https://i.ibb.co/M4NkScb/43.png', 166000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (626, '635d8f68-d4d7-441a-aa96-68a18e4b2136', 1, 9, 'https://i.ibb.co/YF3y4MMP/43.png', 166000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (627, '635d8f68-d4d7-441a-aa96-68a18e4b2136', 1, 1, 'https://i.ibb.co/jPzpSGpc/44.png', 166000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (628, '635d8f68-d4d7-441a-aa96-68a18e4b2136', 3, 1, 'https://i.ibb.co/PSVMLKV/44.png', 166000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (629, '635d8f68-d4d7-441a-aa96-68a18e4b2136', 4, 7, 'https://i.ibb.co/G4XD7Xtm/45.png', 166000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (630, '635d8f68-d4d7-441a-aa96-68a18e4b2136', 2, 7, 'https://i.ibb.co/6c6Qp2NL/45.png', 166000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (631, 'e28e9c37-d55d-458f-89d7-e21727485d3f', 2, 9, 'https://i.ibb.co/nM8W2ZDJ/46.png', 529000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (632, 'e28e9c37-d55d-458f-89d7-e21727485d3f', 3, 9, 'https://i.ibb.co/1JsWRhzL/46.png', 529000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (633, 'e28e9c37-d55d-458f-89d7-e21727485d3f', 1, 9, 'https://i.ibb.co/gLwTrXTN/46.png', 529000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (634, 'e28e9c37-d55d-458f-89d7-e21727485d3f', 2, 7, 'https://i.ibb.co/tMgCQWtG/47.png', 529000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (635, 'e28e9c37-d55d-458f-89d7-e21727485d3f', 1, 7, 'https://i.ibb.co/vFqkwbX/47.png', 529000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (636, '39a06d7b-e026-4397-8e05-3bee26c22ead', 2, 10, 'https://i.ibb.co/svZcBgYF/48.png', 215250.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (637, '39a06d7b-e026-4397-8e05-3bee26c22ead', 1, 10, 'https://i.ibb.co/sd7fnZ2v/48.png', 215250.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (638, '39a06d7b-e026-4397-8e05-3bee26c22ead', 1, 3, 'https://i.ibb.co/3nyLPDf/49.png', 215250.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (639, '39a06d7b-e026-4397-8e05-3bee26c22ead', 2, 3, 'https://i.ibb.co/QvL7stvz/49.png', 215250.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (640, '39a06d7b-e026-4397-8e05-3bee26c22ead', 4, 3, 'https://i.ibb.co/gZZ6K4Dz/49.png', 215250.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (641, '3121a13a-b113-49bb-8fa3-1f2e4c5a5b0a', 3, 9, 'https://i.ibb.co/D3X5hy8/51.png', 79000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (642, '3121a13a-b113-49bb-8fa3-1f2e4c5a5b0a', 2, 9, 'https://i.ibb.co/1GnByw4g/50.png', 79000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (643, '3121a13a-b113-49bb-8fa3-1f2e4c5a5b0a', 4, 9, 'https://i.ibb.co/Z1FKt9Gm/50.png', 79000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (644, '3121a13a-b113-49bb-8fa3-1f2e4c5a5b0a', 1, 8, 'https://i.ibb.co/cKKzwHsy/51.png', 79000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (645, '3121a13a-b113-49bb-8fa3-1f2e4c5a5b0a', 2, 8, 'https://i.ibb.co/Q3cFYgYz/51.png', 79000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (646, 'a2e98027-f414-47ee-9a39-c64aca1419c7', 5, 4, 'https://i.ibb.co/23yfPYfH/freepik-minimalist-logo-unleashed-abstract-flowing-line-su-53659.jpg', 100000.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (647, 'dba0a531-2021-4ae9-8a96-ee795a8bdb61', 2, 4, 'https://i.ibb.co/1fcQCktB/20250312-110759.jpg', 1.00) ON CONFLICT DO NOTHING;
INSERT INTO public.variation (variation_id, product_id, size_id, color_id, variation_image, variation_price) VALUES (648, 'a2e98027-f414-47ee-9a39-c64aca1419c7', 1, 1, 'https://i.ibb.co/N6YnvWkt/cau1-drawio-1.png', 1.00) ON CONFLICT DO NOTHING;


--
-- TOC entry 5304 (class 0 OID 58051)
-- Dependencies: 284
-- Data for Name: variation_single; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (9, 'CHÂ434-BLACK-XXL-806850', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (10, 'CHÂ434-BLACK-XXL-590351', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (11, 'CHÂ434-BLACK-XXL-402204', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (12, 'ÁOK157-TEAL-XXL-628279', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (13, 'ÁOT109-RED-S-150683', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (14, 'ÁOK679-BLACK-M-932757', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (15, 'CHÂ434-TEAL-XXL-988079', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (16, 'CHÂ434-TEAL-XXL-372192', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (17, 'CHÂ434-TEAL-XXL-156154', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (18, 'ÁOK157-TEAL-XXXL-738497', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (19, 'ÁOK157-TEAL-XXXL-177612', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (20, 'ÁOD607-BLACK-XXL-883190', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (21, 'ÁOK157-TEAL-XXL-835395', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (22, 'ÁOK157-TEAL-XXL-815613', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (23, 'QUẦ920-NAVY-XL-338057', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (24, 'CHÂ154-GRAY-S-022405', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (25, 'ÁOK157-TEAL-XXL-307788', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (26, 'ÁOK157-TEAL-XXL-343359', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (27, 'ÁOK157-TEAL-XXL-568699', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (28, 'ÁOK157-TEAL-XXL-460459', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (29, 'ÁOK157-TEAL-XXL-974454', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (30, 'ÁOK157-TEAL-XXL-526086', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (31, 'ÁOK157-TEAL-XXL-363656', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (32, 'ÁOK157-TEAL-XXL-130671', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (33, 'ÁOK157-TEAL-XXL-766057', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (34, 'ÁOK157-TEAL-XXL-044774', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (35, 'ÁOK157-TEAL-XXL-871590', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (36, 'ÁOK157-TEAL-XXL-701579', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (37, 'ÁOK157-TEAL-XXL-570102', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (38, 'ÁOK157-TEAL-XXL-298324', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (39, 'ÁOK157-TEAL-XXL-717196', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (40, 'ÁOK157-TEAL-XXL-703375', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (41, 'ÁOK157-TEAL-XXL-540543', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (42, 'ÁOK157-TEAL-XXL-224674', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (43, 'ÁOK157-TEAL-XXL-715051', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (44, 'ÁOK157-TEAL-XXL-995025', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (45, 'ÁOK157-TEAL-XXL-691584', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (46, 'ÁOK157-TEAL-XXL-093874', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (47, 'ÁOK157-TEAL-XXL-986275', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (48, 'ÁOK157-TEAL-XXL-619646', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (49, 'ÁOK157-TEAL-XXL-913530', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (50, 'ÁOK157-TEAL-XXL-932391', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (51, 'ÁOK157-TEAL-XXL-412226', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (52, 'ÁOK157-TEAL-XXL-260159', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (53, 'ÁOK157-TEAL-XXL-020139', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (54, 'ÁOK157-TEAL-XXL-197797', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (55, 'ÁOK157-TEAL-XXL-735709', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (56, 'ÁOK157-TEAL-XXL-366647', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (57, 'ÁOK157-TEAL-XXL-919052', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (58, 'ÁOK157-TEAL-XXL-934694', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (59, 'ÁOK157-TEAL-XXL-933928', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (60, 'ÁOK157-TEAL-XXL-460752', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (61, 'ÁOK157-TEAL-XXL-700699', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (62, 'ÁOK157-TEAL-XXL-986100', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (63, 'ÁOK157-TEAL-XXL-912004', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (64, 'ÁOK157-TEAL-XXL-267185', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (65, 'ÁOK157-TEAL-XXL-846905', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (66, 'ÁOK157-TEAL-XXL-280478', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (67, 'ÁOK157-TEAL-XXL-386749', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (68, 'ÁOK157-TEAL-XXL-065900', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (69, 'ÁOK157-TEAL-XXL-924496', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (70, 'ÁOK157-TEAL-XXL-450100', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (71, 'ÁOK157-TEAL-XXL-306584', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (72, 'ÁOK157-TEAL-XXL-652268', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (73, 'ÁOK157-TEAL-XXL-995804', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (74, 'ÁOK157-TEAL-XXL-862220', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (75, 'ÁOK157-TEAL-XXL-761764', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (76, 'ÁOK157-TEAL-XXL-038633', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (77, 'ÁOK157-TEAL-XXL-310720', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (78, 'ÁOK157-TEAL-XXL-529795', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (79, 'ÁOK157-TEAL-XXL-579889', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (80, 'ÁOK157-TEAL-XXL-804915', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (81, 'ÁOK157-TEAL-XXL-927030', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (82, 'ÁOK157-TEAL-XXL-271918', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (83, 'ÁOK157-TEAL-XXL-870028', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (84, 'ÁOK157-TEAL-XXL-933770', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (85, 'ÁOK157-TEAL-XXL-505894', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (86, 'ÁOK157-TEAL-XXL-749473', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (87, 'ÁOK157-TEAL-XXL-185713', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (88, 'ÁOK157-TEAL-XXL-884197', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (89, 'ÁOK157-TEAL-XXL-318025', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (90, 'ÁOK157-TEAL-XXL-080505', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (91, 'ÁOK157-TEAL-XXL-177483', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (92, 'ĐẦM639-GRAY-M-703629', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (93, 'ÁOK157-TEAL-XXXL-117100', true) ON CONFLICT DO NOTHING;
INSERT INTO public.variation_single (variation_single_id, variation_single_code, is_variation_single_bought) VALUES (94, 'ÁOK157-TEAL-XXL-427696', true) ON CONFLICT DO NOTHING;


--
-- TOC entry 5307 (class 0 OID 58058)
-- Dependencies: 287
-- Data for Name: wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.wishlist (user_id, product_id) VALUES ('93b42024-4686-486d-b626-bd29589befbf', '49c158a0-180e-44aa-b60f-43a2c65fc9c6') ON CONFLICT DO NOTHING;


--
-- TOC entry 5344 (class 0 OID 0)
-- Dependencies: 218
-- Name: brand_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brand_brand_id_seq', 30, true);


--
-- TOC entry 5345 (class 0 OID 0)
-- Dependencies: 221
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 9, true);


--
-- TOC entry 5346 (class 0 OID 0)
-- Dependencies: 223
-- Name: chat_chat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_chat_id_seq', 1, false);


--
-- TOC entry 5347 (class 0 OID 0)
-- Dependencies: 225
-- Name: color_color_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.color_color_id_seq', 23, true);


--
-- TOC entry 5348 (class 0 OID 0)
-- Dependencies: 227
-- Name: comment_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comment_comment_id_seq', 13, true);


--
-- TOC entry 5349 (class 0 OID 0)
-- Dependencies: 230
-- Name: discount_discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discount_discount_id_seq', 9, true);


--
-- TOC entry 5350 (class 0 OID 0)
-- Dependencies: 232
-- Name: discount_status_discount_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discount_status_discount_status_id_seq', 3, true);


--
-- TOC entry 5351 (class 0 OID 0)
-- Dependencies: 234
-- Name: discount_type_discount_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discount_type_discount_type_id_seq', 2, true);


--
-- TOC entry 5352 (class 0 OID 0)
-- Dependencies: 236
-- Name: feedback_feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feedback_feedback_id_seq', 1, false);


--
-- TOC entry 5353 (class 0 OID 0)
-- Dependencies: 238
-- Name: message_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.message_message_id_seq', 1, false);


--
-- TOC entry 5354 (class 0 OID 0)
-- Dependencies: 240
-- Name: notification_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notification_notification_id_seq', 5, true);


--
-- TOC entry 5355 (class 0 OID 0)
-- Dependencies: 244
-- Name: order_status_order_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_status_order_status_id_seq', 6, true);


--
-- TOC entry 5356 (class 0 OID 0)
-- Dependencies: 247
-- Name: payment_method_payment_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_method_payment_method_id_seq', 4, true);


--
-- TOC entry 5357 (class 0 OID 0)
-- Dependencies: 251
-- Name: product_status_product_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_status_product_status_id_seq', 5, true);


--
-- TOC entry 5358 (class 0 OID 0)
-- Dependencies: 253
-- Name: provider_provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provider_provider_id_seq', 3, true);


--
-- TOC entry 5359 (class 0 OID 0)
-- Dependencies: 255
-- Name: rank_rank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rank_rank_id_seq', 5, true);


--
-- TOC entry 5360 (class 0 OID 0)
-- Dependencies: 257
-- Name: review_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.review_review_id_seq', 7, true);


--
-- TOC entry 5361 (class 0 OID 0)
-- Dependencies: 259
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_role_id_seq', 3, true);


--
-- TOC entry 5362 (class 0 OID 0)
-- Dependencies: 262
-- Name: sale_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sale_sale_id_seq', 9, true);


--
-- TOC entry 5363 (class 0 OID 0)
-- Dependencies: 264
-- Name: sale_status_sale_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sale_status_sale_status_id_seq', 3, true);


--
-- TOC entry 5364 (class 0 OID 0)
-- Dependencies: 266
-- Name: sale_type_sale_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sale_type_sale_type_id_seq', 2, true);


--
-- TOC entry 5365 (class 0 OID 0)
-- Dependencies: 268
-- Name: shipping_method_shipping_method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_method_shipping_method_id_seq', 2, true);


--
-- TOC entry 5366 (class 0 OID 0)
-- Dependencies: 270
-- Name: size_size_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.size_size_id_seq', 6, true);


--
-- TOC entry 5367 (class 0 OID 0)
-- Dependencies: 272
-- Name: stock_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_stock_id_seq', 1, false);


--
-- TOC entry 5368 (class 0 OID 0)
-- Dependencies: 275
-- Name: topic_topic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.topic_topic_id_seq', 6, true);


--
-- TOC entry 5369 (class 0 OID 0)
-- Dependencies: 277
-- Name: transaction_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_transaction_id_seq', 211, true);


--
-- TOC entry 5370 (class 0 OID 0)
-- Dependencies: 279
-- Name: transaction_type_transaction_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_type_transaction_type_id_seq', 2, true);


--
-- TOC entry 5371 (class 0 OID 0)
-- Dependencies: 285
-- Name: variation_single_variation_single_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.variation_single_variation_single_id_seq', 94, true);


--
-- TOC entry 5372 (class 0 OID 0)
-- Dependencies: 286
-- Name: variation_variation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.variation_variation_id_seq', 648, true);


--
-- TOC entry 4964 (class 2606 OID 58093)
-- Name: brand brand_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (brand_id);


--
-- TOC entry 4966 (class 2606 OID 58095)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (user_id, variation_id);


--
-- TOC entry 4968 (class 2606 OID 58097)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- TOC entry 4970 (class 2606 OID 58099)
-- Name: chat chat_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_pkey PRIMARY KEY (chat_id);


--
-- TOC entry 4972 (class 2606 OID 58101)
-- Name: color color_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.color
    ADD CONSTRAINT color_pkey PRIMARY KEY (color_id);


--
-- TOC entry 4974 (class 2606 OID 58103)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (comment_id);


--
-- TOC entry 4976 (class 2606 OID 58105)
-- Name: discount discount_code_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT discount_code_unique UNIQUE (discount_code) INCLUDE (discount_code);


--
-- TOC entry 4978 (class 2606 OID 58107)
-- Name: discount discount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT discount_pkey PRIMARY KEY (discount_id);


--
-- TOC entry 4980 (class 2606 OID 58109)
-- Name: discount_status discount_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_status
    ADD CONSTRAINT discount_status_pkey PRIMARY KEY (discount_status_id);


--
-- TOC entry 4982 (class 2606 OID 58111)
-- Name: discount_type discount_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount_type
    ADD CONSTRAINT discount_type_pkey PRIMARY KEY (discount_type_id);


--
-- TOC entry 4984 (class 2606 OID 58113)
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (feedback_id);


--
-- TOC entry 4986 (class 2606 OID 58115)
-- Name: message message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_pkey PRIMARY KEY (message_id);


--
-- TOC entry 4988 (class 2606 OID 58117)
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (notification_id);


--
-- TOC entry 4990 (class 2606 OID 58119)
-- Name: order order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4992 (class 2606 OID 58121)
-- Name: order_status order_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (order_status_id);


--
-- TOC entry 4994 (class 2606 OID 58123)
-- Name: order_variation_single order_variation_single_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_variation_single
    ADD CONSTRAINT order_variation_single_pkey PRIMARY KEY (order_id, variation_single_id);


--
-- TOC entry 4996 (class 2606 OID 58125)
-- Name: payment_method payment_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_method
    ADD CONSTRAINT payment_method_pkey PRIMARY KEY (payment_method_id);


--
-- TOC entry 4998 (class 2606 OID 58127)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- TOC entry 5000 (class 2606 OID 58129)
-- Name: product_status product_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_status
    ADD CONSTRAINT product_status_pkey PRIMARY KEY (product_status_id);


--
-- TOC entry 5002 (class 2606 OID 58131)
-- Name: provider provider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provider
    ADD CONSTRAINT provider_pkey PRIMARY KEY (provider_id);


--
-- TOC entry 5004 (class 2606 OID 58133)
-- Name: rank rank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rank
    ADD CONSTRAINT rank_pkey PRIMARY KEY (rank_id);


--
-- TOC entry 5006 (class 2606 OID 58135)
-- Name: review review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (review_id);


--
-- TOC entry 5008 (class 2606 OID 58137)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- TOC entry 5010 (class 2606 OID 58139)
-- Name: sale sale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (sale_id);


--
-- TOC entry 5012 (class 2606 OID 58141)
-- Name: sale_product sale_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_product
    ADD CONSTRAINT sale_product_pkey PRIMARY KEY (sale_id, product_id);


--
-- TOC entry 5014 (class 2606 OID 58143)
-- Name: sale_status sale_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_status
    ADD CONSTRAINT sale_status_pkey PRIMARY KEY (sale_status_id);


--
-- TOC entry 5016 (class 2606 OID 58145)
-- Name: sale_type sale_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_type
    ADD CONSTRAINT sale_type_pkey PRIMARY KEY (sale_type_id);


--
-- TOC entry 5018 (class 2606 OID 58147)
-- Name: shipping_method shipping_method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_method
    ADD CONSTRAINT shipping_method_pkey PRIMARY KEY (shipping_method_id);


--
-- TOC entry 5020 (class 2606 OID 58149)
-- Name: size size_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.size
    ADD CONSTRAINT size_pkey PRIMARY KEY (size_id);


--
-- TOC entry 5022 (class 2606 OID 58151)
-- Name: stock stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock
    ADD CONSTRAINT stock_pkey PRIMARY KEY (stock_id);


--
-- TOC entry 5024 (class 2606 OID 58153)
-- Name: stock_variation stock_variation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_variation
    ADD CONSTRAINT stock_variation_pkey PRIMARY KEY (stock_id, variation_id);


--
-- TOC entry 5026 (class 2606 OID 58155)
-- Name: topic topic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.topic
    ADD CONSTRAINT topic_pkey PRIMARY KEY (topic_id);


--
-- TOC entry 5028 (class 2606 OID 58157)
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (transaction_id);


--
-- TOC entry 5030 (class 2606 OID 58159)
-- Name: transaction_type transaction_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_type
    ADD CONSTRAINT transaction_type_pkey PRIMARY KEY (transaction_type_id);


--
-- TOC entry 5034 (class 2606 OID 58161)
-- Name: user_discount user_discount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_discount
    ADD CONSTRAINT user_discount_pkey PRIMARY KEY (discount_id, user_id);


--
-- TOC entry 5032 (class 2606 OID 58163)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- TOC entry 5036 (class 2606 OID 58165)
-- Name: user_rank user_rank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_rank
    ADD CONSTRAINT user_rank_pkey PRIMARY KEY (user_id);


--
-- TOC entry 5038 (class 2606 OID 58167)
-- Name: variation variation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variation
    ADD CONSTRAINT variation_pkey PRIMARY KEY (variation_id);


--
-- TOC entry 5040 (class 2606 OID 58169)
-- Name: variation_single variation_single_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variation_single
    ADD CONSTRAINT variation_single_pkey PRIMARY KEY (variation_single_id);


--
-- TOC entry 5041 (class 2606 OID 58170)
-- Name: cart cart_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- TOC entry 5042 (class 2606 OID 58175)
-- Name: cart cart_variation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_variation_id_fkey FOREIGN KEY (variation_id) REFERENCES public.variation(variation_id);


--
-- TOC entry 5043 (class 2606 OID 58180)
-- Name: chat chat_user_id_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat
    ADD CONSTRAINT chat_user_id_1_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- TOC entry 5045 (class 2606 OID 58185)
-- Name: comment_parent comment_parent_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_parent
    ADD CONSTRAINT comment_parent_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.comment(comment_id);


--
-- TOC entry 5046 (class 2606 OID 58190)
-- Name: comment_parent comment_parent_comment_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment_parent
    ADD CONSTRAINT comment_parent_comment_parent_id_fkey FOREIGN KEY (comment_parent_id) REFERENCES public.comment(comment_id);


--
-- TOC entry 5044 (class 2606 OID 58195)
-- Name: comment comment_review_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.review(review_id);


--
-- TOC entry 5047 (class 2606 OID 58200)
-- Name: discount discount_discount_rank_requirement_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT discount_discount_rank_requirement_fkey FOREIGN KEY (discount_rank_requirement) REFERENCES public.rank(rank_id);


--
-- TOC entry 5048 (class 2606 OID 58205)
-- Name: discount discount_discount_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT discount_discount_status_id_fkey FOREIGN KEY (discount_status_id) REFERENCES public.discount_status(discount_status_id);


--
-- TOC entry 5049 (class 2606 OID 58210)
-- Name: discount discount_discount_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discount
    ADD CONSTRAINT discount_discount_type_id_fkey FOREIGN KEY (discount_type_id) REFERENCES public.discount_type(discount_type_id);


--
-- TOC entry 5050 (class 2606 OID 58215)
-- Name: feedback feedback_topic_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topic(topic_id);


--
-- TOC entry 5051 (class 2606 OID 58225)
-- Name: message message_chat_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_chat_id_fkey FOREIGN KEY (chat_id) REFERENCES public.chat(chat_id);


--
-- TOC entry 5052 (class 2606 OID 58230)
-- Name: message message_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT message_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public."user"(user_id);


--
-- TOC entry 5053 (class 2606 OID 58235)
-- Name: notification notification_user_id_sender_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_user_id_sender_fkey FOREIGN KEY (user_id_sender) REFERENCES public."user"(user_id);


--
-- TOC entry 5054 (class 2606 OID 58240)
-- Name: notification_user notification_user_notification_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_user
    ADD CONSTRAINT notification_user_notification_id_fkey FOREIGN KEY (notification_id) REFERENCES public.notification(notification_id);


--
-- TOC entry 5055 (class 2606 OID 58245)
-- Name: notification_user notification_user_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notification_user
    ADD CONSTRAINT notification_user_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- TOC entry 5056 (class 2606 OID 58250)
-- Name: order order_discount_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_discount_id_fkey FOREIGN KEY (discount_id) REFERENCES public.discount(discount_id);


--
-- TOC entry 5057 (class 2606 OID 58255)
-- Name: order order_incharge_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_incharge_employee_id_fkey FOREIGN KEY (incharge_employee_id) REFERENCES public."user"(user_id) NOT VALID;


--
-- TOC entry 5058 (class 2606 OID 58260)
-- Name: order order_order_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_order_status_id_fkey FOREIGN KEY (order_status_id) REFERENCES public.order_status(order_status_id);


--
-- TOC entry 5059 (class 2606 OID 58265)
-- Name: order order_payment_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_payment_method_id_fkey FOREIGN KEY (payment_method_id) REFERENCES public.payment_method(payment_method_id);


--
-- TOC entry 5060 (class 2606 OID 58270)
-- Name: order order_shipping_method_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_shipping_method_id_fkey FOREIGN KEY (shipping_method_id) REFERENCES public.shipping_method(shipping_method_id);


--
-- TOC entry 5061 (class 2606 OID 58275)
-- Name: order order_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."order"
    ADD CONSTRAINT order_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- TOC entry 5062 (class 2606 OID 58280)
-- Name: order_variation_single order_variation_single_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_variation_single
    ADD CONSTRAINT order_variation_single_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(order_id);


--
-- TOC entry 5063 (class 2606 OID 58285)
-- Name: order_variation_single order_variation_single_variation_single_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_variation_single
    ADD CONSTRAINT order_variation_single_variation_single_id_fkey FOREIGN KEY (variation_single_id) REFERENCES public.variation_single(variation_single_id);


--
-- TOC entry 5064 (class 2606 OID 58290)
-- Name: product product_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brand(brand_id);


--
-- TOC entry 5066 (class 2606 OID 58295)
-- Name: product_category product_category_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id);


--
-- TOC entry 5067 (class 2606 OID 58300)
-- Name: product_category product_category_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_category
    ADD CONSTRAINT product_category_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- TOC entry 5065 (class 2606 OID 58305)
-- Name: product product_product_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_product_status_id_fkey FOREIGN KEY (product_status_id) REFERENCES public.product_status(product_status_id);


--
-- TOC entry 5068 (class 2606 OID 58310)
-- Name: review review_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_order_id_fkey FOREIGN KEY (order_id) REFERENCES public."order"(order_id);


--
-- TOC entry 5069 (class 2606 OID 58315)
-- Name: review review_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- TOC entry 5070 (class 2606 OID 58320)
-- Name: review review_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- TOC entry 5073 (class 2606 OID 58325)
-- Name: sale_product sale_product_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_product
    ADD CONSTRAINT sale_product_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- TOC entry 5074 (class 2606 OID 58330)
-- Name: sale_product sale_product_sale_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale_product
    ADD CONSTRAINT sale_product_sale_id_fkey FOREIGN KEY (sale_id) REFERENCES public.sale(sale_id);


--
-- TOC entry 5071 (class 2606 OID 58335)
-- Name: sale sale_sale_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_sale_status_id_fkey FOREIGN KEY (sale_status_id) REFERENCES public.sale_status(sale_status_id);


--
-- TOC entry 5072 (class 2606 OID 58340)
-- Name: sale sale_sale_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_sale_type_id_fkey FOREIGN KEY (sale_type_id) REFERENCES public.sale_type(sale_type_id);


--
-- TOC entry 5075 (class 2606 OID 58345)
-- Name: stock_variation stock_variation_stock_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_variation
    ADD CONSTRAINT stock_variation_stock_id_fkey FOREIGN KEY (stock_id) REFERENCES public.stock(stock_id);


--
-- TOC entry 5076 (class 2606 OID 58350)
-- Name: stock_variation stock_variation_variation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_variation
    ADD CONSTRAINT stock_variation_variation_id_fkey FOREIGN KEY (variation_id) REFERENCES public.variation(variation_id);


--
-- TOC entry 5077 (class 2606 OID 58355)
-- Name: transaction transaction_incharge_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_incharge_employee_id_fkey FOREIGN KEY (incharge_employee_id) REFERENCES public."user"(user_id);


--
-- TOC entry 5078 (class 2606 OID 58360)
-- Name: transaction transaction_provider_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_provider_id_fkey FOREIGN KEY (provider_id) REFERENCES public.provider(provider_id);


--
-- TOC entry 5079 (class 2606 OID 58365)
-- Name: transaction transaction_stock_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_stock_id_fkey FOREIGN KEY (stock_id) REFERENCES public.stock(stock_id);


--
-- TOC entry 5080 (class 2606 OID 58370)
-- Name: transaction transaction_transaction_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_transaction_type_id_fkey FOREIGN KEY (transaction_type_id) REFERENCES public.transaction_type(transaction_type_id);


--
-- TOC entry 5081 (class 2606 OID 58375)
-- Name: transaction transaction_variation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_variation_id_fkey FOREIGN KEY (variation_id) REFERENCES public.variation(variation_id);


--
-- TOC entry 5083 (class 2606 OID 58380)
-- Name: user_discount user_discount_discount_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_discount
    ADD CONSTRAINT user_discount_discount_id_fkey FOREIGN KEY (discount_id) REFERENCES public.discount(discount_id);


--
-- TOC entry 5084 (class 2606 OID 58385)
-- Name: user_discount user_discount_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_discount
    ADD CONSTRAINT user_discount_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


--
-- TOC entry 5085 (class 2606 OID 58390)
-- Name: user_rank user_rank_rank_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_rank
    ADD CONSTRAINT user_rank_rank_id_fkey FOREIGN KEY (rank_id) REFERENCES public.rank(rank_id) NOT VALID;


--
-- TOC entry 5086 (class 2606 OID 58395)
-- Name: user_rank user_rank_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_rank
    ADD CONSTRAINT user_rank_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id) NOT VALID;


--
-- TOC entry 5082 (class 2606 OID 58400)
-- Name: user user_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.role(role_id);


--
-- TOC entry 5087 (class 2606 OID 58405)
-- Name: variation variation_color_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variation
    ADD CONSTRAINT variation_color_id_fkey FOREIGN KEY (color_id) REFERENCES public.color(color_id);


--
-- TOC entry 5088 (class 2606 OID 58410)
-- Name: variation variation_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variation
    ADD CONSTRAINT variation_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- TOC entry 5089 (class 2606 OID 58415)
-- Name: variation variation_size_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variation
    ADD CONSTRAINT variation_size_id_fkey FOREIGN KEY (size_id) REFERENCES public.size(size_id);


--
-- TOC entry 5090 (class 2606 OID 58420)
-- Name: wishlist wishlist_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- TOC entry 5091 (class 2606 OID 58425)
-- Name: wishlist wishlist_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id);


-- Completed on 2025-08-09 21:10:12

--
-- PostgreSQL database dump complete
--

