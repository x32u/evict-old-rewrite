--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-0ubuntu0.24.04.1)

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.access_tokens (
    user_id bigint,
    refresh_token text
);


ALTER TABLE public.access_tokens OWNER TO postgres;

--
-- Name: afk; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.afk (
    guild_id bigint,
    user_id bigint,
    reason text,
    "time" timestamp with time zone
);


ALTER TABLE public.afk OWNER TO postgres;

--
-- Name: aliases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aliases (
    guild_id bigint NOT NULL,
    command text NOT NULL,
    alias text NOT NULL
);


ALTER TABLE public.aliases OWNER TO postgres;

--
-- Name: anti_join; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.anti_join (
    guild_id bigint,
    rate integer
);


ALTER TABLE public.anti_join OWNER TO postgres;

--
-- Name: antinuke; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.antinuke (
    guild_id bigint,
    configured text,
    owner_id bigint,
    whitelisted jsonb,
    admins jsonb,
    logs bigint
);


ALTER TABLE public.antinuke OWNER TO postgres;

--
-- Name: antinuke_modules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.antinuke_modules (
    guild_id bigint,
    module text,
    punishment text,
    threshold integer
);


ALTER TABLE public.antinuke_modules OWNER TO postgres;

--
-- Name: antispam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.antispam (
    guild_id bigint,
    rate integer,
    timeout bigint,
    users text,
    channels text
);


ALTER TABLE public.antispam OWNER TO postgres;

--
-- Name: api_key; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_key (
    key text,
    user_id bigint,
    role text
);


ALTER TABLE public.api_key OWNER TO postgres;

--
-- Name: archive; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archive (
    guild_id bigint NOT NULL,
    channel_id bigint NOT NULL
);


ALTER TABLE public.archive OWNER TO postgres;

--
-- Name: archive_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archive_category (
    guild_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.archive_category OWNER TO postgres;

--
-- Name: authorize; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authorize (
    guild_id bigint,
    user_id bigint,
    till timestamp with time zone,
    transfers integer
);


ALTER TABLE public.authorize OWNER TO postgres;

--
-- Name: autopfp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autopfp (
    guild_id bigint NOT NULL,
    type text NOT NULL,
    category text NOT NULL,
    channel_id bigint
);


ALTER TABLE public.autopfp OWNER TO postgres;

--
-- Name: autoping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autoping (
    guild_id bigint NOT NULL,
    channel_id bigint NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.autoping OWNER TO postgres;

--
-- Name: autoreact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autoreact (
    guild_id bigint NOT NULL,
    trigger text NOT NULL,
    reactions text NOT NULL
);


ALTER TABLE public.autoreact OWNER TO postgres;

--
-- Name: autoreacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autoreacts (
    guild_id bigint NOT NULL,
    trigger text NOT NULL,
    reaction text NOT NULL
);


ALTER TABLE public.autoreacts OWNER TO postgres;

--
-- Name: autoresponder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autoresponder (
    guild_id bigint,
    trigger text,
    response text,
    strict boolean DEFAULT true
);


ALTER TABLE public.autoresponder OWNER TO postgres;

--
-- Name: autorole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autorole (
    guild_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.autorole OWNER TO postgres;

--
-- Name: avatar_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avatar_history (
    user_id text NOT NULL,
    name text,
    avatars text,
    background text
);


ALTER TABLE public.avatar_history OWNER TO postgres;

--
-- Name: avatar_urls; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avatar_urls (
    user_id bigint,
    token text,
    data bytea
);


ALTER TABLE public.avatar_urls OWNER TO postgres;

--
-- Name: avatars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.avatars (
    user_id bigint NOT NULL,
    name text NOT NULL,
    avatar text NOT NULL,
    key text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL
);


ALTER TABLE public.avatars OWNER TO postgres;

--
-- Name: bday; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bday (
    user_id bigint,
    month integer,
    day integer
);


ALTER TABLE public.bday OWNER TO postgres;

--
-- Name: birthday; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.birthday (
    user_id bigint,
    bday timestamp with time zone,
    said text
);


ALTER TABLE public.birthday OWNER TO postgres;

--
-- Name: blacklist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blacklist (
    id bigint NOT NULL,
    type text NOT NULL
);


ALTER TABLE public.blacklist OWNER TO postgres;

--
-- Name: boost; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boost (
    guild_id bigint,
    channel_id bigint,
    message text
);


ALTER TABLE public.boost OWNER TO postgres;

--
-- Name: booster_module; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booster_module (
    guild_id bigint,
    base bigint
);


ALTER TABLE public.booster_module OWNER TO postgres;

--
-- Name: booster_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booster_roles (
    guild_id bigint,
    user_id bigint,
    role_id bigint
);


ALTER TABLE public.booster_roles OWNER TO postgres;

--
-- Name: br_award; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.br_award (
    guild_id bigint,
    role_id bigint
);


ALTER TABLE public.br_award OWNER TO postgres;

--
-- Name: bumpreminder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bumpreminder (
    guild_id bigint,
    channel_id bigint,
    user_id bigint,
    thankyou text,
    reminder text,
    "time" timestamp with time zone
);


ALTER TABLE public.bumpreminder OWNER TO postgres;

--
-- Name: confess; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.confess (
    guild_id bigint,
    channel_id bigint,
    confession integer
);


ALTER TABLE public.confess OWNER TO postgres;

--
-- Name: confess_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.confess_members (
    guild_id bigint,
    user_id bigint,
    confession integer
);


ALTER TABLE public.confess_members OWNER TO postgres;

--
-- Name: confess_mute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.confess_mute (
    guild_id bigint,
    user_id bigint
);


ALTER TABLE public.confess_mute OWNER TO postgres;

--
-- Name: counters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.counters (
    guild_id bigint,
    channel_type text,
    channel_id bigint,
    channel_name text,
    module text
);


ALTER TABLE public.counters OWNER TO postgres;

--
-- Name: disablecmd; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disablecmd (
    guild_id bigint,
    cmd text
);


ALTER TABLE public.disablecmd OWNER TO postgres;

--
-- Name: disablemodule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disablemodule (
    guild_id bigint NOT NULL,
    module text NOT NULL
);


ALTER TABLE public.disablemodule OWNER TO postgres;

--
-- Name: donor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.donor (
    user_id bigint,
    since bigint,
    status text
);


ALTER TABLE public.donor OWNER TO postgres;

--
-- Name: economy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.economy (
    user_id bigint,
    cash double precision,
    card double precision,
    daily bigint,
    dice bigint
);


ALTER TABLE public.economy OWNER TO postgres;

--
-- Name: error_codes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.error_codes (
    code character varying(30) NOT NULL,
    info json
);


ALTER TABLE public.error_codes OWNER TO postgres;

--
-- Name: fake_perms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fake_perms (
    guild_id bigint,
    role_id bigint,
    perms text
);


ALTER TABLE public.fake_perms OWNER TO postgres;

--
-- Name: filter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filter (
    guild_id bigint,
    mode text,
    rule_id bigint
);


ALTER TABLE public.filter OWNER TO postgres;

--
-- Name: force_nick; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.force_nick (
    guild_id bigint,
    user_id bigint,
    nickname text
);


ALTER TABLE public.force_nick OWNER TO postgres;

--
-- Name: gamestats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gamestats (
    user_id bigint,
    game text,
    wins integer,
    loses integer,
    total integer
);


ALTER TABLE public.gamestats OWNER TO postgres;

--
-- Name: give_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.give_roles (
    guild_id bigint,
    role_id bigint
);


ALTER TABLE public.give_roles OWNER TO postgres;

--
-- Name: giveaway; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.giveaway (
    guild_id bigint,
    channel_id bigint,
    message_id bigint,
    winners integer,
    members text,
    finish timestamp with time zone,
    host bigint,
    title text
);


ALTER TABLE public.giveaway OWNER TO postgres;

--
-- Name: global_disabled_cmds; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.global_disabled_cmds (
    cmd character varying(30) NOT NULL,
    disabled boolean,
    disabled_by text
);


ALTER TABLE public.global_disabled_cmds OWNER TO postgres;

--
-- Name: globalban; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.globalban (
    user_id bigint,
    reason text
);


ALTER TABLE public.globalban OWNER TO postgres;

--
-- Name: gw_ended; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gw_ended (
    channel_id bigint,
    message_id bigint,
    members text
);


ALTER TABLE public.gw_ended OWNER TO postgres;

--
-- Name: hardban; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hardban (
    guild_id bigint NOT NULL,
    user_id bigint NOT NULL,
    reason text,
    moderator_id bigint NOT NULL
);


ALTER TABLE public.hardban OWNER TO postgres;

--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    id text,
    url text
);


ALTER TABLE public.images OWNER TO postgres;

--
-- Name: imgonly; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imgonly (
    guild_id bigint NOT NULL,
    channel_id bigint NOT NULL
);


ALTER TABLE public.imgonly OWNER TO postgres;

--
-- Name: invoke; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.invoke (
    guild_id bigint,
    command text,
    embed text
);


ALTER TABLE public.invoke OWNER TO postgres;

--
-- Name: jail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jail (
    guild_id bigint,
    channel_id bigint,
    role_id bigint
);


ALTER TABLE public.jail OWNER TO postgres;

--
-- Name: jail_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jail_members (
    guild_id bigint NOT NULL,
    user_id bigint NOT NULL,
    roles text,
    jailed_at timestamp with time zone
);


ALTER TABLE public.jail_members OWNER TO postgres;

--
-- Name: lastfm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lastfm (
    user_id bigint,
    username text
);


ALTER TABLE public.lastfm OWNER TO postgres;

--
-- Name: lastfm_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lastfm_users (
    id integer,
    discord_user_id bigint,
    username character varying(255),
    session_key character varying(255)
);


ALTER TABLE public.lastfm_users OWNER TO postgres;

--
-- Name: lastfmcc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lastfmcc (
    user_id bigint,
    command text
);


ALTER TABLE public.lastfmcc OWNER TO postgres;

--
-- Name: leave; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leave (
    guild_id bigint,
    channel_id bigint,
    message text
);


ALTER TABLE public.leave OWNER TO postgres;

--
-- Name: level_rewards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.level_rewards (
    guild_id bigint,
    level integer,
    role_id bigint
);


ALTER TABLE public.level_rewards OWNER TO postgres;

--
-- Name: level_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.level_user (
    guild_id bigint,
    user_id bigint,
    xp integer,
    level integer,
    target_xp bigint
);


ALTER TABLE public.level_user OWNER TO postgres;

--
-- Name: leveling; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leveling (
    guild_id bigint,
    channel_id bigint,
    message text,
    booster_boost text
);


ALTER TABLE public.leveling OWNER TO postgres;

--
-- Name: lfmode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lfmode (
    user_id bigint,
    mode text
);


ALTER TABLE public.lfmode OWNER TO postgres;

--
-- Name: lfreactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lfreactions (
    user_id bigint,
    reactions text
);


ALTER TABLE public.lfreactions OWNER TO postgres;

--
-- Name: lock_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lock_role (
    guild_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.lock_role OWNER TO postgres;

--
-- Name: lockdown_ignore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lockdown_ignore (
    guild_id bigint NOT NULL,
    channel_id bigint NOT NULL
);


ALTER TABLE public.lockdown_ignore OWNER TO postgres;

--
-- Name: logging; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logging (
    guild_id bigint NOT NULL,
    messages bigint,
    guild bigint,
    roles bigint,
    channels bigint,
    members bigint
);


ALTER TABLE public.logging OWNER TO postgres;

--
-- Name: logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs (
    key text NOT NULL,
    guild_id bigint NOT NULL,
    channel_id bigint NOT NULL,
    author jsonb DEFAULT '{}'::jsonb NOT NULL,
    logs jsonb DEFAULT '{}'::jsonb NOT NULL
);


ALTER TABLE public.logs OWNER TO postgres;

--
-- Name: marry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marry (
    author bigint,
    soulmate bigint,
    "time" bigint
);


ALTER TABLE public.marry OWNER TO postgres;

--
-- Name: number_counter; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.number_counter (
    guild_id bigint NOT NULL,
    channel_id bigint NOT NULL,
    last_counted bigint,
    current_number integer
);


ALTER TABLE public.number_counter OWNER TO postgres;

--
-- Name: opened_tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.opened_tickets (
    guild_id bigint,
    channel_id bigint,
    user_id bigint
);


ALTER TABLE public.opened_tickets OWNER TO postgres;

--
-- Name: prefixes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prefixes (
    guild_id bigint NOT NULL,
    prefix text
);


ALTER TABLE public.prefixes OWNER TO postgres;

--
-- Name: reactionrole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reactionrole (
    guild_id bigint,
    channel_id bigint,
    message_id bigint,
    emoji text,
    role_id bigint
);


ALTER TABLE public.reactionrole OWNER TO postgres;

--
-- Name: reminder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reminder (
    user_id bigint,
    channel_id bigint,
    guild_id bigint,
    date timestamp with time zone,
    task text
);


ALTER TABLE public.reminder OWNER TO postgres;

--
-- Name: reskin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reskin (
    user_id bigint,
    toggled boolean,
    name text,
    avatar text
);


ALTER TABLE public.reskin OWNER TO postgres;

--
-- Name: reskin_enabled; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reskin_enabled (
    guild_id bigint
);


ALTER TABLE public.reskin_enabled OWNER TO postgres;

--
-- Name: reskin_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reskin_user (
    user_id bigint,
    toggled boolean,
    name text,
    avatar text
);


ALTER TABLE public.reskin_user OWNER TO postgres;

--
-- Name: restore; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restore (
    guild_id bigint NOT NULL,
    user_id bigint NOT NULL,
    roles text
);


ALTER TABLE public.restore OWNER TO postgres;

--
-- Name: restrictcommand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restrictcommand (
    guild_id bigint NOT NULL,
    command text NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.restrictcommand OWNER TO postgres;

--
-- Name: seen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seen (
    user_id bigint,
    guild_id bigint,
    "time" timestamp with time zone
);


ALTER TABLE public.seen OWNER TO postgres;

--
-- Name: selfprefix; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.selfprefix (
    user_id bigint NOT NULL,
    prefix text
);


ALTER TABLE public.selfprefix OWNER TO postgres;

--
-- Name: spotify; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.spotify (
    user_id bigint,
    access_token text
);


ALTER TABLE public.spotify OWNER TO postgres;

--
-- Name: starboard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.starboard (
    guild_id bigint,
    channel_id bigint,
    emoji text,
    count integer,
    role_id bigint
);


ALTER TABLE public.starboard OWNER TO postgres;

--
-- Name: starboard_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.starboard_messages (
    guild_id bigint,
    channel_id bigint,
    message_id bigint,
    starboard_message_id bigint
);


ALTER TABLE public.starboard_messages OWNER TO postgres;

--
-- Name: stickymessage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stickymessage (
    guild_id bigint NOT NULL,
    channel_id bigint NOT NULL,
    message text NOT NULL
);


ALTER TABLE public.stickymessage OWNER TO postgres;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    guild_id bigint NOT NULL,
    author_id bigint NOT NULL,
    name text NOT NULL,
    response text NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: ticket_topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket_topics (
    guild_id bigint,
    name text,
    description text
);


ALTER TABLE public.ticket_topics OWNER TO postgres;

--
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tickets (
    guild_id bigint,
    open_embed text,
    category_id bigint,
    logs bigint,
    support_id bigint
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- Name: timezone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timezone (
    user_id bigint,
    zone text
);


ALTER TABLE public.timezone OWNER TO postgres;

--
-- Name: trial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trial (
    guild_id bigint NOT NULL,
    end_date integer
);


ALTER TABLE public.trial OWNER TO postgres;

--
-- Name: trials; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trials (
    guild_id bigint NOT NULL,
    expires bigint NOT NULL
);


ALTER TABLE public.trials OWNER TO postgres;

--
-- Name: username_track; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.username_track (
    guild_id bigint,
    webhook_url text
);


ALTER TABLE public.username_track OWNER TO postgres;

--
-- Name: usernames; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usernames (
    user_id bigint,
    user_name text,
    "time" bigint
);


ALTER TABLE public.usernames OWNER TO postgres;

--
-- Name: uwu_lock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uwu_lock (
    guild_id bigint,
    user_id bigint
);


ALTER TABLE public.uwu_lock OWNER TO postgres;

--
-- Name: vcs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vcs (
    user_id bigint,
    voice bigint
);


ALTER TABLE public.vcs OWNER TO postgres;

--
-- Name: vm_buttons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vm_buttons (
    guild_id bigint,
    action text,
    label text,
    emoji text,
    style text
);


ALTER TABLE public.vm_buttons OWNER TO postgres;

--
-- Name: voicemaster; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voicemaster (
    guild_id bigint,
    channel_id bigint,
    interface_id bigint
);


ALTER TABLE public.voicemaster OWNER TO postgres;

--
-- Name: warns; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.warns (
    guild_id bigint,
    user_id bigint,
    author_id bigint,
    "time" text,
    reason text
);


ALTER TABLE public.warns OWNER TO postgres;

--
-- Name: webhook; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.webhook (
    guild_id bigint,
    code text,
    url text,
    channel text,
    name text,
    avatar text
);


ALTER TABLE public.webhook OWNER TO postgres;

--
-- Name: welcome; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.welcome (
    guild_id bigint,
    channel_id bigint,
    message text
);


ALTER TABLE public.welcome OWNER TO postgres;

--
-- Name: whitelist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.whitelist (
    guild_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.whitelist OWNER TO postgres;

--
-- Name: whitelist_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.whitelist_state (
    guild_id bigint NOT NULL,
    embed text
);


ALTER TABLE public.whitelist_state OWNER TO postgres;

--
-- Name: xray; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.xray (
    guild_id bigint,
    target_id bigint,
    webhook_url text
);


ALTER TABLE public.xray OWNER TO postgres;

--
-- Data for Name: access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.access_tokens (user_id, refresh_token) FROM stdin;
\.


--
-- Data for Name: afk; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.afk (guild_id, user_id, reason, "time") FROM stdin;
\.


--
-- Data for Name: aliases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aliases (guild_id, command, alias) FROM stdin;
1254536563186991184	antinuke giverole	gr
1254536563186991184	an	
1254536563186991184	antinuke massmention	mm
1254536563186991184	antinuke giverole	gr
1254536563186991184	an kick	k
1254536563186991184	antinuke ban	b
1254536563186991184	antinuke botadd	ba
1254536563186991184	antinuke channeldelete	cd
1254536563186991184	an channelcreate	cc
1254536563186991184	copyembed	ec
1202055026797707316	mute	m
1202055026797707316	mute	to
1202055026797707316	mute	tout
1202055026797707316	kick	k
1202055026797707316	warn	wa
1202055026797707316	ban	b
1202055026797707316	av	pfp
1202055026797707316	banner	bnr
1202055026797707316	sbanner	sbnr
\.


--
-- Data for Name: anti_join; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.anti_join (guild_id, rate) FROM stdin;
\.


--
-- Data for Name: antinuke; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.antinuke (guild_id, configured, owner_id, whitelisted, admins, logs) FROM stdin;
1254536563186991184	true	1169601140804042842	[1047630662133350470]	[1047630662133350470]	1269685507198287893
1202055026797707316	true	1208370307551989761	[1157111422598250577]	\N	\N
1273788483336667191	true	1210027683938041876	\N	\N	\N
1088761100503371839	true	595239050273619969	\N	\N	\N
1274119155431379045	true	1169280230830129162	\N	\N	\N
1231607483030569030	true	1244565854692184096	\N	\N	\N
\.


--
-- Data for Name: antinuke_modules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.antinuke_modules (guild_id, module, punishment, threshold) FROM stdin;
1254536563186991184	role giving	strip	0
1254536563186991184	mass mention	strip	\N
1254536563186991184	kick	kick	20
1254536563186991184	ban	kick	20
1254536563186991184	bot add	strip	\N
1254536563186991184	channel delete	strip	15
1254536563186991184	role delete	strip	15
1254536563186991184	spammer	kick	\N
1254536563186991184	channel create	ban	15
1254536563186991184	new accounts	kick	604800
1202055026797707316	role delete	strip	1
1202055026797707316	ban	strip	10
1202055026797707316	channel create	strip	1
1202055026797707316	role create	strip	1
\.


--
-- Data for Name: antispam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.antispam (guild_id, rate, timeout, users, channels) FROM stdin;
\.


--
-- Data for Name: api_key; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_key (key, user_id, role) FROM stdin;
04ced35d-34ab-4094-86b2-6b7e45f8ab83	598125772754124823	master
\.


--
-- Data for Name: archive; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.archive (guild_id, channel_id) FROM stdin;
\.


--
-- Data for Name: archive_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.archive_category (guild_id, category_id) FROM stdin;
\.


--
-- Data for Name: authorize; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authorize (guild_id, user_id, till, transfers) FROM stdin;
\.


--
-- Data for Name: autopfp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autopfp (guild_id, type, category, channel_id) FROM stdin;
1254536563186991184	pfps	random	1269682188270571634
1254536563186991184	pfps	roadmen	1269682188270571634
1254536563186991184	pfps	girl	1269682188270571634
1254536563186991184	pfps	egirl	1269682188270571634
1254536563186991184	pfps	anime	1269682188270571634
1254536563186991184	pfps	ceinory	1269682188270571634
1202055026797707316	pfps	random	1269988512153731195
1202055026797707316	banners	random	1269988513596833943
950153022405763124	pfps	random	1273609783617916939
950153022405763124	banners	random	1273609835782475900
\.


--
-- Data for Name: autoping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autoping (guild_id, channel_id, message) FROM stdin;
\.


--
-- Data for Name: autoreact; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autoreact (guild_id, trigger, reactions) FROM stdin;
1202055026797707316	skull	["\\ud83d\\udc80"]
1202055026797707316	sob	["\\ud83d\\ude2d"]
1202055026797707316	faggot	["\\ud83c\\udf08"]
1202055026797707316	fagot	["\\ud83c\\udf08"]
1202055026797707316	nigga	["\\ud83d\\udc80"]
1202055026797707316	fag	["\\ud83c\\udf08"]
1202055026797707316	fagg	["\\ud83c\\udf08"]
1202055026797707316	fags	["\\ud83c\\udf08"]
1202055026797707316	faggs	["\\ud83c\\udf08"]
1202055026797707316	cum	["<a:shot:1270007392037240996>"]
\.


--
-- Data for Name: autoreacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autoreacts (guild_id, trigger, reaction) FROM stdin;
\.


--
-- Data for Name: autoresponder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autoresponder (guild_id, trigger, response, strict) FROM stdin;
1254536563186991184	pic perms	to get pic perms boost /higher	t
1202055026797707316	nigger	kill all niggers	t
1202055026797707316	kys	keep yourself safe	t
1202055026797707316	engrave	<@1157111422598250577>	t
1202055026797707316	war.dev	<@1157111422598250577>	t
\.


--
-- Data for Name: autorole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autorole (guild_id, role_id) FROM stdin;
1202055026797707316	1269988406604206120
1202055026797707316	1269988404825821245
950153022405763124	1270496433304244234
1273788483336667191	1274373411992240159
1274119155431379045	1274643088601780286
1266971195761234002	1274724890079133707
\.


--
-- Data for Name: avatar_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.avatar_history (user_id, name, avatars, background) FROM stdin;
\.


--
-- Data for Name: avatar_urls; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.avatar_urls (user_id, token, data) FROM stdin;
\.


--
-- Data for Name: avatars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.avatars (user_id, name, avatar, key, "timestamp") FROM stdin;
\.


--
-- Data for Name: bday; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bday (user_id, month, day) FROM stdin;
\.


--
-- Data for Name: birthday; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.birthday (user_id, bday, said) FROM stdin;
\.


--
-- Data for Name: blacklist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.blacklist (id, type) FROM stdin;
\.


--
-- Data for Name: boost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boost (guild_id, channel_id, message) FROM stdin;
1202055026797707316	1269988490737745993	ty 4 boostin {user.mention}
\.


--
-- Data for Name: booster_module; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booster_module (guild_id, base) FROM stdin;
1202055026797707316	1202057666919419995
1265355781369495714	1265623785982132265
\.


--
-- Data for Name: booster_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.booster_roles (guild_id, user_id, role_id) FROM stdin;
\.


--
-- Data for Name: br_award; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.br_award (guild_id, role_id) FROM stdin;
\.


--
-- Data for Name: bumpreminder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bumpreminder (guild_id, channel_id, user_id, thankyou, reminder, "time") FROM stdin;
\.


--
-- Data for Name: confess; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.confess (guild_id, channel_id, confession) FROM stdin;
\.


--
-- Data for Name: confess_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.confess_members (guild_id, user_id, confession) FROM stdin;
\.


--
-- Data for Name: confess_mute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.confess_mute (guild_id, user_id) FROM stdin;
\.


--
-- Data for Name: counters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.counters (guild_id, channel_type, channel_id, channel_name, module) FROM stdin;
1202055026797707316	voice	1270046118801182823	{target}	humans
\.


--
-- Data for Name: disablecmd; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disablecmd (guild_id, cmd) FROM stdin;
1231607483030569030	ban
1231607483030569030	hardban
1231607483030569030	kick
\.


--
-- Data for Name: disablemodule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disablemodule (guild_id, module) FROM stdin;
\.


--
-- Data for Name: donor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.donor (user_id, since, status) FROM stdin;
214753146512080907	1722717439	purchased
1169601140804042842	1722717493	purchased
187747524646404105	1723730230	purchased
863914425445908490	1723763420	purchased
598125772754124823	1723952439	purchased
1130715311897858180	1723968613	purchased
987183275560820806	1724124069	purchased
\.


--
-- Data for Name: economy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.economy (user_id, cash, card, daily, dice) FROM stdin;
840439255708991508	1576.91	0	1722847700	\N
1169601140804042842	0	1766.81	1722965587	1722879216
994736882938302494	100	0	\N	\N
\.


--
-- Data for Name: error_codes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.error_codes (code, info) FROM stdin;
CZCbKh	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 971464344749629512, "timestamp": "<t:1722636183:R>", "error": "Command raised an exception: Error: BrowserType.launch: Executable doesn't exist at /home/evict/.cache/ms-playwright/chromium-1124/chrome-linux/chrome\\n\\u2554\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2557\\n\\u2551 Looks like Playwright was just installed or updated.       \\u2551\\n\\u2551 Please run the following command to download new browsers: \\u2551\\n\\u2551                                                            \\u2551\\n\\u2551     playwright install                                     \\u2551\\n\\u2551                                                            \\u2551\\n\\u2551 <3 Playwright Team                                         \\u2551\\n\\u255a\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u255d", "code": "CZCbKh", "command": "screenshot"}
y9fs0D	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722646407:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "y9fs0D", "command": "jishaku shell"}
AIo5nh	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722649194:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn components.0.components.0.options: This field is required", "code": "AIo5nh", "command": "help"}
t3KZdO	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722649831:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn components.0.components.0.options: This field is required", "code": "t3KZdO", "command": "help"}
sCjDdD	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722650120:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn components.0.components.0.options: This field is required", "code": "sCjDdD", "command": "help"}
OhGcQQ	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722650378:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn components.0.components.0.options: Must be between 1 and 25 in length.", "code": "OhGcQQ", "command": "help"}
JaKvgv	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722650547:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn components.0.components.0.options: This field is required", "code": "JaKvgv", "command": "help"}
omcevA	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 971464344749629512, "timestamp": "<t:1722650571:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn components.0.components.0.options: This field is required", "code": "omcevA", "command": "help"}
TXY7cj	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722650576:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn components.0.components.0.options: This field is required", "code": "TXY7cj", "command": "help"}
TDflsP	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722650641:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn components.0.components.0.options: This field is required", "code": "TDflsP", "command": "help"}
yHpThO	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722650767:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn components.0.components.0.options: Must be between 1 and 25 in length.", "code": "yHpThO", "command": "help"}
9TV0GV	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722650803:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn components.0.components.0.options: Must be between 1 and 25 in length.", "code": "9TV0GV", "command": "help"}
TiIB8f	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722650857:R>", "error": "Command raised an exception: NameError: name 'Button' is not defined", "code": "TiIB8f", "command": "help"}
htWUqV	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722651009:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn components.0.components.0.options: Must be between 1 and 25 in length.", "code": "htWUqV", "command": "help"}
dsSVEs	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722651300:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn components.0.components.0.options: Must be between 1 and 25 in length.", "code": "dsSVEs", "command": "help"}
oKMAAv	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722651578:R>", "error": "Command raised an exception: RecursionError: maximum recursion depth exceeded in comparison", "code": "oKMAAv", "command": "help"}
gbCO3d	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722651670:R>", "error": "Command raised an exception: RecursionError: maximum recursion depth exceeded in comparison", "code": "gbCO3d", "command": "help"}
ONwlBb	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722652002:R>", "error": "Command raised an exception: TypeError: 'PretendContext' object is not callable", "code": "ONwlBb", "command": "help"}
J50G6Q	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722652161:R>", "error": "Command raised an exception: NoNodesAvailable: There are no nodes available.", "code": "J50G6Q", "command": "play"}
WfDJ2t	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722652261:R>", "error": "Command raised an exception: KeyError: 'hits'", "code": "WfDJ2t", "command": "song"}
0tsQ7c	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722652281:R>", "error": "Command raised an exception: KeyError: 'hits'", "code": "0tsQ7c", "command": "song"}
dbec8t	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722652464:R>", "error": "Command raised an exception: KeyError: 'hits'", "code": "dbec8t", "command": "song"}
NvywFr	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722652490:R>", "error": "Command raised an exception: KeyError: 'hits'", "code": "NvywFr", "command": "song"}
5B1OdB	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722652524:R>", "error": "Command raised an exception: KeyError: 'hits'", "code": "5B1OdB", "command": "song"}
jv9MSD	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722653674:R>", "error": "Command raised an exception: IndexError: list index out of range", "code": "jv9MSD", "command": "bans"}
lRek10	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722654030:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "lRek10", "command": "help"}
9wCedB	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722654590:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "9wCedB", "command": "help"}
D2D13Z	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722654663:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "D2D13Z", "command": "help"}
dTfVib	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722654875:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "dTfVib", "command": "help"}
1fhUjX	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722655089:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "1fhUjX", "command": "help"}
GwtwCO	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722655480:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "GwtwCO", "command": "help"}
eMNo6A	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722655610:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "eMNo6A", "command": "help"}
fGsgtV	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722655696:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "fGsgtV", "command": "help"}
Xinz3H	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722656042:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "Xinz3H", "command": "help"}
FsmOTT	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722656079:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "FsmOTT", "command": "help"}
Pbu6cc	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722659362:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "Pbu6cc", "command": "help"}
iJNJQs	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722659489:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "iJNJQs", "command": "help"}
F06Mdc	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722659537:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "F06Mdc", "command": "help"}
ZR4HY0	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722659685:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "ZR4HY0", "command": "help"}
McZArt	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722659767:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "McZArt", "command": "help"}
YCsk4D	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722659873:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "YCsk4D", "command": "help"}
x7fSA0	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 971464344749629512, "timestamp": "<t:1722659877:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "x7fSA0", "command": "help"}
z5qTmr	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 971464344749629512, "timestamp": "<t:1722659904:R>", "error": "Command raised an exception: TypeError: Paginator.__init__() missing 1 required positional argument: 'embeds'", "code": "z5qTmr", "command": "help"}
rueZQN	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722659984:R>", "error": "Command raised an exception: AttributeError: 'PretendHelp' object has no attribute 'paginator'", "code": "rueZQN", "command": "help"}
CATCvf	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 971464344749629512, "timestamp": "<t:1722663034:R>", "error": "Command raised an exception: NoNodesAvailable: There are no nodes available.", "code": "CATCvf", "command": "play"}
NOMZbI	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722665980:R>", "error": "Command raised an exception: IndexError: list index out of range", "code": "NOMZbI", "command": "bans"}
pzu5WJ	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722701197:R>", "error": "Command raised an exception: NoNodesAvailable: There are no nodes available.", "code": "pzu5WJ", "command": "play"}
WVwtgA	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722701210:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "WVwtgA", "command": "jishaku shell"}
fMkfbl	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 1169601140804042842, "timestamp": "<t:1722702266:R>", "error": "Command raised an exception: PermissionError: [Errno 13] Permission denied: '/root/PretendImages/Banners/'", "code": "fMkfbl", "command": "report"}
OA9QWT	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722702666:R>", "error": "Command raised an exception: IndexError: list index out of range", "code": "OA9QWT", "command": "timezone list"}
7ED2yO	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722703318:R>", "error": "Command raised an exception: TypeError: Webhook.send() got an unexpected keyword argument 'reference'", "code": "7ED2yO", "command": "reskin name"}
Rtwikh	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722703557:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"name\\" of relation \\"reskin\\" does not exist", "code": "Rtwikh", "command": "reskin name"}
TNOFc6	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 987183275560820806, "timestamp": "<t:1722703683:R>", "error": "Command raised an exception: UndefinedTableError: relation \\"reskin\\" does not exist", "code": "TNOFc6", "command": "reskin name"}
wZobnM	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 987183275560820806, "timestamp": "<t:1722703696:R>", "error": "Command raised an exception: UndefinedTableError: relation \\"reskin\\" does not exist", "code": "wZobnM", "command": "help"}
xeROCU	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722703712:R>", "error": "Command raised an exception: UndefinedTableError: relation \\"reskin\\" does not exist", "code": "xeROCU", "command": "help"}
owGGZ6	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722703757:R>", "error": "Command raised an exception: UndefinedTableError: relation \\"reskin\\" does not exist", "code": "owGGZ6", "command": "help"}
6X93GX	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 987183275560820806, "timestamp": "<t:1722703823:R>", "error": "Command raised an exception: UndefinedTableError: relation \\"reskin\\" does not exist", "code": "6X93GX", "command": "help"}
1zCrnu	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722703985:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "1zCrnu", "command": "jishaku shell"}
Cb561m	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722704005:R>", "error": "Command raised an exception: AttributeError: 'PretendContext' object has no attribute 'success'", "code": "Cb561m", "command": "reskin name"}
CfYky5	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722704013:R>", "error": "Command raised an exception: KeyError: 'avatar_url'", "code": "CfYky5", "command": "help"}
40vmJN	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722704121:R>", "error": "Command raised an exception: AttributeError: 'PretendContext' object has no attribute 'webhook'", "code": "40vmJN", "command": "help"}
rYW62K	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722704125:R>", "error": "Command raised an exception: AttributeError: 'PretendContext' object has no attribute 'webhook'", "code": "rYW62K", "command": "jishaku"}
WTGXz7	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722704411:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "WTGXz7", "command": "jishaku shell"}
8f4Ax1	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 987183275560820806, "timestamp": "<t:1722704472:R>", "error": "Command raised an exception: AttributeError: 'PretendContext' object has no attribute 'success'", "code": "8f4Ax1", "command": "reskin disable"}
few66z	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722705527:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "few66z", "command": "jishaku shell"}
xookJk	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722705536:R>", "error": "Command raised an exception: UndefinedTableError: relation \\"reskin_enabled\\" does not exist", "code": "xookJk", "command": "help"}
NE66Lx	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722705571:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "NE66Lx", "command": "jishaku shell"}
lt3rLg	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722708299:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "lt3rLg", "command": "jishaku shell"}
z6Kcil	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722708834:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "z6Kcil", "command": "jishaku shell"}
BshOZ3	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722708880:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "BshOZ3", "command": "jishaku shell"}
b4LbXt	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722709019:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "b4LbXt", "command": "jishaku shell"}
g19b4p	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722709074:R>", "error": "Command raised an exception: IndexError: list index out of range", "code": "g19b4p", "command": "bans"}
5R3aaN	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722709258:R>", "error": "Command raised an exception: AttributeError: 'PretendContext' object has no attribute 'success'", "code": "5R3aaN", "command": "reskin name"}
v1H6Yp	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722709384:R>", "error": "Command raised an exception: IndexError: list index out of range", "code": "v1H6Yp", "command": "bans"}
UsPYO5	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722709433:R>", "error": "Command raised an exception: IndexError: list index out of range", "code": "UsPYO5", "command": "bans"}
h5c1wp	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722709448:R>", "error": "Command raised an exception: IndexError: list index out of range", "code": "h5c1wp", "command": "bans"}
cYTlCQ	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722709494:R>", "error": "Command raised an exception: IndexError: list index out of range", "code": "cYTlCQ", "command": "bans"}
os6FG8	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722709572:R>", "error": "Command raised an exception: IndexError: list index out of range", "code": "os6FG8", "command": "timezone list"}
KTrlej	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722709599:R>", "error": "Command raised an exception: IndexError: list index out of range", "code": "KTrlej", "command": "timezone list"}
cq65DZ	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722709965:R>", "error": "Command raised an exception: TypeError: 'NoneType' object is not subscriptable", "code": "cq65DZ", "command": "fyp"}
ZVWJco	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722710053:R>", "error": "Command raised an exception: IndexError: list index out of range", "code": "ZVWJco", "command": "donators"}
L0eQ3h	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722710107:R>", "error": "Command raised an exception: IndexError: list index out of range", "code": "L0eQ3h", "command": "donators"}
3kakm5	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722710788:R>", "error": "Command raised an exception: IndexError: list index out of range", "code": "3kakm5", "command": "muted"}
rRvv6e	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722710887:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'edit'", "code": "rRvv6e", "command": "shazam"}
R8zPNJ	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722712393:R>", "error": "Command raised an exception: AttributeError: 'Fun' object has no attribute 'session'", "code": "R8zPNJ", "command": "fyp"}
pcuPfX	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722712429:R>", "error": "Command raised an exception: AttributeError: 'Fun' object has no attribute 'session'", "code": "pcuPfX", "command": "fyp"}
qGm2AE	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722712576:R>", "error": "Command raised an exception: AttributeError: 'Fun' object has no attribute 'session'", "code": "qGm2AE", "command": "fyp"}
8dgdo1	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722712949:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "8dgdo1", "command": "jishaku shell"}
1leAmw	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722713020:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "1leAmw", "command": "jishaku shell"}
52umbU	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722713054:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "52umbU", "command": "jishaku shell"}
k6YzAk	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722713250:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "k6YzAk", "command": "jishaku shell"}
IqX11u	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 1169601140804042842, "timestamp": "<t:1722716073:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "IqX11u", "command": "nowplaying"}
jVgKik	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722716112:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'get_member'", "code": "jVgKik", "command": "donor add"}
v7512E	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722716199:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'get_member'", "code": "v7512E", "command": "donor add"}
61HHmP	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722716270:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'get_member'", "code": "61HHmP", "command": "donor add"}
L5FUyt	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722716486:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'get_member'", "code": "L5FUyt", "command": "donor add"}
9gR8xg	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722716598:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'get_member'", "code": "9gR8xg", "command": "donor add"}
jTzZNq	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 1169601140804042842, "timestamp": "<t:1722718499:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "jTzZNq", "command": "nowplaying"}
9rqJGH	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722716635:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'get_member'", "code": "9rqJGH", "command": "donor add"}
3Tp2Qp	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722716748:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'get_role'", "code": "3Tp2Qp", "command": "donor add"}
akohyQ	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722717046:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'get_role'", "code": "akohyQ", "command": "donor add"}
h6IE3d	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722717112:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'get_role'", "code": "h6IE3d", "command": "donor add"}
GEKKeW	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722717131:R>", "error": "Command raised an exception: AttributeError: 'int' object has no attribute 'id'", "code": "GEKKeW", "command": "donor add"}
Boislv	{"guild_id": 1268137490011656213, "channel_id": 1269394377122512916, "user_id": 1169601140804042842, "timestamp": "<t:1722718051:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "Boislv", "command": "nowplaying"}
1a78v9	{"guild_id": 1268137490011656213, "channel_id": 1269394377122512916, "user_id": 1169601140804042842, "timestamp": "<t:1722718189:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "1a78v9", "command": "nowplaying"}
pboADt	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 971464344749629512, "timestamp": "<t:1722718262:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'title'", "code": "pboADt", "command": "queue"}
fMkpCm	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 1169601140804042842, "timestamp": "<t:1722718956:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "fMkpCm", "command": "nowplaying"}
TmVcKk	{"guild_id": 1268137490011656213, "channel_id": 1269394377122512916, "user_id": 1169601140804042842, "timestamp": "<t:1722719890:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "TmVcKk", "command": "nowplaying"}
KFL0hO	{"guild_id": 1268137490011656213, "channel_id": 1269394377122512916, "user_id": 1169601140804042842, "timestamp": "<t:1722719920:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "KFL0hO", "command": "nowplaying"}
w5SbtV	{"guild_id": 1266750786478805023, "channel_id": 1266751590660968499, "user_id": 1169601140804042842, "timestamp": "<t:1722720344:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "w5SbtV", "command": "nowplaying"}
5PyJsR	{"guild_id": 950153022405763124, "channel_id": 1269400788342669336, "user_id": 1169601140804042842, "timestamp": "<t:1722720465:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "5PyJsR", "command": "nowplaying"}
2zoY0J	{"guild_id": 950153022405763124, "channel_id": 1269400788342669336, "user_id": 598125772754124823, "timestamp": "<t:1722720473:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "2zoY0J", "command": "jishaku shell"}
v5gWcV	{"guild_id": 950153022405763124, "channel_id": 1269400788342669336, "user_id": 598125772754124823, "timestamp": "<t:1722720544:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "v5gWcV", "command": "jishaku shell"}
1wh67w	{"guild_id": 950153022405763124, "channel_id": 1269400788342669336, "user_id": 1169601140804042842, "timestamp": "<t:1722720553:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "1wh67w", "command": "nowplaying"}
4jxtfo	{"guild_id": 950153022405763124, "channel_id": 1269400788342669336, "user_id": 1169601140804042842, "timestamp": "<t:1722720796:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "4jxtfo", "command": "nowplaying"}
neIeUx	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722725448:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "neIeUx", "command": "nowplaying"}
htwViq	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722725473:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "htwViq", "command": "nowplaying"}
sgYBsE	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722725742:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "sgYBsE", "command": "jishaku shell"}
5Bp1YT	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722725807:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "5Bp1YT", "command": "jishaku shell"}
kJfH1Z	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722725893:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "kJfH1Z", "command": "jishaku shell"}
cG7prA	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722741640:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "cG7prA", "command": "jishaku shell"}
bZplCy	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722743216:R>", "error": "Command raised an exception: IndexError: list index out of range", "code": "bZplCy", "command": "stickers"}
gyTpvG	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722745261:R>", "error": "Command raised an exception: Forbidden: 403 Forbidden (error code: 50007): Cannot send messages to this user", "code": "gyTpvG", "command": "apikey add"}
MMGQSH	{"guild_id": 1268777695244980389, "channel_id": 1268777695244980392, "user_id": 598125772754124823, "timestamp": "<t:1722750339:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "MMGQSH", "command": "jishaku shell"}
Q80Jrp	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722762779:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "Q80Jrp", "command": "nowplaying"}
ObcC14	{"guild_id": 1268137490011656213, "channel_id": 1269394377122512916, "user_id": 1169601140804042842, "timestamp": "<t:1722763274:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "ObcC14", "command": "nowplaying"}
nKPa4b	{"guild_id": 1268137490011656213, "channel_id": 1269394377122512916, "user_id": 1169601140804042842, "timestamp": "<t:1722763323:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "nKPa4b", "command": "nowplaying"}
o7Par8	{"guild_id": 1268137490011656213, "channel_id": 1269394377122512916, "user_id": 1169601140804042842, "timestamp": "<t:1722763357:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "o7Par8", "command": "nowplaying"}
BIvwmo	{"guild_id": 1268137490011656213, "channel_id": 1269394377122512916, "user_id": 1169601140804042842, "timestamp": "<t:1722763384:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "BIvwmo", "command": "nowplaying"}
yUuPt1	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722763595:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "yUuPt1", "command": "nowplaying"}
85j7nQ	{"guild_id": 1268137490011656213, "channel_id": 1269394377122512916, "user_id": 1169601140804042842, "timestamp": "<t:1722763669:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "85j7nQ", "command": "nowplaying"}
TvQpEC	{"guild_id": 1268137490011656213, "channel_id": 1269394377122512916, "user_id": 1169601140804042842, "timestamp": "<t:1722763930:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "TvQpEC", "command": "nowplaying"}
Ngo3cx	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722764452:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "Ngo3cx", "command": "nowplaying"}
43DX94	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722765073:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "43DX94", "command": "nowplaying"}
X5kiAh	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722764839:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "X5kiAh", "command": "nowplaying"}
xCvYSC	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722766553:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "xCvYSC", "command": "nowplaying"}
XsU8fc	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722784783:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "XsU8fc", "command": "nowplaying"}
EKvj2O	{"guild_id": 1254536563186991184, "channel_id": 1269682186039201837, "user_id": 1169601140804042842, "timestamp": "<t:1722786818:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'edit'", "code": "EKvj2O", "command": "role humans"}
mwGYsc	{"guild_id": 1254536563186991184, "channel_id": 1269682203827109999, "user_id": 1169601140804042842, "timestamp": "<t:1722788907:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn embeds.0.fields.0.name: This field is required\\nIn embeds.0.fields.0.value: This field is required", "code": "mwGYsc", "command": "createembed"}
4rietS	{"guild_id": 1254536563186991184, "channel_id": 1269682203827109999, "user_id": 1169601140804042842, "timestamp": "<t:1722789054:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn embeds.0.fields.0.name: This field is required\\nIn embeds.0.fields.0.value: This field is required", "code": "4rietS", "command": "createembed"}
966HsS	{"guild_id": 1254536563186991184, "channel_id": 1269682203827109999, "user_id": 1169601140804042842, "timestamp": "<t:1722789064:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn embeds.0.fields.0.value: This field is required", "code": "966HsS", "command": "createembed"}
NCgEe9	{"guild_id": 1254536563186991184, "channel_id": 1269682203827109999, "user_id": 1169601140804042842, "timestamp": "<t:1722789178:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn embeds.0.fields.0.value: This field is required", "code": "NCgEe9", "command": "createembed"}
eCaJVa	{"guild_id": 1254536563186991184, "channel_id": 1269682203827109999, "user_id": 1169601140804042842, "timestamp": "<t:1722789207:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn embeds.0.fields.0.value: This field is required", "code": "eCaJVa", "command": "createembed"}
6FucB0	{"guild_id": 1254536563186991184, "channel_id": 1269682203827109999, "user_id": 1169601140804042842, "timestamp": "<t:1722789287:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn embeds.0.fields.0.value: This field is required", "code": "6FucB0", "command": "createembed"}
iFdxZo	{"guild_id": 892675627373699072, "channel_id": 1259232215070674945, "user_id": 598125772754124823, "timestamp": "<t:1722882029:R>", "error": "Command raised an exception: AttributeError: 'PretendContext' object has no attribute 'warning'", "code": "iFdxZo", "command": "getguild"}
QoU1Vq	{"guild_id": 1254536563186991184, "channel_id": 1269682203827109999, "user_id": 1169601140804042842, "timestamp": "<t:1722789293:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn embeds.0.fields.0.value: This field is required", "code": "QoU1Vq", "command": "createembed"}
8U5J74	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722792482:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "8U5J74", "command": "nowplaying"}
af18ps	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722792674:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "af18ps", "command": "nowplaying"}
fzoNJP	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722792938:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'edit'", "code": "fzoNJP", "command": "lastfm set"}
aQ3QMp	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722792943:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'edit'", "code": "aQ3QMp", "command": "lastfm set"}
aMB8wX	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722792950:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "aMB8wX", "command": "nowplaying"}
4NQiyz	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722793020:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'add_reaction'", "code": "4NQiyz", "command": "nowplaying"}
x3ZMGr	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722793146:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn avatar_url: Scheme \\"none\\" is not supported. Scheme must be one of ('http', 'https'). Not a well formed URL.", "code": "x3ZMGr", "command": "reskin avatar"}
4MsMMD	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722793151:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn avatar_url: Scheme \\"none\\" is not supported. Scheme must be one of ('http', 'https'). Not a well formed URL.", "code": "4MsMMD", "command": "reskin avatar"}
WqPkGW	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722793161:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn avatar_url: Scheme \\"none\\" is not supported. Scheme must be one of ('http', 'https'). Not a well formed URL.", "code": "WqPkGW", "command": "help"}
0hWXxw	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722793219:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn avatar_url: Scheme \\"none\\" is not supported. Scheme must be one of ('http', 'https'). Not a well formed URL.", "code": "0hWXxw", "command": "help"}
TvZEex	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722797421:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"reactions\\" does not exist", "code": "TvZEex", "command": "nowplaying"}
JiNKOk	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722793238:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn avatar_url: Scheme \\"none\\" is not supported. Scheme must be one of ('http', 'https'). Not a well formed URL.", "code": "JiNKOk", "command": "help"}
3GxzJT	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722793276:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn avatar_url: Scheme \\"none\\" is not supported. Scheme must be one of ('http', 'https'). Not a well formed URL.", "code": "3GxzJT", "command": "nowplaying"}
oecQ6b	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722793296:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn avatar_url: Scheme \\"none\\" is not supported. Scheme must be one of ('http', 'https'). Not a well formed URL.", "code": "oecQ6b", "command": "nowplaying"}
xfq45L	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722793278:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn avatar_url: Scheme \\"none\\" is not supported. Scheme must be one of ('http', 'https'). Not a well formed URL.", "code": "xfq45L", "command": "nowplaying"}
XfXAZd	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722794194:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "XfXAZd", "command": "jishaku shell"}
mpmlNn	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722793294:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn avatar_url: Scheme \\"none\\" is not supported. Scheme must be one of ('http', 'https'). Not a well formed URL.", "code": "mpmlNn", "command": "nowplaying"}
vXwAzH	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722793752:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn avatar_url: Scheme \\"none\\" is not supported. Scheme must be one of ('http', 'https'). Not a well formed URL.", "code": "vXwAzH", "command": "play"}
bt28Fd	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722794389:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "bt28Fd", "command": "jishaku shell"}
KEpGC2	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722795000:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"reactions\\" does not exist", "code": "KEpGC2", "command": "nowplaying"}
uwo3zB	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722795054:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"lastfm_users\\" does not exist", "code": "uwo3zB", "command": "nowplaying"}
35yhSx	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722795107:R>", "error": "Command raised an exception: UndefinedTableError: missing FROM-clause entry for table \\"public\\"", "code": "35yhSx", "command": "nowplaying"}
SWRrXH	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722795142:R>", "error": "Command raised an exception: UndefinedTableError: missing FROM-clause entry for table \\"public\\"", "code": "SWRrXH", "command": "nowplaying"}
cbrKIo	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722795206:R>", "error": "Command raised an exception: UndefinedTableError: missing FROM-clause entry for table \\"public\\"", "code": "cbrKIo", "command": "nowplaying"}
nX4ODA	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722795263:R>", "error": "Command raised an exception: UndefinedTableError: missing FROM-clause entry for table \\"public\\"", "code": "nX4ODA", "command": "nowplaying"}
OuAS5D	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722795279:R>", "error": "Command raised an exception: UndefinedTableError: missing FROM-clause entry for table \\"public\\"", "code": "OuAS5D", "command": "nowplaying"}
h8AWYx	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722795306:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"lastfm_users\\" does not exist", "code": "h8AWYx", "command": "nowplaying"}
YKibXB	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722795761:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "YKibXB", "command": "jishaku shell"}
lCg2t9	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722795942:R>", "error": "Command raised an exception: IndexError: record index out of range", "code": "lCg2t9", "command": "nowplaying"}
1ILVYf	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722796129:R>", "error": "Command raised an exception: InterfaceError: the server expects 2 arguments for this query, 1 was passed\\nHINT:  Check the query against the passed list of arguments.", "code": "1ILVYf", "command": "nowplaying"}
Umz7Ye	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722796190:R>", "error": "Command raised an exception: UnboundLocalError: cannot access local variable 'user' where it is not associated with a value", "code": "Umz7Ye", "command": "nowplaying"}
vg3qjP	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722796287:R>", "error": "Command raised an exception: UnboundLocalError: cannot access local variable 'user' where it is not associated with a value", "code": "vg3qjP", "command": "nowplaying"}
YW0cn0	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722796360:R>", "error": "Command raised an exception: UnboundLocalError: cannot access local variable 'user' where it is not associated with a value", "code": "YW0cn0", "command": "nowplaying"}
JF1E2g	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722796516:R>", "error": "Command raised an exception: UnboundLocalError: cannot access local variable 'user' where it is not associated with a value", "code": "JF1E2g", "command": "nowplaying"}
SrS9Ez	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722796585:R>", "error": "Command raised an exception: TypeError: Invalid variable type: value should be str, int or float, got <Record username='resentdev'> of type <class 'tools.bot.Record'>", "code": "SrS9Ez", "command": "nowplaying"}
pPLz0K	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722796933:R>", "error": "Command raised an exception: TypeError: 'NoneType' object is not subscriptable", "code": "pPLz0K", "command": "nowplaying"}
86SauF	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722796973:R>", "error": "Command raised an exception: TypeError: 'NoneType' object is not subscriptable", "code": "86SauF", "command": "nowplaying"}
Wfy9y4	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722796974:R>", "error": "Command raised an exception: TypeError: 'NoneType' object is not subscriptable", "code": "Wfy9y4", "command": "nowplaying"}
llEoYH	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722797357:R>", "error": "Command raised an exception: UndefinedTableError: relation \\"lfmode\\" does not exist", "code": "llEoYH", "command": "nowplaying"}
tZzVOz	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722797387:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"reactions\\" does not exist", "code": "tZzVOz", "command": "nowplaying"}
0364Ti	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722797473:R>", "error": "Command raised an exception: DatatypeMismatchError: argument of WHERE must be type boolean, not type bigint", "code": "0364Ti", "command": "nowplaying"}
dnaFYl	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722797507:R>", "error": "Command raised an exception: DatatypeMismatchError: argument of WHERE must be type boolean, not type bigint", "code": "dnaFYl", "command": "nowplaying"}
4HrztV	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722799457:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"discord_user_id\\" does not exist", "code": "4HrztV", "command": "lastfm mode view"}
w8iNjZ	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722797823:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"user_id\\" does not exist", "code": "w8iNjZ", "command": "lastfm user"}
UoQOZr	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722798207:R>", "error": "Command raised an exception: TypeError: 'NoneType' object is not subscriptable", "code": "UoQOZr", "command": "lastfm spotify"}
yieWtJ	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722798221:R>", "error": "Command raised an exception: TypeError: 'NoneType' object is not subscriptable", "code": "yieWtJ", "command": "lastfm spotify"}
xgrsAd	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722798306:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"user_id\\" does not exist", "code": "xgrsAd", "command": "lastfm cover"}
DLPZ9W	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722798492:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"embed\\" of relation \\"lfmode\\" does not exist", "code": "DLPZ9W", "command": "lastfm mode set"}
8SI3iw	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722798550:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"embed\\" of relation \\"lfmode\\" does not exist", "code": "8SI3iw", "command": "lastfm mode remove"}
H3tVO9	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722798878:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'replace'", "code": "H3tVO9", "command": "nowplaying"}
IS6tgy	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722798840:R>", "error": "Command raised an exception: TypeError: 'NoneType' object is not subscriptable", "code": "IS6tgy", "command": "nowplaying"}
fD6Ljh	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722800004:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "fD6Ljh", "command": "jishaku shell"}
vSTNkx	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722800139:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "vSTNkx", "command": "jishaku shell"}
AyhxxO	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722800214:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"discord_user_id\\" does not exist", "code": "AyhxxO", "command": "lastfm mode view"}
GmqUg6	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722800389:R>", "error": "Command raised an exception: AttributeError: 'Lastfm' object has no attribute 'db'", "code": "GmqUg6", "command": "lastfm mode view"}
vhKkEg	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722800425:R>", "error": "Command raised an exception: TypeError: 'NoneType' object is not subscriptable", "code": "vhKkEg", "command": "lastfm mode view"}
heiRDF	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722800734:R>", "error": "Command raised an exception: IndexError: list index out of range", "code": "heiRDF", "command": "lastfm mode view"}
0uv5ve	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722800759:R>", "error": "Command raised an exception: IndexError: list index out of range", "code": "0uv5ve", "command": "jishaku override"}
lognQY	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722800879:R>", "error": "Command raised an exception: TypeError: 'NoneType' object is not subscriptable", "code": "lognQY", "command": "lastfm mode view"}
oit5h4	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722800901:R>", "error": "Command raised an exception: TypeError: 'NoneType' object is not subscriptable", "code": "oit5h4", "command": "jishaku override"}
paAeAn	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722800941:R>", "error": "Command raised an exception: TypeError: 'NoneType' object is not subscriptable", "code": "paAeAn", "command": "lastfm mode view"}
Ecpl2Z	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722800953:R>", "error": "Command raised an exception: TypeError: 'NoneType' object is not subscriptable", "code": "Ecpl2Z", "command": "jishaku override"}
KrHFXQ	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722801025:R>", "error": "Command raised an exception: AttributeError: 'PretendContext' object has no attribute 'lastfm_message'", "code": "KrHFXQ", "command": "lastfm mode view"}
fdC3oG	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722801111:R>", "error": "Command raised an exception: NameError: name 'embed' is not defined", "code": "fdC3oG", "command": "lastfm mode set"}
4SICBK	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722801225:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'replace'", "code": "4SICBK", "command": "nowplaying"}
WxdyJr	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722802839:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'replace'", "code": "WxdyJr", "command": "nowplaying"}
nFKmrk	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722803119:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'replace'", "code": "nFKmrk", "command": "nowplaying"}
wG6b1a	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722803214:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'replace'", "code": "wG6b1a", "command": "nowplaying"}
Fy27cD	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1722803352:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'replace'", "code": "Fy27cD", "command": "nowplaying"}
257Jik	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1722803420:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'replace'", "code": "257Jik", "command": "nowplaying"}
hNUvFu	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1722803500:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'replace'", "code": "hNUvFu", "command": "nowplaying"}
im5uxk	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1722803704:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "im5uxk", "command": "jishaku shell"}
Spo27c	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1722803733:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'replace'", "code": "Spo27c", "command": "nowplaying"}
4DwThh	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1722825232:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'replace'", "code": "4DwThh", "command": "nowplaying"}
hzBeTZ	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1722826437:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'replace'", "code": "hzBeTZ", "command": "nowplaying"}
wo1jrh	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1722826465:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'replace'", "code": "wo1jrh", "command": "nowplaying"}
CuZLJ3	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1722826802:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'replace'", "code": "CuZLJ3", "command": "nowplaying"}
a5yWBS	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1722827289:R>", "error": "Command raised an exception: ValueError: params cannot be None", "code": "a5yWBS", "command": "nowplaying"}
8xigzo	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1722827338:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'replace'", "code": "8xigzo", "command": "nowplaying"}
gLgCcK	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1722830276:R>", "error": "Command raised an exception: AttributeError: 'PretendContext' object has no attribute 'lastfm_message'", "code": "gLgCcK", "command": "lastfm customcommand"}
zto6Rc	{"guild_id": 1254536563186991184, "channel_id": 1269691124218462301, "user_id": 1169601140804042842, "timestamp": "<t:1722858386:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"reactions\\" of relation \\"lastfm\\" does not exist", "code": "zto6Rc", "command": "lastfm reactions"}
AAiJBw	{"guild_id": 1254536563186991184, "channel_id": 1269691124218462301, "user_id": 1169601140804042842, "timestamp": "<t:1722858414:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"reactions\\" of relation \\"lastfm\\" does not exist", "code": "AAiJBw", "command": "lastfm reactions"}
oNeIpQ	{"guild_id": 1254536563186991184, "channel_id": 1269691124218462301, "user_id": 1169601140804042842, "timestamp": "<t:1722858435:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"reactions\\" of relation \\"lastfm\\" does not exist", "code": "oNeIpQ", "command": "lastfm reactions"}
QJlbCP	{"guild_id": 1254536563186991184, "channel_id": 1269682193186160801, "user_id": 1169601140804042842, "timestamp": "<t:1722863130:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'edit'", "code": "QJlbCP", "command": "voicemaster setup"}
FyzZBe	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1169601140804042842, "timestamp": "<t:1722863302:R>", "error": "Command raised an exception: TypeError: 'NoneType' object is not subscriptable", "code": "FyzZBe", "command": "lastfm spotify"}
oGYTeo	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 987183275560820806, "timestamp": "<t:1722870432:R>", "error": "Command raised an exception: ValueError: Invalid operation: The `response.text` quick accessor requires the response to contain a valid `Part`, but none were returned. Please check the `candidate.safety_ratings` to determine if the response was blocked.", "code": "oGYTeo", "command": "chatgpt"}
YXGiVs	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 987183275560820806, "timestamp": "<t:1722871009:R>", "error": "Command raised an exception: AttributeError: 'PretendContext' object has no attribute 'lastfm_message'", "code": "YXGiVs", "command": "nowplaying"}
qz5yEo	{"guild_id": 1202055026797707316, "channel_id": 1269988483158507521, "user_id": 1208370307551989761, "timestamp": "<t:1722874974:R>", "error": "Command raised an exception: ValueError: Invalid operation: The `response.text` quick accessor requires the response to contain a valid `Part`, but none were returned. Please check the `candidate.safety_ratings` to determine if the response was blocked.", "code": "qz5yEo", "command": "chatgpt"}
mx8hqA	{"guild_id": 1202055026797707316, "channel_id": 1269988483158507521, "user_id": 1208370307551989761, "timestamp": "<t:1722876969:R>", "error": "Command raised an exception: Forbidden: 403 Forbidden (error code: 50013): Missing Permissions", "code": "mx8hqA", "command": "nickname"}
R7Leqi	{"guild_id": 1202055026797707316, "channel_id": 1269988483158507521, "user_id": 1208370307551989761, "timestamp": "<t:1722876979:R>", "error": "Command raised an exception: Forbidden: 403 Forbidden (error code: 50013): Missing Permissions", "code": "R7Leqi", "command": "nickname"}
qmWoHH	{"guild_id": 1202055026797707316, "channel_id": 1269988494319681559, "user_id": 1169601140804042842, "timestamp": "<t:1722878963:R>", "error": "Command raised an exception: TypeError: PretendContext.reply() got an unexpected keyword argument 'allowed_mentions'", "code": "qmWoHH", "command": "8ball"}
RBKque	{"guild_id": 1202055026797707316, "channel_id": 1269988494319681559, "user_id": 1169601140804042842, "timestamp": "<t:1722879091:R>", "error": "Command raised an exception: ValueError: Invalid operation: The `response.text` quick accessor requires the response to contain a valid `Part`, but none were returned. Please check the `candidate.safety_ratings` to determine if the response was blocked.", "code": "RBKque", "command": "chatgpt"}
hMCBUw	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1722882618:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "hMCBUw", "command": "jishaku shell"}
1AhrJh	{"guild_id": 1271502845161508884, "channel_id": 1272536810832138270, "user_id": 187747524646404105, "timestamp": "<t:1723727013:R>", "error": "Command raised an exception: Error: BrowserType.launch: Executable doesn't exist at /root/.cache/ms-playwright/chromium-1129/chrome-linux/chrome\\n\\u2554\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2557\\n\\u2551 Looks like Playwright was just installed or updated.       \\u2551\\n\\u2551 Please run the following command to download new browsers: \\u2551\\n\\u2551                                                            \\u2551\\n\\u2551     playwright install                                     \\u2551\\n\\u2551                                                            \\u2551\\n\\u2551 <3 Playwright Team                                         \\u2551\\n\\u255a\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u255d", "code": "1AhrJh", "command": "screenshot"}
xUaIks	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723764548:R>", "error": "Command raised an exception: AttributeError: 'Utility' object has no attribute 'session'", "code": "xUaIks", "command": "fyp"}
KnbjDS	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723767964:R>", "error": "Command raised an exception: KeyError: 'avatar_url'", "code": "KnbjDS", "command": "help"}
JDaqYC	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723768167:R>", "error": "Command raised an exception: KeyError: 'avatar_url'", "code": "JDaqYC", "command": "help"}
GCy0Rd	{"guild_id": 950153022405763124, "channel_id": 1274204210711498854, "user_id": 598125772754124823, "timestamp": "<t:1723923652:R>", "error": "Command raised an exception: AttributeError: 'Donor' object has no attribute '_API__do_request'", "code": "GCy0Rd", "command": "chatgpt"}
0q1k70	{"guild_id": 950153022405763124, "channel_id": 1269411799875457171, "user_id": 598125772754124823, "timestamp": "<t:1723923822:R>", "error": "Command raised an exception: TypeError: API.ask_chatgpt() missing 1 required positional argument: 'prompt'", "code": "0q1k70", "command": "chatgpt"}
9Y6Pae	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723951325:R>", "error": "Command raised an exception: TypeError: object NoneType can't be used in 'await' expression", "code": "9Y6Pae", "command": "portal"}
gaBCdV	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 863914425445908490, "timestamp": "<t:1723957423:R>", "error": "Command raised an exception: UndefinedTableError: relation \\"uwu_lock\\" does not exist", "code": "gaBCdV", "command": "uwulock"}
OijWWn	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723957581:R>", "error": "Command raised an exception: UndefinedTableError: relation \\"uwu_lock\\" does not exist", "code": "OijWWn", "command": "help"}
zGXelE	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723957594:R>", "error": "Command raised an exception: UndefinedTableError: relation \\"uwu_lock\\" does not exist", "code": "zGXelE", "command": "help"}
OrZGoP	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 863914425445908490, "timestamp": "<t:1723958510:R>", "error": "Command raised an exception: AttributeError: 'Member' object has no attribute 'avatar_url'", "code": "OrZGoP", "command": "jishaku override"}
hbjrVM	{"guild_id": 1274119155431379045, "channel_id": 1274122772607668398, "user_id": 1130715311897858180, "timestamp": "<t:1723991285:R>", "error": "Command raised an exception: NotFound: 404 Not Found (error code: 10003): Unknown Channel", "code": "hbjrVM", "command": "channel remove"}
oyimsR	{"guild_id": 1088761100503371839, "channel_id": 1176965908854476902, "user_id": 1131457898183135252, "timestamp": "<t:1724179228:R>", "error": "Command raised an exception: NotFound: 404 Not Found (error code: 10026): Unknown Ban", "code": "oyimsR", "command": "unban"}
kpat6y	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 187747524646404105, "timestamp": "<t:1723727053:R>", "error": "Command raised an exception: Error: BrowserType.launch: Executable doesn't exist at /root/.cache/ms-playwright/chromium-1129/chrome-linux/chrome\\n\\u2554\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2557\\n\\u2551 Looks like Playwright was just installed or updated.       \\u2551\\n\\u2551 Please run the following command to download new browsers: \\u2551\\n\\u2551                                                            \\u2551\\n\\u2551     playwright install                                     \\u2551\\n\\u2551                                                            \\u2551\\n\\u2551 <3 Playwright Team                                         \\u2551\\n\\u255a\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u255d", "code": "kpat6y", "command": "screenshot"}
mhPznW	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723764846:R>", "error": "Command raised an exception: AttributeError: 'Utility' object has no attribute 'session'", "code": "mhPznW", "command": "fyp"}
qJgDUg	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723768175:R>", "error": "Command raised an exception: KeyError: 'avatar_url'", "code": "qJgDUg", "command": "help"}
JSn87a	{"guild_id": 950153022405763124, "channel_id": 1274204210711498854, "user_id": 598125772754124823, "timestamp": "<t:1723923709:R>", "error": "Command raised an exception: AttributeError: 'Donor' object has no attribute '_API__do_request'", "code": "JSn87a", "command": "chatgpt"}
nnmQNh	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723951366:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'text_channels'", "code": "nnmQNh", "command": "portal"}
L2fs5P	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723957453:R>", "error": "Command raised an exception: UndefinedTableError: relation \\"uwu_lock\\" does not exist", "code": "L2fs5P", "command": "help"}
wQAWBz	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 863914425445908490, "timestamp": "<t:1723958575:R>", "error": "Command raised an exception: AttributeError: 'Member' object has no attribute 'avatar_url'", "code": "wQAWBz", "command": "jishaku"}
kAYbd3	{"guild_id": 1274119155431379045, "channel_id": 1274761719641804862, "user_id": 1130715311897858180, "timestamp": "<t:1723997286:R>", "error": "Command raised an exception: NotFound: 404 Not Found (error code: 10008): Unknown Message", "code": "kAYbd3", "command": "purge"}
4f8enI	{"guild_id": 1274119155431379045, "channel_id": 1274745975054798908, "user_id": 1211838285887053885, "timestamp": "<t:1723999013:R>", "error": "Command raised an exception: NotFound: 404 Not Found (error code: 10008): Unknown Message", "code": "4f8enI", "command": "purge"}
apWgPd	{"guild_id": 1088761100503371839, "channel_id": 1176965908854476902, "user_id": 1131457898183135252, "timestamp": "<t:1724179655:R>", "error": "Command raised an exception: NotFound: 404 Not Found (error code: 10026): Unknown Ban", "code": "apWgPd", "command": "unban"}
P0Sk0V	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 187747524646404105, "timestamp": "<t:1723727821:R>", "error": "Command raised an exception: Error: BrowserType.launch: Executable doesn't exist at /root/.cache/ms-playwright/chromium-1129/chrome-linux/chrome\\n\\u2554\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2557\\n\\u2551 Looks like Playwright was just installed or updated.       \\u2551\\n\\u2551 Please run the following command to download new browsers: \\u2551\\n\\u2551                                                            \\u2551\\n\\u2551     playwright install                                     \\u2551\\n\\u2551                                                            \\u2551\\n\\u2551 <3 Playwright Team                                         \\u2551\\n\\u255a\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u2550\\u255d", "code": "P0Sk0V", "command": "screenshot"}
hCSE7k	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723764917:R>", "error": "Command raised an exception: AttributeError: 'Utility' object has no attribute 'session'", "code": "hCSE7k", "command": "fyp"}
rU2VRz	{"guild_id": 950153022405763124, "channel_id": 1274204210711498854, "user_id": 863914425445908490, "timestamp": "<t:1723866505:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'title'", "code": "rU2VRz", "command": "queue"}
ZvTodB	{"guild_id": 950153022405763124, "channel_id": 1274204210711498854, "user_id": 598125772754124823, "timestamp": "<t:1723923783:R>", "error": "Command raised an exception: TypeError: API.ask_chatgpt() missing 1 required positional argument: 'prompt'", "code": "ZvTodB", "command": "chatgpt"}
VWXCyg	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723951435:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'text_channels'", "code": "VWXCyg", "command": "portal"}
rfRq4b	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723957612:R>", "error": "Command raised an exception: UndefinedTableError: relation \\"uwu_lock\\" does not exist", "code": "rfRq4b", "command": "jishaku"}
LQlXHB	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 863914425445908490, "timestamp": "<t:1723958577:R>", "error": "Command raised an exception: AttributeError: 'Member' object has no attribute 'avatar_url'", "code": "LQlXHB", "command": "jishaku"}
H9M3f7	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 863914425445908490, "timestamp": "<t:1723958583:R>", "error": "Command raised an exception: AttributeError: 'Member' object has no attribute 'avatar_url'", "code": "H9M3f7", "command": "jishaku"}
s8CHAH	{"guild_id": 1274119155431379045, "channel_id": 1274767861956612146, "user_id": 1211838285887053885, "timestamp": "<t:1723998842:R>", "error": "Command raised an exception: NotFound: 404 Not Found (error code: 10008): Unknown Message", "code": "s8CHAH", "command": "purge"}
9XCqG9	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 1074668481867419758, "timestamp": "<t:1723727942:R>", "error": "Command raised an exception: TimeoutError: Page.goto: Timeout 30000ms exceeded.\\nCall log:\\nnavigating to \\"https://scare.life/static/large.txt\\", waiting until \\"load\\"\\n", "code": "9XCqG9", "command": "screenshot"}
8eQyGm	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723764957:R>", "error": "Command raised an exception: AttributeError: 'Utility' object has no attribute 'session'", "code": "8eQyGm", "command": "fyp"}
QlP8BK	{"guild_id": 1273788483336667191, "channel_id": 1273788609631223828, "user_id": 1210027683938041876, "timestamp": "<t:1723904754:R>", "error": "Command raised an exception: NotFound: 404 Not Found (error code: 10008): Unknown Message", "code": "QlP8BK", "command": "role all"}
j1jU0V	{"guild_id": 950153022405763124, "channel_id": 1269411799875457171, "user_id": 598125772754124823, "timestamp": "<t:1723923863:R>", "error": "Command raised an exception: TypeError: API.ask_chatgpt() missing 1 required positional argument: 'self'", "code": "j1jU0V", "command": "chatgpt"}
GFOyA1	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723952001:R>", "error": "Command raised an exception: AttributeError: 'NoneType' object has no attribute 'text_channels'", "code": "GFOyA1", "command": "portal"}
kwXgMN	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 863914425445908490, "timestamp": "<t:1723957641:R>", "error": "Command raised an exception: UndefinedTableError: relation \\"uwu_lock\\" does not exist", "code": "kwXgMN", "command": "jishaku"}
lVEjEs	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 863914425445908490, "timestamp": "<t:1723958579:R>", "error": "Command raised an exception: AttributeError: 'Member' object has no attribute 'avatar_url'", "code": "lVEjEs", "command": "jishaku"}
OuGamb	{"guild_id": 892675627373699072, "channel_id": 1271715754785505391, "user_id": 1096131119012913248, "timestamp": "<t:1724063015:R>", "error": "Command raised an exception: NotFound: 404 Not Found (error code: 10026): Unknown Ban", "code": "OuGamb", "command": "unban"}
FPfihb	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 187747524646404105, "timestamp": "<t:1723727982:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"reactions\\" does not exist", "code": "FPfihb", "command": "nowplaying"}
HKpNj5	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723766528:R>", "error": "Command raised an exception: TypeError: Embed.add_field() got an unexpected keyword argument 'Value'", "code": "HKpNj5", "command": "botinfo"}
uKkpkz	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723768173:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"avatar_url\\" of relation \\"reskin\\" does not exist", "code": "uKkpkz", "command": "reskin avatar"}
W281A8	{"guild_id": 950153022405763124, "channel_id": 1274204210711498854, "user_id": 598125772754124823, "timestamp": "<t:1723919567:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "W281A8", "command": "jishaku shell"}
YaQI6I	{"guild_id": 950153022405763124, "channel_id": 1269411799875457171, "user_id": 598125772754124823, "timestamp": "<t:1723923884:R>", "error": "Command raised an exception: AttributeError: 'Donor' object has no attribute '_API__do_request'", "code": "YaQI6I", "command": "chatgpt"}
m7Sj1U	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723952079:R>", "error": "Command raised an exception: Forbidden: 403 Forbidden (error code: 50007): Cannot send messages to this user", "code": "m7Sj1U", "command": "portal"}
suAVzY	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 863914425445908490, "timestamp": "<t:1723957643:R>", "error": "Command raised an exception: UndefinedTableError: relation \\"uwu_lock\\" does not exist", "code": "suAVzY", "command": "jishaku"}
qXUbrL	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723957837:R>", "error": "Command raised an exception: UndefinedTableError: relation \\"uwu_lock\\" does not exist", "code": "qXUbrL", "command": "jishaku"}
6J6wdS	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 863914425445908490, "timestamp": "<t:1723958580:R>", "error": "Command raised an exception: AttributeError: 'Member' object has no attribute 'avatar_url'", "code": "6J6wdS", "command": "help"}
uh1sNl	{"guild_id": 892675627373699072, "channel_id": 1271715754785505391, "user_id": 1252782146100269126, "timestamp": "<t:1724105506:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"reactions\\" does not exist", "code": "uh1sNl", "command": "nowplaying"}
Cg3Oa8	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 187747524646404105, "timestamp": "<t:1723730246:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn content: Must be 2000 or fewer in length.", "code": "Cg3Oa8", "command": "chatgpt"}
oYIwAj	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 187747524646404105, "timestamp": "<t:1723730253:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn content: Must be 2000 or fewer in length.", "code": "oYIwAj", "command": "chatgpt"}
GTkaRE	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723767808:R>", "error": "Command raised an exception: KeyError: 'avatar_url'", "code": "GTkaRE", "command": "reskin enable"}
sl0Yei	{"guild_id": 950153022405763124, "channel_id": 1274204210711498854, "user_id": 598125772754124823, "timestamp": "<t:1723921513:R>", "error": "Command raised an exception: RuntimeError: Session is closed", "code": "sl0Yei", "command": "jishaku shell"}
Dss24G	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723952902:R>", "error": "Command raised an exception: ContentTypeError: 0, message='Attempt to decode JSON with unexpected mimetype: text/html; charset=utf-8', url='https://api.akari.bot/snapstory?username=snapchat'", "code": "Dss24G", "command": "snapchatstory"}
e4fL9i	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 863914425445908490, "timestamp": "<t:1723957645:R>", "error": "Command raised an exception: UndefinedTableError: relation \\"uwu_lock\\" does not exist", "code": "e4fL9i", "command": "jishaku"}
CpLIIM	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 863914425445908490, "timestamp": "<t:1723958738:R>", "error": "Command raised an exception: AttributeError: 'Member' object has no attribute 'avatar_url'", "code": "CpLIIM", "command": "jishaku"}
bmAQU4	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 187747524646404105, "timestamp": "<t:1723756682:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"reactions\\" does not exist", "code": "bmAQU4", "command": "nowplaying"}
yTb7Hg	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723767814:R>", "error": "Command raised an exception: KeyError: 'avatar_url'", "code": "yTb7Hg", "command": "jishaku debug"}
LYLqLF	{"guild_id": 950153022405763124, "channel_id": 1274204210711498854, "user_id": 598125772754124823, "timestamp": "<t:1723921915:R>", "error": "Command raised an exception: TypeError: Webhook.send() got an unexpected keyword argument 'reference'", "code": "LYLqLF", "command": "reskin enable"}
rCjZEv	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 863914425445908490, "timestamp": "<t:1723957659:R>", "error": "Command raised an exception: UndefinedTableError: relation \\"uwu_lock\\" does not exist", "code": "rCjZEv", "command": "jishaku"}
dxixBO	{"guild_id": 950153022405763124, "channel_id": 1269411445741715520, "user_id": 598125772754124823, "timestamp": "<t:1723959740:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn message_reference: Unknown message", "code": "dxixBO", "command": "uwulock"}
BRjuDM	{"guild_id": 950153022405763124, "channel_id": 1274204210711498854, "user_id": 863914425445908490, "timestamp": "<t:1723960127:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn message_reference: Unknown message", "code": "BRjuDM", "command": "uwulock"}
aMoWgX	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 863914425445908490, "timestamp": "<t:1723960435:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn message_reference: Unknown message", "code": "aMoWgX", "command": "uwulock"}
l833DR	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 863914425445908490, "timestamp": "<t:1723763927:R>", "error": "Command raised an exception: UndefinedColumnError: column \\"reactions\\" does not exist", "code": "l833DR", "command": "nowplaying"}
PVLxFS	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723767816:R>", "error": "Command raised an exception: KeyError: 'avatar_url'", "code": "PVLxFS", "command": "jishaku debug"}
2tDpo5	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723767826:R>", "error": "Command raised an exception: KeyError: 'avatar_url'", "code": "2tDpo5", "command": "help"}
XfQjPs	{"guild_id": 950153022405763124, "channel_id": 1274204210711498854, "user_id": 598125772754124823, "timestamp": "<t:1723921925:R>", "error": "Command raised an exception: TypeError: Webhook.send() got an unexpected keyword argument 'reference'", "code": "XfQjPs", "command": "error"}
MYSupL	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 863914425445908490, "timestamp": "<t:1723958439:R>", "error": "Command raised an exception: AttributeError: 'Member' object has no attribute 'avatar_url'", "code": "MYSupL", "command": "jishaku debug"}
H1tlXy	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 863914425445908490, "timestamp": "<t:1723958518:R>", "error": "Command raised an exception: AttributeError: 'Member' object has no attribute 'avatar_url'", "code": "H1tlXy", "command": "jishaku"}
qPhhE1	{"guild_id": 950153022405763124, "channel_id": 1269411445741715520, "user_id": 598125772754124823, "timestamp": "<t:1723960057:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn message_reference: Unknown message", "code": "qPhhE1", "command": "uwulock"}
KNwwqX	{"guild_id": 950153022405763124, "channel_id": 1269408686628012125, "user_id": 598125772754124823, "timestamp": "<t:1723763948:R>", "error": "Command raised an exception: AttributeError: 'HybridCommand' object has no attribute 'feed'", "code": "KNwwqX", "command": "fyp"}
i7w0In	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723767952:R>", "error": "Command raised an exception: KeyError: 'avatar_url'", "code": "i7w0In", "command": "reskin enable"}
8vcnj7	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 598125772754124823, "timestamp": "<t:1723922884:R>", "error": "Command raised an exception: AttributeError: 'AkariContext' object has no attribute 'user'", "code": "8vcnj7", "command": "reskin disable"}
mXP9sV	{"guild_id": 950153022405763124, "channel_id": 1256138394069766184, "user_id": 863914425445908490, "timestamp": "<t:1723958496:R>", "error": "Command raised an exception: AttributeError: 'Member' object has no attribute 'avatar_url'", "code": "mXP9sV", "command": "jishaku override"}
8w3Ovh	{"guild_id": 1274163487312187435, "channel_id": 1274163487312187438, "user_id": 1130715311897858180, "timestamp": "<t:1723989773:R>", "error": "Command raised an exception: HTTPException: 400 Bad Request (error code: 50035): Invalid Form Body\\nIn message_reference: Unknown message", "code": "8w3Ovh", "command": "uwulock"}
\.


--
-- Data for Name: fake_perms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fake_perms (guild_id, role_id, perms) FROM stdin;
1202055026797707316	1269988403571589131	["change_nickname"]
1202055026797707316	1269988363327246407	["manage_channels"]
1202055026797707316	1269988364623282290	["manage_roles"]
1202055026797707316	1269988373603553341	["moderate_members", "manage_messages", "manage_nicknames", "manage_threads"]
\.


--
-- Data for Name: filter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filter (guild_id, mode, rule_id) FROM stdin;
1202055026797707316	invites	1270035597968543754
1202055026797707316	words	1270035842282557550
\.


--
-- Data for Name: force_nick; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.force_nick (guild_id, user_id, nickname) FROM stdin;
950153022405763124	461294830287585291	pls fuck me daddy
950153022405763124	750379503179661444	com’s cute little bitch
950153022405763124	1259709597694824469	juno’s sex doll
950153022405763124	1208472692337020999	sam the femboy
1274163487312187435	1180841403480289400	hi
\.


--
-- Data for Name: gamestats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gamestats (user_id, game, wins, loses, total) FROM stdin;
\.


--
-- Data for Name: give_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.give_roles (guild_id, role_id) FROM stdin;
\.


--
-- Data for Name: giveaway; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.giveaway (guild_id, channel_id, message_id, winners, members, finish, host, title) FROM stdin;
\.


--
-- Data for Name: global_disabled_cmds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.global_disabled_cmds (cmd, disabled, disabled_by) FROM stdin;
avatarhistory	t	598125772754124823
\.


--
-- Data for Name: globalban; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.globalban (user_id, reason) FROM stdin;
\.


--
-- Data for Name: gw_ended; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gw_ended (channel_id, message_id, members) FROM stdin;
1273788609631223828	1274395812612538489	[1210027683938041876, 801958136885280788, 1222973436935147591, 1155572277405032519, 1261794642047799336, 1034793618516492358, 889132951093264457, 1155728679574458438, 1269370561872527381, 1143660517928476783]
1273788609631223828	1274394910954622986	[1210027683938041876, 1255953945734549669, 801958136885280788, 1222973436935147591, 1155572277405032519, 1261794642047799336, 538483170434220032, 1034793618516492358, 658383534029013024]
\.


--
-- Data for Name: hardban; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hardban (guild_id, user_id, reason, moderator_id) FROM stdin;
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (id, url) FROM stdin;
\.


--
-- Data for Name: imgonly; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imgonly (guild_id, channel_id) FROM stdin;
1202055026797707316	1269988506156007507
1202055026797707316	1269988502511030284
1274119155431379045	1274644681422147686
\.


--
-- Data for Name: invoke; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.invoke (guild_id, command, embed) FROM stdin;
\.


--
-- Data for Name: jail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jail (guild_id, channel_id, role_id) FROM stdin;
950153022405763124	1269414814246240267	1269414811691651123
1202055026797707316	1270042379247681640	1270042374810239115
1274119155431379045	1274639929653198908	1274639927375696017
1274163487312187435	1274727119171092490	1274727116889653269
\.


--
-- Data for Name: jail_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jail_members (guild_id, user_id, roles, jailed_at) FROM stdin;
\.


--
-- Data for Name: lastfm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lastfm (user_id, username) FROM stdin;
\.


--
-- Data for Name: lastfm_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lastfm_users (id, discord_user_id, username, session_key) FROM stdin;
\N	598125772754124823	resentdev	dT_OdlLnK4MT5aMuLsym9zHAPsVokUSp
\N	1169601140804042842	precinations	juBlstfYSw9ZxFiOG4Gr91Cj2ufpq9Dd
\N	971464344749629512	FiJiCoLD	mcVJTGkf3nD0qjE5AikIQPv6hgoXQyba
\.


--
-- Data for Name: lastfmcc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lastfmcc (user_id, command) FROM stdin;
598125772754124823	hi
\.


--
-- Data for Name: leave; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.leave (guild_id, channel_id, message) FROM stdin;
1202055026797707316	1269988494319681559	fys {user.mention}
\.


--
-- Data for Name: level_rewards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.level_rewards (guild_id, level, role_id) FROM stdin;
1202055026797707316	1	1269988416527929386
1202055026797707316	3	1269988415646990417
1202055026797707316	5	1269988414397087930
1202055026797707316	7	1269988412983607377
1202055026797707316	7	1269988403571589131
1202055026797707316	10	1269988411679445044
1202055026797707316	15	1269988410462965824
1202055026797707316	20	1269988409154211860
1202055026797707316	25	1269988407682273342
1202055026797707316	50	1269988384995016715
1202055026797707316	75	1269988380855242806
1202055026797707316	100	1269988380142342256
1202055026797707316	125	1269988378510884965
\.


--
-- Data for Name: level_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.level_user (guild_id, user_id, xp, level, target_xp) FROM stdin;
1202055026797707316	1208370307551989761	296	6	316
1202055026797707316	732530644412006460	44	2	118
1202055026797707316	1169601140804042842	64	3	170
\.


--
-- Data for Name: leveling; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.leveling (guild_id, channel_id, message, booster_boost) FROM stdin;
1202055026797707316	1269988498576904235	congrats {user.mention}, your dick's **{level}cm** long now	\N
\.


--
-- Data for Name: lfmode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lfmode (user_id, mode) FROM stdin;
\.


--
-- Data for Name: lfreactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lfreactions (user_id, reactions) FROM stdin;
\.


--
-- Data for Name: lock_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lock_role (guild_id, role_id) FROM stdin;
\.


--
-- Data for Name: lockdown_ignore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lockdown_ignore (guild_id, channel_id) FROM stdin;
\.


--
-- Data for Name: logging; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logging (guild_id, messages, guild, roles, channels, members) FROM stdin;
1254536563186991184	1269682209514717327	1269682209514717327	1269682209514717327	1269682209514717327	1269682209514717327
1202055026797707316	1269988481157828612	1269988481157828612	1269988481157828612	1269988481157828612	1269988481157828612
950153022405763124	1269411799875457171	1269411799875457171	1269411799875457171	1269411799875457171	1269411799875457171
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs (key, guild_id, channel_id, author, logs) FROM stdin;
\.


--
-- Data for Name: marry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marry (author, soulmate, "time") FROM stdin;
\.


--
-- Data for Name: number_counter; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.number_counter (guild_id, channel_id, last_counted, current_number) FROM stdin;
\.


--
-- Data for Name: opened_tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.opened_tickets (guild_id, channel_id, user_id) FROM stdin;
\.


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prefixes (guild_id, prefix) FROM stdin;
1268777695244980389	-
1202055026797707316	,
892675627373699072	-
950153022405763124	;
1273788483336667191	,
1265355781369495714	;
1266971195761234002	,
1231607483030569030	;
1274163487312187435	,
\.


--
-- Data for Name: reactionrole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reactionrole (guild_id, channel_id, message_id, emoji, role_id) FROM stdin;
1254536563186991184	1269695139844980902	1269695227346813009	<:sword:1255220317782020178>	1269682043189596325
1254536563186991184	1269695139844980902	1269697719606448219	<:sword:1255220317782020178>	1269682043189596325
1254536563186991184	1269697501980524585	1269697659724238919	<:sword:1255220317782020178>	1269682041340035163
1254536563186991184	1269682195404951567	1269699535245017108	<:sword:1255220317782020178>	1269682041340035163
\.


--
-- Data for Name: reminder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reminder (user_id, channel_id, guild_id, date, task) FROM stdin;
\.


--
-- Data for Name: reskin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reskin (user_id, toggled, name, avatar) FROM stdin;
598125772754124823	f	hi	https://cdn.discordapp.com/avatars/598125772754124823/ca5db36c447e2f2c302754e054525286.png?size=1024
732530644412006460	t	i ❤️ jesus	https://cdn.discordapp.com/avatars/732530644412006460/9c3d03cab48e8184c4ec2800f2220c4c.png?size=1024
1169601140804042842	t	bleed	https://cdn.discordapp.com/avatars/593921296224747521/4021abad5c35389022a1004a095f544e.png?size=1024
598125772754124823	t	x32u	https://cdn.discordapp.com/avatars/598125772754124823/e4fb2a49b1c6a9e1de32520a66dbd6ca.png?size=1024
598125772754124823	t	x32u	https://cdn.discordapp.com/avatars/598125772754124823/e4fb2a49b1c6a9e1de32520a66dbd6ca.png?size=1024
\.


--
-- Data for Name: reskin_enabled; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reskin_enabled (guild_id) FROM stdin;
\.


--
-- Data for Name: reskin_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reskin_user (user_id, toggled, name, avatar) FROM stdin;
\.


--
-- Data for Name: restore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restore (guild_id, user_id, roles) FROM stdin;
1127267129121587370	1223498284996235337	[1127267129121587370, 1208816648782356570, 1208816660425867326, 1127267129176117269, 1208819086608441445, 1208819889360339014]
1226492622617444423	746608806867501099	[1226492622617444423, 1227139363360477204, 1226770585724518432, 1226492622617444425, 1250041214372155433]
1268137490011656213	1250829526964109387	[1268137490011656213, 1268592294546899046]
1268137490011656213	1149535834756874250	[1268137490011656213, 1268592294546899046]
950153022405763124	1207108276517605411	[950153022405763124]
950153022405763124	1185934752478396528	[950153022405763124]
950153022405763124	716390085896962058	[950153022405763124]
950153022405763124	235148962103951360	[950153022405763124]
950153022405763124	432610292342587392	[950153022405763124]
950153022405763124	155149108183695360	[950153022405763124]
950153022405763124	491769129318088714	[950153022405763124]
950153022405763124	720351927581278219	[950153022405763124]
950153022405763124	270904126974590976	[950153022405763124]
950153022405763124	578258045889544192	[950153022405763124]
950153022405763124	1256752431040036915	[950153022405763124]
950153022405763124	356268235697553409	[950153022405763124]
950153022405763124	557628352828014614	[950153022405763124]
950153022405763124	711428816127393844	[950153022405763124]
950153022405763124	949479338275913799	[950153022405763124]
950153022405763124	646937666251915264	[950153022405763124]
950153022405763124	1269050664416448513	[950153022405763124]
950153022405763124	1207108193147297837	[950153022405763124]
950153022405763124	1207108145235624020	[950153022405763124]
950153022405763124	1207108189884252173	[950153022405763124]
950153022405763124	1207108186365239296	[950153022405763124]
950153022405763124	1207108186260119552	[950153022405763124]
950153022405763124	1207108189913358342	[950153022405763124]
950153022405763124	1207108183584280608	[950153022405763124]
950153022405763124	1208472692337020999	[950153022405763124]
950153022405763124	987183275560820806	[950153022405763124]
950153022405763124	1169601140804042842	[950153022405763124]
950153022405763124	866197648493903914	[950153022405763124]
950153022405763124	1059833824541941873	[950153022405763124]
950153022405763124	1107099551816499200	[950153022405763124]
950153022405763124	1190186115307671573	[950153022405763124]
950153022405763124	996099484515827784	[950153022405763124]
950153022405763124	1133453569312440340	[950153022405763124]
950153022405763124	813062593316388864	[950153022405763124]
950153022405763124	518871170569863180	[950153022405763124]
950153022405763124	1043332857667538954	[950153022405763124]
950153022405763124	677611959558078477	[950153022405763124]
950153022405763124	896738730784747590	[950153022405763124]
950153022405763124	1179328426801381426	[950153022405763124]
950153022405763124	1241859669341896805	[950153022405763124]
950153022405763124	995167001779638293	[950153022405763124]
950153022405763124	1142660932900757626	[950153022405763124]
950153022405763124	1152008892918796428	[950153022405763124]
950153022405763124	798046382808104990	[950153022405763124]
950153022405763124	1076771218805489774	[950153022405763124]
950153022405763124	852894685729914910	[950153022405763124]
950153022405763124	1128790306750464050	[950153022405763124]
950153022405763124	1193509716123467878	[950153022405763124]
950153022405763124	684431774620712993	[950153022405763124]
950153022405763124	849339857993990144	[950153022405763124]
950153022405763124	1259709597694824469	[950153022405763124]
950153022405763124	1269433308945711135	[950153022405763124]
950153022405763124	995580403198988328	[950153022405763124]
950153022405763124	840439255708991508	[950153022405763124]
950153022405763124	447533024867778572	[950153022405763124]
950153022405763124	661306842273677341	[950153022405763124]
950153022405763124	1262943338340945920	[950153022405763124]
972867465635848253	598125772754124823	[972867465635848253, 972899470872285244, 1170198000014995556]
972867465635848253	1268777073078571121	[972867465635848253, 972899470872285244]
946800234804166697	1268777073078571121	[946800234804166697, 1036384181690847394]
946800234804166697	1146616084183650355	[946800234804166697, 1036384181690847394]
950153022405763124	1139318380676009995	[950153022405763124]
946800234804166697	845724632086347787	[946800234804166697, 1036384181690847394, 948343502507491339, 1171527920716619806]
946800234804166697	452763253861253120	[946800234804166697, 1036384181690847394]
950153022405763124	187747524646404105	[950153022405763124]
946800234804166697	1175049107891568782	[946800234804166697, 1036384181690847394, 1171527920716619806]
1208651928507129887	948573943650992169	[1208651928507129887]
950153022405763124	1044196479046254652	[950153022405763124]
946800234804166697	915101417595891742	[946800234804166697, 1036384181690847394, 1171527920716619806]
892675627373699072	697224554728390667	[892675627373699072, 1249814208334528533]
950153022405763124	969026219276394556	[950153022405763124]
672178593371127808	810066670055718914	[672178593371127808, 698323076202496121]
946800234804166697	938033489478025217	[946800234804166697, 1036384181690847394, 981564541982875688]
950153022405763124	908075736131338260	[950153022405763124]
946800234804166697	819386457030131732	[946800234804166697, 1036384181690847394]
950153022405763124	1118915899311784009	[950153022405763124]
1208651928507129887	969263509802201098	[1208651928507129887]
946800234804166697	1142143127235334315	[946800234804166697, 1036384181690847394]
892675627373699072	994566460108181524	[892675627373699072, 1249814208334528533]
946800234804166697	874023343165165588	[946800234804166697, 1036384181690847394]
849340259442491412	1223026491751923782	[849340259442491412]
946800234804166697	1123586224851009656	[946800234804166697, 1036384181690847394, 948345555090833418]
892675627373699072	357585970100699146	[892675627373699072, 1249814208334528533]
1208651928507129887	900446386833727489	[1208651928507129887]
892675627373699072	1071934226011803688	[892675627373699072, 1249814208334528533]
946800234804166697	1212116225635651607	[946800234804166697, 1036384181690847394]
950153022405763124	882483895839358986	[950153022405763124]
946800234804166697	950536718275182592	[946800234804166697, 1036384181690847394]
946800234804166697	1250220782886584400	[946800234804166697, 1036384181690847394]
950153022405763124	954923887848722462	[950153022405763124]
946800234804166697	789866732465815623	[946800234804166697, 1036384181690847394]
950153022405763124	1221145814626205781	[950153022405763124]
946800234804166697	791942815193628702	[946800234804166697, 1036384181690847394, 948343375462019112]
950153022405763124	906756775158611989	[950153022405763124]
672178593371127808	647485123977150475	[672178593371127808, 698323076202496121]
950153022405763124	1057310810440994967	[950153022405763124]
946800234804166697	1192911412410986634	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1149170812331503688	[946800234804166697, 1036384181690847394, 948343502507491339]
950153022405763124	585435009113128960	[950153022405763124]
946800234804166697	662770920821096452	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1115162865918283787	[946800234804166697, 1036384181690847394]
946800234804166697	1150040762973687848	[946800234804166697, 1036384181690847394, 948343346257076224]
950153022405763124	1015714172195049502	[950153022405763124]
946800234804166697	667126864724230204	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1129544554262040709	[946800234804166697, 1036384181690847394, 948343375462019112]
892675627373699072	1252001166703853588	[892675627373699072, 1249814208334528533]
946800234804166697	921520450138427392	[946800234804166697, 1036384181690847394]
946800234804166697	795634211083255848	[946800234804166697, 1036384181690847394]
892675627373699072	820661475013820496	[892675627373699072, 1249814208334528533]
946800234804166697	926931780236349530	[946800234804166697, 1036384181690847394]
892675627373699072	1031682374678880286	[892675627373699072, 1249814208334528533]
892675627373699072	902397632104759327	[892675627373699072, 1249814208334528533]
946800234804166697	951330074102214696	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	857734631247708181	[946800234804166697, 1036384181690847394, 948343375462019112]
672178593371127808	789283935070322699	[672178593371127808, 934134615201947708, 772910083197370409, 772910080974651453, 772910065530699786, 680924892601778184, 698323076202496121, 767613428525170689]
946800234804166697	1136121807913623663	[946800234804166697, 1036384181690847394]
946800234804166697	1166963963817377883	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1072986628022349906	[946800234804166697, 1036384181690847394]
950153022405763124	720397027636412519	[950153022405763124]
950153022405763124	498250712908562435	[950153022405763124]
950153022405763124	461294830287585291	[950153022405763124]
950153022405763124	713105351582548010	[950153022405763124]
892675627373699072	1069258018258178059	[892675627373699072, 1249814208334528533]
1208651928507129887	1069258018258178059	[1208651928507129887]
950153022405763124	1147292410116837416	[950153022405763124]
946800234804166697	1073240117394800774	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1054029157031497839	[946800234804166697, 1036384181690847394]
946800234804166697	502979907568271371	[946800234804166697, 1036384181690847394]
946800234804166697	678807889678172205	[946800234804166697, 1036384181690847394]
892675627373699072	1170953822634520628	[892675627373699072, 1249814208334528533]
892675627373699072	1235271206287048769	[892675627373699072, 1249814208334528533]
950153022405763124	858699890636619817	[950153022405763124]
946800234804166697	944050743483203584	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	899153071538585600	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	755544681776939008	[946800234804166697, 1036384181690847394]
672178593371127808	1129482004673605703	[672178593371127808, 698323076202496121]
950153022405763124	1234993627407716413	[950153022405763124]
950153022405763124	814125636825513995	[950153022405763124]
892675627373699072	754646394018725890	[892675627373699072, 1249814208334528533]
950153022405763124	710028376286429254	[950153022405763124]
1254536563186991184	1094942437820076083	[1254536563186991184, 1255628812012490784, 1255961078551019630]
1254536563186991184	356268235697553409	[1254536563186991184, 1255628812012490784, 1255961078551019630]
1254536563186991184	292953664492929025	[1254536563186991184, 1255628812012490784]
892675627373699072	840439255708991508	[892675627373699072, 1249814208334528533]
946800234804166697	1189384877418745947	[946800234804166697, 1036384181690847394]
1254536563186991184	416358583220043796	[1254536563186991184]
950153022405763124	682227930977402920	[950153022405763124]
946800234804166697	495958791666270209	[946800234804166697, 1036384181690847394]
950153022405763124	987091223837835294	[950153022405763124]
950153022405763124	742402634559914125	[950153022405763124]
892675627373699072	1234993627407716413	[892675627373699072, 1249814208334528533]
892675627373699072	974580866615496714	[892675627373699072, 1249814208334528533]
892675627373699072	968753252873146439	[892675627373699072, 1249814208334528533]
946800234804166697	1222558126981648570	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	837317859277013022	[946800234804166697, 1036384181690847394]
1202055026797707316	1268777073078571121	[1202055026797707316, 1269988435125338184, 1269988359330201710, 1269988357732040725]
1202055026797707316	912268358416756816	[1202055026797707316, 1269988435125338184, 1269988359330201710, 1269988357732040725]
1202055026797707316	1034747093887234068	[1202055026797707316, 1269988357732040725]
946800234804166697	933154896058925076	[946800234804166697, 1036384181690847394]
950153022405763124	1259940333597360158	[950153022405763124]
946800234804166697	779716535802658836	[946800234804166697, 1036384181690847394]
950153022405763124	1188955485462872226	[950153022405763124]
946800234804166697	744734403468591185	[946800234804166697, 1036384181690847394, 1171527920716619806]
1257723151580659852	994051042939523174	[1257723151580659852, 1260628272790634589, 1260160410913345556, 1258283118272712814]
1257723151580659852	1145151922282692738	[1257723151580659852, 1258283118272712814]
946800234804166697	927168603449614376	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	742117131952586782	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
1090069129928654940	896277278500200450	[1090069129928654940, 1124541858736001024, 1092471557093331035]
1232875191911059476	1259709597694824469	[1232875191911059476]
1144686158601793559	1151773515016568852	[1144686158601793559]
1232875191911059476	1262943338340945920	[1232875191911059476]
946800234804166697	547882311983824907	[946800234804166697]
1016406976860782662	1024751284487733300	[1016406976860782662, 1047608205502590997]
946800234804166697	1154138884461035592	[946800234804166697, 1036384181690847394]
1232875191911059476	1173899303773806621	[1232875191911059476]
1232875191911059476	1067254727252922439	[1232875191911059476]
1016406976860782662	562443001029197885	[1016406976860782662, 1047608205502590997]
1090069129928654940	828756607012831263	[1090069129928654940, 1124541857481900042, 1092471557093331035]
1144686158601793559	847225536957906944	[1144686158601793559]
1016406976860782662	1006676890796437535	[1016406976860782662, 1047608205502590997]
946800234804166697	857689903068741663	[946800234804166697, 1036384181690847394]
946800234804166697	785654253854916639	[946800234804166697, 1036384181690847394]
1090069129928654940	970457385590194187	[1090069129928654940, 1124861228469207050, 1124541857481900042, 1092471557093331035]
1144686158601793559	1116284783941664798	[1144686158601793559]
1236930028172873769	1042764840319602709	[1236930028172873769]
892675627373699072	1217017901953847376	[892675627373699072, 1249814208334528533]
1144686158601793559	1096792048104902676	[1144686158601793559]
946800234804166697	687402525024059433	[946800234804166697, 1036384181690847394, 948343488594972724]
950153022405763124	663111989945696307	[950153022405763124]
950153022405763124	802350881608958042	[950153022405763124, 1270496433304244234]
950153022405763124	662249741845004308	[950153022405763124, 1270496433304244234]
1232875191911059476	1188163689208090684	[1232875191911059476]
1232875191911059476	187747524646404105	[1232875191911059476]
950153022405763124	236957169302372352	[950153022405763124]
1196884840633602068	685499306165272597	[1196884840633602068]
892675627373699072	1210274379037151285	[892675627373699072, 1249814208334528533]
1144686158601793559	1162536006457774110	[1144686158601793559]
950153022405763124	852784127447269396	[950153022405763124]
892675627373699072	186228036142759937	[892675627373699072, 1249814208334528533]
950153022405763124	1203756334642765864	[950153022405763124, 1270496433304244234]
946800234804166697	777233668212129813	[946800234804166697, 1036384181690847394, 948343502507491339]
950153022405763124	768078659146874890	[950153022405763124, 1270496433304244234]
950153022405763124	906293726639448125	[950153022405763124, 1270496433304244234]
946800234804166697	473085066214375425	[946800234804166697, 1036384181690847394]
946800234804166697	860542766147698698	[946800234804166697, 1036384181690847394]
946800234804166697	1124605861860487198	[946800234804166697, 1036384181690847394]
946800234804166697	949778694296174624	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	874627582325301278	[946800234804166697, 1036384181690847394]
1196884840633602068	440947997262741504	[1196884840633602068]
950153022405763124	1054018891254337556	[950153022405763124, 1270496433304244234]
672178593371127808	928430794513465354	[672178593371127808, 772910080974651453, 955309593980973106, 698323076202496121, 767613428525170689]
950153022405763124	1098175594363109459	[950153022405763124, 1270496433304244234]
892675627373699072	886064010468921425	[892675627373699072, 1249814208334528533]
1196884840633602068	1051064251818721290	[1196884840633602068]
946800234804166697	1156932147920248912	[946800234804166697, 1036384181690847394, 948343502507491339, 948345555090833418]
946800234804166697	1142484479923978250	[946800234804166697, 1036384181690847394, 948343488594972724]
892675627373699072	1134785376867860480	[892675627373699072, 1249814208334528533]
892675627373699072	1267253369987268628	[892675627373699072, 1249814208334528533]
1090069129928654940	656619914680991745	[1090069129928654940, 1133788651197833318, 1124541857481900042, 1092471557093331035]
946800234804166697	1141128835539148921	[946800234804166697, 1036384181690847394, 948343488594972724]
1016406976860782662	1031707931537838150	[1016406976860782662, 1047608205502590997]
672178593371127808	691315607404150825	[672178593371127808, 772910065530699786, 698323076202496121, 683152548051550221]
950153022405763124	386114379235590145	[950153022405763124, 1270496433304244234]
672178593371127808	856958861877182494	[672178593371127808, 698323076202496121]
1016406976860782662	945432160310022164	[1016406976860782662, 1047608205502590997]
946800234804166697	1036307338237329448	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	763444110853406730	[946800234804166697, 1036384181690847394, 1171527920716619806]
672178593371127808	455383194007765032	[672178593371127808, 698323076202496121]
950153022405763124	465895574172860437	[950153022405763124, 1270496433304244234]
946800234804166697	935511368709324813	[946800234804166697, 1036384181690847394, 1171527920716619806]
1239885748484964362	813519747546218546	[1239885748484964362, 1241059575550054470, 1239885748484964364, 1239885748493090844, 1239885748501614598, 1239885748531101774, 1239885748531101773]
950153022405763124	1082472997379649546	[950153022405763124, 1270496433304244234]
950153022405763124	1075205262195052586	[950153022405763124, 1270496433304244234]
1090069129928654940	1040407648153116773	[1090069129928654940, 1092471557093331035]
892675627373699072	1141337638217986049	[892675627373699072]
946800234804166697	1065949984714924032	[946800234804166697, 1036384181690847394, 948345555090833418]
1090069129928654940	819897305564971019	[1090069129928654940, 1124541857481900042, 1092471557093331035]
950153022405763124	1142977519872647198	[950153022405763124, 1270496433304244234]
1016406976860782662	745624548077994094	[1016406976860782662, 1047608205502590997]
950153022405763124	803686632883486740	[950153022405763124, 1270496433304244234]
946800234804166697	853287934148739094	[946800234804166697, 1036384181690847394]
1090069129928654940	926168893448413274	[1090069129928654940, 1092471557093331035]
946800234804166697	1107172593104060427	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	671965699907911700	[946800234804166697, 1036384181690847394, 1171527920716619806]
1196884840633602068	661227287953276928	[1196884840633602068]
946800234804166697	1248008229691326504	[946800234804166697, 1036384181690847394, 1171527920716619806]
1090069129928654940	1125274127515787315	[1090069129928654940, 1124541864008220732, 1124541857481900042, 1092471557093331035]
950153022405763124	1169139655829102612	[950153022405763124, 1270496433304244234]
1090069129928654940	801484991531450409	[1090069129928654940, 1124541865232977941, 1124541857481900042, 1092471557093331035]
892675627373699072	1262336941228163074	[892675627373699072, 1249814208334528533]
1016406976860782662	877304236759715900	[1016406976860782662, 1047608205502590997]
1214059201635024957	1161641194951024741	[1214059201635024957, 1219624617530884119, 1219624404548587630, 1219624130706669699, 1219624316812136458, 1214071593345482782, 1237904914034851861]
1144686158601793559	779374951274643486	[1144686158601793559]
1239885748484964362	904390508871303198	[1239885748484964362, 1249987000350670978, 1241059575550054470, 1239885748501614598]
950153022405763124	1055697914820821012	[950153022405763124, 1270496433304244234]
946800234804166697	889246691520282634	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	845152661900099604	[946800234804166697, 1036384181690847394]
1090069129928654940	361958801756389377	[1090069129928654940, 1133788665206808676, 1133788651197833318, 1124541857481900042, 1092471557093331035]
1232875191911059476	1238822724789600258	[1232875191911059476]
1205457387906011176	1208094271865884754	[1205457387906011176, 1235347666603606087, 1235343947673374845, 1235318448100479048, 1236017920073662484, 1236023825242525756, 1205918089452191795]
1016406976860782662	964429246464413706	[1016406976860782662, 1047608205502590997]
1090069129928654940	800794950295748618	[1090069129928654940, 1092471557093331035]
672178593371127808	220369312358203392	[672178593371127808, 772910083084386315, 772910078696489000, 698323076202496121, 683151673291440139]
892675627373699072	1216375204356427816	[892675627373699072, 1249814208334528533]
950153022405763124	1067254727252922439	[950153022405763124, 1270496433304244234]
1090069129928654940	826228571554840576	[1090069129928654940, 1092471557093331035]
1016406976860782662	1073065030712569857	[1016406976860782662, 1047608205502590997]
946800234804166697	984746780690382868	[946800234804166697, 1036384181690847394, 948345555090833418]
1232875191911059476	1117472336107536535	[1232875191911059476]
1090069129928654940	425058704627597317	[1090069129928654940, 1092471557093331035]
1271502845161508884	1094942437820076083	[1271502845161508884]
946800234804166697	1017345213984948314	[946800234804166697, 1036384181690847394]
1090069129928654940	700849243862204529	[1090069129928654940, 1186538924311580672, 1124541857481900042, 1125278932145557544, 1125278921655590992, 1092471557093331035, 1125534904537579580, 1125157381022699691, 1124809999391146065, 1095088196490121358]
1090069129928654940	1121257646641664000	[1090069129928654940, 1125278921655590992, 1092471557093331035, 1124809999391146065, 1095088196490121358]
946800234804166697	1154832155701157928	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	750868040861876286	[946800234804166697, 1036384181690847394, 948345555090833418]
950153022405763124	752905424411557929	[950153022405763124, 1270496433304244234]
1016406976860782662	996375604079374376	[1016406976860782662, 1047608205502590997]
950153022405763124	1132127628313239602	[950153022405763124, 1270496433304244234]
1090069129928654940	1059764430927302676	[1090069129928654940, 1092471557093331035]
946800234804166697	1240714700107284484	[946800234804166697, 1036384181690847394]
1016406976860782662	786570901810315274	[1016406976860782662, 1047608205502590997]
946800234804166697	791108483696689154	[946800234804166697, 1036384181690847394, 948343488594972724]
1232875191911059476	666717997519339540	[1232875191911059476]
1230820012957106287	697877986858500116	[1230820012957106287]
946800234804166697	856354607177269299	[946800234804166697, 1036384181690847394]
946800234804166697	1012412779526893722	[946800234804166697, 1036384181690847394]
892675627373699072	1119498663543177236	[892675627373699072, 1249814208334528533]
946800234804166697	771001143836278844	[946800234804166697, 1036384181690847394]
1090069129928654940	1003486879225741362	[1090069129928654940, 1124541857481900042, 1092471557093331035]
1090069129928654940	1133610518876278844	[1090069129928654940, 1124861228469207050, 1124541865232977941, 1124541864008220732, 1124541862728978443, 1124541857481900042, 1092471557093331035]
1144686158601793559	1077639856290807838	[1144686158601793559]
1016406976860782662	765472344717262878	[1016406976860782662, 1047608205502590997]
946800234804166697	1206030522267209791	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	958121439519703140	[946800234804166697, 1036384181690847394, 1171527920716619806]
892675627373699072	666717997519339540	[892675627373699072, 1249814208334528533]
950153022405763124	1187393311145738370	[950153022405763124, 1270496433304244234]
1090069129928654940	690973556317618287	[1090069129928654940, 1124541862728978443, 1124541857481900042, 1092471557093331035]
946800234804166697	1141455246485356605	[946800234804166697, 1036384181690847394, 948345555090833418]
1016406976860782662	948377484334874665	[1016406976860782662, 1047608205502590997]
672178593371127808	1156318072051871826	[672178593371127808, 698323076202496121]
1239885748484964362	1090894331163975762	[1239885748484964362, 1241059575550054470, 1239885748484964364, 1239885748484964365, 1239885748493090844, 1239885748501614598]
950153022405763124	731935983389638739	[950153022405763124, 1270496433304244234]
946800234804166697	1254060540670513194	[946800234804166697, 1036384181690847394]
950153022405763124	590627582966235167	[950153022405763124, 1270496433304244234]
946800234804166697	1179902957467209759	[946800234804166697, 1036384181690847394, 948345555090833418]
1239885748484964362	1252680882175606905	[1239885748484964362, 1249987000350670978, 1241059575550054470, 1239885748484964364, 1239885748484964365, 1239885748484964371, 1239885748493090843, 1239885748493090844, 1239885748493090845, 1239885748501614593, 1239885748501614594, 1239885748501614595, 1239885748501614596, 1239885748501614598]
892675627373699072	948573943650992169	[892675627373699072, 1249814208334528533]
946800234804166697	780651533124632597	[946800234804166697, 1036384181690847394]
1016406976860782662	738055154393284708	[1016406976860782662, 1047608205502590997]
950153022405763124	881583041783418880	[950153022405763124, 1270496433304244234]
1090069129928654940	1129208471582146581	[1090069129928654940, 1124541857481900042, 1092471557093331035]
1144686158601793559	903043261726343200	[1144686158601793559]
1166349364881535016	853392797019930643	[1166349364881535016, 1168557118316609606, 1198348355600916624]
1144686158601793559	853392797019930643	[1144686158601793559]
1196884840633602068	692435667111903292	[1196884840633602068]
946800234804166697	903899311732047892	[946800234804166697, 1036384181690847394, 948343502507491339]
1090069129928654940	928107585507315792	[1090069129928654940, 1124541865232977941, 1124541864008220732, 1124541858736001024, 1092471557093331035]
946800234804166697	724048503294394450	[946800234804166697, 1036384181690847394]
946800234804166697	963886896591810580	[946800234804166697, 1036384181690847394]
946800234804166697	1131388951349968917	[946800234804166697, 1036384181690847394, 948343488594972724]
1016406976860782662	1055215360787361932	[1016406976860782662, 1047608205502590997]
946800234804166697	642067041469202472	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
1232875191911059476	852784127447269396	[1232875191911059476]
1016406976860782662	998812207452262432	[1016406976860782662, 1047608205502590997]
946800234804166697	951513711770763275	[946800234804166697, 1036384181690847394]
946800234804166697	1093046992655093780	[946800234804166697, 1036384181690847394, 948345555090833418]
1016406976860782662	497179426367340574	[1016406976860782662, 1047608205502590997]
1016406976860782662	488734022449496076	[1016406976860782662, 1047608205502590997]
946800234804166697	974328975641948160	[946800234804166697, 1036384181690847394, 948343488594972724]
892675627373699072	1259958831526576158	[892675627373699072, 1249814208334528533]
892675627373699072	947776083464454154	[892675627373699072, 1249814208334528533]
946800234804166697	1156025455154040882	[946800234804166697, 1036384181690847394]
1090069129928654940	547948914670698496	[1090069129928654940, 1092471557093331035]
672178593371127808	922343146376028211	[672178593371127808, 698323076202496121]
946800234804166697	1167961772507009065	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	995528687598452736	[946800234804166697, 1036384181690847394]
950153022405763124	940059052354981969	[950153022405763124, 1270496433304244234]
950153022405763124	904841106896850976	[950153022405763124, 1270496433304244234]
946800234804166697	505452934222446594	[946800234804166697, 1036384181690847394, 948343488594972724]
1016406976860782662	702193861409243157	[1016406976860782662, 1047608205502590997]
1016406976860782662	720416454079414272	[1016406976860782662, 1047608205502590997]
946800234804166697	468955019610423309	[946800234804166697, 1036384181690847394, 1171527920716619806]
950153022405763124	1099780063286808608	[950153022405763124, 1270496433304244234]
946800234804166697	1099780063286808608	[946800234804166697, 1036384181690847394, 1171527920716619806]
1232875191911059476	840439255708991508	[1232875191911059476]
1016406976860782662	882330338838343700	[1016406976860782662, 1047608205502590997]
1266078689783844919	1212391730783985674	[1266078689783844919, 1266722503095619606]
946800234804166697	958233267042156554	[946800234804166697, 1036384181690847394]
1090069129928654940	718769474211282994	[1090069129928654940, 1124541862728978443, 1124541857481900042, 1092471557093331035]
946800234804166697	972244205353185323	[946800234804166697, 1036384181690847394, 948343375462019112]
1016406976860782662	673198435058450472	[1016406976860782662, 1047608205502590997]
1016406976860782662	954795638711787560	[1016406976860782662, 1047608205502590997]
1232875191911059476	1203651222851031050	[1232875191911059476]
946800234804166697	958296506195148880	[946800234804166697, 1036384181690847394, 948343375462019112]
892675627373699072	1054121558471364658	[892675627373699072, 1249814208334528533]
1016406976860782662	985285785299353640	[1016406976860782662, 1047608205502590997]
1266078689783844919	1157979896421826560	[1266078689783844919, 1266722503095619606]
672178593371127808	1109161254142103552	[672178593371127808, 698323076202496121]
1271502845161508884	1272521861997133915	[1271502845161508884, 1271505058416033815]
892675627373699072	1235709905638527028	[892675627373699072, 1249814208334528533]
1271502845161508884	759066377256042557	[1271502845161508884, 1274345166932676618]
672178593371127808	1147592588044542055	[672178593371127808]
950153022405763124	967101746088386612	[950153022405763124, 1270496433304244234]
1196884840633602068	976562412553662505	[1196884840633602068]
1016406976860782662	760987986841698305	[1016406976860782662, 1047608205502590997]
892675627373699072	965104794597470249	[892675627373699072, 1249814208334528533]
1266078689783844919	331796916662960128	[1266078689783844919, 1266722503095619606]
1144686158601793559	1134763123463684119	[1144686158601793559]
1232875191911059476	1013228328162951188	[1232875191911059476]
946800234804166697	1191978365566058578	[946800234804166697, 1036384181690847394, 948343488594972724]
1266078689783844919	1064687227126427679	[1266078689783844919, 1266722503095619606]
1273788483336667191	1132280037903708211	[1273788483336667191, 1274373411992240159]
950153022405763124	1203651222851031050	[950153022405763124, 1270496433304244234]
1273788483336667191	1184208514688757854	[1273788483336667191, 1274373411992240159]
1273788483336667191	750615027563757628	[1273788483336667191, 1274373411992240159]
892675627373699072	751325873965367395	[892675627373699072, 1249814208334528533]
1273788483336667191	961315326224629760	[1273788483336667191, 1274373411992240159]
950153022405763124	1180298875895033926	[950153022405763124, 1270496433304244234]
1273788483336667191	1274385007494041711	[1273788483336667191, 1274373411992240159]
1273788483336667191	1038789834011062302	[1273788483336667191, 1274373411992240159]
950153022405763124	1161982476143575051	[950153022405763124, 1270496433304244234]
1273788483336667191	994193548641583175	[1273788483336667191, 1274373411992240159]
1273788483336667191	1101616614945865800	[1273788483336667191, 1274373411992240159]
1273788483336667191	939063737694953502	[1273788483336667191, 1274373411992240159]
1273788483336667191	1225454610810929333	[1273788483336667191, 1274373411992240159]
1273788483336667191	1259752873449754700	[1273788483336667191, 1274373411992240159]
1273788483336667191	801958136885280788	[1273788483336667191, 1274373411992240159]
1273788483336667191	604081628838363156	[1273788483336667191, 1274373411992240159]
1273788483336667191	1112389177351344218	[1273788483336667191, 1274373411992240159]
892675627373699072	433495922589302784	[892675627373699072, 1249814208334528533]
946800234804166697	958554708459532299	[946800234804166697, 1036384181690847394]
1273788483336667191	1153711198915797063	[1273788483336667191, 1274373411992240159]
1273788483336667191	1055414059861823620	[1273788483336667191, 1274373411992240159]
1090069129928654940	807714249430401024	[1090069129928654940, 1124541857481900042, 1092471557093331035]
1090069129928654940	895252200815730708	[1090069129928654940, 1133788651197833318, 1092471557093331035]
672178593371127808	695352865379581972	[672178593371127808]
1016406976860782662	443231349311143936	[1016406976860782662, 1047608205502590997]
1273788483336667191	1199444957098942528	[1273788483336667191, 1274373411992240159]
1232875191911059476	1122257448623935599	[1232875191911059476]
1144686158601793559	833303009677017129	[1144686158601793559]
950153022405763124	985365807380979742	[950153022405763124, 1270496433304244234]
1273788483336667191	773634385266081832	[1273788483336667191, 1274373411992240159]
946800234804166697	1184386507180605483	[946800234804166697, 1036384181690847394, 948345555090833418]
950153022405763124	1109857397649965059	[950153022405763124, 1270496433304244234]
1196884840633602068	837293335869653013	[1196884840633602068]
1234458732784521327	1208665338842189836	[1234458732784521327, 1235184093956931584, 1235180603519795220]
1234458732784521327	1227680738523218031	[1234458732784521327, 1235184093956931584]
1234458732784521327	1147957138539421699	[1234458732784521327, 1237131824371728438, 1235184093956931584, 1235818015539335269]
1234458732784521327	942819215658860604	[1234458732784521327, 1235184093956931584]
1234458732784521327	1007675097278058536	[1234458732784521327, 1235184093956931584]
1234458732784521327	1236081792469958748	[1234458732784521327, 1235184093956931584]
1234458732784521327	1185913885979582597	[1234458732784521327, 1237131824371728438, 1235184093956931584]
892675627373699072	1168067513356124200	[892675627373699072, 1249814208334528533]
950153022405763124	1183768582505640010	[950153022405763124, 1270496433304244234]
946800234804166697	894933450765795351	[946800234804166697, 1036384181690847394]
946800234804166697	192253875346997248	[946800234804166697, 1036384181690847394]
1144686158601793559	1107868220133752923	[1144686158601793559]
1234458732784521327	757056295869350038	[1234458732784521327, 1237131824371728438, 1235184093956931584]
892675627373699072	1123197290904035349	[892675627373699072, 1249814208334528533]
892675627373699072	850081584437788732	[892675627373699072, 1249814208334528533]
1090069129928654940	1058302809726013440	[1090069129928654940, 1092471557093331035]
1196884840633602068	759066377256042557	[1196884840633602068, 1196884840893665489]
672178593371127808	976103396065046590	[672178593371127808, 698323076202496121]
1273788483336667191	1267880602963673171	[1273788483336667191, 1274373411992240159]
892675627373699072	898118836358881290	[892675627373699072, 1249814208334528533]
946800234804166697	1100547195985465424	[946800234804166697, 1036384181690847394]
1144686158601793559	926564606414036993	[1144686158601793559]
946800234804166697	708141848467865630	[946800234804166697, 1036384181690847394, 948343375462019112]
1273788483336667191	1201270198712406076	[1273788483336667191, 1274373411992240159]
892675627373699072	1122491568708923513	[892675627373699072, 1249814208334528533]
892675627373699072	959900394518093876	[892675627373699072, 1249814208334528533]
892675627373699072	1150897590246834216	[892675627373699072, 1249814208334528533]
1090069129928654940	760227475979632671	[1090069129928654940, 1092471557093331035]
946800234804166697	1123329397919862945	[946800234804166697, 1036384181690847394]
946800234804166697	958801585666949130	[946800234804166697, 1036384181690847394, 1171527920716619806]
1144686158601793559	1158495033503252520	[1144686158601793559]
946800234804166697	958988422880591882	[946800234804166697, 1036384181690847394]
1266971195761234002	1269370561872527381	[1266971195761234002, 1268264158294573159]
1266971195761234002	550613223733329920	[1266971195761234002, 1271931616813649940, 1266979871414816768, 1271932047128268842]
1266971195761234002	270904126974590976	[1266971195761234002, 1271931616813649940, 1266979871414816768, 1271932047128268842]
1273788483336667191	1143660517928476783	[1273788483336667191, 1274373411992240159]
946800234804166697	959161106784477245	[946800234804166697, 1036384181690847394]
946800234804166697	959172860247674980	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	959295216815321118	[946800234804166697, 1036384181690847394]
946800234804166697	959438925808693278	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	959640336207077476	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	959920884141920346	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	960024013831286806	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	960104650923708469	[946800234804166697, 1036384181690847394]
946800234804166697	960282532660801636	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	960359755258421248	[946800234804166697, 1036384181690847394]
946800234804166697	960663945566355546	[946800234804166697, 1036384181690847394]
946800234804166697	960914213558161480	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	960944539080724521	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	960968038109298709	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	961026935595622450	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	961133788459565066	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	961306302582259753	[946800234804166697, 1036384181690847394]
946800234804166697	961664202559324201	[946800234804166697, 1036384181690847394]
946800234804166697	961846187617570838	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	961990260814909501	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	962084475980873728	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	962099383757864990	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	962100837042253894	[946800234804166697, 1036384181690847394]
946800234804166697	962155228646494218	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	962175124554010624	[946800234804166697, 1036384181690847394]
946800234804166697	962278239210983425	[946800234804166697, 1036384181690847394]
946800234804166697	962685195440508979	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	962745354518945802	[946800234804166697, 1036384181690847394]
946800234804166697	962774155529441280	[946800234804166697, 1036384181690847394, 981564541982875688, 948343488594972724]
946800234804166697	962816162821988402	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112, 948345555090833418]
946800234804166697	962829215475044422	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	962893286429851648	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	968649305458106508	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	968762576915800065	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	968917256748810270	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	968918117264789584	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	968919136413569025	[946800234804166697, 1036384181690847394]
946800234804166697	969190928076136448	[946800234804166697, 1036384181690847394]
946800234804166697	969476977042010192	[946800234804166697, 1036384181690847394]
946800234804166697	969511114599706675	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	969598019530014790	[946800234804166697, 1036384181690847394]
946800234804166697	969677193624055928	[946800234804166697, 1036384181690847394]
946800234804166697	969677866650464259	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	969702438791696484	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	969716427441467494	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	977571453446783007	[946800234804166697, 1036384181690847394]
946800234804166697	990699758295318548	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	990898359361482812	[946800234804166697, 1036384181690847394]
946800234804166697	990941090297286667	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	991121444425715803	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	991128763603632128	[946800234804166697, 1036384181690847394]
946800234804166697	991412187534995537	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	991447668872192081	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	992114623375478984	[946800234804166697, 1036384181690847394]
946800234804166697	992230994566455346	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	992272284171640852	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	992304927625977948	[946800234804166697, 1036384181690847394]
946800234804166697	992422778089242665	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	992518553804750958	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	992594155295477811	[946800234804166697, 1036384181690847394]
946800234804166697	992726596597334047	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948345555090833418]
946800234804166697	992747553571475527	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	999174867872125001	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	999301367246114890	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	999338636686413924	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	999436113653530655	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	999611735449288754	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	999785180837457960	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1000187088496500816	[946800234804166697, 1036384181690847394]
1266971195761234002	557628352828014614	[1266971195761234002, 1271931616813649940, 1271932047128268842]
1266971195761234002	651095740390834176	[1266971195761234002, 1271931616813649940, 1266979871414816768, 1271932047128268842]
1266971195761234002	1268777073078571121	[1266971195761234002, 1271931616813649940, 1271932047128268842]
892675627373699072	507489279229034497	[892675627373699072, 1249814208334528533]
946800234804166697	963087421828898877	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	963171099053527070	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	963194266832732190	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	963405613818343484	[946800234804166697, 1036384181690847394]
946800234804166697	963439497398341632	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	963482285968089118	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	963492370266095626	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	964901419935203348	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	965006860056944640	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	993401847870128138	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	993762505149136926	[946800234804166697, 1036384181690847394]
946800234804166697	993803166426599424	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	993947448047308880	[946800234804166697, 1036384181690847394]
946800234804166697	993976747865424073	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	994054355495944246	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	994113485237665802	[946800234804166697, 1036384181690847394]
946800234804166697	994168968719892490	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	994207245476835381	[946800234804166697, 1036384181690847394]
946800234804166697	1003681501256351815	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1003721261865767003	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1003748294553505872	[946800234804166697, 1036384181690847394]
946800234804166697	1003775760936472646	[946800234804166697, 1036384181690847394]
946800234804166697	1003806104653930498	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1003807295605579930	[946800234804166697, 1036384181690847394]
946800234804166697	1004035494579032105	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1004093401207161003	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1004396618314944634	[946800234804166697, 1036384181690847394]
946800234804166697	1070311815520722964	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1070325522023845989	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1070475298266677359	[946800234804166697, 1036384181690847394]
946800234804166697	1072257744364654732	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1073362992143532052	[946800234804166697, 1036384181690847394]
946800234804166697	1074072555394183349	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1079135977739661463	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1079221394514133042	[946800234804166697, 1036384181690847394]
946800234804166697	1079379740567289936	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1079412952760848384	[946800234804166697, 1036384181690847394]
946800234804166697	1079433252214931546	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1079567890379964466	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1079630418556485744	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1079703793094098944	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1079791487929299055	[946800234804166697, 1036384181690847394]
946800234804166697	1079858405616922624	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1079941673947242566	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1079950046629462077	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1080008267717148703	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1080115320313876510	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1080122568977170492	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1080161437143531601	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1080456481276690472	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1080473761624633444	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1080482191089348631	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1080535009334665377	[946800234804166697, 1036384181690847394]
946800234804166697	1080601880163524720	[946800234804166697, 1036384181690847394]
946800234804166697	1080622592098054226	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1080673209487196201	[946800234804166697, 1036384181690847394]
946800234804166697	1080748744359809104	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1080958745191919726	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1081562220636422154	[946800234804166697, 1036384181690847394]
946800234804166697	1081602892684865687	[946800234804166697, 1036384181690847394]
946800234804166697	1081633855724855356	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1081635798669070356	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1081657104194089152	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1081664977145954445	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1081780804289572864	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1081968810468331631	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1082076186940801106	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1082418033563271228	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1082430302858780743	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1082464511774171146	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1082645450731048971	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1082827577216999474	[946800234804166697, 1036384181690847394]
946800234804166697	1082835715529916456	[946800234804166697, 1036384181690847394]
1266971195761234002	872530858676981770	[1266971195761234002]
1273788483336667191	629068327968309268	[1273788483336667191, 1274373411992240159]
1266971195761234002	693202290714214510	[1266971195761234002, 1271931616813649940]
946800234804166697	940385895876550687	[946800234804166697, 1036384181690847394, 948343488594972724]
1234458732784521327	818948567024664637	[1234458732784521327, 1235184093956931584]
946800234804166697	1178916533574041611	[946800234804166697, 1036384181690847394, 948343346257076224]
950153022405763124	1268777073078571121	[950153022405763124, 1270496433304244234, 1269532923078381639]
946800234804166697	963585407549861929	[946800234804166697, 1036384181690847394]
1266971195761234002	759066377256042557	[1266971195761234002, 1274724890079133707, 1271932047128268842]
946800234804166697	964025027517374574	[946800234804166697, 1036384181690847394]
946800234804166697	964196468456050718	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	964257739754831872	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	964330059987046410	[946800234804166697, 1036384181690847394]
946800234804166697	964480606585102386	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
1266971195761234002	1160025129556918289	[1266971195761234002]
1016406976860782662	990544899994689587	[1016406976860782662, 1047608205502590997]
946800234804166697	964835302600482867	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	974823098849308712	[946800234804166697, 1036384181690847394]
892675627373699072	1152862944678391818	[892675627373699072, 1249814208334528533]
1144686158601793559	1008050864763711599	[1144686158601793559]
946800234804166697	901104970089238630	[946800234804166697, 1036384181690847394]
1090069129928654940	901104970089238630	[1090069129928654940, 1092471557093331035]
946800234804166697	836056444247343136	[946800234804166697, 1036384181690847394, 948343488594972724]
1266971195761234002	1122756755357700149	[1266971195761234002, 1271931616813649940]
1266971195761234002	1257656486968950857	[1266971195761234002, 1271931616813649940]
1266971195761234002	941231603777150976	[1266971195761234002, 1271931616813649940]
1266971195761234002	900837506994544680	[1266971195761234002, 1271931616813649940]
1266971195761234002	276060004262477825	[1266971195761234002, 1274745183220662363]
1016406976860782662	771057650737217546	[1016406976860782662, 1047608205502590997]
1273788483336667191	889132951093264457	[1273788483336667191, 1274373411992240159]
946800234804166697	1070031395600203787	[946800234804166697, 1036384181690847394, 948343488594972724]
1274119155431379045	1272552181639151660	[1274119155431379045, 1274643088601780286]
1274119155431379045	839000084582367272	[1274119155431379045, 1274643088601780286]
1274119155431379045	499595256270946326	[1274119155431379045, 1274643088601780286, 1274120333456052336]
946800234804166697	926472547887906856	[946800234804166697, 1036384181690847394, 948343488594972724]
892675627373699072	1201349513814749328	[892675627373699072, 1249814208334528533]
946800234804166697	1208688903830380576	[946800234804166697, 1036384181690847394, 948343488594972724]
892675627373699072	1273719562487070925	[892675627373699072, 1249814208334528533]
1088761100503371839	1175697377915584562	[1088761100503371839, 1173142348360855572, 1173142342358810694, 1173142295206449192]
1144686158601793559	1127313360417992755	[1144686158601793559]
1239885748484964362	1246725914004295692	[1239885748484964362, 1241059575550054470, 1239885748501614596, 1239885748501614598]
892675627373699072	1243316365440585879	[892675627373699072]
1088761100503371839	1183340068178509854	[1088761100503371839, 1173142348360855572, 1173142295206449192]
1274119155431379045	739036393866657843	[1274119155431379045, 1274643088601780286, 1274186814944706652, 1274350989687652515, 1274119367524876338]
892675627373699072	974886413323603968	[892675627373699072, 1249814208334528533]
1274119155431379045	1259178062990409728	[1274119155431379045, 1274643088601780286]
946800234804166697	608118964035387394	[946800234804166697, 1036384181690847394]
1265355781369495714	759066377256042557	[1265355781369495714]
1274119155431379045	1261972871824015402	[1274119155431379045, 1274643088601780286]
946800234804166697	1135619707278479401	[946800234804166697, 1036384181690847394, 948345555090833418]
950153022405763124	1221459642757152788	[950153022405763124]
946800234804166697	980564753296543846	[946800234804166697, 1036384181690847394]
1232875191911059476	1221459642757152788	[1232875191911059476]
1274119155431379045	1193544602586710106	[1274119155431379045, 1274643088601780286]
1266971195761234002	1203514684326805524	[1266971195761234002, 1274724890079133707]
1266971195761234002	988500350346625084	[1266971195761234002, 1274724890079133707]
1231607483030569030	836978812657860649	[1231607483030569030, 1231607483043418114, 1231607483043418118, 1231607483051671603, 1236676788327809064]
1266971195761234002	1034535789574496327	[1266971195761234002, 1274724890079133707]
1274119155431379045	235148962103951360	[1274119155431379045, 1274643088601780286, 1274120333456052336]
946800234804166697	766555921274109972	[946800234804166697, 1036384181690847394, 948343488594972724]
1266971195761234002	731228516821237860	[1266971195761234002, 1274724890079133707]
892675627373699072	1256570500096725074	[892675627373699072, 1249814208334528533]
672178593371127808	939685897287376916	[672178593371127808, 698323076202496121]
1266971195761234002	1256624048683618335	[1266971195761234002, 1274724890079133707]
1274119155431379045	1209522466104418324	[1274119155431379045, 1274643088601780286]
1266971195761234002	828997614103691355	[1266971195761234002, 1274724890079133707]
1266971195761234002	1152640764652822658	[1266971195761234002, 1274724890079133707]
1266971195761234002	1266838889499332720	[1266971195761234002, 1274724890079133707]
1266971195761234002	1238825917397336144	[1266971195761234002, 1274724890079133707]
946800234804166697	750457792456032347	[946800234804166697, 1036384181690847394]
892675627373699072	672818677208580137	[892675627373699072, 1249814208334528533]
1266971195761234002	801958136885280788	[1266971195761234002, 1274724890079133707]
1266971195761234002	1263235828159877132	[1266971195761234002, 1274724890079133707]
946800234804166697	789844940653330453	[946800234804166697, 1036384181690847394, 948343502507491339]
1274119155431379045	1211838285887053885	[1274119155431379045, 1274749890492366868, 1274748899361558570, 1274748470099443866, 1274643088601780286]
1266971195761234002	818578698465968184	[1266971195761234002, 1274724890079133707]
1266971195761234002	1077941734669041762	[1266971195761234002, 1274724890079133707]
1266971195761234002	1141454225436586085	[1266971195761234002, 1274724890079133707]
1266971195761234002	851640000284983316	[1266971195761234002, 1274724890079133707]
1230820012957106287	751312860189032489	[1230820012957106287]
950153022405763124	1013228328162951188	[950153022405763124, 1270496433304244234]
892675627373699072	997329289215213610	[892675627373699072, 1249814208334528533]
892675627373699072	875042897400053780	[892675627373699072, 1249814208334528533]
1266971195761234002	1062235089779560458	[1266971195761234002, 1274724890079133707]
946800234804166697	965176782322024528	[946800234804166697, 1036384181690847394, 948345555090833418]
1266971195761234002	1122063718495305788	[1266971195761234002, 1274724890079133707]
946800234804166697	965189352038731786	[946800234804166697, 1036384181690847394]
946800234804166697	965309768669466745	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	965332770064851044	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	965367418685890642	[946800234804166697, 1036384181690847394]
946800234804166697	965535706921455697	[946800234804166697, 1036384181690847394]
946800234804166697	965987753496039494	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	966087053165101098	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	966092419332464670	[946800234804166697, 1036384181690847394]
946800234804166697	966197380976365608	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	966364994511994900	[946800234804166697, 1036384181690847394]
946800234804166697	966380468490633306	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	966688560591818813	[946800234804166697, 1036384181690847394]
946800234804166697	973503675119058995	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	973570651342397480	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	973663096667271210	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	973866443353489448	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	974019286010048543	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	974368663916404816	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	974451436261867520	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	974649143660249098	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	974813271041388545	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	975027670259748914	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	975300930637549608	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	983211400283447326	[946800234804166697, 1036384181690847394]
946800234804166697	983428828640718929	[946800234804166697, 1036384181690847394]
946800234804166697	983839264099926066	[946800234804166697, 1036384181690847394]
946800234804166697	983866129485291552	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	987635235715960842	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	987794251586867203	[946800234804166697, 1036384181690847394]
946800234804166697	987956476603695104	[946800234804166697, 1036384181690847394]
946800234804166697	988158019256860722	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	988190963673493554	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	988412496425660446	[946800234804166697, 1036384181690847394]
946800234804166697	988415323768225833	[946800234804166697, 1036384181690847394]
946800234804166697	988599474383360022	[946800234804166697, 1036384181690847394]
946800234804166697	988848842365616249	[946800234804166697, 1036384181690847394]
946800234804166697	988855294480228443	[946800234804166697, 1036384181690847394]
946800234804166697	988876419696308316	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 1171527920716619806]
946800234804166697	996542019214266438	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	996551500828520549	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	996787772595650680	[946800234804166697, 1036384181690847394]
946800234804166697	997045524706381834	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	997111234405081089	[946800234804166697, 1036384181690847394]
946800234804166697	997138886209839194	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	997214049911713892	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	997222991811313726	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	997514822843375688	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 1171527920716619806]
946800234804166697	997534548176949448	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	997574751478362112	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	997679773499260988	[946800234804166697, 1036384181690847394]
946800234804166697	997873351143997520	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	997956873766567986	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	997966404785541160	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	998035635677962270	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	998389617147514910	[946800234804166697, 1036384181690847394]
946800234804166697	998500384668663818	[946800234804166697, 1036384181690847394]
946800234804166697	998528540066725928	[946800234804166697, 1036384181690847394]
946800234804166697	998685847643762819	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	998782657641062470	[946800234804166697, 1036384181690847394]
946800234804166697	998821025817043034	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948345555090833418]
946800234804166697	999023151050674208	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	999056905429327974	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1024860862105796630	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1024953331271073902	[946800234804166697, 1036384181690847394, 948343502507491339, 948343346257076224]
946800234804166697	1024973889480163348	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1025017670627754024	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1025116104324026440	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1025257616491950152	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1025381203475451914	[946800234804166697, 1036384181690847394]
946800234804166697	1025529051521232916	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1025569300888690851	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1025724146996482179	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1025781721968423016	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1026002505173315585	[946800234804166697, 1036384181690847394, 948343488594972724]
672178593371127808	724722336514965565	[672178593371127808, 772910083197370409, 772910065530699786, 698323076202496121, 683152545488961579]
946800234804166697	966690719639167017	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	966809585908334682	[946800234804166697, 1036384181690847394]
946800234804166697	966837011027742782	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	966840660151926834	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	966863823577419776	[946800234804166697, 1036384181690847394]
946800234804166697	966899424045453362	[946800234804166697, 1036384181690847394]
946800234804166697	967050128299003914	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	967207049962340362	[946800234804166697, 1036384181690847394]
946800234804166697	967236294059114496	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	967549694442086420	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	967836739307704390	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	967973329376006174	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	968216038896439366	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	968504350337024020	[946800234804166697, 1036384181690847394]
946800234804166697	968549398101524490	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	992817426242736169	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	992818793912995860	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	992831747257536514	[946800234804166697, 1036384181690847394]
946800234804166697	992911211458986084	[946800234804166697, 1036384181690847394]
946800234804166697	992946572176412852	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	993179339321528471	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	993225133676314737	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	993349977826938941	[946800234804166697, 1036384181690847394]
946800234804166697	1001759707544944722	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1001903953795096657	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1001973755377111150	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1002056449712734218	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1002125289020727307	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1002198357831331890	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1002218338723840111	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1002321350574227558	[946800234804166697, 1036384181690847394]
946800234804166697	1072661532288233493	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1091852833701253282	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1091892882849407046	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1091995875129184266	[946800234804166697, 1036384181690847394]
946800234804166697	1092002316963553310	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1092133058385289388	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1092140958101028935	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1092193650865356940	[946800234804166697, 1036384181690847394]
946800234804166697	1092311911699324958	[946800234804166697, 1036384181690847394, 981564541982875688, 948343502507491339, 948343488594972724, 948343346257076224, 948345555090833418]
946800234804166697	1092358535301582978	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1099965691102249020	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1099971295728386091	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1100172595938197675	[946800234804166697, 1036384181690847394]
946800234804166697	1100345365519138826	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1100584490608373832	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1100594228662386709	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1100649914884690040	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1100780859033927700	[946800234804166697, 1036384181690847394]
946800234804166697	1100890430574448751	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1100897028034277437	[946800234804166697, 1036384181690847394]
946800234804166697	1100918727945490473	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1101047017070932009	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1101079058453893240	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1101276884383309854	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1101409516307894312	[946800234804166697, 1036384181690847394]
946800234804166697	1101685163605360741	[946800234804166697, 1036384181690847394]
946800234804166697	1101688168165687306	[946800234804166697, 1036384181690847394]
946800234804166697	1102280065934430329	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1102320916014321838	[946800234804166697, 1036384181690847394]
946800234804166697	1102337805956436080	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1102360466572976258	[946800234804166697, 1036384181690847394]
946800234804166697	1102420929495175260	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1102430901993996320	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1114890296224915516	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1114945825064357960	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1114975234114719774	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1115071244925157406	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1115162521196826684	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1115263833548800011	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	1117001455379939419	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1117048216358223932	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1117226058626891819	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1117249324326330519	[946800234804166697, 1036384181690847394]
946800234804166697	1117268473735819336	[946800234804166697, 1036384181690847394, 948343346257076224]
950153022405763124	776340527346876416	[950153022405763124, 1270496433304244234]
946800234804166697	969792922117619732	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	970015237157834823	[946800234804166697, 1036384181690847394]
946800234804166697	970041425846743121	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	970314060287594536	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	970490033616343080	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	970517351424466944	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	970652630542090281	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	970662431225430036	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	970980137975836674	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	971046692713549844	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	971134681888219246	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	971187081500045322	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	971295891250098176	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	971435143002718298	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	971440213580738674	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	971615849481924618	[946800234804166697, 1036384181690847394]
946800234804166697	971790199765995590	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	971838864060727336	[946800234804166697, 1036384181690847394]
946800234804166697	971902142849900664	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	972190277563473980	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	972212673221652500	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	972482615275839539	[946800234804166697, 1036384181690847394]
946800234804166697	972511259452907590	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	972607364563890206	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	972608684205174844	[946800234804166697, 1036384181690847394]
946800234804166697	972729380054908978	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	972829613178900551	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	972834930650386472	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	973057775561232384	[946800234804166697, 1036384181690847394]
946800234804166697	973302845547892806	[946800234804166697, 1036384181690847394]
946800234804166697	973334001165168640	[946800234804166697, 1036384181690847394]
946800234804166697	973488596172537907	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	976163534159368242	[946800234804166697, 1036384181690847394]
946800234804166697	976307370189791242	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	976410902511374388	[946800234804166697, 1036384181690847394]
946800234804166697	976550152535932950	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	976810191167316008	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	977104171138449438	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	982353465722413086	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	982400311949926420	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	982430403942055946	[946800234804166697, 1036384181690847394]
946800234804166697	982731357799215176	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	982842106068471809	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	983866662572924988	[946800234804166697, 1036384181690847394, 948343488594972724, 948343346257076224, 1171527920716619806]
946800234804166697	984164404461469746	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	984209957857673256	[946800234804166697, 1036384181690847394]
946800234804166697	984505351955177492	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	984535905769496688	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	984689502792605716	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	984913144298209300	[946800234804166697, 1036384181690847394]
946800234804166697	985054460034285568	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	985159599168569406	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	985238558522613790	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	985301065962504293	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	985356714901655576	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	985369805441892392	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	985449989427822632	[946800234804166697, 1036384181690847394]
946800234804166697	985581726921281538	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	985732707285872684	[946800234804166697, 1036384181690847394]
946800234804166697	985777705960230942	[946800234804166697, 1036384181690847394]
946800234804166697	985976133331869707	[946800234804166697, 1036384181690847394]
946800234804166697	986324073128792064	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	986414148894195743	[946800234804166697, 1036384181690847394]
946800234804166697	986450029231353877	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	986451037227470898	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	986658497301209098	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	987124076290125846	[946800234804166697, 1036384181690847394]
946800234804166697	987454024783646851	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	987455532145201152	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	987466706433749033	[946800234804166697, 1036384181690847394]
946800234804166697	987630325498802216	[946800234804166697, 1036384181690847394]
946800234804166697	1008322089507356742	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1008362358516748448	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1008454525906063561	[946800234804166697, 1036384181690847394]
946800234804166697	1008497755079057500	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1008579878154682438	[946800234804166697, 1036384181690847394]
946800234804166697	974840340236357642	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1020277520559505429	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
1273788483336667191	1261794642047799336	[1273788483336667191, 1274373411992240159]
1090069129928654940	743909481506930788	[1090069129928654940, 1092471557093331035]
1266971195761234002	1104986951846727731	[1266971195761234002, 1274724890079133707]
1265355781369495714	1224778946197848155	[1265355781369495714, 1265415291983233167, 1265415266934722662, 1265623785982132265, 1272241966431735851]
1231607483030569030	906990081154379806	[1231607483030569030, 1231607483043418114, 1231607483043418118, 1231607483051671603, 1236676788327809064, 1231607483043418115]
946800234804166697	775436529048879184	[946800234804166697, 1036384181690847394, 948343488594972724]
1266971195761234002	974823290734526535	[1266971195761234002, 1274724890079133707]
946800234804166697	1020282823460016148	[946800234804166697, 1036384181690847394, 948343375462019112]
1266971195761234002	1102877747811975178	[1266971195761234002, 1274724890079133707]
946800234804166697	1082929305878802432	[946800234804166697, 1036384181690847394]
946800234804166697	1041030242132840459	[946800234804166697, 1036384181690847394, 948343502507491339]
892675627373699072	763919195209334794	[892675627373699072, 1249814208334528533]
892675627373699072	714189735995899906	[892675627373699072, 1249814208334528533]
946800234804166697	732550798084407296	[946800234804166697, 1036384181690847394, 1171527920716619806]
1265355781369495714	1094942437820076083	[1265355781369495714, 1265421431932588075, 1265415236761161830]
1090069129928654940	1084189530455810150	[1090069129928654940, 1124541857481900042, 1092471557093331035]
892675627373699072	996153869044297819	[892675627373699072, 1249814208334528533]
1239885748484964362	991407895738589306	[1239885748484964362, 1241059575550054470, 1239885748501614596, 1239885748501614598]
946800234804166697	665709565941121026	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
892675627373699072	1235618983110119544	[892675627373699072, 1249814208334528533]
1274163487312187435	1203514684326805524	[1274163487312187435]
946800234804166697	483278026772316170	[946800234804166697, 1036384181690847394, 948343502507491339]
1090069129928654940	880490663404257290	[1090069129928654940, 1124541857481900042, 1092471557093331035]
892675627373699072	1265988954768015370	[892675627373699072, 1249814208334528533]
950153022405763124	833262352282550292	[950153022405763124, 1270496433304244234]
1274163487312187435	1149777134580146306	[1274163487312187435, 1274490966488907911]
946800234804166697	1032681811295350804	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1132976344674861087	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	958639329876537395	[946800234804166697, 1036384181690847394]
892675627373699072	958639329876537395	[892675627373699072, 1249814208334528533]
1231607483030569030	1216160611906486293	[1231607483030569030, 1231607483043418119, 1231607483051671603, 1236676788327809064, 1231607483043418115]
892675627373699072	543853011718635522	[892675627373699072, 1249814208334528533]
946800234804166697	727912138378838088	[946800234804166697, 1036384181690847394]
946800234804166697	206585562323222528	[946800234804166697, 1036384181690847394]
946800234804166697	215333109045002240	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	239847004564357124	[946800234804166697, 1036384181690847394]
946800234804166697	261626252320964631	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	265861319079493633	[946800234804166697, 1036384181690847394]
946800234804166697	271407926118187011	[946800234804166697, 1036384181690847394]
946800234804166697	295044215757340673	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	295705827422240770	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	297354858300964874	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	297399424399966210	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	299767378672222209	[946800234804166697, 1036384181690847394]
946800234804166697	300695916883476480	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	306583756439945219	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	311523037511942145	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	317715864101191682	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	319567309821837313	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	327674389833318401	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	330689994660380672	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948345555090833418]
946800234804166697	330878887494025217	[946800234804166697, 1036384181690847394]
946800234804166697	332925467332050945	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	334576287429558276	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	337020317581049856	[946800234804166697, 1036384181690847394]
946800234804166697	339584545181663236	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	343613418399334410	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	344089849227247616	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	344389165817004034	[946800234804166697, 1036384181690847394]
946800234804166697	348332612735074305	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	352417538841378817	[946800234804166697, 1036384181690847394]
946800234804166697	353764042977968128	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	355535510766223364	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	366001109933883405	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	366644647054802956	[946800234804166697, 1036384181690847394]
946800234804166697	368919338901831682	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	369535533648445441	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	373492082762973185	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	374326436443455488	[946800234804166697, 1036384181690847394]
946800234804166697	376004498079875074	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	378100381374349313	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	381456890695122944	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	389788324870750211	[946800234804166697, 1036384181690847394]
1234198250995712073	1137817552882507839	[1234198250995712073, 1234305309657534594]
946800234804166697	390888447897763847	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	395034990636957697	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	399156783790424065	[946800234804166697, 1036384181690847394]
946800234804166697	402131045618548748	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	405095583783714816	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	405768904242233344	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	406838045397221377	[946800234804166697, 1036384181690847394]
946800234804166697	407927341398884353	[946800234804166697, 1036384181690847394]
946800234804166697	469691719651164170	[946800234804166697, 1036384181690847394]
946800234804166697	474469732116856832	[946800234804166697, 1036384181690847394]
946800234804166697	478838368269107200	[946800234804166697, 1036384181690847394]
946800234804166697	479386448802480128	[946800234804166697, 1036384181690847394]
946800234804166697	482584405425127425	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	482724123185774592	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	483392317051371545	[946800234804166697, 1036384181690847394]
946800234804166697	484443158474784768	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	484931828474445866	[946800234804166697, 1036384181690847394]
946800234804166697	488077954673541142	[946800234804166697, 1036384181690847394]
946800234804166697	491191802343194626	[946800234804166697, 1036384181690847394]
946800234804166697	493240286739300352	[946800234804166697, 1036384181690847394]
946800234804166697	493568011685462026	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	493651114164486144	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	493755271970291722	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	495189452096929798	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	497006003871809536	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	498521758174019595	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	499762198634037278	[946800234804166697, 1036384181690847394]
946800234804166697	500712611965304879	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	502493845821325324	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	502978679136321546	[946800234804166697, 1036384181690847394]
946800234804166697	504249580070764545	[946800234804166697, 1036384181690847394]
946800234804166697	659106713558843392	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	659251418607124501	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	659521811712704514	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	660638376566718485	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	662549986319400970	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	663131478200418346	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	663170541250805796	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	697658682703609857	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	697703407640903771	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	697852127120457759	[946800234804166697, 1036384181690847394, 948343502507491339, 948343375462019112]
946800234804166697	697923388873900053	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	728045175225450546	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112, 1171527920716619806]
946800234804166697	728430060469747766	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	729062050696921169	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	729165599992971317	[946800234804166697, 1036384181690847394]
946800234804166697	729759126359376014	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	730174201461473290	[946800234804166697, 1036384181690847394]
946800234804166697	730174230385131520	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	730396307675414548	[946800234804166697, 1036384181690847394]
946800234804166697	730443670041526355	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	730485807810609233	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	730810673101275138	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	731764933100044300	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	731910109344694293	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112, 1171527920716619806]
946800234804166697	732615001612746834	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	732724339899891765	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	733060135081083060	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	733195527088504842	[946800234804166697, 1036384181690847394]
946800234804166697	733764230645416017	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	733806337452146930	[946800234804166697, 1036384181690847394]
946800234804166697	733919793606033450	[946800234804166697, 1036384181690847394]
946800234804166697	734159626299375717	[946800234804166697, 1036384181690847394]
946800234804166697	734485042000035981	[946800234804166697, 1036384181690847394]
946800234804166697	734859178732027914	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	735103137412546612	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	735146584790007888	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	735453885333897216	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	735658382513405973	[946800234804166697, 1036384181690847394]
946800234804166697	735660285347758090	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	736358567388643338	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	736729731306619091	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	737032709653790772	[946800234804166697, 1036384181690847394]
946800234804166697	737732328956231710	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	738200984987107409	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	738731748669784106	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	738874827053465600	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	409033944504467476	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	409770303238176768	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	410397578585178123	[946800234804166697, 1036384181690847394]
946800234804166697	412344987800567859	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	414156743061536771	[946800234804166697, 1036384181690847394]
946800234804166697	420952764248621068	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	424613574325829632	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	424789855831064615	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418]
946800234804166697	427162305180991508	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	427717230222901248	[946800234804166697, 1036384181690847394]
946800234804166697	431988421712543744	[946800234804166697, 1036384181690847394]
946800234804166697	433230718827626498	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	434030445198311424	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	434461070971764737	[946800234804166697, 1036384181690847394]
946800234804166697	440219959151427595	[946800234804166697, 1036384181690847394, 948343375462019112, 948345555090833418]
946800234804166697	448378071435968512	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	451754553935790090	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	452875050312269826	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	453599299842867210	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	453656133509447707	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	455241704774303745	[946800234804166697, 1036384181690847394]
946800234804166697	455491805493067799	[946800234804166697, 1036384181690847394]
946800234804166697	456448609198538754	[946800234804166697, 1036384181690847394]
946800234804166697	459121181337845788	[946800234804166697, 1036384181690847394]
946800234804166697	460146886813417475	[946800234804166697, 1036384181690847394, 981564541982875688, 948345555090833418]
946800234804166697	461525790404640776	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	461631372797411329	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	462016767221301258	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	462508071634337792	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	463573412842045441	[946800234804166697, 1036384181690847394]
946800234804166697	463734245806964756	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	463846522681819156	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	468125020292644866	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	521474751043076096	[946800234804166697, 1036384181690847394]
946800234804166697	522925247951798283	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	523536165798805508	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	523845062648659999	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	524061492287504384	[946800234804166697, 1036384181690847394]
946800234804166697	525880087560716298	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	527757198420606978	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	528411530937499651	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	528564932753489920	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	528828049056333824	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	650029818548715540	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	651584941519273987	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	652212622900592698	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	711566957379452990	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	711662112669171763	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	977234212442738698	[946800234804166697, 1036384181690847394]
946800234804166697	977339622180937828	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	977762852049928265	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	978047966046748682	[946800234804166697, 1036384181690847394]
946800234804166697	978214583737147402	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	978228009226080297	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	978310429409443850	[946800234804166697, 1036384181690847394]
946800234804166697	978492492787896323	[946800234804166697, 1036384181690847394]
946800234804166697	978897222051717151	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	979164346091442176	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	979361031262449735	[946800234804166697, 1036384181690847394]
946800234804166697	979493866317160458	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	979968542344622090	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	980063686108516362	[946800234804166697, 1036384181690847394]
946800234804166697	980165042169327626	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	980195282912444427	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	980203136230772816	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	980361193074069524	[946800234804166697, 1036384181690847394]
946800234804166697	980442852276469770	[946800234804166697, 1036384181690847394]
946800234804166697	980488238563225730	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	980518963941363733	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1000329919051612200	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1000443327147167755	[946800234804166697, 1036384181690847394]
946800234804166697	1024853521440456714	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1076333406767566960	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1076360226397229056	[946800234804166697, 1036384181690847394]
946800234804166697	1076646687151505489	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1076679458079113356	[946800234804166697, 1036384181690847394]
946800234804166697	442011665878482955	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	442130636736823307	[946800234804166697, 1036384181690847394]
946800234804166697	444619004427108353	[946800234804166697, 1036384181690847394]
946800234804166697	446347831868129282	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	541330434827747348	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	541428599836770335	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	541913521609375744	[946800234804166697, 1036384181690847394]
946800234804166697	541960165885345802	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	663803664367878164	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	664060289074987029	[946800234804166697, 1036384181690847394]
946800234804166697	664471867280719873	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	664495913515089925	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	664989521267654666	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	665615086110375947	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	665879583379423243	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	666394571168677918	[946800234804166697, 1036384181690847394]
946800234804166697	666416677197447210	[946800234804166697, 1036384181690847394]
946800234804166697	667042111073288219	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	667084576761577472	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	668294735676309520	[946800234804166697, 1036384181690847394]
946800234804166697	669318614423437317	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	711794785450590270	[946800234804166697, 1036384181690847394]
946800234804166697	711843191376183336	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	712145269344436234	[946800234804166697, 1036384181690847394]
946800234804166697	712168477133373441	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	977439504040353862	[946800234804166697, 1036384181690847394]
946800234804166697	1013120493357899817	[946800234804166697, 1036384181690847394]
946800234804166697	1013335183535128607	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1013470280477331547	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1013649887369375754	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1013994751462211654	[946800234804166697, 1036384181690847394]
946800234804166697	1014634372030267453	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1014636887769616415	[946800234804166697, 1036384181690847394]
946800234804166697	1014971541445955715	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1015049190079995994	[946800234804166697, 1036384181690847394]
946800234804166697	1076703642847019081	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1101847321051922574	[946800234804166697, 1036384181690847394]
946800234804166697	1101866343797641287	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1101956856735342633	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1101984054666076272	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1102044686857809930	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1115298029952577537	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1115514688499875890	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1115615195138641926	[946800234804166697, 1036384181690847394]
946800234804166697	1115647719533457450	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1115698733976399944	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1115804960676909086	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1115934676540985364	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1115958924122800138	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1117431459737763954	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1117523193473802370	[946800234804166697, 1036384181690847394]
946800234804166697	1117533250320085092	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1117560675821170748	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1117609835756797992	[946800234804166697, 1036384181690847394]
946800234804166697	1117768190215327867	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1117792084024360980	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1117806178660008089	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1117960098275397662	[946800234804166697, 1036384181690847394]
946800234804166697	1118007681245003797	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1118015815678185503	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1118058989754794014	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1118138751852494928	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1118163444424777818	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1118322171572396032	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1118371234829324368	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1118428506590806087	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1118551852674470030	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1118602768769356006	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1118719869161050152	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1118734384787374120	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1118853457588256820	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1118855684172288073	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1118896279439814659	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1118928290426662912	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1118928741737959445	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1119081216801513493	[946800234804166697, 1036384181690847394]
946800234804166697	447168585245392898	[946800234804166697, 1036384181690847394]
946800234804166697	631205966947418142	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	632633672490680379	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	634942326564978698	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	635433491596705792	[946800234804166697, 1036384181690847394]
946800234804166697	635923201842610197	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	636122271861178368	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	636609706898489349	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	639977956227416065	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	641615428438982677	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	647216738194292747	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	648613013615542293	[946800234804166697, 1036384181690847394]
946800234804166697	649584350719115284	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	649757591093641242	[946800234804166697, 1036384181690847394]
946800234804166697	649923528707014668	[946800234804166697, 1036384181690847394, 948343502507491339, 948343375462019112, 1171527920716619806]
946800234804166697	696451155210797097	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	696755263969165372	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	697153000006877285	[946800234804166697, 1036384181690847394]
946800234804166697	697368605381230603	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	698000561865359382	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	698267010878013462	[946800234804166697, 1036384181690847394]
946800234804166697	698545966500020244	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	698632787795771422	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	709031033323913249	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	709036011178557488	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	720504298882072606	[946800234804166697, 1036384181690847394]
946800234804166697	720620565735407896	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	720767320515149910	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	721032082721341440	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	721109767430471771	[946800234804166697, 1036384181690847394, 948343375462019112, 948345555090833418]
946800234804166697	721225199474704416	[946800234804166697, 1036384181690847394]
946800234804166697	721254800888430633	[946800234804166697, 1036384181690847394]
946800234804166697	721807711649398816	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 1171527920716619806]
946800234804166697	722169741841793057	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112]
946800234804166697	722401751432691712	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	722491465871261746	[946800234804166697, 1036384181690847394]
946800234804166697	722776964037083166	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	722862186942431282	[946800234804166697, 1036384181690847394]
946800234804166697	722901221291327640	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	722923066245513307	[946800234804166697, 1036384181690847394]
946800234804166697	723021985025884201	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	723212828994961418	[946800234804166697, 1036384181690847394]
946800234804166697	725514636048334930	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	725542369579237476	[946800234804166697, 1036384181690847394]
946800234804166697	725570400699940866	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	725931801276841997	[946800234804166697, 1036384181690847394, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	726163201099825202	[946800234804166697, 1036384181690847394]
946800234804166697	726575818939170866	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	727802517156659251	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	727913882781483061	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	727919781864407141	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	728020569848545320	[946800234804166697, 1036384181690847394, 948343375462019112, 1171527920716619806]
946800234804166697	980825782660247562	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	981005577503256626	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	981141525197099038	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	981144406772043866	[946800234804166697, 1036384181690847394]
946800234804166697	981295612320444467	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	982305417671622756	[946800234804166697, 1036384181690847394]
946800234804166697	1004466149595041923	[946800234804166697, 1036384181690847394]
946800234804166697	1004543922229489716	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1004636297996030083	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1004743834330210427	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1004759574009610292	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1004890341951950859	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1004938155809570836	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1005086487584444497	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1005157139267997717	[946800234804166697, 1036384181690847394]
946800234804166697	1005269038366195844	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1005828300020658206	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1005969441714077776	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1006066265498066967	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1006107235283378208	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1110933790500606033	[946800234804166697, 1036384181690847394]
946800234804166697	504393208852119590	[946800234804166697, 1036384181690847394]
946800234804166697	505149330089574430	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	505515371135238154	[946800234804166697, 1036384181690847394]
946800234804166697	506551593731096607	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	506987666118803456	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418]
946800234804166697	508485150292836387	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	509035649274216460	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	509407454354997268	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	509488771939565576	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	509755560543911962	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	529582157031669771	[946800234804166697, 1036384181690847394]
946800234804166697	531437153788493845	[946800234804166697, 1036384181690847394]
946800234804166697	532339778881060884	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	532532003426533396	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	532940293801246730	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	533443361554694151	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	533632681070690304	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	538225459549175808	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	538944955079589918	[946800234804166697, 1036384181690847394]
946800234804166697	539468941316325406	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	541983918354595851	[946800234804166697, 1036384181690847394]
946800234804166697	543815815317815296	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	543969191917781002	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	544169135660072970	[946800234804166697, 1036384181690847394]
946800234804166697	545702912895090690	[946800234804166697, 1036384181690847394]
946800234804166697	547586382210531359	[946800234804166697, 1036384181690847394]
946800234804166697	549919067071315977	[946800234804166697, 1036384181690847394]
946800234804166697	551519585250050070	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	551794408610201621	[946800234804166697, 1036384181690847394]
946800234804166697	711794196758921277	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	982883311607250964	[946800234804166697, 1036384181690847394]
946800234804166697	982890847194464256	[946800234804166697, 1036384181690847394]
946800234804166697	982975439066763264	[946800234804166697, 1036384181690847394]
946800234804166697	983074718687064134	[946800234804166697, 1036384181690847394, 948343375462019112, 948345555090833418]
946800234804166697	983077772220055642	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	988882151204347975	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	989007823126011934	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	989032475139403857	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	989266003848462508	[946800234804166697, 1036384181690847394]
946800234804166697	989352103401119755	[946800234804166697, 1036384181690847394]
946800234804166697	989582815454703616	[946800234804166697, 1036384181690847394]
946800234804166697	989735811408875540	[946800234804166697, 1036384181690847394]
946800234804166697	989761748405989396	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	989979552195412020	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	990022990953578506	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	990273136769523733	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	990296341609607298	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	990300802398703646	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	990550379467005982	[946800234804166697, 1036384181690847394]
946800234804166697	994225847890366544	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	994356750763429928	[946800234804166697, 1036384181690847394]
946800234804166697	994636535800537169	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	994651840992006264	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	994803262534451250	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	994808271393259610	[946800234804166697, 1036384181690847394, 981564541982875688, 948343488594972724]
946800234804166697	994841393245724722	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	995047430489903154	[946800234804166697, 1036384181690847394]
946800234804166697	995076861556162631	[946800234804166697, 1036384181690847394]
946800234804166697	995753044962726028	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	995884071584546837	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	995916664992440432	[946800234804166697, 1036384181690847394]
946800234804166697	996000953226510437	[946800234804166697, 1036384181690847394]
946800234804166697	996126102298820699	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	996157539907555449	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	996180896614985861	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	996190522236469298	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	996240331576193145	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	996358850322116618	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1076918115033698414	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1076946197442465872	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1076949162110750766	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1077017292333916252	[946800234804166697, 1036384181690847394]
946800234804166697	1077034312521756683	[946800234804166697, 1036384181690847394, 948343346257076224, 948345555090833418]
946800234804166697	1110947916216012802	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	511213548832030735	[946800234804166697, 1036384181690847394]
946800234804166697	512315719111933952	[946800234804166697, 1036384181690847394]
946800234804166697	513245082640449556	[946800234804166697, 1036384181690847394, 981564541982875688, 948343488594972724]
946800234804166697	515350009126846465	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	516747515538833408	[946800234804166697, 1036384181690847394]
946800234804166697	517405965205766158	[946800234804166697, 1036384181690847394]
946800234804166697	518607322457833482	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	518839619132063745	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	520069897724624934	[946800234804166697, 1036384181690847394]
946800234804166697	521094988759826454	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	553730042593673227	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	556049669273419776	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	556238694965575737	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	556839370276208663	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	558971626121723911	[946800234804166697, 1036384181690847394]
946800234804166697	561137386097082370	[946800234804166697, 1036384181690847394]
946800234804166697	561780544170360833	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	563661885883416588	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	564618718991351819	[946800234804166697, 1036384181690847394]
946800234804166697	564644844300009472	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	565476643112615956	[946800234804166697, 1036384181690847394]
946800234804166697	566836956881748018	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	566853309949018114	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	567051630789263361	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	572271273430745098	[946800234804166697, 1036384181690847394]
946800234804166697	574254651302739989	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	574700529117298698	[946800234804166697, 1036384181690847394]
946800234804166697	575510644988706826	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	576456887671848972	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	576559473963827201	[946800234804166697, 1036384181690847394]
946800234804166697	576996028733980692	[946800234804166697, 1036384181690847394]
946800234804166697	577945173619638273	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	582365346032386078	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	582388123162640405	[946800234804166697, 1036384181690847394]
946800234804166697	584170233854689280	[946800234804166697, 1036384181690847394]
946800234804166697	586248204069109773	[946800234804166697, 1036384181690847394]
946800234804166697	619167094222749716	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	619203719296319488	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	620311568328163348	[946800234804166697, 1036384181690847394]
946800234804166697	621705340341452801	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	622619718339133441	[946800234804166697, 1036384181690847394]
946800234804166697	625358983313489997	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	626990538901684237	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	627651007668682773	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	628267372863553586	[946800234804166697, 1036384181690847394]
946800234804166697	629424073897803786	[946800234804166697, 1036384181690847394]
946800234804166697	716210337908523059	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	716349662986109028	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	716399015905984517	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	716781470492131369	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	716927125273313291	[946800234804166697, 1036384181690847394]
946800234804166697	1000217743339044974	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1000322894364160033	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1000448954028265612	[946800234804166697, 1036384181690847394]
946800234804166697	1000475682062733383	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1000727331792502864	[946800234804166697, 1036384181690847394]
946800234804166697	1000887509422723114	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1001174929024241735	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1001259494501785620	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1001325311394332835	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1001739884962259014	[946800234804166697, 1036384181690847394]
946800234804166697	1002366552747823195	[946800234804166697, 1036384181690847394]
946800234804166697	1002470290871300107	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1002487022872690788	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1002488779317203094	[946800234804166697, 1036384181690847394]
946800234804166697	1002583951254237184	[946800234804166697, 1036384181690847394]
946800234804166697	1002630463074082937	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1002704335563653120	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1002819542629765251	[946800234804166697, 1036384181690847394]
946800234804166697	1002852213066059776	[946800234804166697, 1036384181690847394]
946800234804166697	1002892724338429952	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1003031441900326973	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1003123291336228904	[946800234804166697, 1036384181690847394]
946800234804166697	1003413422874034197	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1003489377416118303	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1003556651737030766	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	586343266102804490	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	597892165494112303	[946800234804166697, 1036384181690847394]
946800234804166697	598982614837231628	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	600550562131607574	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	600872404067156008	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	601277046735241228	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	601342345157410819	[946800234804166697, 1036384181690847394]
946800234804166697	601882397042278420	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	603287581106372638	[946800234804166697, 1036384181690847394]
946800234804166697	603389672521072648	[946800234804166697, 1036384181690847394]
946800234804166697	603658892702121984	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	604423034111131669	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112, 1171527920716619806]
946800234804166697	605466475318476822	[946800234804166697, 1036384181690847394]
946800234804166697	607658982861045760	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	607811169515732993	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	608062520149803031	[946800234804166697, 1036384181690847394]
946800234804166697	610268566557818880	[946800234804166697, 1036384181690847394]
946800234804166697	610614565599969316	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	612986324646887424	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	614538766358413323	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	616953751424598027	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	617340742553305091	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	670460054759145482	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	670978803677528098	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	671435819780800551	[946800234804166697, 1036384181690847394, 981564541982875688, 948345555090833418]
946800234804166697	672096685849313300	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	672200923841429514	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	672622277707431986	[946800234804166697, 1036384181690847394]
946800234804166697	672897026224160789	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	673204572482699275	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	674329591518724147	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	674601262205108244	[946800234804166697, 1036384181690847394]
946800234804166697	674685774398095380	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	680569821783785476	[946800234804166697, 1036384181690847394]
946800234804166697	680799737997426734	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	681271907642769449	[946800234804166697, 1036384181690847394]
946800234804166697	681865866220142595	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	682058418890342430	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	682264945240702986	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	682893126482001979	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	684408493893091542	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	685950433625505807	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	686620143878668345	[946800234804166697, 1036384181690847394]
946800234804166697	687208629002174465	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	687884249931841558	[946800234804166697, 1036384181690847394]
946800234804166697	688169291941543955	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	688553409863090185	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	688751278062567485	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	688753988463624295	[946800234804166697, 1036384181690847394]
946800234804166697	689263243335696533	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	689369523626835974	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	689604696947818501	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	689802036719386675	[946800234804166697, 1036384181690847394, 948343488594972724, 948343346257076224]
946800234804166697	689975926163112090	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	690549981521772578	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	690965519670706316	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	691428924709928995	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	691638829035028621	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	692177991710539858	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	692557290472996885	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	692602274203303975	[946800234804166697, 1036384181690847394]
946800234804166697	692804203374051409	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948345555090833418, 1171527920716619806]
946800234804166697	692815442758205472	[946800234804166697, 1036384181690847394, 948343375462019112, 948343346257076224]
946800234804166697	693210772452409466	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	693517032259584032	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	693545857316028519	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	693719433390063636	[946800234804166697, 1036384181690847394]
946800234804166697	693731823045312572	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	693746692654235709	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	693805082747207750	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	694172879172010059	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	694406244060102696	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	694710776564285540	[946800234804166697, 1036384181690847394]
946800234804166697	694998593894875247	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	695147183850127403	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	695386287678685184	[946800234804166697, 1036384181690847394]
946800234804166697	587633897819340841	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	588811355654586385	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	589694886551224362	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	590602586390790198	[946800234804166697, 1036384181690847394]
946800234804166697	590757085382311937	[946800234804166697, 1036384181690847394]
946800234804166697	591242315759222786	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	593453863747715082	[946800234804166697, 1036384181690847394]
946800234804166697	593708571212906497	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	653053384676605972	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	653146734519779328	[946800234804166697, 1036384181690847394]
946800234804166697	654741236741046283	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	655880645192712203	[946800234804166697, 1036384181690847394]
946800234804166697	655934609413898256	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	657235762646876170	[946800234804166697, 1036384181690847394]
946800234804166697	658417417994764309	[946800234804166697, 1036384181690847394]
946800234804166697	658883303381794816	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	717241029601919038	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	717693447057702943	[946800234804166697, 1036384181690847394]
946800234804166697	717930184267005952	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	718259411965050941	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	718470809538003015	[946800234804166697, 1036384181690847394]
946800234804166697	718707265326284841	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	718896603775107082	[946800234804166697, 1036384181690847394]
946800234804166697	719547034012614706	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	720386844876996608	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	720435809790066728	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1003560866517618768	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1015199812611752056	[946800234804166697, 1036384181690847394]
946800234804166697	1015229149994029086	[946800234804166697, 1036384181690847394]
946800234804166697	1015332029384097873	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1015368054823207004	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1015392988098215967	[946800234804166697, 1036384181690847394]
946800234804166697	1015464035040370819	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 1171527920716619806]
946800234804166697	1015734270385459280	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1015787171677999154	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1015812291687612486	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1016032411391373312	[946800234804166697, 1036384181690847394]
946800234804166697	1016171073642962954	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	1016365380693938268	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1016385364635684914	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1016412469264134225	[946800234804166697, 1036384181690847394]
946800234804166697	1016420932446859264	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1016436170978230284	[946800234804166697, 1036384181690847394]
946800234804166697	1016513981394997308	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1016695041512714310	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1017093152299028552	[946800234804166697, 1036384181690847394]
946800234804166697	1017343624679260231	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1017496780914577448	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1017730004706144256	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1017817539675430972	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1018051270025687040	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1018266558952378490	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1018342221533167646	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1018423295214882817	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1018699361011642439	[946800234804166697, 1036384181690847394]
946800234804166697	1018879398310596699	[946800234804166697, 1036384181690847394]
946800234804166697	1018949469145935883	[946800234804166697, 1036384181690847394]
946800234804166697	1078781069538644070	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1078783819055906856	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1078970505148764181	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948345555090833418]
946800234804166697	1083426019123413055	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1084091183644549140	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1084182120500568074	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1084252950144237739	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1084271182045511870	[946800234804166697, 1036384181690847394]
946800234804166697	1110954680860819530	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1111038273666687137	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1111082376370585630	[946800234804166697, 1036384181690847394]
946800234804166697	1111134678024462356	[946800234804166697, 1036384181690847394]
946800234804166697	1111304376515051610	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1111315055540187279	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1111355756982308884	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1111466168558026783	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	595397264470573056	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	596919214841921546	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	597428580619911168	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	675538666684284938	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	677012507424194591	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	677050989873725442	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	677352454635126824	[946800234804166697, 1036384181690847394]
946800234804166697	678468453014962191	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	678641548291866624	[946800234804166697, 1036384181690847394]
946800234804166697	679511645386571846	[946800234804166697, 1036384181690847394]
946800234804166697	679729436542894140	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	698845503940722688	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	699343907602956288	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	699444655200141394	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	699783004981166111	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	699861615809527848	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	700158346447290409	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	700293771081941002	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	700510304672677968	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	700555638467592253	[946800234804166697, 1036384181690847394]
946800234804166697	701180273114742976	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	701541532078964766	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	701761197246120026	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	701825678894694410	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	702096305333469224	[946800234804166697, 1036384181690847394]
946800234804166697	702411122095161385	[946800234804166697, 1036384181690847394]
946800234804166697	703001729687617547	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	703075694808399942	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	703105720882823278	[946800234804166697, 1036384181690847394]
946800234804166697	703201609190080542	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	714935921799331911	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	715018885916655716	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	715396827737751594	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	715423595001806888	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	715972567298736190	[946800234804166697, 1036384181690847394]
946800234804166697	716093408778649712	[946800234804166697, 1036384181690847394]
946800234804166697	726356803650060338	[946800234804166697, 1036384181690847394]
946800234804166697	726430118159057016	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	741159791484862515	[946800234804166697, 1036384181690847394]
946800234804166697	741352672447430657	[946800234804166697, 1036384181690847394]
946800234804166697	741683220634009651	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	742000263107313764	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	742596138632478802	[946800234804166697, 1036384181690847394]
946800234804166697	742642173735862282	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	742803455516737557	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	743159924409892885	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	743320342608478259	[946800234804166697, 1036384181690847394]
946800234804166697	743410543913730078	[946800234804166697, 1036384181690847394]
946800234804166697	743514232380981309	[946800234804166697, 1036384181690847394]
946800234804166697	744671989905752136	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1006197873265877033	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1006215666275205161	[946800234804166697, 1036384181690847394]
946800234804166697	1006282026426576968	[946800234804166697, 1036384181690847394]
946800234804166697	1006366823308079245	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1006627431202951229	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1006654296919642163	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1006696409581490328	[946800234804166697, 1036384181690847394]
946800234804166697	1006765235509674085	[946800234804166697, 1036384181690847394]
946800234804166697	1006772754365808662	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1006885643286229083	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1006956618358997034	[946800234804166697, 1036384181690847394]
946800234804166697	1006990568003489894	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 1171527920716619806]
946800234804166697	1007024957575921724	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1007190051639267378	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1007701821348925451	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1008132225654591499	[946800234804166697, 1036384181690847394]
946800234804166697	1082839938896240645	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1083001660470726737	[946800234804166697, 1036384181690847394]
946800234804166697	1083081631084052520	[946800234804166697, 1036384181690847394]
946800234804166697	1083125212893155328	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1083191187705446450	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1083396539600359535	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1085799817684459540	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1085948026369081607	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1086036895089307751	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1086307809081163797	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1086314320180297832	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1086400408571871262	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	643055752906276865	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	644988507865088000	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	703369823563808850	[946800234804166697, 1036384181690847394]
946800234804166697	703501164330745926	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	703628537311002694	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	703665185667416114	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	703765361123786802	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	704292893115809932	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	704696057568821298	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	704791518304796804	[946800234804166697, 1036384181690847394]
946800234804166697	705075113984524308	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	705167296431390762	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	705319981713195048	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	705866912126730362	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	706395763667894295	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	706536622170046554	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	706590791199621211	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	707268347120713838	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	707890695171735565	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	707969576432041994	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	707975734206922858	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	708383855375155281	[946800234804166697, 1036384181690847394]
946800234804166697	708700679690256384	[946800234804166697, 1036384181690847394]
946800234804166697	708708492382437456	[946800234804166697, 1036384181690847394]
946800234804166697	708913944542052402	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	709114727443202070	[946800234804166697, 1036384181690847394]
946800234804166697	709525919743606826	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	709975239970390147	[946800234804166697, 1036384181690847394]
946800234804166697	710155806980702208	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	710285090671951915	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	711219916706938881	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	711307235099410522	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1008583996634038355	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1008970648909008896	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1009089777087283210	[946800234804166697, 1036384181690847394]
946800234804166697	1009101429220323359	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1009111972756865098	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1009437936439279636	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1009529426331050005	[946800234804166697, 1036384181690847394]
946800234804166697	1009570321570996294	[946800234804166697, 1036384181690847394]
946800234804166697	1009646915916414989	[946800234804166697, 1036384181690847394]
946800234804166697	1010055322355908608	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1010180521751494806	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1010228255028166658	[946800234804166697, 1036384181690847394]
946800234804166697	1010263078769786920	[946800234804166697, 1036384181690847394]
946800234804166697	1010398292271706112	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1010795360031096882	[946800234804166697, 1036384181690847394]
946800234804166697	1010878372865376276	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1011013436827775116	[946800234804166697, 1036384181690847394]
946800234804166697	1011130961280368680	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1011234450442555482	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1011315687500812389	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1011500956938154035	[946800234804166697, 1036384181690847394, 948343375462019112, 948343346257076224]
946800234804166697	1011590001030611005	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1011881023925141544	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1012144358121799721	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1012389621449109526	[946800234804166697, 1036384181690847394]
946800234804166697	1012421338989867120	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1012831924840050700	[946800234804166697, 1036384181690847394]
946800234804166697	1012843983661183118	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1012962375370031124	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1012986666086047744	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1018987287364780085	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1018990261570895943	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1019073294625943632	[946800234804166697, 1036384181690847394]
946800234804166697	1019190793451343902	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1019261647426162749	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1019283083813470298	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1019325181124161646	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1019366957679640637	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1019394300456489011	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1019961880099438724	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1020089106929299466	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1020191975254798396	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1020311732331221012	[946800234804166697, 1036384181690847394]
946800234804166697	1020556920194596914	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	695633559024566342	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	695675695723970710	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	712211214494859305	[946800234804166697, 1036384181690847394]
946800234804166697	712253251269165077	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343346257076224, 1171527920716619806]
946800234804166697	712375136598360094	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	712748802834169928	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	712763504838312018	[946800234804166697, 1036384181690847394]
946800234804166697	713341271728717835	[946800234804166697, 1036384181690847394]
946800234804166697	713467350732767282	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	714233474298544160	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	714654142068686908	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	723339554840510594	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	723793737502949396	[946800234804166697, 1036384181690847394]
946800234804166697	724736969027879388	[946800234804166697, 1036384181690847394]
946800234804166697	724792119155228742	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	724875703585341491	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	725029737759506514	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	725159612407611522	[946800234804166697, 1036384181690847394]
946800234804166697	725322505832628255	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1020943582271639592	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1021512321434144839	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1021532132339892295	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1021613330651156512	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1021946569701982229	[946800234804166697, 1036384181690847394, 948343375462019112, 948343346257076224]
946800234804166697	1022048133984813107	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1022197082221715546	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1022953079085219941	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1022981616722772028	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1023076882805166090	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1023205188049305611	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1023208280794857492	[946800234804166697, 1036384181690847394]
946800234804166697	1023224964532420688	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1023247559512309851	[946800234804166697, 1036384181690847394]
946800234804166697	1023446320977035275	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1023584467492802683	[946800234804166697, 1036384181690847394]
946800234804166697	1023682022536925285	[946800234804166697, 1036384181690847394]
946800234804166697	1023791732149727263	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1024021229990072370	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1024029105064259605	[946800234804166697, 1036384181690847394]
946800234804166697	1024333561869905931	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1024376099859341402	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1026357391685587024	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1026634429680078939	[946800234804166697, 1036384181690847394]
946800234804166697	1026999342818668618	[946800234804166697, 1036384181690847394]
946800234804166697	1027030637137379379	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1027230407973941349	[946800234804166697, 1036384181690847394]
946800234804166697	1027308119363178617	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1027363908392075274	[946800234804166697, 1036384181690847394]
946800234804166697	1027433568462438411	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1086748553361240237	[946800234804166697, 1036384181690847394]
946800234804166697	1086797622636974141	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1086915019586936912	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1087126740436004895	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1087141780073484288	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1087358210693935124	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1087503430781784234	[946800234804166697, 1036384181690847394]
946800234804166697	1087509708346241116	[946800234804166697, 1036384181690847394]
946800234804166697	1087552368213766185	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1087802270411923456	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1087836280404058213	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1087841254672441344	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1087929537641324575	[946800234804166697, 1036384181690847394]
946800234804166697	1088180084202033202	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1088201177201639547	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1088203316879691928	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1088208588230627380	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1088260251880530070	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1088537133096116386	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1088602034191749130	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1088808688011182180	[946800234804166697, 1036384181690847394, 948343502507491339, 948343375462019112]
946800234804166697	1088816615870709911	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1088899603816005783	[946800234804166697, 1036384181690847394]
946800234804166697	1088923028886401124	[946800234804166697, 1036384181690847394]
946800234804166697	1088995477871149175	[946800234804166697, 1036384181690847394]
946800234804166697	1089135482098683986	[946800234804166697, 1036384181690847394]
946800234804166697	1120169578874536036	[946800234804166697, 1036384181690847394]
946800234804166697	739330457375866904	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	739511915729911841	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	739559986861965362	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	740314788059414649	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	740533710042169354	[946800234804166697, 1036384181690847394]
946800234804166697	740783961776586803	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	740806483532316722	[946800234804166697, 1036384181690847394]
946800234804166697	740852439749623840	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	745256493925793903	[946800234804166697, 1036384181690847394]
946800234804166697	745308482869264444	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	745533361006837781	[946800234804166697, 1036384181690847394]
946800234804166697	746269485966688258	[946800234804166697, 1036384181690847394]
946800234804166697	746368541107814430	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	746371910731825233	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	746554170043007048	[946800234804166697, 1036384181690847394, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	746602235768864769	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	747538989933920408	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	747593150293475358	[946800234804166697, 1036384181690847394]
946800234804166697	748208491407081633	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	748381626165362789	[946800234804166697, 1036384181690847394]
946800234804166697	749332930844688514	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	750658099697811476	[946800234804166697, 1036384181690847394]
946800234804166697	750764883183927407	[946800234804166697, 1036384181690847394, 948343502507491339, 948343375462019112]
946800234804166697	750837130665918564	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	751219804190408774	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	751275568565059635	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	751526614608642181	[946800234804166697, 1036384181690847394]
946800234804166697	751630698976247869	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	751792293744476243	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	751835030107586662	[946800234804166697, 1036384181690847394]
946800234804166697	752311332799381533	[946800234804166697, 1036384181690847394]
946800234804166697	752338131436437634	[946800234804166697, 1036384181690847394]
946800234804166697	752800745543303218	[946800234804166697, 1036384181690847394]
946800234804166697	753120330620338176	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	753298754320203927	[946800234804166697, 1036384181690847394]
946800234804166697	753438573843447918	[946800234804166697, 1036384181690847394]
946800234804166697	753614607054143609	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	753691125872590888	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	753711861563916379	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	754367436689506445	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	754373943846240356	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	754447214000079032	[946800234804166697, 1036384181690847394]
946800234804166697	754756163303768196	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	754830583032578162	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	754882903544168520	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	755288157678731265	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	755496248882102275	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	755496376888197161	[946800234804166697, 1036384181690847394]
946800234804166697	755822043722940488	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	755928404628471848	[946800234804166697, 1036384181690847394]
946800234804166697	755955478109880542	[946800234804166697, 1036384181690847394]
946800234804166697	756119973965070407	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	756241071792717886	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	756246401985413153	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	756362250503192646	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	756494064236494948	[946800234804166697, 1036384181690847394, 948343375462019112, 1171527920716619806]
946800234804166697	756525329077764098	[946800234804166697, 1036384181690847394]
946800234804166697	756650002654298133	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	756847461192171521	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	756881354724999208	[946800234804166697, 1036384181690847394]
946800234804166697	756951809121190023	[946800234804166697, 1036384181690847394]
946800234804166697	756974728266252428	[946800234804166697, 1036384181690847394]
946800234804166697	756977248049037385	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	757212145980276816	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	757231176955068447	[946800234804166697, 1036384181690847394]
946800234804166697	757249881793626113	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	757358667757518860	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	757494154191306783	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	757638931419365465	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	757692016930062397	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	757697238536552490	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	757725845363097720	[946800234804166697, 1036384181690847394]
946800234804166697	757737645693730988	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	758049339762409584	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	758359847200096302	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	758633060748492800	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 1171527920716619806]
946800234804166697	758713752748032030	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	758925680901226498	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	759826330459832391	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	760306116574969877	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	760908114853101650	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	760990777563676702	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	761400632116248597	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	761673015817011211	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	761707188020051969	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	762314081633697792	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	762898490920927252	[946800234804166697, 1036384181690847394]
946800234804166697	762925322760749087	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	763072818396266499	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	763107081582280724	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	763179874206089252	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	763470404538597396	[946800234804166697, 1036384181690847394]
946800234804166697	763761982712578048	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	763912904940453898	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	764229000423538718	[946800234804166697, 1036384181690847394]
946800234804166697	764312980707082251	[946800234804166697, 1036384181690847394]
946800234804166697	764431843218554890	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	764681457054122035	[946800234804166697, 1036384181690847394]
946800234804166697	764909474061746208	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	764932365600161822	[946800234804166697, 1036384181690847394]
946800234804166697	765114357339389992	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	765228636810117201	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	765584349809868810	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	765841220919754833	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	766094098704236564	[946800234804166697, 1036384181690847394]
946800234804166697	766328344307564574	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	766379415130341426	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	766831434097885204	[946800234804166697, 1036384181690847394]
946800234804166697	766913386192961546	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	767061195907399771	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	767187810989244466	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	767401906011242526	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	767795538216616006	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	767807170594078781	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343346257076224]
946800234804166697	768179185885249577	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	768200859577221181	[946800234804166697, 1036384181690847394]
946800234804166697	768270178798403614	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	769049158370852915	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	769171411990085643	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	769627233710374933	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	769627492939333682	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	770040181121482753	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	770289872845668353	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	770313885444997164	[946800234804166697, 1036384181690847394]
946800234804166697	770842230985588757	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	770947123901497345	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	771339515751170069	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	771760456830418945	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	771792768645201960	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	772092085851389992	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	772479495802060821	[946800234804166697, 1036384181690847394]
946800234804166697	772576208407756810	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	773187266448457729	[946800234804166697, 1036384181690847394]
946800234804166697	773354049381990410	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	773423385531252807	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	773711394314911764	[946800234804166697, 1036384181690847394]
946800234804166697	773893822844895282	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	774857299930906625	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	774955389639983125	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	774958450794823723	[946800234804166697, 1036384181690847394]
946800234804166697	775377590231498753	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	775729126345670657	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	775867449786499072	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948345555090833418]
946800234804166697	776093221532991491	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	776161767234994227	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	776255584080625664	[946800234804166697, 1036384181690847394]
946800234804166697	776351444722909184	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	776653905110892565	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343346257076224, 948345555090833418]
946800234804166697	776830409194602536	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	776832272526606376	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	776842138570457148	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	776904175148990504	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	777766576194584616	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	778061711005188107	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	778284663285481483	[946800234804166697, 1036384181690847394]
946800234804166697	778357280546619423	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	778685606200999966	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	778832962363588638	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	779062122738090006	[946800234804166697, 1036384181690847394]
946800234804166697	779089522079825941	[946800234804166697, 1036384181690847394]
946800234804166697	779135658697555979	[946800234804166697, 1036384181690847394]
946800234804166697	779458297035751425	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	779674884703387658	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	779693774485848064	[946800234804166697, 1036384181690847394]
946800234804166697	779790042741735424	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	780242245013864458	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	780432686803320933	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	780476186848657452	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	780579559217037313	[946800234804166697, 1036384181690847394]
946800234804166697	781124701791191063	[946800234804166697, 1036384181690847394]
946800234804166697	781296231799717918	[946800234804166697, 1036384181690847394]
946800234804166697	781559030623240212	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	781687888765124629	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	782104140095553589	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	782243464154185728	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	782348221409656892	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	782688940221661204	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	782773499101708300	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	783877720601788416	[946800234804166697, 1036384181690847394]
946800234804166697	784410622183735306	[946800234804166697, 1036384181690847394]
946800234804166697	784577897934487572	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	784742361976274954	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	785334974735450112	[946800234804166697, 1036384181690847394]
946800234804166697	785923826570887178	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	786364227651764234	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	786685125433491476	[946800234804166697, 1036384181690847394]
946800234804166697	786853035527634964	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	787211420890038314	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	787321850371637279	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	787846764862111774	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	788123902718902342	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	788305261525336064	[946800234804166697, 1036384181690847394]
946800234804166697	788358100860141609	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	788438252490457198	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	788645227610898463	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	789183721705701377	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	789598339779919913	[946800234804166697, 1036384181690847394]
946800234804166697	789744234059399189	[946800234804166697, 1036384181690847394]
946800234804166697	789914894547681280	[946800234804166697, 1036384181690847394]
946800234804166697	789941506496528405	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	790015771132166204	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	790123841379893258	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	790720371136397322	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	790763304908881920	[946800234804166697, 1036384181690847394]
946800234804166697	790817905008312373	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	791022649274794074	[946800234804166697, 1036384181690847394]
946800234804166697	791754085878857749	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	792023089348739102	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	792091973435523072	[946800234804166697, 1036384181690847394]
946800234804166697	792139950199930881	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	792261599623905330	[946800234804166697, 1036384181690847394]
946800234804166697	792465362053890068	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	792867980051611699	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	792897796843896833	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	798696254665523201	[946800234804166697, 1036384181690847394]
946800234804166697	799032895872303114	[946800234804166697, 1036384181690847394]
946800234804166697	799089914359840788	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	799126934633447445	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	799657195838504990	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	799937845632434186	[946800234804166697, 1036384181690847394]
946800234804166697	800130894026506270	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	800579812959846430	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	800637217059110912	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	801026015320473630	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	801114077132095489	[946800234804166697, 1036384181690847394]
946800234804166697	801149887478497351	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	784733209145507881	[946800234804166697, 1036384181690847394]
946800234804166697	801551339414224938	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	801796079040331787	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	805729833635414028	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	838277402949976074	[946800234804166697, 1036384181690847394]
946800234804166697	838341510587482122	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	838599966367940630	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	838854913228406794	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1026144078762606773	[946800234804166697, 1036384181690847394]
946800234804166697	1026197953364361337	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1026253525321261057	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1026273381554851960	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1026347328384270336	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1027478183160840234	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1027701053463994369	[946800234804166697, 1036384181690847394]
946800234804166697	1027921130666856589	[946800234804166697, 1036384181690847394]
946800234804166697	1028594289497874482	[946800234804166697, 1036384181690847394]
946800234804166697	1028704277708935239	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112]
946800234804166697	1028757608636616704	[946800234804166697, 1036384181690847394]
946800234804166697	1028812159502782514	[946800234804166697, 1036384181690847394]
946800234804166697	1028817224821133312	[946800234804166697, 1036384181690847394]
946800234804166697	1028833937641971894	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1029079912562298940	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1029365604173492234	[946800234804166697, 1036384181690847394]
946800234804166697	1029645711949705246	[946800234804166697, 1036384181690847394, 981564541982875688, 948343488594972724]
946800234804166697	1089312184288432128	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1089317532353167502	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1089331970967867474	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1089382105710076005	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1089386347594252369	[946800234804166697, 1036384181690847394, 948343502507491339, 948343346257076224]
946800234804166697	1089526481383870494	[946800234804166697, 1036384181690847394]
946800234804166697	1089564829049688136	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1089703663003500654	[946800234804166697, 1036384181690847394]
946800234804166697	1089773270267609088	[946800234804166697, 1036384181690847394]
946800234804166697	1089963034107191386	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1090049461255938170	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1090110270745084047	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1090158588418330664	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1090261117512724532	[946800234804166697, 1036384181690847394]
946800234804166697	1090352451611275324	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1090437558485393448	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1090438964357386311	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1090485173897932840	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1090798731957387284	[946800234804166697, 1036384181690847394]
946800234804166697	1090805585982791820	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1090865431465697372	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1092377277972627456	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1092426074757021749	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1092475785018880190	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1092577706945810492	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1092591452325941388	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1092664420863311922	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1092764799584190534	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1092804629294764156	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1092807605182812201	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1092957968737243138	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1093083418004295781	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1093169277537894452	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1093182144777572453	[946800234804166697, 1036384181690847394]
946800234804166697	1111494778450882702	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1111643844874874951	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1111654194450010133	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1111747226549620858	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1111799727562956800	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1111822365890981909	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1112060063130067126	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1113597834781016074	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1116020208566550610	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1116155465496285184	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1116209916038877184	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1116417043982467303	[946800234804166697, 1036384181690847394]
946800234804166697	1116498583361962085	[946800234804166697, 1036384181690847394]
946800234804166697	1116710048345895033	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	792920927658704896	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	793693979660648511	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	793725962269098064	[946800234804166697, 1036384181690847394]
946800234804166697	793933717743599628	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	793950337069219852	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	794385526944956428	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	794678496169164851	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	794683055486271519	[946800234804166697, 1036384181690847394]
946800234804166697	794762046268375051	[946800234804166697, 1036384181690847394]
946800234804166697	794976706216722442	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	795273272287297548	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	795522513790697472	[946800234804166697, 1036384181690847394]
946800234804166697	795718724925522002	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	795720181296267335	[946800234804166697, 1036384181690847394]
946800234804166697	795798134155378728	[946800234804166697, 1036384181690847394]
946800234804166697	795933091079520276	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	796063342291976302	[946800234804166697, 1036384181690847394]
946800234804166697	796134344947269682	[946800234804166697, 1036384181690847394]
946800234804166697	796275135161171988	[946800234804166697, 1036384181690847394]
946800234804166697	796485010428919818	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	796597177810944030	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	796600323078225940	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112, 948343346257076224, 1171527920716619806]
946800234804166697	796912969736126535	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	797231291715944538	[946800234804166697, 1036384181690847394]
946800234804166697	797759133012721664	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	797828148469170266	[946800234804166697, 1036384181690847394]
946800234804166697	797872655763374111	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	797878163517865995	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	797936420785618954	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	797948359041089586	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	798092706038939690	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	830641971706068992	[946800234804166697, 1036384181690847394]
946800234804166697	830675578221756416	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	830830383704047626	[946800234804166697, 1036384181690847394]
946800234804166697	830849571038167130	[946800234804166697, 1036384181690847394]
946800234804166697	831150993893752853	[946800234804166697, 1036384181690847394]
946800234804166697	831218184420851743	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	831704538406846475	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	831718967998808155	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	832005590406135849	[946800234804166697, 1036384181690847394]
946800234804166697	832060714264690708	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	832986566234341428	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	833132134465929257	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	833235839755747378	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 1171527920716619806]
946800234804166697	833423800724488202	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	833709971514458143	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	833795266586345512	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	834174143301025873	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	834455407326003200	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	834537611825512528	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	834589382047432774	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	834931901902880828	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	834948291846209566	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	835215379462488096	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	835216838030917692	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	835547164636872704	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	835669098247487488	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	835904253876633610	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	836111063383670855	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	836219256290279485	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	836333214955601970	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	843202143196545074	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1029884130789445653	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1030178585702584373	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1030221807174815835	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1030317318766592080	[946800234804166697, 1036384181690847394]
946800234804166697	1030483537654190130	[946800234804166697, 1036384181690847394]
946800234804166697	1030805786538033152	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1031102577871425650	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1031191145092493402	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1031350162670493696	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1031378319406538762	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	798355527583006751	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	798527104458948608	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	801816668439445525	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	802276908573524008	[946800234804166697, 1036384181690847394]
946800234804166697	802334735014559755	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	802579067890827284	[946800234804166697, 1036384181690847394]
946800234804166697	802940233627992085	[946800234804166697, 1036384181690847394, 948343502507491339, 948343375462019112]
946800234804166697	803008763497676840	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	803034700984614922	[946800234804166697, 1036384181690847394]
946800234804166697	803140277900410900	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	803218738727223318	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	803296315421360168	[946800234804166697, 1036384181690847394]
946800234804166697	803442058933174272	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	803518668750979083	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	803570532834476032	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	803619855508045845	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	803885113216991232	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343346257076224]
946800234804166697	803932895265030174	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	803979057196302378	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	804066809275220040	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	804084516720476200	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	804125424459317289	[946800234804166697, 1036384181690847394]
946800234804166697	804128417083293717	[946800234804166697, 1036384181690847394]
946800234804166697	804398825048899635	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	804816819437305886	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	804837523016777749	[946800234804166697, 1036384181690847394, 981564541982875688, 948343502507491339]
946800234804166697	804873969459134474	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	805167844013768715	[946800234804166697, 1036384181690847394]
946800234804166697	805276827399880734	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	805687347478921216	[946800234804166697, 1036384181690847394]
946800234804166697	1031400137806848010	[946800234804166697, 1036384181690847394]
946800234804166697	1031412409723797567	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1031458529804025866	[946800234804166697, 1036384181690847394]
946800234804166697	1031614503844065371	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1031638088121856003	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1031780378668711946	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1031887448122347550	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1031902962349506570	[946800234804166697, 1036384181690847394]
946800234804166697	1032008328559206420	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1032324803211821099	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112, 948343346257076224]
946800234804166697	1032696683575914526	[946800234804166697, 1036384181690847394]
946800234804166697	1032875721779064883	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1032881640038465600	[946800234804166697, 1036384181690847394]
946800234804166697	1033170902805909644	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1033436543152558142	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1033539240182681701	[946800234804166697, 1036384181690847394]
946800234804166697	1034114565513945119	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1034160378516615249	[946800234804166697, 1036384181690847394]
946800234804166697	1034452237793116312	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1034467922904629318	[946800234804166697, 1036384181690847394, 948343502507491339, 948343375462019112]
946800234804166697	1034538278931677284	[946800234804166697, 1036384181690847394]
946800234804166697	1034582652122038312	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1034630593352302674	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1034643571535511573	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1034779137983905802	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1035068130088726528	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1035210578937004126	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1069642491822870580	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1069733196830351500	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1069940864996098110	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1069994285530873917	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1070087123388076135	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1077096166661046292	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1077184150676701274	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1077213759262707753	[946800234804166697, 1036384181690847394]
946800234804166697	1077433924801806447	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1077659435893268520	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1077723296109449366	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1077795757639352381	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1077830677157916752	[946800234804166697, 1036384181690847394]
946800234804166697	1078007215518138378	[946800234804166697, 1036384181690847394]
946800234804166697	1078250170573135954	[946800234804166697, 1036384181690847394]
946800234804166697	1078262749169205341	[946800234804166697, 1036384181690847394]
946800234804166697	1078407107101069323	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1078476700637212742	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1078671700079677561	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	798550445521764413	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1035297125371740180	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1035337808602214481	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1035546330472386570	[946800234804166697, 1036384181690847394]
946800234804166697	1035729400588668999	[946800234804166697, 1036384181690847394]
946800234804166697	1035879180124033104	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1036075616618946592	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1036100779783757835	[946800234804166697, 1036384181690847394]
946800234804166697	1036291680162291753	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1036340707553726548	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1036393020213428254	[946800234804166697, 1036384181690847394]
946800234804166697	1036410444677652551	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1036656118979625070	[946800234804166697, 1036384181690847394]
946800234804166697	1036660597175111780	[946800234804166697, 1036384181690847394]
946800234804166697	1037167582895157258	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1037244742381084682	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1037278614590324738	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1037477521417060352	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1037527232576487494	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1037530350198468710	[946800234804166697, 1036384181690847394, 948343346257076224, 948345555090833418]
946800234804166697	1037675397090918420	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1037708868320510032	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1037855392488755240	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1037954922035032115	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1038251715847270471	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1038273224930238495	[946800234804166697, 1036384181690847394]
946800234804166697	1038828014353522801	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1038981553004490802	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1039237344454250599	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1039293145445314582	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1072230467165765793	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1073712228496326676	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1074017483071172740	[946800234804166697, 1036384181690847394]
946800234804166697	1085311431404171324	[946800234804166697, 1036384181690847394]
946800234804166697	1085336041386422322	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1085370447979368450	[946800234804166697, 1036384181690847394]
946800234804166697	1085445468412190732	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1093348487199981630	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1093505134409027654	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1093592903701495818	[946800234804166697, 1036384181690847394]
946800234804166697	1093778896819863552	[946800234804166697, 1036384181690847394]
946800234804166697	1093967764433154159	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1094025833393422357	[946800234804166697, 1036384181690847394]
946800234804166697	1094058100895518833	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1094287421895614637	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	1094291370136580128	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1094300747220398211	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1094303555038498937	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1094332940898545725	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1094342714834833418	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1094390098398826597	[946800234804166697, 1036384181690847394]
946800234804166697	1094407471705096354	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1094469544673812632	[946800234804166697, 1036384181690847394]
946800234804166697	1094655861315616925	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1094688872773980211	[946800234804166697, 1036384181690847394, 948343502507491339, 948345555090833418]
946800234804166697	1094695982148636672	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1102060219833516052	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	1102072228402700338	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1102207108050604043	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1102680471319621672	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1102699229631234098	[946800234804166697, 1036384181690847394]
946800234804166697	1102742779987243111	[946800234804166697, 1036384181690847394]
946800234804166697	1103046039574937620	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1103046081216000030	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1103199418863341641	[946800234804166697, 1036384181690847394]
946800234804166697	1103325731112628294	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1103461393841262593	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1103486799143243787	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1112120830860738600	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1116751805972500640	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1116754802899177535	[946800234804166697, 1036384181690847394]
946800234804166697	1116766297666093056	[946800234804166697, 1036384181690847394]
946800234804166697	1116864852057665546	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1116891498697461791	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1116894693767262248	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1116905968933027840	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	801204177375330336	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	801285515303190568	[946800234804166697, 1036384181690847394, 981564541982875688, 948345555090833418]
946800234804166697	806615231530532866	[946800234804166697, 1036384181690847394]
946800234804166697	807064524716769290	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	819707486147706941	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	819742564202184716	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	819966028331221002	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	820094347525095444	[946800234804166697, 1036384181690847394]
946800234804166697	820729359009972264	[946800234804166697, 1036384181690847394, 948343502507491339, 948345555090833418]
946800234804166697	820817335073243157	[946800234804166697, 1036384181690847394]
946800234804166697	820878373794480128	[946800234804166697, 1036384181690847394]
946800234804166697	821067558052429955	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	821475656650981436	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	821757692087500910	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	821800795137245224	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	821895481922813963	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	822009540068245515	[946800234804166697, 1036384181690847394]
946800234804166697	822518419403964446	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	822661011110494229	[946800234804166697, 1036384181690847394]
946800234804166697	823022539558486027	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	823607431627407371	[946800234804166697, 1036384181690847394]
946800234804166697	824075430368903189	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	824514479832301579	[946800234804166697, 1036384181690847394]
946800234804166697	824701339523219456	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	824750322189729842	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	825504953355075584	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	825588585490939984	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	843375908999790602	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	843473708735922176	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	843531905529282570	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	843577897537372212	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	843590880636305448	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	843875463720861718	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112, 948343346257076224]
946800234804166697	844106739829178418	[946800234804166697, 1036384181690847394]
946800234804166697	844261362683215882	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	844989416087093288	[946800234804166697, 1036384181690847394]
946800234804166697	845057952959430679	[946800234804166697, 1036384181690847394]
946800234804166697	845374830299316255	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	845491903788875826	[946800234804166697, 1036384181690847394]
946800234804166697	845507382557278228	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	845667005793435659	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948345555090833418, 1171527920716619806]
946800234804166697	847007311062106172	[946800234804166697, 1036384181690847394]
946800234804166697	847084710134939668	[946800234804166697, 1036384181690847394]
946800234804166697	847512620680609802	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	847545613804371992	[946800234804166697, 1036384181690847394]
946800234804166697	847642727860142101	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	847674618940751932	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	847862990770667541	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	847934285629751348	[946800234804166697, 1036384181690847394]
946800234804166697	847944988579201054	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	848340301809582103	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	848938835870089257	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	849200616520941608	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	849450041877463040	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1039581530630148218	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1040767231153422357	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1040795021428928713	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1040852113208643604	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1041098599674695740	[946800234804166697, 1036384181690847394]
946800234804166697	1041224543743770625	[946800234804166697, 1036384181690847394]
946800234804166697	1041225401722212372	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1041286252491718666	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1041425366025244673	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1041582947440013382	[946800234804166697, 1036384181690847394]
946800234804166697	1045648745427107861	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1045680403400380447	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1055341471114469376	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1055405722327846982	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1055460050291937300	[946800234804166697, 1036384181690847394]
946800234804166697	1055701104073130056	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1055880579670876281	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1056126061529813022	[946800234804166697, 1036384181690847394]
946800234804166697	1056149914805092382	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1056665938763710594	[946800234804166697, 1036384181690847394]
946800234804166697	1056708249417687180	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1056741611045929001	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	805868144185835571	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	805878345182085190	[946800234804166697, 1036384181690847394]
946800234804166697	806157352239497236	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	806205415212843029	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	806271212279562250	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	806427130233618462	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	806607315004162120	[946800234804166697, 1036384181690847394]
946800234804166697	807408287875203073	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	807439305487548416	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	807455511989321738	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	807684110566424587	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	807760201460482060	[946800234804166697, 1036384181690847394]
946800234804166697	808373317487558686	[946800234804166697, 1036384181690847394]
946800234804166697	808403542377103360	[946800234804166697, 1036384181690847394]
946800234804166697	808439626641178624	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	808498683904524308	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	808997962935435275	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	809616432555229194	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	809914976839663636	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	809936422383255554	[946800234804166697, 1036384181690847394]
946800234804166697	810239359063556136	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	810267821547323402	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	810294044341174292	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	810307204254531595	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	826185703238402059	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	826228188375679058	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	826299521876623361	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	826842188511969320	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	826938673663705128	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	827066578897731584	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	827186263194075226	[946800234804166697, 1036384181690847394]
946800234804166697	827260816365191249	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	827622910051090432	[946800234804166697, 1036384181690847394]
946800234804166697	827776701488037928	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	827927787474124821	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	828085862104432711	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	828482682655997993	[946800234804166697, 1036384181690847394]
946800234804166697	828725419355144222	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	829039935017320508	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	829071032697487361	[946800234804166697, 1036384181690847394]
946800234804166697	829292856543674368	[946800234804166697, 1036384181690847394]
946800234804166697	829525612930007112	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	830582733100154940	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	830617843384320072	[946800234804166697, 1036384181690847394]
946800234804166697	839873594900480032	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	839960211459932201	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	840031506126995458	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	840201902628012053	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	840350969094471732	[946800234804166697, 1036384181690847394]
946800234804166697	840428125317234689	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	840955107020898324	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	841325410759344148	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	841331397926715414	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	841372347378303007	[946800234804166697, 1036384181690847394]
946800234804166697	841383337247244319	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	841483460756766721	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	841656696240603156	[946800234804166697, 1036384181690847394]
946800234804166697	850025429016248361	[946800234804166697, 1036384181690847394, 948343375462019112, 948345555090833418, 1171527920716619806]
946800234804166697	850099736174133299	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	850109116168142869	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1039680332573720587	[946800234804166697, 1036384181690847394]
946800234804166697	1039702638503133244	[946800234804166697, 1036384181690847394]
946800234804166697	1039848044495118398	[946800234804166697, 1036384181690847394]
946800234804166697	1040021705743147129	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1040123719508557965	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1040188073461436456	[946800234804166697, 1036384181690847394]
946800234804166697	1040440567030628382	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1040535009087459329	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1040595740180881528	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1040601591272718517	[946800234804166697, 1036384181690847394]
946800234804166697	1054938709465763840	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112, 948343346257076224]
946800234804166697	1055044491599413309	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1055058548154966057	[946800234804166697, 1036384181690847394]
946800234804166697	1055174097291722833	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1055255628173561876	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	810530159836135484	[946800234804166697, 1036384181690847394]
946800234804166697	810754264854560788	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	810812548160553010	[946800234804166697, 1036384181690847394]
946800234804166697	811000005032673341	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	811246795460050954	[946800234804166697, 1036384181690847394]
946800234804166697	811311285034942475	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	811702629528633384	[946800234804166697, 1036384181690847394]
946800234804166697	811807151625338900	[946800234804166697, 1036384181690847394]
946800234804166697	811886684823093268	[946800234804166697, 1036384181690847394]
946800234804166697	812032888371281930	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	812330375996899379	[946800234804166697, 1036384181690847394]
946800234804166697	812413720662900836	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	812522400213368892	[946800234804166697, 1036384181690847394]
946800234804166697	812632647237894144	[946800234804166697, 1036384181690847394]
946800234804166697	812787936848248884	[946800234804166697, 1036384181690847394]
946800234804166697	815678494452482129	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	816089989171511317	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	816229163626528800	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	816519602124095539	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	816696624768090162	[946800234804166697, 1036384181690847394]
946800234804166697	816812717541294130	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	816864917952790571	[946800234804166697, 1036384181690847394]
946800234804166697	817498387883622481	[946800234804166697, 1036384181690847394]
946800234804166697	818204939691098162	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	818537939427655722	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	818640462939422730	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	818681929808216144	[946800234804166697, 1036384181690847394]
946800234804166697	818805509892079616	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	818996289306886205	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	819066733263716352	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	819098812647866408	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	819132920475287632	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	819302870942744596	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	819508807620231168	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	825603811921100822	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	825658093756874752	[946800234804166697, 1036384181690847394]
946800234804166697	825703524054597632	[946800234804166697, 1036384181690847394]
946800234804166697	825807438216691774	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	825847982351056958	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	836422561667612672	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	836632444522201089	[946800234804166697, 1036384181690847394]
946800234804166697	836761379774922752	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	836873274302136361	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	836997275984461845	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	837035330040496129	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	837108063445450753	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	837126054618726400	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	837664453646483466	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	838114386383994921	[946800234804166697, 1036384181690847394]
946800234804166697	838148322345746474	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	842404134580912188	[946800234804166697, 1036384181690847394]
946800234804166697	842874947252781066	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	843138624064978974	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	843140542551949322	[946800234804166697, 1036384181690847394]
946800234804166697	1041633321802805249	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1042017737339322408	[946800234804166697, 1036384181690847394]
946800234804166697	1073304376984219692	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1073863050605633587	[946800234804166697, 1036384181690847394]
946800234804166697	1091007994378080319	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1091014106632433794	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1091130384974094468	[946800234804166697, 1036384181690847394]
946800234804166697	1091385308567843017	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1091409681500606495	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1091483292596965427	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1091548596454817953	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1091558039183700060	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1091818241028014130	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1091839626488070174	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1094714353879617566	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1094755164939898971	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1094781379084034180	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1094815338635473006	[946800234804166697, 1036384181690847394]
946800234804166697	1094886509905182740	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1095029497448890460	[946800234804166697, 1036384181690847394]
946800234804166697	1095034425718341632	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1095092034429276220	[946800234804166697, 1036384181690847394]
946800234804166697	1095109778008715354	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	812822036342636585	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	812895485291266148	[946800234804166697, 1036384181690847394]
946800234804166697	812924160359268383	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	812939942975373333	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	813077672715616257	[946800234804166697, 1036384181690847394]
946800234804166697	813247392006668309	[946800234804166697, 1036384181690847394]
946800234804166697	813277582325841931	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	813486987210260491	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	813526242888384533	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	813560593638096897	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	814120069029560352	[946800234804166697, 1036384181690847394]
946800234804166697	814227513461964811	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	814274003581403136	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	814483278815559710	[946800234804166697, 1036384181690847394]
946800234804166697	814853938720538684	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	815311336564719616	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	815355674329743443	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	815666928902209546	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	817892050389172264	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	817950332448669716	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	817952264386904095	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	817971900134850593	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	818052487030112268	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	836342090618241024	[946800234804166697, 1036384181690847394, 948343502507491339, 948345555090833418]
946800234804166697	839135006928011325	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	839168869561663498	[946800234804166697, 1036384181690847394]
946800234804166697	839182921465725011	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	841676356302536734	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	841690530223882241	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	841778310840582154	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	841803585897758811	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	842381971845677076	[946800234804166697, 1036384181690847394]
946800234804166697	849766269896622122	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1042086118880989244	[946800234804166697, 1036384181690847394]
946800234804166697	1042197866522873907	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1042277862339784835	[946800234804166697, 1036384181690847394]
946800234804166697	1042453552427184189	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1042540871578562722	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1042574674355302402	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1042829601283518525	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1042905540172464300	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1043152516227018783	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1043261854606176277	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1043641649806446644	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1043735253753266256	[946800234804166697, 1036384181690847394]
946800234804166697	1043878301531385960	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1043965215286505502	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1044109987879862272	[946800234804166697, 1036384181690847394]
946800234804166697	1044240162441416705	[946800234804166697, 1036384181690847394]
946800234804166697	1044245111455895564	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1044326318470340689	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1044484487301566464	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1044488983780020244	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1044605147881406556	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1044765157609451581	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1044826362726338600	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1044995895252488303	[946800234804166697, 1036384181690847394]
946800234804166697	1045142997303574559	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1045218730491265054	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1045461579388424284	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1046076496269299762	[946800234804166697, 1036384181690847394]
946800234804166697	1052416535089647647	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1052488854369747005	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1052677500213407805	[946800234804166697, 1036384181690847394]
946800234804166697	1052712267403247687	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1052959864911044618	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418]
946800234804166697	1053049890499989524	[946800234804166697, 1036384181690847394]
946800234804166697	1053083390578008085	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1053092619028287558	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1053404003645538325	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1053410115442716853	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1053695036841279559	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1053739864547397723	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1053762215662080000	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	839349905469734923	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	839616902699155464	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	850084172155977728	[946800234804166697, 1036384181690847394]
946800234804166697	850990934011150346	[946800234804166697, 1036384181690847394]
946800234804166697	851073898426400769	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948345555090833418, 1171527920716619806]
946800234804166697	851370576206626836	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	851449401205194753	[946800234804166697, 1036384181690847394]
946800234804166697	851699077187895336	[946800234804166697, 1036384181690847394]
946800234804166697	851829747045892116	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	851904918893232148	[946800234804166697, 1036384181690847394]
946800234804166697	851955128499830813	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	852084097773469766	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	852103331429875712	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	852415045551521803	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	852463496989638667	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	852566483276136448	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	852578510006386709	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	852586771988480020	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	852888441531531284	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	853147993913556992	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	853255957860843540	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	853290533053399050	[946800234804166697, 1036384181690847394]
946800234804166697	853562842065272863	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	853621156825661440	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	853819101621518366	[946800234804166697, 1036384181690847394]
946800234804166697	853829027186081792	[946800234804166697, 1036384181690847394]
946800234804166697	854038550525640704	[946800234804166697, 1036384181690847394]
946800234804166697	854536608093831168	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	854802057588768768	[946800234804166697, 1036384181690847394]
946800234804166697	855096190806786068	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	855252670176952341	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	855344588540608512	[946800234804166697, 1036384181690847394]
946800234804166697	855530492529868810	[946800234804166697, 1036384181690847394]
946800234804166697	855853851277131796	[946800234804166697, 1036384181690847394]
946800234804166697	855902023216005130	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	856417106060378123	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	856524072368472075	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	856786793126821929	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	857038344143372299	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	857627385607356436	[946800234804166697, 1036384181690847394]
946800234804166697	857728305212948481	[946800234804166697, 1036384181690847394]
946800234804166697	857869291395481610	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	858139312680206346	[946800234804166697, 1036384181690847394]
946800234804166697	858706215729889341	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	858825505905049620	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	859190755721347084	[946800234804166697, 1036384181690847394]
946800234804166697	859330321836933130	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	859495875717890089	[946800234804166697, 1036384181690847394]
946800234804166697	859786165808791553	[946800234804166697, 1036384181690847394]
946800234804166697	859970787325640714	[946800234804166697, 1036384181690847394]
946800234804166697	860444828118155272	[946800234804166697, 1036384181690847394]
946800234804166697	860764325445369866	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	860806802085511200	[946800234804166697, 1036384181690847394]
946800234804166697	860927067868758036	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	861357058250637312	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	862137361291149322	[946800234804166697, 1036384181690847394]
946800234804166697	862344287039127572	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	863171471534850059	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	863270868741521428	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	863338016587776000	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	863880737078116362	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	863930762826219563	[946800234804166697, 1036384181690847394]
946800234804166697	864006215352057876	[946800234804166697, 1036384181690847394]
946800234804166697	864025887959679006	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	864144643604086824	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	864188603880833076	[946800234804166697, 1036384181690847394]
946800234804166697	864454336951091240	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	864740089099190302	[946800234804166697, 1036384181690847394]
946800234804166697	864895252983578665	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	864945621260959784	[946800234804166697, 1036384181690847394]
946800234804166697	864982794991960075	[946800234804166697, 1036384181690847394]
946800234804166697	865417937892802601	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	866437552344662046	[946800234804166697, 1036384181690847394]
946800234804166697	866491609619890216	[946800234804166697, 1036384181690847394]
946800234804166697	866514496306675742	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	867090738041978880	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	867551258846691388	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	867615906372780055	[946800234804166697, 1036384181690847394]
946800234804166697	867732486053953586	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	867932331623714816	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	868061768478511145	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	868136161015640114	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	868463098154074132	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	885616599489450026	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	885661703914811393	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	885879458203041802	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	885899984782897153	[946800234804166697, 1036384181690847394]
946800234804166697	885969508869738537	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	886226496501473290	[946800234804166697, 1036384181690847394]
946800234804166697	886408205931003937	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	886509603691577345	[946800234804166697, 1036384181690847394]
946800234804166697	886545097909481472	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	886792410317860904	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	887169422870073404	[946800234804166697, 1036384181690847394]
946800234804166697	887346654343229451	[946800234804166697, 1036384181690847394]
946800234804166697	887357177482862592	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	887498981838577674	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	887723065436430417	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112, 948345555090833418, 1171527920716619806]
946800234804166697	887737070666268722	[946800234804166697, 1036384181690847394]
946800234804166697	887879153175658507	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	887911798093783063	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	888012988857085982	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418]
946800234804166697	888178877996883968	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	888188734565146625	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	915400200397422682	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	915696603719954502	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	915756466827325460	[946800234804166697, 1036384181690847394]
946800234804166697	916426463039877181	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	916965620489289759	[946800234804166697, 1036384181690847394]
946800234804166697	917312147665592361	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	917415613020926012	[946800234804166697, 1036384181690847394]
946800234804166697	917546789933035540	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	917693508708601898	[946800234804166697, 1036384181690847394]
946800234804166697	917896433020059708	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	917911949570883645	[946800234804166697, 1036384181690847394, 948343502507491339, 1171527920716619806]
946800234804166697	917915421276012585	[946800234804166697, 1036384181690847394]
946800234804166697	918036265478291507	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	918123115308023818	[946800234804166697, 1036384181690847394]
946800234804166697	918225830306525216	[946800234804166697, 1036384181690847394]
946800234804166697	918314983857725530	[946800234804166697, 1036384181690847394]
946800234804166697	918430783658684426	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	918530137090322472	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	918788787432214539	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	918854650902482964	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	924838602083565598	[946800234804166697, 1036384181690847394]
946800234804166697	924956499762089994	[946800234804166697, 1036384181690847394]
946800234804166697	925013639382048819	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	925047877070360637	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	925065769174319106	[946800234804166697, 1036384181690847394]
946800234804166697	925531045875576893	[946800234804166697, 1036384181690847394]
946800234804166697	925650334104305726	[946800234804166697, 1036384181690847394]
946800234804166697	925795892634714112	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	925928234095353926	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	925964810804408320	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	926163198531485757	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	926163489641353248	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	926924147550990416	[946800234804166697, 1036384181690847394]
946800234804166697	926961393146687538	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	926974364128268349	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	927229337567101018	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	927257876156801044	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	927425329751023676	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	927544033314746408	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1046195627610099772	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1046261462269693982	[946800234804166697, 1036384181690847394]
946800234804166697	1046456492032802866	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1046543914431160420	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 1171527920716619806]
946800234804166697	1046572809234677820	[946800234804166697, 1036384181690847394]
946800234804166697	1046955987837390868	[946800234804166697, 1036384181690847394]
946800234804166697	1047222793722404955	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1047263460280512602	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1047314759462178958	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	868343463052206100	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	918870143533203456	[946800234804166697, 1036384181690847394]
946800234804166697	919017228089823274	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	919186818262523956	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	919348799967748096	[946800234804166697, 1036384181690847394]
946800234804166697	919583005352275978	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	919656476136603699	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	920107702489841665	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	920302808891261031	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	920533129226227772	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	921479055080054834	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	941136709846990918	[946800234804166697, 1036384181690847394]
946800234804166697	941252681492738058	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	941413314007826483	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	941533571590537236	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	942124775566893147	[946800234804166697, 1036384181690847394]
946800234804166697	942166831379132447	[946800234804166697, 1036384181690847394]
946800234804166697	942326824824885258	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	942483690062233710	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	942548951159164939	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	942559121666875502	[946800234804166697, 1036384181690847394]
946800234804166697	942729168255336458	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	942890573398945872	[946800234804166697, 1036384181690847394]
946800234804166697	942919878036299807	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	942962135930134588	[946800234804166697, 1036384181690847394]
946800234804166697	943193266009042984	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	943638431005827113	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	944192543787192332	[946800234804166697, 1036384181690847394]
946800234804166697	944318751355068467	[946800234804166697, 1036384181690847394]
946800234804166697	944380345942413384	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	944510347962896465	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	944813790539710495	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	945033059068178512	[946800234804166697, 1036384181690847394]
946800234804166697	945118267691896853	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	945158292991254548	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	945508387087589376	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	945535229840465961	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	945700066658762774	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	945748381895118898	[946800234804166697, 1036384181690847394]
946800234804166697	945819595497963611	[946800234804166697, 1036384181690847394]
946800234804166697	945885750099062795	[946800234804166697, 1036384181690847394]
946800234804166697	946009042982154280	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	946051904348229652	[946800234804166697, 1036384181690847394]
946800234804166697	946159102743167037	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	946163636408287232	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	946391580712005683	[946800234804166697, 1036384181690847394, 948343375462019112, 948343346257076224, 1171527920716619806]
946800234804166697	946939612645982208	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	947042917703381013	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	947199295780700242	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	947241413786103859	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	947295478305939486	[946800234804166697, 1036384181690847394]
946800234804166697	950889688976228363	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	950903964432482355	[946800234804166697, 1036384181690847394]
946800234804166697	951061488544665630	[946800234804166697, 1036384181690847394]
946800234804166697	951665412595126293	[946800234804166697, 1036384181690847394]
946800234804166697	951909427315900426	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	952068940144721971	[946800234804166697, 1036384181690847394, 948343375462019112, 948345555090833418]
946800234804166697	952287560246374560	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	952376511476936775	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	952516994509467698	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	952642890046242897	[946800234804166697, 1036384181690847394]
946800234804166697	952643971530760222	[946800234804166697, 1036384181690847394]
946800234804166697	952990448731979847	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	953021405870587914	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	953050153269477446	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1047514353307500624	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1047636301324759070	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1048234120133750814	[946800234804166697, 1036384181690847394, 948343488594972724, 948343346257076224]
946800234804166697	1048272738072154112	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1048333092525449347	[946800234804166697, 1036384181690847394]
946800234804166697	1048485204169334825	[946800234804166697, 1036384181690847394]
946800234804166697	1048786691156099092	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1049003670714470452	[946800234804166697, 1036384181690847394]
946800234804166697	1049062646164504627	[946800234804166697, 1036384181690847394]
946800234804166697	1095424082511659008	[946800234804166697, 1036384181690847394]
946800234804166697	868369018376056842	[946800234804166697, 1036384181690847394]
946800234804166697	868608202294575164	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	868858102777253889	[946800234804166697, 1036384181690847394]
946800234804166697	869404879788048394	[946800234804166697, 1036384181690847394]
946800234804166697	869585283522383932	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	869654883840716890	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	870123727738781756	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	870270090942242877	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	879820787828285500	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	880502643418628126	[946800234804166697, 1036384181690847394]
946800234804166697	881160387159007262	[946800234804166697, 1036384181690847394]
946800234804166697	881314534718074880	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	889650460510797864	[946800234804166697, 1036384181690847394]
946800234804166697	889960159290482709	[946800234804166697, 1036384181690847394]
946800234804166697	890037081756291103	[946800234804166697, 1036384181690847394, 948343488594972724, 948343346257076224]
946800234804166697	890456165408972832	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	892757873891889192	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	892966584795156531	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	893029629059796993	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	893123443015446569	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	893154225884921856	[946800234804166697, 1036384181690847394]
946800234804166697	893427850240221205	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	893460952735973446	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	893932200058310676	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	894049798636851250	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	894628866361024572	[946800234804166697, 1036384181690847394]
946800234804166697	894681176197967882	[946800234804166697, 1036384181690847394]
946800234804166697	895052086679584808	[946800234804166697, 1036384181690847394]
946800234804166697	895122142792933416	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	895485667029704705	[946800234804166697, 1036384181690847394]
946800234804166697	895559213340819476	[946800234804166697, 1036384181690847394]
946800234804166697	895634367697784832	[946800234804166697, 1036384181690847394]
946800234804166697	895716083561029692	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	895809491478646828	[946800234804166697, 1036384181690847394]
946800234804166697	896140853523927040	[946800234804166697, 1036384181690847394]
946800234804166697	896146062287454279	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	896413528087478283	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	896436157678780466	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	896454406285975563	[946800234804166697, 1036384181690847394]
946800234804166697	896494741301108828	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	896896185590247425	[946800234804166697, 1036384181690847394]
946800234804166697	897465899479617616	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	897688922476412928	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	897702988108398672	[946800234804166697, 1036384181690847394]
946800234804166697	898214114441195590	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	898727638825312326	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	898921609220460586	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	898947488805961739	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	899114125035175946	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	899236826747916308	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	899300490704203796	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	899397404292432024	[946800234804166697, 1036384181690847394]
946800234804166697	899413581630689311	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	899856588096028672	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	899986355172540416	[946800234804166697, 1036384181690847394]
946800234804166697	900128337886863390	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	900733620610818109	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	900856871588597850	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	900881261416054824	[946800234804166697, 1036384181690847394]
946800234804166697	901157157318295582	[946800234804166697, 1036384181690847394]
946800234804166697	901407516074868736	[946800234804166697, 1036384181690847394]
946800234804166697	901546805026750474	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	902018449205755964	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	902057124652277800	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	902123797375754271	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	902446245786845205	[946800234804166697, 1036384181690847394]
946800234804166697	936780299591892992	[946800234804166697, 1036384181690847394]
946800234804166697	936790759619842059	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	936794155370287105	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	937132218298564629	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	937381541649215578	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	937405957313540116	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	937504171903582208	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	937781833301647442	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	937848581514223616	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	937868275449217034	[946800234804166697, 1036384181690847394]
946800234804166697	938129722951471116	[946800234804166697, 1036384181690847394]
946800234804166697	938427735511011339	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	870795486997667921	[946800234804166697, 1036384181690847394]
946800234804166697	870945006029000755	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	870979540804075530	[946800234804166697, 1036384181690847394]
946800234804166697	871036694453944330	[946800234804166697, 1036384181690847394]
946800234804166697	871202593140002837	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	871635500992172072	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418]
946800234804166697	871876418722754561	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	871932595225624617	[946800234804166697, 1036384181690847394]
946800234804166697	872260391068139601	[946800234804166697, 1036384181690847394]
946800234804166697	872269647154663424	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	872543408810512416	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	872639747238031402	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	872708626459004968	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	872787620185378866	[946800234804166697, 1036384181690847394]
946800234804166697	873307513951518740	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	873727574709256284	[946800234804166697, 1036384181690847394]
946800234804166697	874093139906953258	[946800234804166697, 1036384181690847394]
946800234804166697	874672707600531476	[946800234804166697, 1036384181690847394]
946800234804166697	874853984718975086	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	875120841413771285	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	875303467219042324	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	875330232465371177	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	875687246731284530	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	875702636253421638	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	875757355990659123	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	875865301311438868	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	875911566837563422	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	876136427908386916	[946800234804166697, 1036384181690847394]
946800234804166697	876201488714711050	[946800234804166697, 1036384181690847394]
946800234804166697	876300146835607582	[946800234804166697, 1036384181690847394]
946800234804166697	876985901211852831	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	877055320894099466	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	877466123090657300	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	878008249566236742	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	878104170849263647	[946800234804166697, 1036384181690847394]
946800234804166697	878308523224748082	[946800234804166697, 1036384181690847394]
946800234804166697	878403035662016574	[946800234804166697, 1036384181690847394]
946800234804166697	878437045368918077	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	878461289071005707	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	878950955649998882	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	879236436702953533	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	879499620470906900	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	879819962238255114	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	912313511902859284	[946800234804166697, 1036384181690847394]
946800234804166697	912334635550277733	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	912387576223121458	[946800234804166697, 1036384181690847394]
946800234804166697	912391728709918731	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	912451825993662525	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	912530489804455956	[946800234804166697, 1036384181690847394]
946800234804166697	912583625478901800	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	913086450197733417	[946800234804166697, 1036384181690847394]
946800234804166697	913418870637854720	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	928292755044716605	[946800234804166697, 1036384181690847394]
946800234804166697	928315412716863548	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	928376449893822564	[946800234804166697, 1036384181690847394]
946800234804166697	928531633982808074	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	928599338337316874	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	928600491259199539	[946800234804166697, 1036384181690847394]
946800234804166697	928834512908058644	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	950613951132078090	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	953306978300612629	[946800234804166697, 1036384181690847394]
946800234804166697	953475823980126258	[946800234804166697, 1036384181690847394]
946800234804166697	953581963321688064	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	953772685660397608	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	953797244656689222	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948345555090833418]
946800234804166697	954064787153760307	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	954530712751591484	[946800234804166697, 1036384181690847394]
946800234804166697	954597194835562577	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	954676709398020146	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	954837907494039552	[946800234804166697, 1036384181690847394]
946800234804166697	955188945153576990	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	955191203731750972	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	955221643024793671	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	955284312192864306	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	955505230940868709	[946800234804166697, 1036384181690847394]
946800234804166697	955661933485391912	[946800234804166697, 1036384181690847394]
946800234804166697	881398172038074468	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	882087565388312646	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	882106148457697321	[946800234804166697, 1036384181690847394]
946800234804166697	882115857696825446	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	882410852676931594	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	882655619478331463	[946800234804166697, 1036384181690847394]
946800234804166697	882709537340153856	[946800234804166697, 1036384181690847394]
946800234804166697	883126662601007126	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	883133865588293663	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	883267255759163392	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	883414973609574470	[946800234804166697, 1036384181690847394]
946800234804166697	883711025973715014	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	884106949455659008	[946800234804166697, 1036384181690847394]
946800234804166697	884184816101240872	[946800234804166697, 1036384181690847394]
946800234804166697	884949811109957643	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	885123790214934540	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	885570029939204097	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	888259937388601366	[946800234804166697, 1036384181690847394]
946800234804166697	888529104348004394	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	888742700491345930	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	888909096470872104	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	888987659974873088	[946800234804166697, 1036384181690847394]
946800234804166697	889190435329802270	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	889549411246538753	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	890894333576900659	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	902752332062801961	[946800234804166697, 1036384181690847394]
946800234804166697	902929564966223883	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	903248557912506389	[946800234804166697, 1036384181690847394]
946800234804166697	903249909770223638	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	903645186473721906	[946800234804166697, 1036384181690847394]
946800234804166697	903712569972383774	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	903719000280797224	[946800234804166697, 1036384181690847394]
946800234804166697	903727867203031140	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	903855262346117141	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	904322440635752460	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	904358240257732628	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	904372084212371466	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	904457536969773137	[946800234804166697, 1036384181690847394]
946800234804166697	904752945227255838	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	904936313839566888	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	905074482559987722	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	905746482659999754	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	905838366954766417	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	905949878545436692	[946800234804166697, 1036384181690847394]
946800234804166697	906091348866781194	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	906284868319739935	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	906293219027984464	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	906496061332389918	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	906582874340331550	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	906722737823817749	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	907146617730269184	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	907222960715202581	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	907299707053826069	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	907369741973323776	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	907379557986881576	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	908401752678760579	[946800234804166697, 1036384181690847394]
946800234804166697	908582901673762837	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	908756718303997972	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	908943327913730060	[946800234804166697, 1036384181690847394]
946800234804166697	956678343246360678	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	956980930235494410	[946800234804166697, 1036384181690847394]
946800234804166697	1049128872593068162	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1049129640842756156	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1049149879441702933	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1049821063917346876	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1049910980513112135	[946800234804166697, 1036384181690847394]
946800234804166697	1050026649338531910	[946800234804166697, 1036384181690847394]
946800234804166697	1050155993734054010	[946800234804166697, 1036384181690847394]
946800234804166697	1050943621773402244	[946800234804166697, 1036384181690847394]
946800234804166697	1051251243953168475	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1051510459913732126	[946800234804166697, 1036384181690847394]
946800234804166697	1051720078258864208	[946800234804166697, 1036384181690847394]
946800234804166697	1051768262553243728	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1054471725691183174	[946800234804166697, 1036384181690847394]
946800234804166697	1054561693767839805	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1054583886996324362	[946800234804166697, 1036384181690847394]
946800234804166697	890964103554826290	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	891071934882799616	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	891365252279717941	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	891488812281262090	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	891674475798622228	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	891786820843606068	[946800234804166697, 1036384181690847394]
946800234804166697	891984180068618273	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	891999506030297139	[946800234804166697, 1036384181690847394]
946800234804166697	892005726455746571	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	892014169874898975	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	892034973702430765	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	892715102330052658	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	909116715038806027	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	909283409304629299	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	909614337394618438	[946800234804166697, 1036384181690847394]
946800234804166697	911498557742260275	[946800234804166697, 1036384181690847394]
946800234804166697	911830845667553341	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	911972675927281704	[946800234804166697, 1036384181690847394]
946800234804166697	912021887251546122	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	912080896721580082	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	913953542732124231	[946800234804166697, 1036384181690847394]
946800234804166697	913984547576746014	[946800234804166697, 1036384181690847394]
946800234804166697	914159115033514015	[946800234804166697, 1036384181690847394]
946800234804166697	914282482365497394	[946800234804166697, 1036384181690847394]
946800234804166697	914626304958169191	[946800234804166697, 1036384181690847394]
946800234804166697	914709176813510686	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	915045112097173591	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	915296559564988416	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	915349117696364554	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	921583074016362547	[946800234804166697, 1036384181690847394]
946800234804166697	921696158487814174	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	921754130391904276	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	921756937870245959	[946800234804166697, 1036384181690847394]
946800234804166697	921769906125549609	[946800234804166697, 1036384181690847394]
946800234804166697	921904319530418256	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	921915352160534538	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	921990431468843008	[946800234804166697, 1036384181690847394]
946800234804166697	922597438559256636	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	922705007474794536	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	922838366679076884	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	922967322027773983	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	923152374342758450	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	923688666386280488	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	923821003224789042	[946800234804166697, 1036384181690847394, 948343375462019112, 1171527920716619806]
946800234804166697	924211419975675934	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	924305163592814592	[946800234804166697, 1036384181690847394, 948343502507491339, 948343375462019112, 948345555090833418]
946800234804166697	924313410026479636	[946800234804166697, 1036384181690847394]
946800234804166697	924330506332553257	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	924339171361980457	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	924390287705526302	[946800234804166697, 1036384181690847394]
946800234804166697	924513346479345675	[946800234804166697, 1036384181690847394]
946800234804166697	924523517305819176	[946800234804166697, 1036384181690847394]
946800234804166697	924527029897031690	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	924528148530487296	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	924832851432722522	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	927562426822561853	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	927683534603317298	[946800234804166697, 1036384181690847394]
946800234804166697	927764435270000701	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	927914265959080008	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	927915723366490174	[946800234804166697, 1036384181690847394]
946800234804166697	927950997316337694	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	927968000060059700	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	928126852558618624	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	928227008842989568	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	928260648222199810	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948345555090833418]
946800234804166697	928915758950531102	[946800234804166697, 1036384181690847394, 948343502507491339, 948343375462019112, 948345555090833418]
946800234804166697	929095852553809941	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	929155397137367111	[946800234804166697, 1036384181690847394, 981564541982875688, 948343488594972724]
946800234804166697	929158146335866931	[946800234804166697, 1036384181690847394]
946800234804166697	929300412379586590	[946800234804166697, 1036384181690847394]
946800234804166697	929322837850849301	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	929444234581405758	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	929490164064075796	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	929755830885167164	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	929764871111843871	[946800234804166697, 1036384181690847394]
946800234804166697	929768706555383838	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	929830473318932570	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	929840512352006174	[946800234804166697, 1036384181690847394]
946800234804166697	929854567171129385	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	930403409134247956	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	930479749640368158	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	930633163905040425	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	931040750454583366	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418, 1171527920716619806]
946800234804166697	931249511878234152	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	931296436786720848	[946800234804166697, 1036384181690847394]
946800234804166697	931816864831660112	[946800234804166697, 1036384181690847394]
946800234804166697	931915704712712202	[946800234804166697, 1036384181690847394, 948343375462019112, 948345555090833418]
946800234804166697	931996046446440468	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	932112286682853386	[946800234804166697, 1036384181690847394]
946800234804166697	932125063757590548	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	932303518356889661	[946800234804166697, 1036384181690847394]
946800234804166697	932712073790636042	[946800234804166697, 1036384181690847394]
946800234804166697	932718317431586858	[946800234804166697, 1036384181690847394]
946800234804166697	932741157958594561	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	932788741599289365	[946800234804166697, 1036384181690847394]
946800234804166697	932846938611662948	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1053999213278666762	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1054018629517189181	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1054069658887659641	[946800234804166697, 1036384181690847394]
946800234804166697	1054121755196801046	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1054222879555850371	[946800234804166697, 1036384181690847394]
946800234804166697	1054263586949701632	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1054329990570852362	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1054338594912870442	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1054408559280017418	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1065821143677796373	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1070503817847779358	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1070734994630250556	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1070767696498675764	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1070913030558322728	[946800234804166697, 1036384181690847394]
946800234804166697	1071041558956224532	[946800234804166697, 1036384181690847394]
946800234804166697	1071215564850212934	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1071287128144760923	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1071318310353903718	[946800234804166697, 1036384181690847394]
946800234804166697	1071322144832761887	[946800234804166697, 1036384181690847394]
946800234804166697	1071334672187015268	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1071467350689337415	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1071480501933723778	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1071488016671068311	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1071518237596078111	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1071557599411060907	[946800234804166697, 1036384181690847394]
946800234804166697	1071564969449099435	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1071593572069031936	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1071653476821647410	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1071689218738368532	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1071828908862885968	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1071843931177881702	[946800234804166697, 1036384181690847394]
946800234804166697	1072347465044467874	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1073805670136172706	[946800234804166697, 1036384181690847394]
946800234804166697	1074038872838774784	[946800234804166697, 1036384181690847394]
946800234804166697	1074247605598552125	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1074295107697770497	[946800234804166697, 1036384181690847394]
946800234804166697	1074303130222727349	[946800234804166697, 1036384181690847394]
946800234804166697	1074336339950051358	[946800234804166697, 1036384181690847394]
946800234804166697	1074344353163657297	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1074402101972709387	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1074475610937770054	[946800234804166697, 1036384181690847394]
946800234804166697	1074491828683939850	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1074501503353638935	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1074543046605164735	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1074642863155073035	[946800234804166697, 1036384181690847394]
946800234804166697	1075081892723953674	[946800234804166697, 1036384181690847394]
946800234804166697	1075178029233492119	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1075201255800061952	[946800234804166697, 1036384181690847394, 948343375462019112, 1171527920716619806]
946800234804166697	1075996933107236976	[946800234804166697, 1036384181690847394]
946800234804166697	1076055504222171207	[946800234804166697, 1036384181690847394, 948343488594972724, 948343346257076224, 1171527920716619806]
946800234804166697	1076093444583333908	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1076151056209293352	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1076255149317693561	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1076308807040368672	[946800234804166697, 1036384181690847394]
946800234804166697	933075737714507806	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	933214549488828426	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	933589049569054770	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	933947348130856991	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	933949538887147530	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	934153812552327228	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	934248849558622238	[946800234804166697, 1036384181690847394]
946800234804166697	934422125454983169	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	934551113217224715	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	934884041684054048	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	935178977356705822	[946800234804166697, 1036384181690847394]
946800234804166697	935253452160905266	[946800234804166697, 1036384181690847394]
946800234804166697	935497004384149514	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	935579549134110720	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	935633629764280430	[946800234804166697, 1036384181690847394]
946800234804166697	935742386796105738	[946800234804166697, 1036384181690847394]
946800234804166697	935767109093445643	[946800234804166697, 1036384181690847394]
946800234804166697	936013501904863232	[946800234804166697, 1036384181690847394, 981564541982875688, 948345555090833418]
946800234804166697	936035292396281926	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	936205350917533736	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	936348813654892544	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	936505366689218591	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	936754030678536225	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1054862050532278382	[946800234804166697, 1036384181690847394]
946800234804166697	1054865215361122364	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1054909584118124635	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1071855450678624347	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1071882058592428112	[946800234804166697, 1036384181690847394]
946800234804166697	1071933788059344999	[946800234804166697, 1036384181690847394]
946800234804166697	1072154707453296751	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1073218864751587448	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1095450658984964106	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1095848450849001483	[946800234804166697, 1036384181690847394]
946800234804166697	1095860808178749500	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1095865232338989076	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1095974453286019083	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1112143838878896148	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1112157717474320404	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1112243422003208296	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1112531788879896607	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	1112560963829387314	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1112589144200319126	[946800234804166697, 1036384181690847394]
946800234804166697	1112589473872609370	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1112857742223351939	[946800234804166697, 1036384181690847394, 981564541982875688, 948343488594972724]
946800234804166697	1112859158610448525	[946800234804166697, 1036384181690847394]
946800234804166697	1112862366107971664	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1112893054651748363	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1112944677709164654	[946800234804166697, 1036384181690847394]
946800234804166697	1112966416019234867	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1113001621325099068	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1113123401008164956	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1113153210560024648	[946800234804166697, 1036384181690847394]
946800234804166697	1113154966648016906	[946800234804166697, 1036384181690847394]
946800234804166697	1113282714175557673	[946800234804166697, 1036384181690847394]
946800234804166697	1113525575877926992	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1113547386850115666	[946800234804166697, 1036384181690847394]
946800234804166697	1113564469470167080	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1113571780687302781	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1113574278076579912	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1113596421250240553	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1113680393078571030	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1113830139801907241	[946800234804166697, 1036384181690847394, 981564541982875688, 948343488594972724]
946800234804166697	1113918345385885927	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 1171527920716619806]
946800234804166697	1113938663731114055	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1113990335060787261	[946800234804166697, 1036384181690847394]
946800234804166697	1114085513608052737	[946800234804166697, 1036384181690847394]
946800234804166697	1114128589961560134	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1114393504437764138	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1114409384416653362	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1114427638942011472	[946800234804166697, 1036384181690847394, 948343346257076224, 1171527920716619806]
946800234804166697	1114572146140778616	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1114687841251905566	[946800234804166697, 1036384181690847394]
946800234804166697	1114860771919278143	[946800234804166697, 1036384181690847394]
946800234804166697	1114884408172883968	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1114886060120473711	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	938447820598419516	[946800234804166697, 1036384181690847394]
946800234804166697	938477768268714005	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	938857918902718594	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	938892698121822258	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	938973071765819422	[946800234804166697, 1036384181690847394]
946800234804166697	939024469379407874	[946800234804166697, 1036384181690847394]
946800234804166697	939158788575985724	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	939258184311386183	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	939547112813785100	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	939553709061468260	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	939554302781964389	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	939562496321265694	[946800234804166697, 1036384181690847394]
946800234804166697	939607704618557441	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	939721288145063966	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	939728219702186064	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	939772878252019733	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	939785318138249217	[946800234804166697, 1036384181690847394]
946800234804166697	939876400293376041	[946800234804166697, 1036384181690847394]
946800234804166697	939936443944546305	[946800234804166697, 1036384181690847394]
946800234804166697	939955202973368340	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	939964613372567593	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	940268005999386664	[946800234804166697, 1036384181690847394]
946800234804166697	940355563731189790	[946800234804166697, 1036384181690847394]
946800234804166697	940393184167596032	[946800234804166697, 1036384181690847394]
946800234804166697	940660705747689543	[946800234804166697, 1036384181690847394]
946800234804166697	940694960989175868	[946800234804166697, 1036384181690847394]
946800234804166697	940925001077501984	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	947296243103698955	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	947390930200166432	[946800234804166697, 1036384181690847394]
946800234804166697	947423980606881862	[946800234804166697, 1036384181690847394]
946800234804166697	947498440408059924	[946800234804166697, 1036384181690847394]
946800234804166697	948002512533868575	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	948164141623943189	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	948268316781334538	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	948417567901483009	[946800234804166697, 1036384181690847394]
946800234804166697	948596554506309762	[946800234804166697, 1036384181690847394]
946800234804166697	948888261902876692	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	949048932800036884	[946800234804166697, 1036384181690847394]
946800234804166697	949294869665431554	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	949413538496126996	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	949505666383482972	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	949683876303888444	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	950135632888483870	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	950350471825076304	[946800234804166697, 1036384181690847394]
946800234804166697	950552818773819442	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1055316346247848038	[946800234804166697, 1036384181690847394]
946800234804166697	1059498461302624396	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1059649737088839682	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	1059701586240213043	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1059875907004796990	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1059989451020967978	[946800234804166697, 1036384181690847394]
946800234804166697	1059993311437389884	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	1060036123105177610	[946800234804166697, 1036384181690847394]
946800234804166697	1060172686594158643	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1060177613659840553	[946800234804166697, 1036384181690847394]
946800234804166697	1060263480210509934	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1060304588332335176	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1060446147455496244	[946800234804166697, 1036384181690847394, 948343375462019112, 948345555090833418]
946800234804166697	1060550284276940911	[946800234804166697, 1036384181690847394]
946800234804166697	1060628153447493775	[946800234804166697, 1036384181690847394]
946800234804166697	1060635607375806505	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1060745705779646474	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1060951802423545906	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1061005950670082138	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1061042593913389088	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1061131689327345665	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1061377617485381673	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1061453966967328858	[946800234804166697, 1036384181690847394]
946800234804166697	1061474905532665888	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1061513142682800149	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1061557975652765717	[946800234804166697, 1036384181690847394]
946800234804166697	1061649823427739678	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1061686239692070922	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1061708159028297779	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1061720074102243368	[946800234804166697, 1036384181690847394]
946800234804166697	1061828589571551274	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1061837482943074385	[946800234804166697, 1036384181690847394]
946800234804166697	955689191193342002	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	955768127042498652	[946800234804166697, 1036384181690847394]
946800234804166697	955944021820321823	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	957738350868062278	[946800234804166697, 1036384181690847394]
946800234804166697	957829514975662101	[946800234804166697, 1036384181690847394]
946800234804166697	957880605062856724	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	958027537085263923	[946800234804166697, 1036384181690847394]
946800234804166697	958098712066916432	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1056779500714729483	[946800234804166697, 1036384181690847394]
946800234804166697	1056808804794253452	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1056930916435497000	[946800234804166697, 1036384181690847394]
946800234804166697	1057140505919639592	[946800234804166697, 1036384181690847394]
946800234804166697	1057198916317225002	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1057377998342467644	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1057516394926850070	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1057521363516133467	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1057635937686933515	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1057686395717697546	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1057823263234981938	[946800234804166697, 1036384181690847394]
946800234804166697	1057851386416611349	[946800234804166697, 1036384181690847394]
946800234804166697	1057874403200880831	[946800234804166697, 1036384181690847394]
946800234804166697	1057885456542470194	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1057992076341559306	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1058138150108659872	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1058139078492688455	[946800234804166697, 1036384181690847394]
946800234804166697	1058143973279023235	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1058164431038722159	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1058175350196150284	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1058473128310865951	[946800234804166697, 1036384181690847394]
946800234804166697	1058554413486198834	[946800234804166697, 1036384181690847394, 948343375462019112, 948345555090833418]
946800234804166697	1058651337757315082	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1058719456999772210	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1058899838147768350	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1058920846456012910	[946800234804166697, 1036384181690847394]
946800234804166697	1059103298940063834	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1059187644023713933	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1059193513662750820	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1059225790006431804	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1065992592380137503	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1066045246217125888	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1066184785292173362	[946800234804166697, 1036384181690847394]
946800234804166697	1066218998343159848	[946800234804166697, 1036384181690847394]
946800234804166697	1066496065429323847	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1066608235781554237	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1066662683996336220	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1066722415335444523	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1066825844678463528	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1066889204015058959	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1066926261806567515	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1067033165371289641	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1067182091986550855	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1067400293249208371	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1067414501919563847	[946800234804166697, 1036384181690847394]
946800234804166697	1067457426640621689	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1067664078895595521	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1067702744682598441	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1067821563740696586	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1067955712451424337	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1067957724849131560	[946800234804166697, 1036384181690847394]
946800234804166697	1068127535797370920	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112]
946800234804166697	1068558603751010365	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1068573621833965739	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1068664795047395399	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1068684886346563665	[946800234804166697, 1036384181690847394]
946800234804166697	1068686527028285510	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1068718959353921626	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1068720738040815786	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1068753671925534770	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1069045000421253231	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1069052633584771183	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1069228919217201223	[946800234804166697, 1036384181690847394]
946800234804166697	1069345899211403275	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1069556409995362305	[946800234804166697, 1036384181690847394]
946800234804166697	1073187235140214794	[946800234804166697, 1036384181690847394]
946800234804166697	1073430344814047252	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1076747113020526704	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1076892775909429278	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1156279728932659311	[946800234804166697, 1036384181690847394]
946800234804166697	957013850966876230	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	957027293023334521	[946800234804166697, 1036384181690847394]
946800234804166697	1059455048062615553	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1063950100658917527	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1063952835777147040	[946800234804166697, 1036384181690847394]
946800234804166697	1064243318072025140	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1064297898222829568	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1064422719627735110	[946800234804166697, 1036384181690847394]
946800234804166697	1064442183362547752	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1064481142444671018	[946800234804166697, 1036384181690847394]
946800234804166697	1064491065408749569	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1073803310966001694	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343346257076224]
946800234804166697	1096029698410172588	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1096156970265882734	[946800234804166697, 1036384181690847394]
946800234804166697	1096245757838901352	[946800234804166697, 1036384181690847394]
946800234804166697	1096251316575154256	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1096463439259504831	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1103491051446087711	[946800234804166697, 1036384181690847394]
946800234804166697	1103549779809665034	[946800234804166697, 1036384181690847394]
946800234804166697	1103766669165334598	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1103783794164629645	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1103875359818121337	[946800234804166697, 1036384181690847394]
946800234804166697	1104015101775847494	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1104039121309138987	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1104046163386171543	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1104193082225868810	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1104543036056281099	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1104565946363957350	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1104696292623515648	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1104705243192774717	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1104719528946040853	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1104755473393131621	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 1171527920716619806]
946800234804166697	1104840116909899887	[946800234804166697, 1036384181690847394]
946800234804166697	1104948185148960848	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1105084983065985105	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1105397813128478762	[946800234804166697, 1036384181690847394]
946800234804166697	1105513677261652019	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1105667622030295131	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1105817210573815840	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1106346526621581422	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1106662162455330899	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1106804204091220019	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1106937255819489280	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1107100150440140882	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1107134444197916702	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1107166942604836940	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1107393197346390166	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1107442514736205915	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1107476973971832872	[946800234804166697, 1036384181690847394, 948343502507491339, 948345555090833418]
946800234804166697	1107614204938170458	[946800234804166697, 1036384181690847394]
946800234804166697	1107635949296427049	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1107678939729625270	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1107807824987295814	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1107885038114189342	[946800234804166697, 1036384181690847394]
946800234804166697	1108464205327241217	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1108508971930767370	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1108548520492929044	[946800234804166697, 1036384181690847394]
946800234804166697	1108576765976248381	[946800234804166697, 1036384181690847394]
946800234804166697	1108629049141633035	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1108744589046710294	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1108754729384808501	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1108776151121395722	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1108966403064737843	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1109274443060093020	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1109308198235689002	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1109330447676227635	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1109492028141731991	[946800234804166697, 1036384181690847394]
946800234804166697	1109687081325834271	[946800234804166697, 1036384181690847394]
946800234804166697	1109947913322369125	[946800234804166697, 1036384181690847394]
946800234804166697	1109951116164223036	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1110099548480749682	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1110144738012712980	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1110154499483504690	[946800234804166697, 1036384181690847394]
946800234804166697	1110356447100948510	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1110507279263993960	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1110575979165913118	[946800234804166697, 1036384181690847394]
946800234804166697	957197734463553537	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	957242748807827466	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	957293502365065266	[946800234804166697, 1036384181690847394]
946800234804166697	957298332852682792	[946800234804166697, 1036384181690847394]
946800234804166697	1061938589316960296	[946800234804166697, 1036384181690847394]
946800234804166697	1061993489824489493	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1062159498652946552	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1062503763698528288	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1062880020860776528	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1063060347474411561	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1063259998395838535	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1063332106421403718	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1063689438804332614	[946800234804166697, 1036384181690847394]
946800234804166697	1063710174927388693	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1063905301260148837	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1063941786378174534	[946800234804166697, 1036384181690847394]
946800234804166697	1064638738417860829	[946800234804166697, 1036384181690847394]
946800234804166697	1064851436996927548	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1065160942838620220	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1065318250898014288	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1065400189625569350	[946800234804166697, 1036384181690847394]
946800234804166697	1065430625319927858	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1065447536049016863	[946800234804166697, 1036384181690847394]
946800234804166697	1065451891821117520	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1065453407911026758	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1065582415084535919	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1065598846970888222	[946800234804166697, 1036384181690847394]
946800234804166697	1065694336928469072	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1065749350527021146	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1065774154751684658	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1073951225617326150	[946800234804166697, 1036384181690847394]
946800234804166697	1084436397190021190	[946800234804166697, 1036384181690847394]
946800234804166697	1084506465026449419	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1084635410153611356	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1085024116794470461	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1085031294922133646	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1085220129987624960	[946800234804166697, 1036384181690847394]
946800234804166697	1085258254201929799	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1085631167606300783	[946800234804166697, 1036384181690847394]
946800234804166697	1085699180326047764	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1085702444161437778	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1096562236237021305	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1096581692673769592	[946800234804166697, 1036384181690847394]
946800234804166697	1096584280957788180	[946800234804166697, 1036384181690847394, 981564541982875688, 948343375462019112]
946800234804166697	1096624603197079552	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1096638660742500372	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1096666518449823754	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1096694785387020288	[946800234804166697, 1036384181690847394]
946800234804166697	1096880046775476254	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1096897427350507550	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1096992849960112201	[946800234804166697, 1036384181690847394]
946800234804166697	1097247861080608860	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1097284300270993498	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1097612327697797181	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1097638175150702612	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1097639680104742943	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1097823414099652730	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1097831162895925319	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1097851172892708894	[946800234804166697, 1036384181690847394]
946800234804166697	1097873058204758208	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1098417034116743219	[946800234804166697, 1036384181690847394]
946800234804166697	1098485198317965312	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1098676374664917132	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1098707669268844687	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1098814243647787119	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1099083775150927922	[946800234804166697, 1036384181690847394]
946800234804166697	1099138273470857277	[946800234804166697, 1036384181690847394]
946800234804166697	1099167692608516147	[946800234804166697, 1036384181690847394]
946800234804166697	1099198358624686181	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1099294645453865032	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1099441829977526443	[946800234804166697, 1036384181690847394]
946800234804166697	1099579451098005554	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1099779832956592260	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1099783317517238352	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1099862015134158929	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1099898184072974368	[946800234804166697, 1036384181690847394]
946800234804166697	1119228951475265609	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1119393698657079416	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1119404345616764969	[946800234804166697, 1036384181690847394]
946800234804166697	1119446512183816254	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1119449656422826004	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1119478636613992498	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1119488301783597186	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1119532737284558858	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1119569836016685087	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1119595956720123965	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1119700224231866449	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112]
946800234804166697	1119768208128356402	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1119825686723579926	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1120074541037781043	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1131460304988024862	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1131703186588192781	[946800234804166697, 1036384181690847394, 948343375462019112, 1171527920716619806]
946800234804166697	1131738731712356484	[946800234804166697, 1036384181690847394]
946800234804166697	1131790382414438460	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1132470658513780856	[946800234804166697, 1036384181690847394]
946800234804166697	1132497926711676939	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1132498742642225233	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1132503067942735902	[946800234804166697, 1036384181690847394, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1132610372529033216	[946800234804166697, 1036384181690847394]
946800234804166697	1132618823414071388	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1132715175720521738	[946800234804166697, 1036384181690847394]
946800234804166697	1132744489547612281	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1132792412666875954	[946800234804166697, 1036384181690847394]
946800234804166697	1132811738543304734	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1132933000984789012	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1132943819697049670	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1133802001533259777	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1133827088034574358	[946800234804166697, 1036384181690847394]
946800234804166697	1133838753639698493	[946800234804166697, 1036384181690847394]
946800234804166697	1134025544535638046	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1134208452886007889	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1134273553454334066	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948345555090833418]
946800234804166697	1134308088330072097	[946800234804166697, 1036384181690847394, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1134562245175681145	[946800234804166697, 1036384181690847394]
946800234804166697	1134682476783079509	[946800234804166697, 1036384181690847394]
946800234804166697	1134712740041207969	[946800234804166697, 1036384181690847394]
946800234804166697	1134803954799231027	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1134878652409061446	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948345555090833418]
946800234804166697	1135124741330567219	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1135261262272536606	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1135347779925975100	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1135350887922012192	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1135350940254355578	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1135374401278312629	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1135396730238668850	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1135426948408016927	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1135491169028153355	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1135870270536695808	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1135944547592044604	[946800234804166697, 1036384181690847394]
946800234804166697	1141075254840672267	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418]
946800234804166697	1141080069603860532	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1141105026404728912	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1141136380248997929	[946800234804166697, 1036384181690847394, 948343375462019112, 1171527920716619806]
946800234804166697	1141241586605371452	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1141404265726873634	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1141436507870208025	[946800234804166697, 1036384181690847394]
946800234804166697	1141449971158229052	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1141491272507465828	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1141523901814423695	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1141587126555775036	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1141650581723811903	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1141912444936142899	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1141921030701588480	[946800234804166697, 1036384181690847394]
946800234804166697	1142097246071050311	[946800234804166697, 1036384181690847394]
946800234804166697	1142187465407475774	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1142525878463635496	[946800234804166697, 1036384181690847394]
946800234804166697	1142638784018649169	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1156642010426515636	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1120173023966793801	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1120196278266101820	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1120403243130961970	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1120449300070150175	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1120468062785781800	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1120489923527581868	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1120554960845799574	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1120626460294664242	[946800234804166697, 1036384181690847394]
946800234804166697	1120631756975001702	[946800234804166697, 1036384181690847394]
946800234804166697	1120662985719939134	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1120734848512958527	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1120780283545923700	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1120786324312576030	[946800234804166697, 1036384181690847394]
946800234804166697	1120855492470788216	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948345555090833418]
946800234804166697	1120939108303392788	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1121147455904432298	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1121156549390377203	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1121175929671143595	[946800234804166697, 1036384181690847394]
946800234804166697	1121185413659377836	[946800234804166697, 1036384181690847394]
946800234804166697	1121186448243163298	[946800234804166697, 1036384181690847394]
946800234804166697	1121186857322041354	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1121191878503698554	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1121194139862712330	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1121204627392700426	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1121205448889086024	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1121253495429931009	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1121275983014666321	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1121281086891237376	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1121363635483197451	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1121407500281970698	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1121486683821588521	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1121523460968022146	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1121618006741635112	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1121699614672822376	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1121839644410126457	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1121859797420093583	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1132956997445243031	[946800234804166697, 1036384181690847394]
946800234804166697	1133095184536698921	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1133100381837217922	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1133237066591907841	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1133331142897041408	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1133359536489627748	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1133397128681619546	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1133432617795059782	[946800234804166697, 1036384181690847394]
946800234804166697	1133444560966647840	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1133611896143093800	[946800234804166697, 1036384181690847394]
946800234804166697	1133621347055050813	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1133789647894499440	[946800234804166697, 1036384181690847394]
946800234804166697	1141685491238973521	[946800234804166697, 1036384181690847394]
946800234804166697	1141891313470545940	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1142884060465725490	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 1171527920716619806]
946800234804166697	1143098184067989586	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1143115212363419768	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1143275164461715536	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948345555090833418, 1171527920716619806]
946800234804166697	1143298012479770695	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	1143425971974840331	[946800234804166697, 1036384181690847394]
946800234804166697	1143441866587639919	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1143515573351891097	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1143611811392921671	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 1171527920716619806]
946800234804166697	1143657800753491992	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1143922762931511396	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1144009681229053953	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1144030430102818896	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1144233306024595497	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1144322388884996268	[946800234804166697, 1036384181690847394]
946800234804166697	1144432808165638215	[946800234804166697, 1036384181690847394]
946800234804166697	1144434072958017546	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1144536572268642497	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1144677921840185556	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1144752168700739744	[946800234804166697, 1036384181690847394]
946800234804166697	1144795718603788318	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1121927357834481815	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1121980906677227651	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1122024210718531604	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1122026826894672013	[946800234804166697, 1036384181690847394]
946800234804166697	1126721840644096050	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1126729875458363515	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1126790478671646770	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1126803613692461149	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1135969456934367232	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1144819615822782585	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1144921637565780068	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1144971073822142576	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1145143410311831555	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1145189313462669422	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1147964229408804914	[946800234804166697, 1036384181690847394]
946800234804166697	1148020959018766507	[946800234804166697, 1036384181690847394]
946800234804166697	1148092805139415142	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1148308538238701719	[946800234804166697, 1036384181690847394]
946800234804166697	1148333098245828618	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948345555090833418, 1171527920716619806]
946800234804166697	1148602840789557309	[946800234804166697, 1036384181690847394]
946800234804166697	1148669379727339591	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1148731480416206878	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1148759647784816660	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1148760295523758110	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1148805204351930418	[946800234804166697, 1036384181690847394]
946800234804166697	1149025977930879057	[946800234804166697, 1036384181690847394]
946800234804166697	1149110973655957657	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1149470653733404792	[946800234804166697, 1036384181690847394]
946800234804166697	1149773094878203935	[946800234804166697, 1036384181690847394]
946800234804166697	1149990660305338479	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1150005158915354655	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1150039522323738776	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1150084272233910392	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1150413311783993445	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1150510463344459847	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1150538976889942027	[946800234804166697, 1036384181690847394]
946800234804166697	1150539120507101284	[946800234804166697, 1036384181690847394]
946800234804166697	1150755079490641930	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1150781248684433418	[946800234804166697, 1036384181690847394]
946800234804166697	1151491386965757964	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1151506549135655014	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1151543083419324537	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1151546260046757990	[946800234804166697, 1036384181690847394]
946800234804166697	1151645619144888462	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1151706632644988969	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1151910257585557574	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1151924046171226162	[946800234804166697, 1036384181690847394]
946800234804166697	1152002551680610396	[946800234804166697, 1036384181690847394]
946800234804166697	1152009997375524905	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1152054652230184993	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1152375082652540958	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1152401866706128996	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1152413341839544330	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1152446868131946527	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	1152446889787146240	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1152465548903464980	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1152538441595244594	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1152557934610501693	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1152572661868802108	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1152613613601837077	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1152680879529939015	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1152710273480798359	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1152726725281718332	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1153100541178683443	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1153325633464700989	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1153341995780145272	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1153387985920868464	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1153420276181246073	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1153446727609761833	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112, 948345555090833418]
946800234804166697	1154030146194522222	[946800234804166697, 1036384181690847394]
946800234804166697	1154055146385440880	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1154178399221321820	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1154413904567472198	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1122171859153211452	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1122185923535319231	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1122238276993028280	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1122259611328712804	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1122269844407062618	[946800234804166697, 1036384181690847394]
946800234804166697	1122295446568718416	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1122300567453192249	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1122360417302368327	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1122361257127841863	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1122426950179373087	[946800234804166697, 1036384181690847394]
946800234804166697	1123058819455520788	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1123255609094058055	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1123282334628708362	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1123339643119751188	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1123377267628847136	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1123377423002640575	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1123409942255247401	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1123439507153371188	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1123445296244989952	[946800234804166697, 1036384181690847394]
946800234804166697	1123492578399096893	[946800234804166697, 1036384181690847394]
946800234804166697	1123581482997395456	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1123583910681514015	[946800234804166697, 1036384181690847394]
946800234804166697	1123592790081798165	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1123621519122239620	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1123630321301196901	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1123667429445357579	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1123797989127901224	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1123898196054253639	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1124000426665189387	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1124099497996329003	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1124131674020642897	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1124132958282973214	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1124146955996639294	[946800234804166697, 1036384181690847394]
946800234804166697	1124203133099315210	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1124387321509331044	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1124404063702888640	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1124444076255760554	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1124462151726280734	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1124468622190973028	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1124530328036458516	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1124536494430883961	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1124579469622005761	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1124582402208051200	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1124595234374955088	[946800234804166697, 1036384181690847394]
946800234804166697	1124605261827547146	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1124675570568007771	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1124728758188908576	[946800234804166697, 1036384181690847394]
946800234804166697	1124742955245240393	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1124754975021600878	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1124772044769341510	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1124855419895038012	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1124870985431138355	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1124885727868616806	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1124889003892674640	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1124948894908956763	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1124977241454030948	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1125002370401701928	[946800234804166697, 1036384181690847394, 981564541982875688, 948345555090833418]
946800234804166697	1125105648334557365	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1136070441446944789	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1136107001072582706	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1136130772034658304	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1136169031674630256	[946800234804166697, 1036384181690847394]
946800234804166697	1136435147407884378	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1136559128077156393	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1136740095920181329	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1136762833447702569	[946800234804166697, 1036384181690847394]
946800234804166697	1136784245080211466	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1136828867231887463	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1136883259616276500	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1137013646636105778	[946800234804166697, 1036384181690847394]
946800234804166697	1137048586736111636	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1137071403598893157	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1137124430175293451	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	1150915409403449394	[946800234804166697, 1036384181690847394]
946800234804166697	1122514915798831225	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1122604811066552451	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1122610581447397497	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1122680574344183838	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1122857793360232479	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1122908915982663861	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1122923877627072623	[946800234804166697, 1036384181690847394]
946800234804166697	1123027269447860295	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1123038226626646092	[946800234804166697, 1036384181690847394, 948343502507491339, 948345555090833418]
946800234804166697	1126812648412024862	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1126826139793502218	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1126883452034228355	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1128523834258108490	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1128572554001535046	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1128602791930241085	[946800234804166697, 1036384181690847394]
946800234804166697	1128619438174912582	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1128625918278127738	[946800234804166697, 1036384181690847394]
946800234804166697	1128660483709337602	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1128722882093133954	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1128777194483744829	[946800234804166697, 1036384181690847394]
946800234804166697	1128823343383072840	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1128870403062902894	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1128915495014367342	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1128994747202142339	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1129011878589366402	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1129043376117907458	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1129115199035691038	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1129119978747076778	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1129166226174787757	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1129220454972915883	[946800234804166697, 1036384181690847394]
946800234804166697	1129240782805684265	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1129300678364377128	[946800234804166697, 1036384181690847394]
946800234804166697	1129385839655399436	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1129439472640081940	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1129454865563787425	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1129471564677648475	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1129488370670780506	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1129523159931039804	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1129524596165574697	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1129565097208070274	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1129587825302573136	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1129597700887826514	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1129619875355181137	[946800234804166697, 1036384181690847394]
946800234804166697	1129689372682375248	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1137160363113197689	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1137410143919804436	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1137428651806302218	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1137441689708003472	[946800234804166697, 1036384181690847394]
946800234804166697	1137448117965426750	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1137449645870682273	[946800234804166697, 1036384181690847394]
946800234804166697	1137453835338661989	[946800234804166697, 1036384181690847394]
946800234804166697	1137461223840039042	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1137487574059991111	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1137614518214721586	[946800234804166697, 1036384181690847394]
946800234804166697	1137819859418361997	[946800234804166697, 1036384181690847394]
946800234804166697	1137821167097487371	[946800234804166697, 1036384181690847394]
946800234804166697	1151117954809876592	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1151239268459618304	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1156665855506133032	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1156699426132328509	[946800234804166697, 1036384181690847394]
946800234804166697	1156770114058858496	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1156949314472513567	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1157085009727979651	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1157107994140627045	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1157181668541612072	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1157473708391272509	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1157481560971427890	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1157505242607407266	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1157538865586905098	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1157740531686842368	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1157753589477937312	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1157886587238101092	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1157931790187642901	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1157967637712732281	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1158083213512675449	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1158118135438770207	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	1125149674911842364	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1125196287235600495	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1125205015200550973	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1125215698726170664	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1125226131809906728	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1125280449506324561	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1125369286635044924	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1125484824606552165	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1125567946312400977	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1125573926794317894	[946800234804166697, 1036384181690847394]
946800234804166697	1125591923613241374	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1125676366973632612	[946800234804166697, 1036384181690847394]
946800234804166697	1125683314964058162	[946800234804166697, 1036384181690847394]
946800234804166697	1125836351015764088	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1125855346938876055	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1125857605970034708	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1125868485243830322	[946800234804166697, 1036384181690847394]
946800234804166697	1125874053014622228	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1125924231423742032	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1125939048129765458	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1125981493127282739	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1125986774775242823	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1126000419273973792	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1126031104621674546	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1126154567734808576	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1126175431805116546	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1126197097998336132	[946800234804166697, 1036384181690847394]
946800234804166697	1126207964655652965	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1126232593583591474	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1126239451903959050	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1126259082672750652	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1126275306387415133	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1126292439842426951	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1126314491450236928	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1126319302295961621	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1126325810706534411	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1126338410605453377	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1126342043308929124	[946800234804166697, 1036384181690847394]
946800234804166697	1126362488338907217	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112, 948345555090833418]
946800234804166697	1126401834228142171	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1126528152521416774	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1126536118515548295	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1126558834366886051	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1126703003269857281	[946800234804166697, 1036384181690847394]
946800234804166697	1129705850718662736	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1129803737792270336	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1130657078978035845	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1130735533790855209	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1130772838488494151	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1130865064723873822	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1130956744936394822	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1130965466341462046	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1130966085538156625	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1131032609259003934	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1131161761073074228	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1131168685017550848	[946800234804166697, 1036384181690847394]
946800234804166697	1138140266524577944	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1138170977423990794	[946800234804166697, 1036384181690847394]
946800234804166697	1138253802093420575	[946800234804166697, 1036384181690847394]
946800234804166697	1138522372006232076	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1138583289859428482	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1138703929715216414	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1138821846196830218	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1138909941701279774	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1139033290595127337	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1139042947904585888	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1139059190204211230	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1139084692524630036	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1139318952800026796	[946800234804166697, 1036384181690847394]
946800234804166697	1139353606567501935	[946800234804166697, 1036384181690847394]
946800234804166697	1139374775538548838	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1139438322196951121	[946800234804166697, 1036384181690847394]
946800234804166697	1139482066828922961	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1139600550506270881	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1139669557745811562	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1126923492986716280	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1126928351148392579	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1126963658694611045	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1127015782623219712	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1127035163407306802	[946800234804166697, 1036384181690847394]
946800234804166697	1127052101013491755	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1127073132436537385	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1127100742289870848	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1127206962958970960	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1127289624495140885	[946800234804166697, 1036384181690847394, 981564541982875688, 948343488594972724]
946800234804166697	1127315108318683148	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1127317709437272115	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1127368653369770108	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1127441815939862591	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1127467186357801002	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1127479260165193839	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1127494451741327474	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1127582925886603324	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1127648862304219156	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1127691187399163905	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1127704726000115884	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1127714690445881454	[946800234804166697, 1036384181690847394]
946800234804166697	1127734840343666788	[946800234804166697, 1036384181690847394]
946800234804166697	1127765762954776667	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1127876962719907840	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1127986429302165596	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1127994331744186439	[946800234804166697, 1036384181690847394]
946800234804166697	1128021772458004560	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1128033804481732648	[946800234804166697, 1036384181690847394]
946800234804166697	1128040726299693086	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1128084102134894663	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1128118345338728448	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1128254801893933108	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1128309993800740915	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1128349546355900446	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1128387100643962930	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1128387336988786768	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1128394323617128539	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1128403884172394600	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1128485400831332352	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1128499875923890307	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1139799334926417970	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1139882147855990814	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1139928163330302062	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1139968859626012722	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1139969152119996439	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1139972282706575432	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1140396462958706803	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1140515920129839195	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1140617001946071131	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1140621379088162887	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1140653118292504718	[946800234804166697, 1036384181690847394]
946800234804166697	1140813456770076795	[946800234804166697, 1036384181690847394]
946800234804166697	1141027304374542336	[946800234804166697, 1036384181690847394]
946800234804166697	1145498184525828107	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1145551849869553726	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1145697795114799184	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1145755061025243187	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1154501330916880454	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1154798025143758888	[946800234804166697, 1036384181690847394]
946800234804166697	1154858458814877788	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418]
946800234804166697	1154868305312616540	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1154939563001790616	[946800234804166697, 1036384181690847394]
946800234804166697	1155297128894181489	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1158330923738218526	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1158648922202460193	[946800234804166697, 1036384181690847394]
946800234804166697	1158853792016646145	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1158894565495947409	[946800234804166697, 1036384181690847394]
946800234804166697	1158946639474606122	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1159194567640363028	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	1159232932297318400	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1159280976531296328	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1159304973755105380	[946800234804166697, 1036384181690847394]
946800234804166697	1159819738952769617	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1129826871199154346	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1129836088068931605	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1129870551352086639	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1129903934388052039	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1129914083060232312	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1130013462429446145	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1130015031745052734	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1130040499366002688	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1130109760092504207	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1130147920952442990	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1130210239724138698	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1130256293362409502	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1130303928060362793	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1130309920168886293	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1130360100259897374	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1130392985041895444	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1130442218763722783	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1130579633973235813	[946800234804166697, 1036384181690847394, 981564541982875688, 948343488594972724]
946800234804166697	1130580323038658581	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1130641400384462858	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1131282051585298483	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1131316301013454868	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1131423590303150110	[946800234804166697, 1036384181690847394]
946800234804166697	1139982863362691102	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1140109391236960277	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112]
946800234804166697	1140119508980351017	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1140310909605126165	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1140348548764930098	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1145257847756697641	[946800234804166697, 1036384181690847394]
946800234804166697	1145261830525157417	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1145322250866802688	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1145390579979653172	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1145415617772531762	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1145435690981662773	[946800234804166697, 1036384181690847394]
946800234804166697	1145783382299639888	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1145839947266400356	[946800234804166697, 1036384181690847394]
946800234804166697	1146062271194341478	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1146242714149601371	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1146249335164633088	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1146256323177091095	[946800234804166697, 1036384181690847394]
946800234804166697	1146339080230150184	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1146352201552375808	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1146408078707793951	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1146441842439766168	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1146578461545222185	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1146586186463326208	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1146601033829724161	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1146603338830459042	[946800234804166697, 1036384181690847394]
946800234804166697	1146616987565428746	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1146739048099098675	[946800234804166697, 1036384181690847394, 948343502507491339, 948343375462019112, 948345555090833418]
946800234804166697	1146773715858755676	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1146849821580349562	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1146949705440444547	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1147160235044245626	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1147256193035817082	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1147312911715405904	[946800234804166697, 1036384181690847394]
946800234804166697	1147338828684738600	[946800234804166697, 1036384181690847394]
946800234804166697	1147591648205864991	[946800234804166697, 1036384181690847394, 948343488594972724, 948343346257076224, 948345555090833418]
946800234804166697	1147684619991396382	[946800234804166697, 1036384181690847394]
946800234804166697	1147704519057227909	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1147795237113167904	[946800234804166697, 1036384181690847394]
946800234804166697	1155333153691549767	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1155363452324413512	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1155367934898741312	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1155439336351879230	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1155503962926092369	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112, 1171527920716619806]
946800234804166697	1155506683393618002	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1155539676376088647	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	1155647504604467291	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1155686528991899758	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1156056587975270481	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1156071290474614836	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1156084812394799227	[946800234804166697, 1036384181690847394, 981564541982875688, 948345555090833418]
946800234804166697	1159928924298555433	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1159991713331433494	[946800234804166697, 1036384181690847394]
946800234804166697	1160095708993568869	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1160230808125177898	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	1160291741384069191	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1160310584487710870	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1160366981548089396	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1160367319659331584	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1160374445395935302	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1160547542111629343	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1160572679850557553	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1161390200640000041	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1161419902406635630	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1161717428997345390	[946800234804166697, 1036384181690847394]
946800234804166697	1161794292734509167	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1162038033806282882	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1162150284999536701	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1162190420298694798	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1162248380748144722	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1162313350269636629	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1162354139175604315	[946800234804166697, 1036384181690847394]
946800234804166697	1162484212444713080	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1162880874556166264	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1162910310286495774	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1162944822420705401	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1162991590730649682	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1163014172959838229	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1163045553303736330	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1163066270451777577	[946800234804166697, 1036384181690847394]
946800234804166697	1163097393500274698	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1163247255181074472	[946800234804166697, 1036384181690847394]
946800234804166697	1163641242068992080	[946800234804166697, 1036384181690847394]
946800234804166697	1163721747326046288	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1163988891666231359	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1164061598713905263	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1164078484172328991	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1168548730300022826	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1168643259585790122	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1168672847925870692	[946800234804166697, 1036384181690847394]
946800234804166697	1168679707810734150	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1168972364302782470	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1169002353081454592	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1169271395704909904	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1169359763159658526	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1169369173458161867	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1169418721920557099	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1169601342428426314	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1169765849675075714	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1169813452450177046	[946800234804166697, 1036384181690847394, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1169819668312227935	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1169864575244566562	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 1171527920716619806]
946800234804166697	1170141393151344640	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1170167978373955614	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1170176371415330869	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1170179731061231703	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1170189062435516468	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1170305230391476225	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1170378651360055370	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1170438087726342144	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1170477716571701292	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1170640491403038790	[946800234804166697, 1036384181690847394]
946800234804166697	1170858068981075988	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1170880847017152646	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1170938358411837451	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1170981942536183862	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1171017130225979392	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1171034860169744474	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1171060908001329226	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1171470223182934050	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1171481253300678796	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1171803390108500058	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1160583433802752181	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1160602112380637265	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1160686085748310046	[946800234804166697, 1036384181690847394]
946800234804166697	1160808657907351562	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1160964786046120006	[946800234804166697, 1036384181690847394]
946800234804166697	1160967800836325436	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1161025768671957053	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1161072343431532585	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1161115441289240576	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1161268633666863245	[946800234804166697, 1036384181690847394]
946800234804166697	1161283144054472788	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1161344297614970980	[946800234804166697, 1036384181690847394]
946800234804166697	1175233246099939328	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1175249887948980247	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1175277573064888380	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1175289542274715739	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1175437993067171881	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1175458903132213379	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1175533654609506324	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1175548184198664272	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1175597222251991163	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1175605612520943626	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1175606756722876469	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1175632168010141747	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1175814874060832778	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1175830144137580624	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1175832947992047620	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1175863051166163005	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1175905413431042100	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1175984518172250208	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1176058860910424088	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1176065275800596501	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1176109183960088639	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1176197442933375006	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1176202010647859274	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1176211938401865882	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1176214317008420885	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1176518535044943895	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1176621365776887849	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1176656889392672802	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1176772398775795725	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1176840363374293064	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1176938164166856794	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1177090060483579915	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1177208334600900700	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1164159825018634312	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1164186980259725354	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1164333989503451188	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1164487922981023774	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1164621675753652417	[946800234804166697, 1036384181690847394]
946800234804166697	1164642179923333274	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1164682046547951697	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1164712178411126865	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1164726327660781582	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1164929459355394099	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1164949871141343292	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1165149428013871114	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1165174126185549935	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1165197592376918148	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1165387946740961425	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1165393989881577472	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1165450415089930301	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1165590938966577222	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1165914231149961270	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1166135691353280532	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1166136538401353768	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1166471292074066054	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1166498766124220518	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1166582200242814979	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1166783067835351100	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1166847323620507749	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1166853586119037061	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1166868862491430922	[946800234804166697, 1036384181690847394, 948343488594972724, 948343346257076224]
946800234804166697	1166871692983926857	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1167219390211707013	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1167229037878448190	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1171794425492557867	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1172383019177353259	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1172412558859313223	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1172466496287559700	[946800234804166697, 1036384181690847394]
946800234804166697	1172528288208535627	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1172610867972554845	[946800234804166697, 1036384181690847394]
946800234804166697	1172745360049963151	[946800234804166697, 1036384181690847394]
946800234804166697	1172810714671497328	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1172820833262125146	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1172821868668006401	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1172841161833054271	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1172844025749971005	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1172863695618056287	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1172966249928601820	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1172966262746390610	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1173124163267993680	[946800234804166697, 1036384181690847394]
946800234804166697	1173130229661835357	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1173279987638480966	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	1173304014708949053	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1173339419986636923	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1173357553510526976	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1173361605883461723	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1173384053240639510	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1173401670873530392	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1173544997224714260	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1173567179476713586	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1173592692878487552	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1173620837006450738	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1173731806114226206	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1173895658051211327	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1174081643607236698	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1174134880964190226	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1174466765141581864	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112]
946800234804166697	1174503502425358566	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1174745708289605675	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1174814433948745840	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1175151198446293016	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1175208109510250599	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1167324270758735945	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1167327994977734662	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1167445268640313405	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1167475318706155641	[946800234804166697, 1036384181690847394]
946800234804166697	1167518098975363203	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1167646378399387711	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1167715256324341883	[946800234804166697, 1036384181690847394]
946800234804166697	1167761096967471207	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 1171527920716619806]
946800234804166697	1167763938553905204	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1167806757586882604	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418, 1171527920716619806]
946800234804166697	1167819360497320040	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1167828378422886560	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1167899560195141633	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1167944406704332911	[946800234804166697, 1036384181690847394]
946800234804166697	1167952558061531230	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1167974744549765142	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1167999920830165042	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1168008111940976744	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1168212524794118185	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1168220337759076422	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112, 1171527920716619806]
946800234804166697	1168262861815021699	[946800234804166697, 1036384181690847394]
946800234804166697	1168426648492838923	[946800234804166697, 1036384181690847394]
946800234804166697	1171578030955708416	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1171647970882625566	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1171662500178178138	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1171782419217645630	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1177273218789285918	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1177309054389993575	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1177373945603821588	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1177451651292995676	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948345555090833418, 1171527920716619806]
946800234804166697	1177492170807185408	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1177698518878670899	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1177704285362995210	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1177818251888169122	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1171889342931816589	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1171890638862680086	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1172065079093641280	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1172127668221784164	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1172135807197388811	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1172176281874477160	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1172209544810725447	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1172334341876105266	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1172354048402403388	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1172360333353041932	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1177804175741038672	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1177829288058310737	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1177832811667914813	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1177841181703536732	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1177769251134783649	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1177865314596294749	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1177964546779000896	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1178065439738302515	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1178127177519202417	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1178194152547168316	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1178209764489039953	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1178286894942015539	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1178293178957316106	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1178322880837189683	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1178350150364692571	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1178513571978694696	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1178547369604825099	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1178563607672393768	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1178673882497044493	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 1171527920716619806]
946800234804166697	1178794777559437332	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1178859863460290594	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1178956494612484167	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1178970947433275402	[946800234804166697, 1036384181690847394]
946800234804166697	1178995489388113942	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1179020852562505729	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1179027641441984534	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1179234687495974912	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1179409399865933845	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1179477447062868016	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 1171527920716619806]
946800234804166697	1179488184330104914	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1179526590674243584	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1179565148625719346	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1179582238346715216	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1179592362796785776	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1179609421588987997	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1179616794906984569	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1179623446498525228	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1179788176437559347	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1179857600511234129	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1179883099161632788	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1179927119820763238	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1179942261895745606	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1179970023079546890	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1180131855979257927	[946800234804166697, 1036384181690847394, 948343375462019112, 1171527920716619806]
946800234804166697	1180142372852609126	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1180197354570264709	[946800234804166697, 1036384181690847394]
946800234804166697	1180226356253032528	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1180235877696426089	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1180239795256053810	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1180285326263078926	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1180295979182862470	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1180347542140113006	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1180401788332019765	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	1180428134680641578	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1180444199099826203	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1180540730649874483	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1180610750444752907	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1180676927279857775	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1180684051317784709	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1180687244185587774	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1180691186445467753	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1180818564274462793	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1180822271489753229	[946800234804166697, 1036384181690847394]
946800234804166697	1180836176056287332	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1180854854470610964	[946800234804166697, 1036384181690847394, 948343502507491339, 948345555090833418]
946800234804166697	1180904587394289714	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1180949220321136677	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1181019777729298532	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1181073232883884094	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1181092179289047061	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1181092600061624381	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1181138960827809842	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1181158484641845300	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1181171408823406638	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1181211745356877828	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1181267870290825367	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1181283636889268225	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1181337904870592582	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1181403999849676853	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1181441483677646918	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1181468849795768340	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1181860788638584882	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1181939154456682547	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1181970238980501515	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1181971176331956224	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1182110310174294117	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1182344695767113779	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1182378163335082026	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1182403199555080246	[946800234804166697, 1036384181690847394]
946800234804166697	1182464850794913814	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1182504146314743869	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1182632566587658253	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1182642649740628028	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1182775176400752661	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1182944118830272515	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1182952556645842956	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1183079556358352938	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1183138678898442293	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1183167077918457929	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1183208332828360767	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1183404765183475764	[946800234804166697, 1036384181690847394]
946800234804166697	1183410571043942406	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1183882698293526629	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1184069860297289735	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1184082200182923294	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1184241568023056486	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1184243244553470046	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1184300110209880105	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1184584784505225286	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1184607016010915900	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1184621444496359465	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948345555090833418]
946800234804166697	1184822643732525130	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1186087149574049903	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1186217353197932639	[946800234804166697, 1036384181690847394, 948343375462019112, 948343346257076224]
946800234804166697	1186392888880418909	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	1186398165923008662	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1186480141031973024	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1186642586597859338	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1186674876505935924	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1186828071207186502	[946800234804166697, 1036384181690847394, 948343375462019112, 1171527920716619806]
946800234804166697	1187073734536876043	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1187132419388743783	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1187270502369218611	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1187456162417877073	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1187521654214103102	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1187532485052092449	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1187561490656546842	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1187835641535398079	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1187837830953697321	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1187853174925693033	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1187854446470897756	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1187890318138408992	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1188118759043506256	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418, 1171527920716619806]
946800234804166697	1188119634059210822	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1188135523533996153	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1188158734967504988	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1188190874534944881	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1188211642811547780	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1188240777428607149	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1188310638225801309	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1188312916433317929	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1188314225555279932	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1188317068127371305	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1188329654529048660	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1188430029089161318	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1188469068819345418	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1183449294968205412	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1183502167974355118	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1183603678519758940	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1183771748299186221	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1183782351994638410	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1183812107733565470	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1183814360859152564	[946800234804166697, 1036384181690847394]
946800234804166697	1183817214151893186	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1184919516464021514	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1185012770924658771	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1185222552612782105	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1185261202931208294	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1185285461061685351	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1185441190196289578	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1185490000729620510	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1185517433251958817	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	1185576378498826291	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1185590503215996980	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1185735439995383909	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1185751021306253312	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1185783696553426976	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1185798965883584642	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1185841491038457856	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1185924115530514577	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1185930600201338934	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1185997301798412288	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1186074172082892960	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1186083664107417610	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1195242692486119505	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1195349278256808089	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1195438292376760409	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1195541487795052695	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1195583823551942729	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	1195586559810998332	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1195712112463466557	[946800234804166697, 1036384181690847394]
946800234804166697	1195762065009299547	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1195802435504046231	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1195816615812550706	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1195885938564411502	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948345555090833418, 1171527920716619806]
946800234804166697	1195942668350537759	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1195988299890827306	[946800234804166697, 1036384181690847394, 948343346257076224, 1171527920716619806]
946800234804166697	1196036914579517520	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1196208960252948571	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1196236112096669747	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1196312496466821131	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1196352226738835588	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1196553065290014760	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1196561940814770256	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1196798095107821659	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1196895781421072436	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1196920236906119198	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1198410878043816047	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1198428233805344942	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1198438084254118028	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1198446119735283795	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1198478447907971155	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948345555090833418, 1171527920716619806]
946800234804166697	1200344636649115701	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1200469860031930425	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1200472221248917595	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1200525707172909241	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1200614207922643107	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1200665079155277896	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1200702372721213615	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1200710067872354424	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1200737399576203404	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1200755657402499162	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112, 948345555090833418]
946800234804166697	1200921716612931627	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1201012770720718960	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1201024085623316483	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1201026241189380106	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1188498925934628976	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1188506572448596101	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1188508749602758768	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1188645870481195075	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1188677844872736778	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1188722165084852276	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1188784479771303938	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1188896528887189568	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1188962345435799562	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1189003123382030429	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1189013501377794138	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1189015462336540733	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1189226399211454506	[946800234804166697, 1036384181690847394]
946800234804166697	1189308325419028621	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1189315695012491327	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1189333618280108142	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1189367796300267611	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1189443641052237946	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1189480042472935504	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1189494999570718821	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1189519400106197063	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1189594295775273012	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1189673199152136279	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1189761540400893982	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1189811436881449014	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1190105409906814999	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	1190136310531366942	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1190144944325808309	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1190197488406233169	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1190382047177474229	[946800234804166697, 1036384181690847394]
946800234804166697	1190413968901144599	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1190511577640734853	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1190512518368612468	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1190656624210227230	[946800234804166697, 1036384181690847394, 948343375462019112, 948343346257076224]
946800234804166697	1190658072734089316	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1190787834047631393	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1190844144541777966	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1190870990570397746	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1190905094070349845	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1191061917947674715	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1191070429260038275	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1191119784637640767	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1191186402973585408	[946800234804166697, 1036384181690847394, 948343346257076224, 1171527920716619806]
946800234804166697	1191235586032410755	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1191525491786653696	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1191628703222997035	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1191638684320145508	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1191696099342307382	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1191752087550316668	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1194692260680454144	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1194792748490960911	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1194833658633277470	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1194834985140633610	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1194975989319618653	[946800234804166697, 1036384181690847394]
946800234804166697	1194985013352083567	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1194992822705725460	[946800234804166697, 1036384181690847394, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1195029372290207885	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1195094677985185825	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1198587144982249577	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1198629196621164644	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1198684290662281347	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1198714208666271846	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1198777479666610269	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1198798787309744148	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1198830086896496704	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1198862599467577530	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1198883077812924467	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1199009383040950302	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1199058617660354631	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1199067744990138380	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1199101597603598359	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1199121102069309512	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1199124490874015835	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1199214790002872403	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1199241757485965332	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1199266344508588167	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1199314241950318676	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1199341732567982131	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1199343679064789034	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1199456884910993489	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1199487598247301211	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1199518887792885803	[946800234804166697, 1036384181690847394, 948343375462019112, 948343346257076224]
946800234804166697	1199520115511804065	[946800234804166697, 1036384181690847394]
946800234804166697	1199599788451188816	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1199645591685320814	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1199691263180542032	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1199820690900127797	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1199837952012992564	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1199858367565402113	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1199887321168883842	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1199890997430206510	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1199910555985641523	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1199964525697433686	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1199965256328421447	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1200016445623504940	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1200103727181344908	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1201046157036634124	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1191761922194931713	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1191777793986543718	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1191863925411680371	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1191919805733798035	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1191921425217490976	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1192039346379948096	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1192156848728576051	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1192208050531090523	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1192242701186375812	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1192254870477090846	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1192317083850117241	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1192330119872782416	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1192336073381138454	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1192398388172431381	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1192404857525633025	[946800234804166697, 1036384181690847394]
946800234804166697	1192407703667089428	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1192505942944780340	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1192584905062887544	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1192751048176181273	[946800234804166697, 1036384181690847394, 948343502507491339, 1171527920716619806]
946800234804166697	1193036752458366977	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1193083790151659562	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1193368629748695151	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1193403713377796128	[946800234804166697, 1036384181690847394]
946800234804166697	1193417340486963295	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1193426105344987187	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1193502850786004992	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1193525696543326281	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1193552421377544265	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1193592929697145047	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1193626005751992393	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1193689330707873972	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1193693913140170753	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1193769003705978941	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1193810391277502498	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1193880094507282523	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1193959765550825572	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1193969079543922698	[946800234804166697, 1036384181690847394]
946800234804166697	1194027393522880563	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1194108650285973625	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1194117212399743070	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1194171790851842270	[946800234804166697, 1036384181690847394, 948343346257076224, 948345555090833418]
946800234804166697	1194175960837271655	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1194243201062666313	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1194269108569641032	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1194284404831424612	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1194306619442466829	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1194338486292074576	[946800234804166697, 1036384181690847394]
946800234804166697	1194431891781210254	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1194442531522494567	[946800234804166697, 1036384181690847394, 948343346257076224, 1171527920716619806]
946800234804166697	1194464157324562572	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1194548825608683521	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1194644077661134950	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1196933278146510928	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1196954915545825307	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1197061309695529013	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1197066335897792604	[946800234804166697, 1036384181690847394]
946800234804166697	1197087731893944354	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1197253632467402956	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1197328719556137153	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1197329878144528424	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1197330962929963019	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1197349446174912603	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1197429592873517127	[946800234804166697, 1036384181690847394, 948343502507491339, 948343375462019112]
946800234804166697	1197598858365108248	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1197603798370222130	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1197617495415214191	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1197668221210349688	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1197674625279213599	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1197690005078937740	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1197697399599136849	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1197721572606222360	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1197782604372508752	[946800234804166697, 1036384181690847394]
946800234804166697	1197842829301522494	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	1197909675446906934	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1197994435892494388	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1198039426954186884	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1198043195225931968	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1198052981346672690	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1198104071186415716	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1198135331988447295	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1198225960990953513	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1198295794655178892	[946800234804166697, 1036384181690847394, 981564541982875688, 948343488594972724]
946800234804166697	1198394776047849545	[946800234804166697, 1036384181690847394]
946800234804166697	1198395852029431841	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1200109481250529340	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1200124730506739722	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1200126317534904461	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1200136015344570428	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1200168644408258674	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1200197873460068473	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1200227958468661340	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1200229504648495235	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1200277618465964103	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1200281781564362893	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1200289809323806732	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1200858338284556348	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1200907319022731334	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 1171527920716619806]
946800234804166697	1201215885055107132	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1201245417573195862	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1201251656818511885	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1201271358114496513	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1201297486208315593	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1201395455490273290	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1201496209395826888	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1201534293915222046	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1201638197680152596	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1201734395262931027	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1201789543116967947	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1201794057467351073	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1201860883912073256	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1201873522662580279	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1201912571440136212	[946800234804166697, 1036384181690847394, 948343502507491339, 948345555090833418]
946800234804166697	1201944099293499422	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1202025078192082984	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1202072628672876645	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1202082440919920670	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1202188726395207696	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1202318375506948106	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1202364339219071010	[946800234804166697, 1036384181690847394]
946800234804166697	1202375805380853762	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1202638017613791245	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1202638432527188069	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1203024241369546853	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1203081753804148750	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1203092453272322108	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1203093629736980494	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1203128897621856316	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1203158172672725087	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1203170397139374105	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1203336578525823006	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1203342258846441542	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1203410016086921276	[946800234804166697, 1036384181690847394, 948343502507491339, 948343346257076224, 1171527920716619806]
946800234804166697	1203425180580585543	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1203429803651502140	[946800234804166697, 1036384181690847394]
946800234804166697	1203438268813942814	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1203447143663407145	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1203465531257266208	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1203475297899380788	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1203500943409283112	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1203532937094627411	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948345555090833418, 1171527920716619806]
946800234804166697	1201098496065937459	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1201149563877195808	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1201181163914539068	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1203539817376518174	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1203575758392401951	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1203578155676344373	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1202380150088400933	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1202442809685184535	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1202445384857948204	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1202488073292746784	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1202512015495667755	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1202575320633315364	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1202607340575006781	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1202660761084887100	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1202688822241140791	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1202711116149428227	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1202788386604064828	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1202801931626487839	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1202830508090982451	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1202848451533209622	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1202860883722633256	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1202862196980191254	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1202883308296347698	[946800234804166697, 1036384181690847394]
946800234804166697	1202970855295025153	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1202995602766438480	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1203610258312798262	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	1203621566190198847	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1203644889808769060	[946800234804166697, 1036384181690847394, 948343375462019112, 1171527920716619806]
946800234804166697	1204187413300248586	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1204203220872986645	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1204212330393767967	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1204305445993320459	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1204370196244987955	[946800234804166697]
946800234804166697	1204397213791551579	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224]
946800234804166697	1204401851152343072	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1204469218448253010	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1204502560480821324	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1204510289895096421	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1204540877410668585	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112]
946800234804166697	1203655716582203425	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1203672491504181290	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1203727451709247569	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1203768972110074016	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	1203808147844890755	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1203818317459226695	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1203819201639227456	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1203834005301239854	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1203865428661768283	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1203958826718728242	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1204030844554059776	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1204064442938167326	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1204071195633258519	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1204155954178949121	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1204167955047252024	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1204182703340134452	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1204184953764577328	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1204556244677955614	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1204563601491492897	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1204566645700567063	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1204587760715829351	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1204601371458928642	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1204605011099656293	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1204609881190178848	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1204635663472005126	[946800234804166697, 1036384181690847394, 948343346257076224, 948345555090833418]
946800234804166697	1204661268313673781	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1204663309702397973	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1204696658248605698	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1204703549691269160	[946800234804166697, 1036384181690847394]
946800234804166697	1204712969091555368	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1204773395817046067	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1204793921448976426	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1204812933037686868	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1204822746710933535	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1204828546959417375	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1204829650077876274	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1204836587175813201	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1204895818444705854	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1204910671419015231	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	1204913569905381386	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1204925543473086534	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1204939083374268476	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1204957932534632478	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1204963133538697312	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1205027471804731408	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1205044843609587746	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1205045036740513803	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1205073007467438080	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1205172802668462111	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1205172878232789055	[946800234804166697, 1036384181690847394, 948343502507491339, 948343375462019112, 948345555090833418]
946800234804166697	1205173276821819434	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1205173980194148433	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1205220985805086790	[946800234804166697, 1036384181690847394, 948343375462019112, 948343346257076224]
946800234804166697	1205238598266527787	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1205274913007599698	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418, 1171527920716619806]
946800234804166697	1205298501727166486	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1205303173909323839	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1205340644898373683	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1205341254146064445	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1205377400670519436	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1205379012810113045	[946800234804166697, 1036384181690847394]
946800234804166697	1205545234629394492	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1205571690441089054	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1205594713277595663	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1205613740922372129	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1205754139993313310	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1205774254059294820	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1205796238029754380	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1205881475736539166	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1205908368741376111	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1205916123820720138	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1205926014312644669	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1205926824736067605	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1205985299780599879	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1206031984510505031	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1206053477248143371	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1206132293438152754	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1206136836234416181	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1206184162176929825	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1206294461932380241	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1206328265531457588	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1206333957667557467	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1206348366842437725	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1206375215198896149	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1206383584307585037	[946800234804166697, 1036384181690847394]
946800234804166697	1206387293527474267	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1206412485616341074	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1206493689858490392	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1206495535318437889	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1206514268560822315	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1206614850470547469	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1206629141047148574	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1206654779179270156	[946800234804166697, 1036384181690847394]
946800234804166697	1206662982982041692	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1206684642158055524	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1206714454310649907	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1206726478125989951	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1206788773975826462	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1206790697240240189	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1206843408463958017	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1206926231778631691	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112]
946800234804166697	1206963090407694367	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1207027745792729150	[946800234804166697, 1036384181690847394, 948343502507491339, 948345555090833418]
946800234804166697	1207052264175308882	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1207054403622666354	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1207152084156424257	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1207160573410934816	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1207716519853957172	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1207728090898374706	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1207776989331726358	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1207828603497349233	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1207839406304788500	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1207895406898585633	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1207899093733609472	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	1208013996356280371	[946800234804166697, 1036384181690847394, 948343502507491339, 948345555090833418]
946800234804166697	1208031103068274749	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1208211190497542145	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1208251385443913772	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1208331656415547403	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1208351785581023232	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1210669316249362512	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1210673226426884200	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1210718382618320956	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1210749619764596756	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1210770634452369438	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1210782240020234281	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1210849238620311597	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1210954111277862962	[946800234804166697, 1036384181690847394]
946800234804166697	1210962393383833684	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1211047278375080001	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1211064939306033173	[946800234804166697, 1036384181690847394, 948343375462019112, 948343346257076224, 1171527920716619806]
946800234804166697	1211102902098337792	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1211152647751598131	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1211157207564161107	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1211158259231105044	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1211169478013091910	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	1211268591832535093	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1211304520353710110	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1211349953864007710	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1211364942872322080	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1211423669469839360	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1211458242882969651	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1208507198833958993	[946800234804166697, 1036384181690847394]
946800234804166697	1208533741488840816	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1208597582268600341	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1208599591713513522	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1208626424974549033	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1208663854255706133	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1208727870135074816	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1208794337794850846	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1208843189797265458	[946800234804166697, 1036384181690847394]
946800234804166697	1208925445660348506	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1208925604229939270	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1208949192093999184	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1208965495097790546	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1209000093563355177	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1209032361463775262	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1209210269109067877	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1209358448546947092	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1209391200532955179	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1209532180317999118	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1209566366055530610	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1209669829544513537	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1209725604195467406	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1209884494119698472	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1210014679804416070	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1210134911290314774	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1210189343520587798	[946800234804166697, 1036384181690847394]
946800234804166697	1210337308692185173	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1210552260111769601	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1224498424045375491	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1224942705419878462	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1225384227365720125	[946800234804166697, 1036384181690847394]
946800234804166697	1230599107182067743	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1230656317023195248	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1230842355393892402	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1230920637422243912	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1244920565937213483	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1245042761879785562	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1245592667560349717	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1245811571507200133	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1245863627806871556	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1245901452334071840	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1245971238896271402	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1246076223138955315	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1246224020798574642	[946800234804166697, 1036384181690847394]
946800234804166697	1246289811178782795	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1246607779934769174	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1246779156222447701	[946800234804166697, 1036384181690847394]
946800234804166697	1246919689700114506	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1246996951862476870	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1247227572039848061	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1247244022075101208	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1247546764974624859	[946800234804166697, 1036384181690847394]
946800234804166697	1247719929772380292	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1247726582244704257	[946800234804166697, 1036384181690847394]
946800234804166697	1247744537195974767	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1247982510328119377	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1248001503981994051	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1248140192578146455	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1248187518491431002	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1248285090568732732	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1248354884340813936	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1248385730871296124	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1249004805784080522	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1249063824523395093	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1249382089418342565	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1249581650904481855	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1249615894645047370	[946800234804166697, 1036384181690847394]
946800234804166697	1249752428224446615	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1250094742012821638	[946800234804166697, 1036384181690847394]
946800234804166697	1250254225762549820	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1250449886118154324	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1069400852672032910	[946800234804166697, 1036384181690847394]
946800234804166697	1211513231898841108	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1211557430689927199	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1211586033855238215	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1211686153040691310	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1211701956880629801	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1212027032301473864	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1212063069358915615	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1212080745359745081	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1212117784968831026	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1212181099694788609	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1212231422639743079	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948345555090833418, 1171527920716619806]
946800234804166697	1212240720803532883	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1212356213543800863	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1212385230753632368	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1212448809997832193	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1212522450491801640	[946800234804166697, 1036384181690847394]
946800234804166697	1212592437655248978	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1213507178183528520	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1213515960544133191	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1213557664316137556	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1213617026711691334	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1213619469327269889	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1213911256449163314	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1213964717228302467	[946800234804166697, 1036384181690847394]
946800234804166697	1213976208132276255	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1214074940286832720	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1214094848085327892	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1214144059149656096	[946800234804166697, 1036384181690847394]
946800234804166697	1214232621324705804	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1214328201459925043	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1214332562609152134	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1214362778106859594	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1223817123739209821	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1223853548735823934	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1223855557904044133	[946800234804166697, 1036384181690847394]
946800234804166697	1223926353686954085	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1224015428783833249	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1224054108906979408	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1224140393315307521	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1224142740980498547	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1224153029385912454	[946800234804166697, 1036384181690847394]
946800234804166697	1224190156714545213	[946800234804166697, 1036384181690847394, 948345555090833418, 1171527920716619806]
946800234804166697	1224496389854330976	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1225778768640086017	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1225807464952238173	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1225895185775464609	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1225934212436201515	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1225947884118085642	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1226294623484248124	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1226444267799711824	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1226531550406115378	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1226592953082974268	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1226718543479963739	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1226813257382232145	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1227076173868306483	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1227077665912127659	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1227104405375942828	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1227105773641797717	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1227107418094174259	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1227165749118894110	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1227254447093055628	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1227320104555909141	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1227354697866674310	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1230002756585263155	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1230041847649271870	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1230174980755558471	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1230202257132486759	[946800234804166697, 1036384181690847394, 948343488594972724]
672178593371127808	391653865440935949	[672178593371127808, 698323076202496121]
950153022405763124	1080501616475643934	[950153022405763124, 1270496433304244234]
1090069129928654940	670012512170672158	[1090069129928654940, 1092471557093331035]
946800234804166697	1212668845483892748	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1212709645974507543	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1212765184737677345	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1212806761468268656	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1213165110168657964	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1213305809904341003	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1213346701448843265	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1213386447734710293	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1213390467677421598	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1214388390167060540	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1214480947639095307	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1214576618627141713	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1214722143921766400	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1215045376273551400	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1215047059565187162	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1215083915467816970	[946800234804166697, 1036384181690847394, 948343502507491339, 948343375462019112]
946800234804166697	1215087905530183787	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1215100024929656902	[946800234804166697, 1036384181690847394]
946800234804166697	1215133019346833509	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1215152751013666816	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1215162164977864706	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1215165694191079466	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	1215167986135212073	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1215183223328608336	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1215363024257290281	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1215407329462460507	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1215411325996498985	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1215444020684267591	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1215446378159800342	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1215452258590793729	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1215723199736582198	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1215749234603589786	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1215863847420825633	[946800234804166697, 1036384181690847394]
946800234804166697	1215866949167222866	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1215930339353165868	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1215935368403091541	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1216065645897056276	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1216213153793314920	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1216328065949499404	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1216421903267397662	[946800234804166697, 1036384181690847394]
946800234804166697	1216444625280176250	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1216480291225600241	[946800234804166697, 1036384181690847394]
946800234804166697	1216584496238034947	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1216716774649630766	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1216757127914197013	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1216821295799341097	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1216861127766577263	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1216989962440806453	[946800234804166697, 1036384181690847394, 948343488594972724, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1217029945239277649	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1217127756807278673	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1217202224376184963	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1217456316977512551	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1217526378908356658	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1217936081132191754	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1217960434938941450	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1217961154475982960	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1218070012536029267	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1218203510567338027	[946800234804166697, 1036384181690847394]
946800234804166697	1218235682175193088	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1218295770806091816	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112]
946800234804166697	1218421965287850112	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 1171527920716619806]
946800234804166697	1218424448495911024	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1218523608608014417	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1218668722940543067	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1218826560342069291	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1219035711848841317	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1219042554033737808	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1219271209456500827	[946800234804166697, 1036384181690847394, 948343375462019112, 948343346257076224, 1171527920716619806]
946800234804166697	1219303430313607188	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1219310494830039091	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1219356056577118311	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	1219486432951930912	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1219774176613892209	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1219784801217941607	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1219803900979314759	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1219863241954562049	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
946800234804166697	1219928861006106626	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1219976152345739264	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1220007443937890324	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1220677590654914571	[946800234804166697, 1036384181690847394]
946800234804166697	1220052065959804989	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1220056482721042464	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1220139002389073984	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1220273531917697087	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1220389789015212032	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1220417096585052166	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1220422295751753819	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1220447442848452629	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1220459546540118097	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1220491615483990070	[946800234804166697, 1036384181690847394]
946800234804166697	1220545139106123786	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1220553538879357078	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1220657897764290632	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1227406755760443433	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1227496656618913823	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1227755311339671664	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1227763360381141073	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	1227836597102444664	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1227994823043190897	[946800234804166697, 1036384181690847394]
946800234804166697	1228317989246337105	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1228356111422459905	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1228525882872823868	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1228610102571827273	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1228634725883707432	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1228762846939189289	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724]
946800234804166697	1228795758166413422	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1229091586797994026	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1229169821413933185	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1229204099728146512	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1229412034131660873	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1229963341125128242	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948345555090833418, 1171527920716619806]
1088761100503371839	1246956331898900603	[1088761100503371839, 1177017695137439894, 1173142348360855572, 1173142295206449192]
950153022405763124	781911586012004384	[950153022405763124, 1270496433304244234]
946800234804166697	1220726106563285063	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1220833623297757248	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1220836236609192058	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1220841168418508980	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1220883497778942103	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1220884341853520113	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1220896032431538178	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1220929520605986967	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1221063796563378202	[946800234804166697, 1036384181690847394, 948343375462019112, 1171527920716619806]
946800234804166697	1221075868496039986	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1221099144941142028	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1221114793595895890	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1221149240030662769	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1221186005223084062	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1221236604488646729	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	1221258883650031616	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1221260912888119378	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1221294426769330176	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1221583466311717034	[946800234804166697, 1036384181690847394, 948343488594972724, 948345555090833418]
946800234804166697	1221706375609061446	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1221734206179377152	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1221757494452555806	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1221765027124613137	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1221792239160922132	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1221868211713216512	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1221969409711804540	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1222053573483823128	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1222054256874487808	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1222144769967263846	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1222181645738840067	[946800234804166697, 1036384181690847394]
946800234804166697	1222217581193068574	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1222268369869340813	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1222293647073218571	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1222535853633699935	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1222620633612025976	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1222666022067372183	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1222673753662685225	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1222703548463317035	[946800234804166697, 1036384181690847394]
946800234804166697	1222740004804100166	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1222884055020736582	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1222968423596818442	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1223059551297863732	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1223311397782290538	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1223387510634315836	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1223395330331250748	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1223403272241549394	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1223409655233904671	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1223486710831382559	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1223518165556793386	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1223582384889266288	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1223604688838987788	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1223717368551702758	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1231104438056255561	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1231133934457327636	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1231356729871175740	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1231715592541700136	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1231959456665829388	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1232144561556426852	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1232261293520715868	[946800234804166697, 1036384181690847394, 948343502507491339, 948345555090833418]
946800234804166697	1232774216911294488	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1232855850612162580	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1233072750503919708	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1233116591864942744	[946800234804166697, 1036384181690847394]
946800234804166697	1233241790086381729	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1233545053432184903	[946800234804166697, 1036384181690847394, 948343346257076224, 1171527920716619806]
946800234804166697	1233597076760166491	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1233896878177914881	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1234014279888273410	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1234322703117324342	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
946800234804166697	1234346650349207594	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1234851008320897036	[946800234804166697, 1036384181690847394]
946800234804166697	1241750230643376234	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1234951153972678659	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
946800234804166697	1235280047544205467	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1235621720430481479	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1235687244107354136	[946800234804166697, 1036384181690847394, 948343346257076224]
946800234804166697	1235995732377342055	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1236403928330145852	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1236494842712817727	[946800234804166697, 1036384181690847394]
946800234804166697	1236522770062639144	[946800234804166697, 1036384181690847394]
946800234804166697	1236535009095974992	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1236546529154699284	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1236879278671663177	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1237211732452180080	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1237454318706102322	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1238165644042833933	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1238909391126659152	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1238970109738094632	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1239109702323933194	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1239210138494173284	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1239248022140096643	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1239846702349811782	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1239972765532950609	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1240778865710993431	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1241351229179826191	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1241379619836268544	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1241379728481452182	[946800234804166697, 1036384181690847394]
892675627373699072	770272697946734605	[892675627373699072, 1249814208334528533]
946800234804166697	1241819778956656664	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1241895758513569823	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1241964196372025425	[946800234804166697, 1036384181690847394, 948343502507491339, 948343375462019112, 948345555090833418]
946800234804166697	1242201768264466513	[946800234804166697, 1036384181690847394]
946800234804166697	1242212651224793169	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1242363148204245063	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1242415024593567775	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1242622326827253792	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1243295881571340410	[946800234804166697, 1036384181690847394, 948343375462019112]
946800234804166697	1243310559714086964	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1243913290653110356	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948345555090833418]
946800234804166697	1243964023607791756	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	1244532047113097229	[946800234804166697, 1036384181690847394, 1171527920716619806]
1088761100503371839	1135017546316267541	[1088761100503371839, 1173142348360855572, 1173142295206449192]
946800234804166697	1251229104204812361	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1252135779308929056	[946800234804166697, 1036384181690847394]
946800234804166697	1252423852730880094	[946800234804166697, 1036384181690847394]
946800234804166697	1255592326303191115	[946800234804166697, 1036384181690847394]
946800234804166697	1259928810535649452	[946800234804166697, 1036384181690847394]
946800234804166697	1128384583163981934	[946800234804166697, 1036384181690847394]
892675627373699072	879467113385963592	[892675627373699072, 1249814208334528533]
1088761100503371839	831953870133133332	[1088761100503371839, 1173142348360855572, 1173142295206449192]
946800234804166697	1056558691282853928	[946800234804166697, 1036384181690847394]
1239885748484964362	1249006709016363023	[1239885748484964362, 1241059575550054470, 1239885748484964365, 1239885748493090845, 1239885748501614598]
1212376692098867240	1274233986268532849	[1212376692098867240, 1262245112159928411]
946800234804166697	873756976482488321	[946800234804166697, 1036384181690847394]
1234198250995712073	746271681575911445	[1234198250995712073, 1236834880911052820, 1234305309657534594, 1246909378301399122, 1234335649381879869]
1166349364881535016	1104604350615130164	[1166349364881535016, 1168557118316609606]
1090069129928654940	510537188786569230	[1090069129928654940, 1092471557093331035]
1144686158601793559	1056665650287874098	[1144686158601793559]
1090069129928654940	264420497436049408	[1090069129928654940, 1133788651197833318, 1124541857481900042, 1092471557093331035]
946800234804166697	441072359206682635	[946800234804166697, 1036384181690847394]
1273788483336667191	1235615637171212504	[1273788483336667191, 1274373411992240159]
946800234804166697	312966720774209538	[946800234804166697, 1036384181690847394]
950153022405763124	716864418515779635	[950153022405763124, 1270496433304244234]
1088761100503371839	998195523536310343	[1088761100503371839, 1177369805372805222, 1173142348360855572, 1173142295206449192]
946800234804166697	842896478943051806	[946800234804166697, 1036384181690847394, 948343488594972724]
1273788483336667191	1066707409206267914	[1273788483336667191, 1274373411992240159]
1090069129928654940	500887883981389824	[1090069129928654940, 1124861228469207050, 1124541862728978443, 1124541857481900042, 1092471557093331035]
1234198250995712073	1213255900584742932	[1234198250995712073, 1234305309657534594]
950153022405763124	1140836817688596510	[950153022405763124, 1270496433304244234]
1090069129928654940	759357243329085451	[1090069129928654940, 1133788665206808676, 1092471557093331035]
1273788483336667191	1223359044123623576	[1273788483336667191, 1274373411992240159]
892675627373699072	1243274323402293259	[892675627373699072, 1249814208334528533, 1262361853523136532]
946800234804166697	704170640462184528	[946800234804166697, 1036384181690847394]
892675627373699072	930831958135677008	[892675627373699072, 1249814208334528533]
672178593371127808	505313933868007425	[672178593371127808, 772910080974651453, 772910078696489000, 698323076202496121, 683152545488961579]
892675627373699072	1148079180743983196	[892675627373699072, 1249814208334528533]
892675627373699072	801243696632037416	[892675627373699072, 1249814208334528533]
892675627373699072	1126424755776520203	[892675627373699072, 1249814208334528533]
892675627373699072	906119883358621717	[892675627373699072, 1249814208334528533]
1088761100503371839	889846864017514526	[1088761100503371839, 1173142348360855572, 1173142295206449192]
672178593371127808	872637987186413668	[672178593371127808, 698323076202496121]
946800234804166697	1104423424895483924	[946800234804166697, 1036384181690847394, 948343375462019112]
892675627373699072	1152214201234903092	[892675627373699072, 1249814208334528533]
1090069129928654940	707661337660096592	[1090069129928654940, 1092471557093331035]
892675627373699072	1203317846650912829	[892675627373699072, 1249814208334528533]
672178593371127808	954394805029445682	[672178593371127808, 698323076202496121]
946800234804166697	884014555578138644	[946800234804166697, 1036384181690847394]
892675627373699072	1025719144819204206	[892675627373699072, 1249814208334528533]
946800234804166697	895675794435768372	[946800234804166697, 1036384181690847394]
892675627373699072	818534352484433921	[892675627373699072, 1249814208334528533]
892675627373699072	926497980624797697	[892675627373699072, 1249814208334528533]
946800234804166697	799994028983713822	[946800234804166697, 1036384181690847394, 948343502507491339]
892675627373699072	858013717315846155	[892675627373699072, 1249814208334528533]
946800234804166697	1073286797607587890	[946800234804166697, 1036384181690847394]
892675627373699072	765020837446811669	[892675627373699072, 1249814208334528533]
1231607483030569030	631949075452788756	[1231607483030569030, 1231607483043418114, 1231607483043418119, 1231607483043418120, 1231607483051671603, 1236676788327809064]
1273788483336667191	1087773302510075990	[1273788483336667191, 1274373411992240159]
672178593371127808	980747600825290792	[672178593371127808, 772910080974651453, 772910065530699786, 698323076202496121]
1090069129928654940	825314459894939748	[1090069129928654940, 1092471557093331035]
1231607483030569030	1059918479198789723	[1231607483030569030, 1231607483043418114, 1231607483043418117, 1231607483051671603, 1236676788327809064, 1231607483043418115]
946800234804166697	663463980546785343	[946800234804166697, 1036384181690847394, 948343502507491339]
946800234804166697	1135013496015294616	[946800234804166697, 1036384181690847394, 948343488594972724, 948343375462019112]
1231607483030569030	1275105811831591038	[1231607483030569030, 1231607483043418114, 1231607483051671603, 1236676788327809064]
1273788483336667191	1187119045300977866	[1273788483336667191, 1274373411992240159]
946800234804166697	1099245463175184475	[946800234804166697, 1036384181690847394]
1239885748484964362	811680002139226193	[1239885748484964362, 1241059575550054470, 1239885748501614595, 1239885748501614598]
1090069129928654940	405719783095533570	[1090069129928654940, 1092471557093331035]
1090069129928654940	757974899263406080	[1090069129928654940, 1124541857481900042, 1092471557093331035]
1234198250995712073	692045914436796436	[1234198250995712073, 1234335323291517009]
946800234804166697	952262168554901586	[946800234804166697, 1036384181690847394]
892675627373699072	1138242057752809544	[892675627373699072, 1249814208334528533]
1232875191911059476	1272140342493446236	[1232875191911059476]
1088761100503371839	1001743304758665246	[1088761100503371839, 1173142348360855572, 1173142352232189973, 1173142342358810694, 1173142295206449192, 1173142305625079892]
1090069129928654940	769087944278933504	[1090069129928654940, 1092471557093331035]
892675627373699072	716619026033541160	[892675627373699072, 1249814208334528533]
672178593371127808	974444112482803802	[672178593371127808, 698323076202496121]
946800234804166697	1046238512200036353	[946800234804166697, 1036384181690847394, 948343488594972724]
1231607483030569030	545666311573995521	[1231607483030569030, 1231607483043418114, 1231607483043418118, 1231607483051671603, 1236676788327809064]
672178593371127808	982845536099000321	[672178593371127808, 698323076202496121]
1090069129928654940	646782780000305163	[1090069129928654940, 1092471557093331035]
946800234804166697	736802460806676593	[946800234804166697, 1036384181690847394, 1171527920716619806]
1090069129928654940	783205422059487232	[1090069129928654940, 1092471557093331035]
1274119155431379045	710560976998498448	[1274119155431379045, 1274643088601780286]
892675627373699072	1164243443955011635	[892675627373699072, 1249814208334528533]
946800234804166697	807466579524190249	[946800234804166697, 1036384181690847394, 981564541982875688]
946800234804166697	1115054029358243870	[946800234804166697, 1036384181690847394]
1090069129928654940	990279474438369350	[1090069129928654940, 1092471557093331035]
946800234804166697	1133913000370241586	[946800234804166697, 1036384181690847394]
892675627373699072	1256776762352992348	[892675627373699072, 1249814208334528533]
1234198250995712073	1267569182057304227	[1234198250995712073, 1234305309657534594]
892675627373699072	1109598228900491264	[892675627373699072, 1249814208334528533]
892675627373699072	808132565206040607	[892675627373699072, 1249814208334528533]
946800234804166697	284807103581913089	[946800234804166697, 1036384181690847394, 948343346257076224]
892675627373699072	880215549630636102	[892675627373699072, 1249814208334528533]
1090069129928654940	319426018714845186	[1090069129928654940, 1092471557093331035]
1090069129928654940	830144210422333501	[1090069129928654940, 1124861228469207050, 1124541857481900042, 1092471557093331035]
1090069129928654940	292729175087775748	[1090069129928654940, 1092471557093331035]
946800234804166697	1168302712681668632	[946800234804166697, 1036384181690847394, 948345555090833418]
892675627373699072	1261648918253670554	[892675627373699072, 1249814208334528533]
1090069129928654940	944768045526712370	[1090069129928654940, 1092471557093331035]
1090069129928654940	1071676773336629258	[1090069129928654940, 1092471557093331035]
946800234804166697	805995818652794881	[946800234804166697, 1036384181690847394, 948343488594972724]
946800234804166697	1060637913504825344	[946800234804166697, 1036384181690847394, 948343488594972724, 1171527920716619806]
1088761100503371839	1208825174288236554	[1088761100503371839, 1173142348360855572, 1173142295206449192]
1090069129928654940	658503887032156161	[1090069129928654940, 1124541862728978443, 1124541857481900042, 1092471557093331035]
1212376692098867240	1077561568440631308	[1212376692098867240, 1262245112361123841]
892675627373699072	652276932599349299	[892675627373699072, 1249814208334528533, 1262361853523136532]
946800234804166697	757032059402321920	[946800234804166697, 1036384181690847394, 948343502507491339, 948343488594972724, 948343375462019112, 948343346257076224, 948345555090833418, 1171527920716619806]
892675627373699072	1271642196084527144	[892675627373699072, 1249814208334528533]
1088761100503371839	1190518454709661797	[1088761100503371839, 1173142348360855572, 1173142295206449192]
946800234804166697	994139825747804170	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	1073332654889508894	[946800234804166697, 1036384181690847394, 948345555090833418]
1212376692098867240	1267569182057304227	[1212376692098867240, 1262245112361123841]
1273716079151022183	1267569182057304227	[1273716079151022183, 1273770103049158747]
1231607483030569030	967450031810564147	[1231607483030569030, 1231607483043418118, 1231607483051671603, 1236676788327809064, 1231607483043418115]
946800234804166697	828704124484452394	[946800234804166697, 1036384181690847394, 948343502507491339]
1265355781369495714	1175516350488264837	[1265355781369495714, 1265397124103933994]
1231607483030569030	1271320146840915991	[1231607483030569030, 1231607483043418114, 1231607483043418118, 1231607483051671603, 1236676788327809064]
1088761100503371839	981416733556494337	[1088761100503371839, 1173142348360855572, 1173142295206449192]
946800234804166697	881174312038572072	[946800234804166697, 1036384181690847394, 948343502507491339, 948345555090833418]
1090069129928654940	755604005442551818	[1090069129928654940, 1092471557093331035]
946800234804166697	1059598051578228758	[946800234804166697, 1036384181690847394, 981564541982875688]
892675627373699072	881962990310686801	[892675627373699072, 1249814208334528533]
1090069129928654940	802922592636895242	[1090069129928654940, 1092471557093331035]
1231607483030569030	1188941915022950460	[1231607483030569030, 1231607483043418114, 1231607483051671603, 1236676788327809064]
946800234804166697	937340064676061184	[946800234804166697, 1036384181690847394]
1090069129928654940	826078381782990899	[1090069129928654940, 1124861228469207050, 1124541857481900042, 1092471557093331035]
1088761100503371839	516933104779132928	[1088761100503371839, 1173142348360855572, 1173142295206449192]
672178593371127808	270689871989964801	[672178593371127808, 772910083084386315, 772910078696489000, 698323076202496121, 767613422610677760]
1231607483030569030	1274502417261789186	[1231607483030569030, 1231607483043418114, 1231607483043418117, 1231607483051671602, 1236676788327809064, 1231607483043418115]
672178593371127808	776216541091463178	[672178593371127808, 698323076202496121]
892675627373699072	1129775209205989507	[892675627373699072, 1249814208334528533]
1144686158601793559	1129775209205989507	[1144686158601793559]
946800234804166697	1098175594363109459	[946800234804166697, 1036384181690847394]
1090069129928654940	481639987763478529	[1090069129928654940, 1124861228469207050, 1124541857481900042, 1092471557093331035]
1234198250995712073	1134075341086924811	[1234198250995712073, 1234305309657534594]
892675627373699072	823716212437549077	[892675627373699072, 1249814208334528533, 1262361853523136532]
892675627373699072	615458320278618154	[892675627373699072, 1249814208334528533]
1234198250995712073	1242930981967757452	[1234198250995712073, 1262061848732241970]
1090069129928654940	779383553476657192	[1090069129928654940, 1124861228469207050, 1124541857481900042, 1092471557093331035]
946800234804166697	1100472254678175955	[946800234804166697, 1036384181690847394, 948345555090833418]
950153022405763124	1136824362259976353	[950153022405763124, 1270496433304244234]
946800234804166697	1147682361736183868	[946800234804166697, 1036384181690847394, 1171527920716619806]
946800234804166697	602742114878619678	[946800234804166697, 1036384181690847394, 948343488594972724]
1234198250995712073	759066377256042557	[1234198250995712073]
1232875191911059476	1005291896026976256	[1232875191911059476]
1274163487312187435	1207130869563654190	[1274163487312187435]
1231607483030569030	947477095355912264	[1231607483030569030, 1231607483043418119, 1231607483051671603, 1236676788327809064, 1231607483043418115]
1274163487312187435	1208524145944694824	[1274163487312187435, 1274736707056435290]
1088761100503371839	925147528826073118	[1088761100503371839, 1173142348360855572, 1173142295206449192]
892675627373699072	845734217501376573	[892675627373699072, 1249814208334528533]
1144686158601793559	1145872613688746015	[1144686158601793559]
1231607483030569030	878739959803179058	[1231607483030569030, 1231607483043418120, 1231607483051671603, 1236676788327809064, 1231607483043418115]
892675627373699072	1201333097556357144	[892675627373699072, 1249814208334528533]
672178593371127808	1272767175106629644	[672178593371127808, 698323076202496121]
950153022405763124	1093503527478898739	[950153022405763124, 1270496433304244234]
1231607483030569030	1125055383992545280	[1231607483030569030, 1231607483043418114, 1231607483043418119, 1231607483051671603, 1236676788327809064]
946800234804166697	758324570469040190	[946800234804166697, 1036384181690847394]
1090069129928654940	851658107976286247	[1090069129928654940, 1092471557093331035]
672178593371127808	817892355339714630	[672178593371127808, 803085820470886430, 772910080974651453, 772910065530699786, 1007996775539408966, 698323076202496121]
1231607483030569030	1004505911571775580	[1231607483030569030, 1231607483043418120, 1231607483051671603, 1236676788327809064, 1231607483043418115]
1088761100503371839	1136358788090302584	[1088761100503371839, 1173142348360855572, 1173142295206449192]
946800234804166697	1185284072944173086	[946800234804166697, 1036384181690847394, 948345555090833418]
946800234804166697	991381283366256720	[946800234804166697, 1036384181690847394]
892675627373699072	1095357814748217355	[892675627373699072, 1249814208334528533]
892675627373699072	994266605536149544	[892675627373699072, 1249814208334528533]
1090069129928654940	881596682842816562	[1090069129928654940, 1092471557093331035]
1090069129928654940	696128749816512564	[1090069129928654940, 1092471557093331035]
892675627373699072	1098175594363109459	[892675627373699072, 1249814208334528533]
672178593371127808	335967068551905281	[672178593371127808, 698323076202496121]
1016406976860782662	416723179378049036	[1016406976860782662, 1047608205502590997]
946800234804166697	986089610629222480	[946800234804166697, 1036384181690847394]
892675627373699072	1228750022586273962	[892675627373699072, 1249814208334528533]
946800234804166697	847242966753607680	[946800234804166697, 1036384181690847394]
950153022405763124	1055854211486728303	[950153022405763124, 1270496433304244234]
1214059201635024957	688523128737103969	[1214059201635024957, 1219624617530884119, 1219624404548587630, 1219624130706669699, 1219624316812136458, 1214071593345482782]
\.


--
-- Data for Name: restrictcommand; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restrictcommand (guild_id, command, role_id) FROM stdin;
\.


--
-- Data for Name: seen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seen (user_id, guild_id, "time") FROM stdin;
1247076592556183598	1268777695244980389	2024-08-04 05:52:55.163961+00
1235271206287048769	1230468832829902848	2024-08-03 00:53:07.520068+00
214753146512080907	1268777695244980389	2024-08-03 20:21:55.280259+00
939274781977612378	1252343120545448039	2024-08-03 00:53:24.673885+00
948573943650992169	1208651928507129887	2024-08-04 09:14:54.984314+00
648683483723595776	1251675682648625264	2024-08-03 00:53:09.776227+00
763815690511450113	1127267129121587370	2024-08-03 00:52:30.113731+00
1250098229496905771	1133440161670234142	2024-08-03 00:53:05.531051+00
885681559552819202	721347673873186816	2024-08-03 00:52:30.485405+00
862945368407801888	1238542680095588523	2024-08-03 00:52:12.012552+00
1187419254220394597	1252343120545448039	2024-08-03 00:52:14.055826+00
1215582436587601920	1230468832829902848	2024-08-03 00:52:14.662432+00
746608806867501099	1226492622617444423	2024-08-03 00:52:41.769535+00
1238768616996995122	1234688687414050896	2024-08-03 00:52:15.106094+00
974456477458763826	721347673873186816	2024-08-03 00:53:15.516558+00
1140303046736355369	1247841972715126844	2024-08-03 00:53:08.259476+00
553732540570271765	1257541366867562496	2024-08-03 00:53:14.048236+00
1264329017696190587	1234874560890015785	2024-08-03 00:52:48.674584+00
1036056465498185748	1258919277449183402	2024-08-03 00:53:14.451614+00
554354904760582168	1240025784182374450	2024-08-03 00:52:48.846894+00
818894869292384347	1108225520962904075	2024-08-03 00:52:17.664809+00
741038814331666432	1226492622617444423	2024-08-03 00:52:42.370308+00
501583707157692416	1133440161670234142	2024-08-03 00:52:18.175743+00
1250429899307483196	1266108553563734147	2024-08-03 00:53:10.005523+00
1007027547705454693	1266143468359778316	2024-08-03 00:52:18.956188+00
1177394183519092796	1211365531073118329	2024-08-03 00:52:19.183936+00
1150462293063245924	721347673873186816	2024-08-03 00:52:19.626129+00
1214902532086833213	1258030644471140384	2024-08-03 00:52:43.105243+00
827098130956812349	1264378143741841511	2024-08-03 00:52:20.810514+00
1169444150605774926	1185200708866289725	2024-08-03 00:53:24.779172+00
959837826801893436	1201299986198036530	2024-08-03 00:53:26.954861+00
1171910131215237161	721347673873186816	2024-08-03 00:53:26.310539+00
769949474084093953	1209918006969503865	2024-08-03 00:53:19.966403+00
864273348497506304	1261865179776286761	2024-08-03 00:53:22.243191+00
1250142934938943578	1241366662142234686	2024-08-03 00:52:22.739394+00
1199508312341872704	1226828213129445468	2024-08-03 00:53:13.056822+00
816837524956643378	1209918006969503865	2024-08-03 00:52:23.300009+00
1250670386774016053	721347673873186816	2024-08-03 00:53:25.414263+00
823184075506188339	721347673873186816	2024-08-03 00:52:33.491905+00
1175880711652261900	1230468832829902848	2024-08-03 00:52:58.287887+00
795749886230265897	1127267129121587370	2024-08-03 00:53:05.716012+00
1092570781009064107	1209918006969503865	2024-08-03 00:52:24.048378+00
956334560386375722	1247844239430254594	2024-08-03 00:53:26.620325+00
1201238090304471162	1261865179776286761	2024-08-03 00:52:49.625707+00
1266898704561078414	1133822935610687488	2024-08-03 00:52:24.957868+00
365204669523558400	1240025784182374450	2024-08-03 00:52:33.924735+00
767152798474960896	1230468832829902848	2024-08-03 00:53:25.146938+00
1007004756880932864	1260607757577355285	2024-08-03 00:53:01.755946+00
1249035520076546115	1209918006969503865	2024-08-03 00:53:16.554945+00
1263613659339423765	721347673873186816	2024-08-03 00:53:26.981473+00
728386557584605225	1127267129121587370	2024-08-03 00:52:50.112792+00
792526365260906506	1133440161670234142	2024-08-03 00:52:26.864717+00
726087516918120482	1185200708866289725	2024-08-03 00:52:58.830598+00
612037962795843655	946800234804166697	2024-08-15 22:26:58.133047+00
1111876644970446909	1230468832829902848	2024-08-03 00:52:50.526732+00
1084799758083833947	1252343120545448039	2024-08-03 00:52:43.96373+00
761995588606230528	1252343120545448039	2024-08-03 00:53:02.022852+00
1009949037740425216	1209918006969503865	2024-08-03 00:52:28.241971+00
1188011131172835350	1234688687414050896	2024-08-03 00:52:28.505763+00
1111876644970446909	1230468832829902848	2024-08-03 00:52:50.559793+00
1187992953638109286	1226828213129445468	2024-08-03 00:52:28.739654+00
1248216293660688486	1258919277449183402	2024-08-03 00:52:44.933632+00
389504068747395074	1201299986198036530	2024-08-03 00:52:28.999905+00
707958007828578437	1201174466886127756	2024-08-03 00:52:34.392655+00
1171676913803202711	1209918006969503865	2024-08-03 00:53:13.213214+00
710227118402961460	1258919277449183402	2024-08-03 00:53:05.832291+00
799162358647488532	1209918006969503865	2024-08-03 00:52:45.032249+00
886432449540808754	1260607757577355285	2024-08-03 00:52:35.670161+00
1096288292615491625	1096289760038883339	2024-08-03 00:53:05.923628+00
859898842120323143	1185200708866289725	2024-08-03 00:53:19.357469+00
869739018055721071	1251322041005506561	2024-08-03 00:53:16.712451+00
763450540276449290	1209918006969503865	2024-08-03 00:52:36.360467+00
1198734566328893534	1197794904043159673	2024-08-03 00:53:08.461081+00
966819050485350450	1240025784182374450	2024-08-03 00:53:10.309075+00
1062875781413486652	1257541366867562496	2024-08-03 00:52:37.429046+00
1249428492429557760	1251675682648625264	2024-08-03 00:53:24.540746+00
871565768603615242	1185200708866289725	2024-08-03 00:52:51.068942+00
1257188501045379072	1257541366867562496	2024-08-03 00:52:38.429515+00
1230788889011290183	1201299986198036530	2024-08-03 00:53:02.761097+00
1260955952442773595	1261865179776286761	2024-08-03 00:52:38.661238+00
818208121532317727	1201174466886127756	2024-08-03 00:53:25.477779+00
1133578686424162454	1133822935610687488	2024-08-03 00:52:51.256894+00
487099917089767425	1059213597307318393	2024-08-03 00:53:11.267977+00
1109148804810276906	1127267129121587370	2024-08-03 00:52:39.858017+00
1111898477258084472	1096289760038883339	2024-08-03 00:53:13.366695+00
750752584859385856	1230468832829902848	2024-08-03 00:52:51.291365+00
508266003797508101	1230468832829902848	2024-08-03 00:52:59.59898+00
735889091564011704	1209918006969503865	2024-08-03 00:53:21.771646+00
1255289918263918593	1241477576757874778	2024-08-03 00:53:15.692405+00
1201265999727575092	1221001878960210031	2024-08-03 00:53:25.380359+00
1239747283382308904	721347673873186816	2024-08-03 00:53:08.996325+00
1258807399528267857	1230468832829902848	2024-08-03 00:53:13.687042+00
797498466494054430	1243192468472856576	2024-08-03 00:53:06.403784+00
1226094086440751175	1059213597307318393	2024-08-03 00:53:03.307046+00
1242821540777562134	1258919277449183402	2024-08-03 00:53:25.879495+00
431492247163371522	1257541366867562496	2024-08-03 00:53:03.441986+00
424780128568999968	721347673873186816	2024-08-03 00:53:06.99065+00
1023361449688584283	1247841972715126844	2024-08-03 00:52:47.54904+00
912803346321137685	1266747240953675889	2024-08-03 00:53:03.531131+00
784287311247835136	1096289760038883339	2024-08-03 00:53:09.051459+00
814133051378499635	721347673873186816	2024-08-03 00:53:09.137135+00
928111752158281749	1059213597307318393	2024-08-03 00:53:11.764355+00
1161481818122502174	1201019455040397392	2024-08-03 00:52:47.895767+00
799014895764504597	721347673873186816	2024-08-03 00:53:00.183934+00
601241875382534145	1096289760038883339	2024-08-03 00:53:00.307648+00
827906181384372225	1133440161670234142	2024-08-03 00:53:15.215717+00
995464018653364267	1252032046029602858	2024-08-03 00:53:13.77199+00
1255236652155015271	1133440161670234142	2024-08-03 00:52:56.792528+00
901315510296277022	1201019455040397392	2024-08-03 00:53:09.159146+00
766928365729873921	1209918006969503865	2024-08-03 00:53:04.175795+00
705266937881690132	1127267129121587370	2024-08-03 00:53:18.362063+00
903684585123119186	1133822935610687488	2024-08-03 00:53:00.616012+00
196102803935068162	1257541366867562496	2024-08-03 00:53:15.228947+00
872953349031481404	1226492622617444423	2024-08-03 00:53:09.450363+00
1234581611983536199	1241477576757874778	2024-08-03 00:53:09.475488+00
965662287799136256	1226492622617444423	2024-08-03 00:53:19.545348+00
549369855367970826	1133440161670234142	2024-08-03 00:53:06.995055+00
1039889083394183198	1260607757577355285	2024-08-03 00:53:19.227909+00
857153794084962344	1133440161670234142	2024-08-03 00:53:13.956697+00
1040411640522342523	721347673873186816	2024-08-03 00:53:22.923695+00
870508652363124746	1247841972715126844	2024-08-03 00:53:09.516882+00
1214792621923246114	1260607757577355285	2024-08-03 00:53:09.695471+00
1247868333731352718	721347673873186816	2024-08-03 00:53:21.261772+00
1236027126419816458	1226492622617444423	2024-08-03 00:53:16.568273+00
773609315314827284	1059213597307318393	2024-08-03 00:53:15.321017+00
828095530751229952	1209918006969503865	2024-08-03 00:53:17.417093+00
1219335527476629676	1209918006969503865	2024-08-03 00:53:22.085968+00
629805357732200449	1221001878960210031	2024-08-03 00:53:24.902266+00
1269050562809303150	721347673873186816	2024-08-03 00:53:23.820934+00
808132565206040607	1251675682648625264	2024-08-03 00:53:23.826871+00
1211447795907563602	1133440161670234142	2024-08-03 00:53:25.524418+00
1241859669341896805	1235302576459616367	2024-08-03 00:53:25.597695+00
1057641059238301848	1185200708866289725	2024-08-03 00:53:25.6912+00
1169601140804042842	1266750786478805023	2024-08-04 18:00:01.554149+00
761626793521971230	1256306941899309110	2024-08-03 00:53:26.485259+00
795160256329023509	1201019455040397392	2024-08-03 00:53:26.490707+00
1144020851486904443	1261865179776286761	2024-08-03 00:53:26.621606+00
1113945966995845213	1273716079151022183	2024-08-18 14:32:12.471439+00
987183275560820806	1268777695244980389	2024-08-05 01:09:07.891313+00
1185934752478396528	950153022405763124	2024-08-03 21:36:33.846672+00
1067586499224293436	946800234804166697	2024-08-05 09:57:52.436781+00
1207108276517605411	950153022405763124	2024-08-03 21:32:10.645622+00
957388794208874607	950153022405763124	2024-08-03 22:07:01.045969+00
1125456119519793313	950153022405763124	2024-08-03 23:11:51.723681+00
1269050664416448513	950153022405763124	2024-08-03 21:42:06.837733+00
463367454312235010	950153022405763124	2024-08-03 23:49:25.947776+00
1169601140804042842	1268137490011656213	2024-08-04 09:50:15.931012+00
1256345985341325382	950153022405763124	2024-08-04 17:54:58.62876+00
732530644412006460	1202055026797707316	2024-08-05 17:34:14.71187+00
1221770638390198273	946800234804166697	2024-08-05 07:12:35.365136+00
547882311983824907	950153022405763124	2024-08-04 23:25:07.77968+00
1251957547842146386	1257723151580659852	2024-08-05 15:26:27.902275+00
732530644412006460	950153022405763124	2024-08-05 16:15:28.436001+00
987183275560820806	950153022405763124	2024-08-20 03:24:40.87747+00
1248366051956097115	892675627373699072	2024-08-20 22:10:50.204331+00
1262943338340945920	950153022405763124	2024-08-04 02:03:32.905388+00
394152799799345152	1271502845161508884	2024-08-17 12:34:40.640714+00
1207108186260119552	950153022405763124	2024-08-03 22:06:28.119807+00
498250712908562435	950153022405763124	2024-08-05 07:08:35.298274+00
1169601140804042842	950153022405763124	2024-08-05 17:47:35.155099+00
1004023220871114884	950153022405763124	2024-08-05 07:08:54.938638+00
1007624133129023608	672178593371127808	2024-08-05 15:48:39.93205+00
1207108189884252173	950153022405763124	2024-08-03 22:06:34.15322+00
1150485725054242906	950153022405763124	2024-08-03 23:25:40.428034+00
876352806431387738	1257723151580659852	2024-08-04 13:46:51.935606+00
1207108183584280608	950153022405763124	2024-08-03 22:06:37.056571+00
969263509802201098	1208651928507129887	2024-08-04 14:29:51.967883+00
1207108145235624020	950153022405763124	2024-08-03 22:06:46.061447+00
1207108189913358342	950153022405763124	2024-08-03 22:06:47.968134+00
1204272063381245973	1257723151580659852	2024-08-04 10:09:12.813007+00
1207108186365239296	950153022405763124	2024-08-03 22:06:50.047956+00
772342846022877204	1257723151580659852	2024-08-04 11:58:36.674036+00
1207108193147297837	950153022405763124	2024-08-03 22:06:51.472502+00
948573943650992169	892675627373699072	2024-08-04 09:23:48.146861+00
715662341554831432	950153022405763124	2024-08-03 23:06:29.155869+00
864524371167019018	892675627373699072	2024-08-05 09:38:23.316252+00
980550223136972841	1257723151580659852	2024-08-04 20:11:55.657125+00
820661475013820496	892675627373699072	2024-08-05 01:03:48.374683+00
400429809202888704	672178593371127808	2024-08-21 03:18:02.254613+00
743306033144791110	1257723151580659852	2024-08-04 15:08:57.397943+00
852894685729914910	950153022405763124	2024-08-03 22:50:16.445591+00
971464344749629512	950153022405763124	2024-08-05 17:47:39.717933+00
1169601140804042842	1268777695244980389	2024-08-05 13:57:51.831232+00
1261488861599760440	950153022405763124	2024-08-05 01:32:58.928535+00
526341224609742859	950153022405763124	2024-08-05 04:47:32.437308+00
1252001166703853588	892675627373699072	2024-08-04 18:22:02.839071+00
110172019273785344	950153022405763124	2024-08-04 15:21:48.456875+00
894443904508780545	1257723151580659852	2024-08-05 15:09:26.664419+00
908075736131338260	950153022405763124	2024-08-03 23:50:47.489498+00
1220556320713998338	1257723151580659852	2024-08-04 23:12:20.012048+00
1116096066522185829	950153022405763124	2024-08-03 22:52:08.030072+00
948245588296740965	950153022405763124	2024-08-04 00:15:15.814966+00
959438821236301824	1257723151580659852	2024-08-04 15:26:00.451012+00
803074635796709416	1257723151580659852	2024-08-04 15:26:36.710755+00
623369905000939520	1257723151580659852	2024-08-04 15:27:52.17935+00
902397632104759327	892675627373699072	2024-08-05 03:22:25.286334+00
851437466871136256	892675627373699072	2024-08-05 10:13:22.13159+00
1208370307551989761	1202055026797707316	2024-08-05 17:24:38.365295+00
1052833821449539655	892675627373699072	2024-08-05 13:10:22.92874+00
900446386833727489	892675627373699072	2024-08-05 01:46:21.890084+00
598125772754124823	1268777695244980389	2024-08-04 17:58:25.372531+00
838948300664340510	1257723151580659852	2024-08-05 14:48:43.722889+00
290338733423853578	1257723151580659852	2024-08-05 15:28:26.910394+00
971464344749629512	1268777695244980389	2024-08-05 00:53:22.765546+00
840439255708991508	950153022405763124	2024-08-04 08:49:19.034872+00
1184957039764582454	950153022405763124	2024-08-05 07:07:32.351055+00
1169601140804042842	1254536563186991184	2024-08-05 17:50:28.92524+00
1060756015093649508	1257723151580659852	2024-08-04 22:58:23.416764+00
732530644412006460	1254536563186991184	2024-08-05 17:37:19.748049+00
624274903281041428	1208651928507129887	2024-08-05 17:10:27.931358+00
461294830287585291	950153022405763124	2024-08-05 07:10:45.405056+00
704346007000973344	946800234804166697	2024-08-04 11:34:00.281937+00
595239050273619969	946800234804166697	2024-08-04 11:34:12.541119+00
1220724398164803705	892675627373699072	2024-08-04 14:42:17.743517+00
1169601140804042842	1202055026797707316	2024-08-05 17:55:44.650466+00
1164426037267009576	1257723151580659852	2024-08-05 05:05:15.540808+00
153643814605553665	950153022405763124	2024-08-05 03:47:25.287811+00
1234993627407716413	892675627373699072	2024-08-04 20:14:57.917425+00
927168603449614376	946800234804166697	2024-08-05 17:59:09.457373+00
793973654886678555	1257723151580659852	2024-08-05 00:35:56.856816+00
742666571142660166	950153022405763124	2024-08-05 18:29:05.07838+00
756917367870717983	1257723151580659852	2024-08-05 15:19:22.332354+00
1194762394803642421	1257723151580659852	2024-08-05 00:36:30.493581+00
1210066990207868980	946800234804166697	2024-08-04 17:26:05.890641+00
341099790349631491	1257723151580659852	2024-08-05 12:07:14.621755+00
1061235304759054368	892675627373699072	2024-08-04 17:02:38.147457+00
840439255708991508	1257723151580659852	2024-08-05 15:21:05.496438+00
987183275560820806	946800234804166697	2024-08-05 00:04:57.714838+00
547882311983824907	946800234804166697	2024-08-05 00:05:48.746716+00
1137782359371030538	946800234804166697	2024-08-04 17:54:24.31452+00
1065688498516009060	1257723151580659852	2024-08-05 08:55:53.152405+00
853067018747510804	672178593371127808	2024-08-04 18:31:40.812189+00
1069258018258178059	1208651928507129887	2024-08-05 03:19:39.343957+00
971464344749629512	892675627373699072	2024-08-05 03:23:50.25593+00
1035927715548766208	1254536563186991184	2024-08-04 20:47:04.252648+00
1069258018258178059	892675627373699072	2024-08-05 03:25:20.066785+00
903630575062122546	1237285755286454332	2024-08-21 05:05:44.510661+00
274323566021967877	1257723151580659852	2024-08-04 23:50:58.073824+00
1259709597694824469	892675627373699072	2024-08-05 04:32:47.369386+00
946885171049811969	950153022405763124	2024-08-05 07:08:05.313362+00
793851837332979722	1257723151580659852	2024-08-05 15:19:40.257527+00
758918919628521474	1257723151580659852	2024-08-05 13:30:36.832236+00
1185934752478396528	1254536563186991184	2024-08-05 16:30:48.786635+00
1258677310731583529	1257723151580659852	2024-08-05 15:25:49.386357+00
1208370307551989761	950153022405763124	2024-08-05 17:22:27.321535+00
1259940333597360158	950153022405763124	2024-08-05 15:10:19.505613+00
716244627094765609	1257723151580659852	2024-08-05 16:33:21.342159+00
1096131119012913248	892675627373699072	2024-08-20 20:32:02.715208+00
908844177587048458	892675627373699072	2024-08-20 22:11:54.040437+00
1217017901953847376	892675627373699072	2024-08-15 08:00:25.263266+00
972964786839121990	892675627373699072	2024-08-15 12:16:38.529868+00
1191446406272123050	1274163487312187435	2024-08-21 06:15:16.88979+00
392300135323009024	950153022405763124	2024-08-19 18:46:15.587286+00
1067254727252922439	950153022405763124	2024-08-15 04:22:07.929929+00
1243274323402293259	950153022405763124	2024-08-20 19:26:24.736046+00
1143630113385218159	892675627373699072	2024-08-15 05:07:02.8751+00
1074668481867419758	1271502845161508884	2024-08-17 12:26:09.1774+00
901889278441836594	892675627373699072	2024-08-15 11:56:45.427277+00
1225214339703898153	1227408949540552794	2024-08-16 02:29:12.40621+00
1126116113898541066	892675627373699072	2024-08-16 14:03:50.902125+00
1204409132896092244	892675627373699072	2024-08-15 19:34:15.703305+00
682872416191643649	1090069129928654940	2024-08-15 08:17:19.128114+00
1023509711133364285	892675627373699072	2024-08-19 09:43:46.662761+00
750379503179661444	1271502845161508884	2024-08-16 13:23:36.225651+00
828433970798002186	672178593371127808	2024-08-15 06:01:42.818402+00
526341224609742859	892675627373699072	2024-08-20 04:05:26.359979+00
428647094631268352	892675627373699072	2024-08-21 03:24:51.428982+00
1130715311897858180	892675627373699072	2024-08-21 05:52:46.973922+00
1247843122160074782	892675627373699072	2024-08-19 12:54:47.515471+00
1035701528801067079	1149806211735236709	2024-08-20 18:49:06.454206+00
881389274237374514	672178593371127808	2024-08-15 11:16:22.869274+00
1224792108691361840	892675627373699072	2024-08-15 12:52:24.317461+00
1205144211100270626	950153022405763124	2024-08-15 14:42:45.411369+00
485125994244472844	672178593371127808	2024-08-20 09:44:18.830625+00
650800692642185256	672178593371127808	2024-08-16 16:55:35.426361+00
1074668481867419758	950153022405763124	2024-08-17 20:30:59.093097+00
663008787572981781	892675627373699072	2024-08-15 13:50:32.071367+00
435716813746339840	950153022405763124	2024-08-15 13:54:53.024951+00
153643814605553665	1271502845161508884	2024-08-17 12:30:33.59865+00
1188955485462872226	950153022405763124	2024-08-19 18:47:02.958561+00
852784127447269396	950153022405763124	2024-08-15 12:42:39.656685+00
1098175594363109459	950153022405763124	2024-08-15 13:58:57.3751+00
1261648918253670554	892675627373699072	2024-08-20 06:04:30.855975+00
993270265511415818	892675627373699072	2024-08-15 13:40:52.001426+00
1140860891089354762	950153022405763124	2024-08-15 13:55:51.109441+00
776831284369686529	950153022405763124	2024-08-15 14:10:52.095583+00
1195363817459290195	950153022405763124	2024-08-15 14:13:22.931075+00
677138737976705038	892675627373699072	2024-08-18 15:45:44.969361+00
1076711980649418872	892675627373699072	2024-08-15 14:14:05.434223+00
598125772754124823	892675627373699072	2024-08-21 01:09:09.274866+00
750379503179661444	950153022405763124	2024-08-19 23:29:55.18132+00
1122944432648503386	892675627373699072	2024-08-21 00:26:59.525629+00
1196215053771358292	672178593371127808	2024-08-19 22:21:16.12174+00
1148079180743983196	892675627373699072	2024-08-21 05:48:22.910194+00
787556133611110422	950153022405763124	2024-08-17 03:45:31.282491+00
1028065326547607622	950153022405763124	2024-08-15 22:08:12.910355+00
915350867438338058	950153022405763124	2024-08-17 07:29:47.423788+00
1243274323402293259	892675627373699072	2024-08-20 17:59:22.648577+00
461914901624127489	950153022405763124	2024-08-19 22:54:21.724887+00
1201333097556357144	892675627373699072	2024-08-20 22:34:43.039128+00
1233932868871524453	892675627373699072	2024-08-18 17:47:45.425743+00
214753146512080907	950153022405763124	2024-08-18 05:38:46.137775+00
849602306835480586	946800234804166697	2024-08-20 05:49:07.795597+00
598125772754124823	946800234804166697	2024-08-19 10:24:38.835708+00
946606422760779777	1234458732784521327	2024-08-19 20:32:08.299614+00
987183275560820806	892675627373699072	2024-08-20 22:12:19.506823+00
186228036142759937	892675627373699072	2024-08-16 01:43:14.263932+00
1257656486968950857	1266971195761234002	2024-08-18 07:24:59.318035+00
1250088006501798021	892675627373699072	2024-08-20 04:03:10.829039+00
1211541176583458816	892675627373699072	2024-08-19 02:07:32.794335+00
805829765503516703	1274119155431379045	2024-08-20 15:29:16.563899+00
1269370561872527381	1273788483336667191	2024-08-18 21:45:48.970413+00
1008008103880560681	892675627373699072	2024-08-18 10:27:30.183202+00
1183768582505640010	950153022405763124	2024-08-17 19:32:09.835357+00
1023516746637910026	892675627373699072	2024-08-15 17:35:11.133586+00
831953870133133332	892675627373699072	2024-08-20 16:38:12.961146+00
1192129759153508467	1225213988976066661	2024-08-15 20:50:32.949622+00
1210027683938041876	1273788483336667191	2024-08-18 07:57:51.007993+00
1270597534267478108	1274119155431379045	2024-08-18 11:00:07.718906+00
824791760873848854	892675627373699072	2024-08-16 23:07:40.773229+00
1203519863818289155	1234458732784521327	2024-08-17 22:49:55.989102+00
1033685488290242600	1239885748484964362	2024-08-18 10:52:07.781716+00
1247162740477395006	1088761100503371839	2024-08-20 14:01:00.673872+00
1109161254142103552	672178593371127808	2024-08-17 11:29:15.771957+00
1224778946197848155	1265355781369495714	2024-08-18 17:39:51.191676+00
1106762924850151455	1236930028172873769	2024-08-16 23:59:45.467464+00
1156627914473869314	1274119155431379045	2024-08-20 10:17:17.338164+00
1169280230830129162	1274119155431379045	2024-08-18 15:01:42.979542+00
863914425445908490	950153022405763124	2024-08-21 04:08:32.162116+00
1206722706029019166	892675627373699072	2024-08-17 22:51:37.822722+00
830322254281179157	892675627373699072	2024-08-18 17:45:48.254436+00
1241433293098979398	892675627373699072	2024-08-18 07:31:49.062516+00
1004857528120774697	950153022405763124	2024-08-15 17:44:59.144607+00
1239529851023654922	892675627373699072	2024-08-18 00:45:36.484696+00
1169689925550096419	1274119155431379045	2024-08-18 11:28:25.546461+00
1188911812582850622	1234458732784521327	2024-08-17 19:09:07.985144+00
187747524646404105	950153022405763124	2024-08-20 21:34:49.938514+00
818948567024664637	1234458732784521327	2024-08-17 03:30:31.625172+00
685621340325281794	1274119155431379045	2024-08-18 23:28:25.022478+00
1208665338842189836	1234458732784521327	2024-08-17 19:10:34.737388+00
1240557661565616193	892675627373699072	2024-08-16 14:30:41.759043+00
1140366514608930866	892675627373699072	2024-08-18 17:55:08.117522+00
1169292197561114755	946800234804166697	2024-08-17 14:22:50.694625+00
1007675097278058536	1234458732784521327	2024-08-17 19:16:07.393819+00
1125516730068893807	892675627373699072	2024-08-17 16:15:55.737538+00
187747524646404105	1271502845161508884	2024-08-17 12:07:04.312904+00
1095534976776278126	950153022405763124	2024-08-18 00:46:24.621836+00
739036393866657843	1274119155431379045	2024-08-18 11:54:52.307877+00
1032009419845799957	892675627373699072	2024-08-20 22:12:14.878008+00
904841106896850976	950153022405763124	2024-08-17 03:46:39.786209+00
1241433293098979398	950153022405763124	2024-08-16 02:59:20.955682+00
1115955887962607616	950153022405763124	2024-08-16 02:59:32.28371+00
652276932599349299	892675627373699072	2024-08-20 03:32:46.645838+00
763919195209334794	1212376692098867240	2024-08-20 10:36:27.758683+00
1143660517928476783	1273788483336667191	2024-08-17 23:39:59.330246+00
1193361881239392338	892675627373699072	2024-08-20 22:11:42.316715+00
1234103913964376094	1274119155431379045	2024-08-20 17:38:26.629883+00
598125772754124823	672178593371127808	2024-08-18 06:16:03.336582+00
821133016956272641	946800234804166697	2024-08-18 04:39:26.243177+00
888785714391687188	946800234804166697	2024-08-16 03:08:42.722791+00
727572298101686323	1239885748484964362	2024-08-18 11:07:07.403173+00
994736882938302494	946800234804166697	2024-08-18 04:42:50.687004+00
1123197290904035349	892675627373699072	2024-08-17 20:11:26.659772+00
731935983389638739	950153022405763124	2024-08-16 17:49:36.149108+00
966424592832929852	892675627373699072	2024-08-16 05:37:24.040814+00
1173899303773806621	950153022405763124	2024-08-17 04:06:02.225138+00
1185934752478396528	1196884840633602068	2024-08-17 20:20:29.208333+00
1151541365390454874	892675627373699072	2024-08-20 03:45:27.7477+00
1259426269250981979	892675627373699072	2024-08-18 06:17:30.521468+00
666717997519339540	892675627373699072	2024-08-16 18:09:22.577174+00
1147957138539421699	1234458732784521327	2024-08-17 19:23:19.051091+00
1149009746557407374	1234458732784521327	2024-08-17 19:23:32.056921+00
839673730649030656	1266078689783844919	2024-08-18 09:06:04.834466+00
923109411797471332	946800234804166697	2024-08-20 22:29:17.671631+00
1092245019852816486	1234458732784521327	2024-08-17 19:24:20.862367+00
1255953945734549669	1273788483336667191	2024-08-17 19:24:31.27525+00
1222990766389985412	892675627373699072	2024-08-17 23:02:09.892103+00
1129094748683112518	946800234804166697	2024-08-16 20:24:06.810866+00
838345327597060116	1088761100503371839	2024-08-21 04:50:57.312798+00
808132565206040607	892675627373699072	2024-08-20 03:56:05.893751+00
1173835644347355248	1090069129928654940	2024-08-16 21:44:06.199544+00
1171188191798243448	1271502845161508884	2024-08-17 12:30:20.057437+00
321213230854701057	1266078689783844919	2024-08-17 17:53:10.354259+00
1273719562487070925	892675627373699072	2024-08-18 11:40:29.388353+00
1140836817688596510	950153022405763124	2024-08-17 18:03:09.531543+00
763919195209334794	892675627373699072	2024-08-18 17:16:13.961654+00
1216899169231441930	946800234804166697	2024-08-18 03:03:38.920635+00
546548675086778398	1271502845161508884	2024-08-17 12:33:56.793775+00
960909469846487131	892675627373699072	2024-08-20 18:57:38.316516+00
995150267811115039	892675627373699072	2024-08-18 07:44:48.45033+00
1261367748429217834	892675627373699072	2024-08-17 23:04:13.284531+00
658383534029013024	1273788483336667191	2024-08-17 23:52:32.815853+00
1255552624577613874	892675627373699072	2024-08-18 17:44:12.70601+00
1234874998372569161	1273788483336667191	2024-08-17 23:23:14.878799+00
629068327968309268	1273788483336667191	2024-08-17 23:53:27.562092+00
1129676739480649838	946800234804166697	2024-08-18 11:28:57.763907+00
598125772754124823	950153022405763124	2024-08-20 21:41:42.873146+00
776340527346876416	950153022405763124	2024-08-18 17:20:29.652982+00
980090356253212682	1149806211735236709	2024-08-20 14:53:52.879033+00
595239050273619969	1088761100503371839	2024-08-20 16:32:27.390824+00
1150537103617306675	892675627373699072	2024-08-17 23:49:02.454819+00
1175394503662768195	1088761100503371839	2024-08-19 07:22:49.832685+00
1253239603947769886	1273788483336667191	2024-08-19 19:52:25.390856+00
839000084582367272	1274119155431379045	2024-08-18 11:09:10.72042+00
1271174663011045519	1212376692098867240	2024-08-20 01:46:46.242585+00
1186503186480119810	892675627373699072	2024-08-18 07:39:30.162489+00
1180254793298612314	892675627373699072	2024-08-18 07:40:00.653698+00
1249663639779278919	1274119155431379045	2024-08-18 12:24:51.459809+00
988166215203696760	892675627373699072	2024-08-20 19:39:34.750435+00
1027613946527629342	1266971195761234002	2024-08-18 06:24:32.914266+00
1203651222851031050	1266078689783844919	2024-08-19 13:41:20.083271+00
1243316365440585879	892675627373699072	2024-08-18 09:22:11.266698+00
1234915429470830614	892675627373699072	2024-08-18 08:19:11.914603+00
304331226993655809	672178593371127808	2024-08-18 11:24:26.013191+00
800859291129086023	1234458732784521327	2024-08-18 12:19:35.575583+00
1155728679574458438	1273788483336667191	2024-08-18 12:34:01.995317+00
1013228328162951188	1235421796099035197	2024-08-18 15:45:11.209715+00
848934114316779560	892675627373699072	2024-08-18 10:58:54.397461+00
974445354386870292	1212376692098867240	2024-08-21 05:39:45.119888+00
845595231071109130	1274119155431379045	2024-08-18 11:55:31.485498+00
1210027683938041876	1266971195761234002	2024-08-18 17:41:27.037816+00
1155728679574458438	1266971195761234002	2024-08-18 15:25:10.078183+00
768137328765435995	1274119155431379045	2024-08-18 11:19:50.729432+00
966058785577787523	1274119155431379045	2024-08-18 11:57:32.638123+00
929070138840469624	1239885748484964362	2024-08-18 11:23:44.793235+00
1233680175225638913	1274119155431379045	2024-08-18 12:16:28.825083+00
1261972871824015402	1274119155431379045	2024-08-18 12:18:24.425893+00
1208472692337020999	950153022405763124	2024-08-19 12:44:33.468851+00
1259178062990409728	1274119155431379045	2024-08-18 12:32:45.726913+00
1130715311897858180	1274119155431379045	2024-08-20 14:54:44.326746+00
1259709597694824469	950153022405763124	2024-08-20 01:27:20.656437+00
1230019130435043421	1274119155431379045	2024-08-18 12:52:49.610923+00
1268194680160522364	1274119155431379045	2024-08-18 12:53:56.458515+00
1075883198044700802	1266971195761234002	2024-08-18 15:17:34.125445+00
939108469859029072	892675627373699072	2024-08-18 12:55:59.903702+00
1234915429470830614	950153022405763124	2024-08-18 13:00:28.569561+00
1123288481989411088	892675627373699072	2024-08-20 00:58:00.50573+00
1130715311897858180	950153022405763124	2024-08-18 16:04:34.149446+00
977260193022869504	1274119155431379045	2024-08-18 13:19:19.884654+00
783694856773566484	1265355781369495714	2024-08-18 13:19:18.059268+00
714189735995899906	892675627373699072	2024-08-18 17:13:50.501154+00
743720550601457674	1265355781369495714	2024-08-20 21:28:06.421935+00
1167616508566970427	892675627373699072	2024-08-20 01:11:13.094987+00
1137027060448116858	1088761100503371839	2024-08-20 15:54:14.01803+00
769375821403521054	1268731443748671640	2024-08-21 05:18:27.052265+00
792763959686070322	1266078689783844919	2024-08-20 13:40:58.603599+00
1273194586310967355	1266078689783844919	2024-08-20 17:29:31.084044+00
1135848221395124275	1266078689783844919	2024-08-19 06:02:44.458369+00
1082683210808426497	1274119155431379045	2024-08-20 15:30:09.374993+00
1246860116494520389	1266078689783844919	2024-08-20 21:02:54.180441+00
1252782146100269126	892675627373699072	2024-08-21 01:01:44.17536+00
862948175903981588	1265355781369495714	2024-08-20 20:09:58.178824+00
1219685486923091991	1212376692098867240	2024-08-18 14:54:23.242927+00
659805906812403793	672178593371127808	2024-08-20 22:50:36.725858+00
715618943703711834	1273716079151022183	2024-08-20 03:08:17.026202+00
1209522466104418324	1274119155431379045	2024-08-18 14:55:03.730156+00
1234915429470830614	1265355781369495714	2024-08-21 02:26:28.366883+00
674258541275512864	1231607483030569030	2024-08-20 11:10:33.913204+00
1178289744094953472	1265355781369495714	2024-08-18 15:09:43.79399+00
1112052025170071662	1239885748484964362	2024-08-18 16:13:46.470742+00
1201608044715458726	1213202524526608394	2024-08-18 15:49:50.801009+00
662782294691676181	1088761100503371839	2024-08-19 08:48:04.76216+00
1094530287708418098	1234198250995712073	2024-08-19 18:45:21.538149+00
1149777134580146306	1274163487312187435	2024-08-18 19:59:50.999965+00
616464767649054721	892675627373699072	2024-08-20 03:32:46.90463+00
1248829149607493682	1212376692098867240	2024-08-20 22:10:30.036263+00
1215374134586900571	1088761100503371839	2024-08-18 15:36:26.464458+00
1034793618516492358	1273788483336667191	2024-08-19 10:35:20.081216+00
913253864868806657	1265355781369495714	2024-08-18 16:26:18.157557+00
1253977009948983316	1088761100503371839	2024-08-20 13:42:46.255989+00
1175156471563046953	1274163487312187435	2024-08-21 06:14:56.665539+00
1269370561872527381	892675627373699072	2024-08-18 13:55:16.447644+00
1218579727024132187	1273716079151022183	2024-08-19 02:38:03.99028+00
763919195209334794	1234198250995712073	2024-08-20 20:29:31.131647+00
537642913316864012	1231607483030569030	2024-08-19 20:20:48.405119+00
1167152583018823804	1231607483030569030	2024-08-20 19:01:08.224129+00
1267489477073567887	1234198250995712073	2024-08-18 20:14:29.139131+00
768138814824644618	1088761100503371839	2024-08-18 14:52:49.607544+00
672818677208580137	892675627373699072	2024-08-18 15:38:36.911417+00
1059918479198789723	1231607483030569030	2024-08-19 16:07:16.836494+00
714189735995899906	1212376692098867240	2024-08-19 02:39:18.099391+00
1229816424378404916	1088761100503371839	2024-08-18 18:02:19.196969+00
1256570500096725074	892675627373699072	2024-08-18 14:25:54.693635+00
714189735995899906	1273716079151022183	2024-08-19 21:09:32.638854+00
964257094167560324	892675627373699072	2024-08-19 21:00:38.206794+00
1189082348239724614	892675627373699072	2024-08-18 15:27:54.255842+00
1255358354629464104	1088761100503371839	2024-08-20 02:24:59.735321+00
997329289215213610	892675627373699072	2024-08-18 15:55:17.717209+00
1239332931844182046	1088761100503371839	2024-08-19 14:43:53.652818+00
1060946221100974141	1106672219091910697	2024-08-19 01:47:23.760565+00
849602306835480586	892675627373699072	2024-08-20 05:45:12.792862+00
304331226993655809	946800234804166697	2024-08-20 10:47:13.868763+00
1215924897864355950	892675627373699072	2024-08-18 19:23:47.10044+00
947477095355912264	1231607483030569030	2024-08-20 21:27:14.902429+00
1143660517928476783	1266971195761234002	2024-08-18 15:44:49.128321+00
923109411797471332	892675627373699072	2024-08-19 20:47:11.405443+00
916014238500257932	672178593371127808	2024-08-18 22:10:51.929035+00
852529137306042368	946800234804166697	2024-08-18 20:52:12.054604+00
1226461060836360263	1265355781369495714	2024-08-18 19:31:19.655245+00
1261780108910526626	1088761100503371839	2024-08-20 00:58:57.215766+00
1230422648773677098	1273716079151022183	2024-08-18 21:15:23.337995+00
1235174668785291338	892675627373699072	2024-08-18 17:12:17.040748+00
1221257502692343879	1239885748484964362	2024-08-19 19:16:15.012607+00
1178022815950188564	1088761100503371839	2024-08-18 19:19:10.865531+00
990419633716727828	1234198250995712073	2024-08-20 12:50:56.277622+00
374376288594558996	1149806211735236709	2024-08-19 04:32:40.314926+00
957388794208874607	892675627373699072	2024-08-18 18:21:33.837897+00
1006867614389256233	1231607483030569030	2024-08-19 19:47:11.330191+00
1213179083442094080	1265355781369495714	2024-08-20 06:06:26.999282+00
1173778699754147911	1088761100503371839	2024-08-19 09:25:56.700515+00
1267569182057304227	1234198250995712073	2024-08-20 02:57:55.356229+00
665423856219193364	1090069129928654940	2024-08-18 22:24:18.350269+00
1193267129756155905	1213717688791203860	2024-08-21 05:47:25.14331+00
1260955952442773595	892675627373699072	2024-08-20 22:09:47.544022+00
1207750841390596187	1239885748484964362	2024-08-19 16:36:57.339658+00
1009120182599430226	892675627373699072	2024-08-19 00:10:18.727613+00
1164243443955011635	892675627373699072	2024-08-19 21:52:37.687201+00
718797209776422922	1234198250995712073	2024-08-18 22:52:58.552486+00
814414698736517120	1265355781369495714	2024-08-19 21:55:55.188435+00
1056558691282853928	946800234804166697	2024-08-19 01:15:39.617811+00
690987523882614904	892675627373699072	2024-08-19 00:10:53.590814+00
890494504233238539	1234198250995712073	2024-08-18 23:25:28.580794+00
889563130584248380	1088761100503371839	2024-08-19 10:20:54.918796+00
967450031810564147	1231607483030569030	2024-08-20 11:44:28.02588+00
1229894772068712549	1088761100503371839	2024-08-20 09:40:26.251176+00
1210205893371629603	1088761100503371839	2024-08-19 01:40:59.245148+00
1053175721297715273	1234198250995712073	2024-08-20 12:32:44.439796+00
732552898231140463	1231607483030569030	2024-08-20 22:46:10.324248+00
1196531377944928328	1212376692098867240	2024-08-20 19:29:00.254715+00
847579302684786728	1090069129928654940	2024-08-19 15:53:04.739868+00
1161753605892747305	1231607483030569030	2024-08-19 21:38:26.81441+00
713259611850932225	950153022405763124	2024-08-19 18:20:02.875921+00
1085400246588293140	892675627373699072	2024-08-19 00:14:33.10162+00
1140056194225025146	1153865015401644144	2024-08-19 21:58:13.672964+00
529010070814457858	1213202524526608394	2024-08-18 23:22:16.649983+00
1096737245429506138	892675627373699072	2024-08-19 10:50:43.576418+00
645742101723742229	946800234804166697	2024-08-20 10:23:37.216795+00
1123618416792707163	1231607483030569030	2024-08-20 13:11:45.592044+00
1237552871055032415	1088761100503371839	2024-08-21 00:56:20.706722+00
814313649522475009	1234198250995712073	2024-08-19 03:17:06.706706+00
1270432386487812140	1234198250995712073	2024-08-19 18:31:47.477659+00
1148685282133155922	1088761100503371839	2024-08-20 00:56:55.138968+00
933682651552952330	1231607483030569030	2024-08-19 21:29:32.960139+00
1248931543708209216	1088761100503371839	2024-08-19 17:10:16.721273+00
1206143459208204331	1234198250995712073	2024-08-20 08:44:21.720231+00
1135495846348214382	892675627373699072	2024-08-19 10:09:08.240342+00
850347079305920542	1088761100503371839	2024-08-20 11:58:46.009502+00
877436879400734740	1265355781369495714	2024-08-19 08:39:01.750521+00
1196584758390554659	1212376692098867240	2024-08-20 04:59:45.403344+00
882789787126362143	1234198250995712073	2024-08-20 07:27:47.895601+00
1009422743151841370	892675627373699072	2024-08-19 10:11:21.897348+00
1035959375820496956	1234198250995712073	2024-08-19 11:20:42.168295+00
1141695454342549525	1265355781369495714	2024-08-20 21:04:44.602773+00
1054313301619769424	1231607483030569030	2024-08-19 22:26:42.476586+00
1129118860394635404	1149806211735236709	2024-08-19 13:02:21.791561+00
1209891557327638659	892675627373699072	2024-08-19 12:08:51.271245+00
858066159068774400	1234198250995712073	2024-08-19 21:10:39.246292+00
1196584758390554659	1234198250995712073	2024-08-19 22:48:53.615084+00
704245254982991922	1090069129928654940	2024-08-19 15:42:24.620897+00
546302644042596372	1274119155431379045	2024-08-19 17:30:38.944209+00
194506501996412928	1090069129928654940	2024-08-19 16:51:38.103822+00
1249271554492338226	1265355781369495714	2024-08-20 20:07:52.515497+00
1202811927638577215	1234198250995712073	2024-08-20 12:21:54.927391+00
1014229179283279893	1231607483030569030	2024-08-20 19:05:04.49366+00
1259165730486616134	1266078689783844919	2024-08-19 16:33:00.381729+00
595239050273619969	892675627373699072	2024-08-20 16:29:58.397285+00
1267823722153246743	1231607483030569030	2024-08-20 19:01:30.197712+00
877436879400734740	1231607483030569030	2024-08-21 06:33:04.624392+00
1162413391617458307	1234198250995712073	2024-08-20 19:20:27.821883+00
1196584758390554659	1273716079151022183	2024-08-20 03:30:10.762779+00
922076621677166612	1088761100503371839	2024-08-20 00:34:48.094567+00
1141296437074874400	1231607483030569030	2024-08-19 21:28:56.696826+00
938063978897231942	1231607483030569030	2024-08-19 22:35:26.418583+00
1014157815344025741	1231607483030569030	2024-08-20 19:20:27.134267+00
744008309346140252	1234198250995712073	2024-08-20 02:20:45.737988+00
986128361313153114	1234198250995712073	2024-08-19 22:59:59.577533+00
1106812014816415846	1234198250995712073	2024-08-20 00:16:11.783823+00
923407311333126145	1088761100503371839	2024-08-20 22:14:27.515169+00
1272140342493446236	950153022405763124	2024-08-20 00:17:40.614486+00
946664786857447474	892675627373699072	2024-08-20 00:57:34.352689+00
747773251413082172	892675627373699072	2024-08-20 03:37:41.37109+00
1261351523171041290	1234198250995712073	2024-08-20 07:14:54.849882+00
1162413391617458307	1273716079151022183	2024-08-20 10:36:21.148336+00
1148002799242719353	1231607483030569030	2024-08-20 02:59:43.573652+00
1128594133552988291	1088761100503371839	2024-08-20 02:43:25.727614+00
1249997106618437653	1273716079151022183	2024-08-20 03:00:45.547949+00
1228750022586273962	892675627373699072	2024-08-20 04:05:41.864306+00
1267061491455099041	1212376692098867240	2024-08-21 06:18:07.355342+00
1109598228900491264	892675627373699072	2024-08-20 03:46:54.126542+00
1207334267487785005	892675627373699072	2024-08-20 03:56:01.781976+00
1137817552882507839	1234198250995712073	2024-08-20 20:29:07.584962+00
1250261892081913939	1273716079151022183	2024-08-20 05:07:26.538494+00
1273029606785552408	892675627373699072	2024-08-20 22:11:59.200787+00
679427226873364504	1265355781369495714	2024-08-20 10:43:19.725365+00
1267569182057304227	1212376692098867240	2024-08-20 10:28:09.144319+00
797577853096820782	1231607483030569030	2024-08-20 22:53:18.765133+00
881648341656694784	892675627373699072	2024-08-20 18:56:14.390531+00
1208524145944694824	950153022405763124	2024-08-20 23:14:03.777483+00
1085193713673838655	892675627373699072	2024-08-18 17:15:34.749329+00
913802608223850567	1234198250995712073	2024-08-20 04:49:28.802897+00
1141695454342549525	1231607483030569030	2024-08-20 13:46:33.301642+00
1190544010486497280	1234198250995712073	2024-08-19 22:59:44.911259+00
1264077499143426059	1212376692098867240	2024-08-20 12:17:09.872147+00
1195361875551059978	1231607483030569030	2024-08-20 18:28:32.840515+00
782193228245762078	1231607483030569030	2024-08-20 22:19:40.296024+00
1059918479198789723	1265355781369495714	2024-08-19 16:06:53.287859+00
1198282718073602091	1274119155431379045	2024-08-18 15:16:57.671447+00
631949075452788756	1231607483030569030	2024-08-18 17:17:33.368171+00
545666311573995521	1231607483030569030	2024-08-19 22:27:04.683207+00
1274816559881125900	1274817235608797254	2024-08-19 03:53:21.552889+00
1025551292216647761	892675627373699072	2024-08-19 20:50:13.239923+00
1159303519573127229	1266078689783844919	2024-08-19 03:54:41.961119+00
1199771404506243193	892675627373699072	2024-08-18 16:37:40.756579+00
715618943703711834	1234198250995712073	2024-08-20 19:49:33.549844+00
732552898231140463	1265355781369495714	2024-08-18 17:39:34.262181+00
868185740796899359	1266971195761234002	2024-08-18 15:17:54.280675+00
1204095658341048320	1266971195761234002	2024-08-18 15:27:46.986128+00
1171921756563451964	1088761100503371839	2024-08-20 21:15:25.988245+00
1236785224978006088	1239885748484964362	2024-08-21 03:30:47.94453+00
959184871966797885	892675627373699072	2024-08-18 15:51:18.457112+00
1216217777744904232	1088761100503371839	2024-08-18 14:00:14.62085+00
985199981721948210	1234198250995712073	2024-08-20 20:23:07.91193+00
1011873354552197130	1273716079151022183	2024-08-19 02:40:01.137987+00
1000370404583538818	892675627373699072	2024-08-19 03:02:39.120731+00
1136358788090302584	1088761100503371839	2024-08-19 00:23:31.771188+00
1250429899307483196	950153022405763124	2024-08-18 20:38:31.969509+00
1203024966023381073	1273716079151022183	2024-08-18 13:56:09.936231+00
895574092307128350	1231607483030569030	2024-08-20 09:10:12.286041+00
971703540076658729	1088761100503371839	2024-08-20 10:22:50.688579+00
1180841403480289400	1274163487312187435	2024-08-21 00:39:53.455103+00
1207075043985854557	1088761100503371839	2024-08-20 10:12:55.13892+00
930831958135677008	892675627373699072	2024-08-19 10:00:33.927879+00
899854009337262101	1231607483030569030	2024-08-19 21:28:58.532444+00
889150082342068255	1265355781369495714	2024-08-18 17:20:34.986815+00
1057338346982101125	1231607483030569030	2024-08-19 21:51:43.424943+00
1146232905429958746	1235421796099035197	2024-08-18 14:10:37.171275+00
773902861763477524	1239885748484964362	2024-08-19 19:15:57.905143+00
1249997106618437653	1234198250995712073	2024-08-20 02:56:14.858149+00
1020287236417269822	1212376692098867240	2024-08-19 23:59:46.666593+00
1123311701207548004	1234198250995712073	2024-08-19 22:43:47.071556+00
990057905942331412	1231607483030569030	2024-08-18 20:02:38.140925+00
1182376960173822062	1213202524526608394	2024-08-18 15:54:12.288244+00
682359033159614576	1090069129928654940	2024-08-19 05:32:01.000532+00
1269370561872527381	1266971195761234002	2024-08-18 17:23:58.503022+00
889150082342068255	1231607483030569030	2024-08-20 15:40:11.011431+00
1239144190361862205	1274119155431379045	2024-08-19 16:28:32.518551+00
1210027683938041876	892675627373699072	2024-08-18 18:24:55.870923+00
1189290835372675142	1212376692098867240	2024-08-20 20:21:34.838424+00
965398241732616202	1234198250995712073	2024-08-18 23:12:54.40698+00
1111850570903470100	1231607483030569030	2024-08-20 22:16:35.359722+00
1216160611906486293	1231607483030569030	2024-08-18 22:11:07.010835+00
1234915429470830614	1231607483030569030	2024-08-20 20:16:01.71034+00
862474209288388648	1149806211735236709	2024-08-18 18:02:06.346928+00
1211838285887053885	1274119155431379045	2024-08-18 23:13:51.339923+00
743720550601457674	1231607483030569030	2024-08-21 06:40:42.011318+00
195932866134147072	892675627373699072	2024-08-20 03:51:22.966773+00
1235558740120305736	1088761100503371839	2024-08-19 01:42:13.42936+00
1274794025601204256	1090069129928654940	2024-08-18 18:20:30.690722+00
856525427685720074	1231607483030569030	2024-08-18 16:21:46.917435+00
1257929624965480510	1265355781369495714	2024-08-19 03:31:07.054233+00
831953870133133332	1088761100503371839	2024-08-18 19:21:22.058388+00
1200638871600381972	1088761100503371839	2024-08-18 21:11:39.85222+00
859169245443260416	1265355781369495714	2024-08-18 16:30:06.781664+00
539560138743480321	1088761100503371839	2024-08-20 16:45:08.13227+00
1130715311897858180	1274163487312187435	2024-08-21 05:41:03.369123+00
1220695923718357015	1088761100503371839	2024-08-19 10:09:46.33453+00
1032934622021038162	1088761100503371839	2024-08-20 19:44:30.689696+00
1141324825449738400	1231607483030569030	2024-08-20 22:45:40.794704+00
1250406033231188024	892675627373699072	2024-08-20 18:56:31.278427+00
884098229384396871	1088761100503371839	2024-08-19 20:59:08.900684+00
1187119045300977866	1273788483336667191	2024-08-18 22:55:19.503443+00
721790075326693426	892675627373699072	2024-08-18 23:22:04.796806+00
679427226873364504	1231607483030569030	2024-08-20 21:58:06.989031+00
1257094751518462023	1231607483030569030	2024-08-18 16:32:25.460173+00
994828418145333348	1212376692098867240	2024-08-19 11:41:29.995472+00
734038643743653952	1265355781369495714	2024-08-19 18:33:16.997352+00
1248837625574461501	1088761100503371839	2024-08-19 15:10:55.010163+00
1201920049967792168	892675627373699072	2024-08-19 07:02:05.084852+00
815915933490085888	892675627373699072	2024-08-18 19:22:26.69114+00
1206767374993203275	892675627373699072	2024-08-19 10:10:26.123118+00
799748077299826749	1234198250995712073	2024-08-20 14:13:09.279721+00
862824763146502154	1265355781369495714	2024-08-20 20:19:26.146194+00
1221340416603852941	1265355781369495714	2024-08-19 18:08:46.538421+00
1208524145944694824	1274163487312187435	2024-08-20 21:51:01.541477+00
1213179083442094080	1231607483030569030	2024-08-21 06:47:00.13939+00
307962269298589707	892675627373699072	2024-08-20 06:49:05.464293+00
812072414640734258	1265355781369495714	2024-08-20 18:40:17.308457+00
843430871868506132	1231607483030569030	2024-08-20 17:02:01.612272+00
995185340321107998	1265355781369495714	2024-08-19 04:32:13.975895+00
1232015740530462896	1234198250995712073	2024-08-20 20:29:34.057352+00
901822492727980123	892675627373699072	2024-08-20 08:22:47.612376+00
846778386559139851	1273716079151022183	2024-08-19 23:45:45.081768+00
1267569182057304227	1273716079151022183	2024-08-20 07:20:41.978253+00
1064983514451300552	1212376692098867240	2024-08-20 00:58:32.535324+00
894222217993388162	1231607483030569030	2024-08-21 01:09:34.548495+00
746271681575911445	1234198250995712073	2024-08-19 02:29:03.277772+00
1271642196084527144	892675627373699072	2024-08-19 23:35:38.415887+00
1014157815344025741	1265355781369495714	2024-08-19 14:21:59.962758+00
1118617398354919434	892675627373699072	2024-08-21 05:48:12.555975+00
1222957525863759882	1265355781369495714	2024-08-19 14:08:20.816187+00
1261243045228318720	1273788483336667191	2024-08-19 10:35:08.186536+00
756376673783513098	1088761100503371839	2024-08-19 08:39:35.561605+00
899854009337262101	1265355781369495714	2024-08-19 12:31:38.413534+00
876470331152408618	1265355781369495714	2024-08-19 17:46:40.475759+00
1017700720486645760	1273788483336667191	2024-08-19 17:28:07.362373+00
714189735995899906	1234198250995712073	2024-08-20 20:21:14.012841+00
1038797112474878047	892675627373699072	2024-08-20 22:13:50.499999+00
1207591452834537512	1265355781369495714	2024-08-19 17:28:31.828894+00
1197136693724192819	1231607483030569030	2024-08-19 19:46:34.551565+00
637962013527638026	1231607483030569030	2024-08-19 19:44:37.229856+00
1244565854692184096	1231607483030569030	2024-08-21 06:46:39.235583+00
1149873411934388264	1234198250995712073	2024-08-20 19:42:07.460757+00
1247161037833244753	1088761100503371839	2024-08-20 14:06:57.173021+00
847852663541989376	892675627373699072	2024-08-21 01:09:42.99739+00
1221108589138153655	1274163487312187435	2024-08-21 00:46:09.886012+00
1149355759478521876	1234198250995712073	2024-08-19 22:43:04.360423+00
1249997106618437653	1212376692098867240	2024-08-20 01:09:40.580125+00
789592100156080128	892675627373699072	2024-08-19 23:50:34.116578+00
1105141268260065330	1088761100503371839	2024-08-20 01:46:22.678256+00
1207591452834537512	1231607483030569030	2024-08-21 06:28:08.385697+00
954475437088718898	892675627373699072	2024-08-20 01:53:53.31129+00
1216049519528251393	892675627373699072	2024-08-20 03:34:07.309872+00
1189082348239724614	1273716079151022183	2024-08-20 03:00:10.300219+00
1167360106665607262	892675627373699072	2024-08-20 03:32:20.293279+00
927400967098478602	892675627373699072	2024-08-20 03:32:27.229594+00
883812278368075777	1274163487312187435	2024-08-20 12:44:30.38372+00
1057397406892826714	1234198250995712073	2024-08-20 18:43:49.291616+00
1128982159366049875	1265355781369495714	2024-08-20 07:06:18.583501+00
798184802267562024	1231607483030569030	2024-08-20 08:19:33.856+00
930266494196133958	892675627373699072	2024-08-20 18:55:45.210232+00
1012019783794962482	892675627373699072	2024-08-20 04:06:54.481188+00
1250429899307483196	892675627373699072	2024-08-20 05:47:49.983531+00
1223035949605457985	892675627373699072	2024-08-20 18:56:15.168684+00
538604845985169442	1231607483030569030	2024-08-20 06:29:49.824279+00
1099366911948619829	1231607483030569030	2024-08-20 21:56:01.735653+00
1057950446939017267	1231607483030569030	2024-08-20 15:40:17.440033+00
1094469475677507685	892675627373699072	2024-08-20 06:29:36.907961+00
1011873354552197130	1212376692098867240	2024-08-21 06:19:47.845968+00
1095357814748217355	892675627373699072	2024-08-20 15:25:30.277938+00
893108216492351538	1088761100503371839	2024-08-20 12:59:40.591991+00
860307561789259787	892675627373699072	2024-08-20 10:54:40.718464+00
791170314733092864	1231607483030569030	2024-08-21 04:57:46.897228+00
1225545336106258546	1273716079151022183	2024-08-20 10:26:15.587839+00
769721799499710504	1231607483030569030	2024-08-20 16:48:38.473553+00
1165466065715871746	1088761100503371839	2024-08-21 04:27:52.826214+00
690889977759793173	1088761100503371839	2024-08-21 04:33:38.461081+00
994686069847117834	1274163487312187435	2024-08-21 05:40:40.33255+00
1222600129983549524	1234458732784521327	2024-08-20 22:26:59.439121+00
911394637929910343	1088761100503371839	2024-08-20 17:56:33.51637+00
1188941915022950460	1231607483030569030	2024-08-20 16:27:11.878124+00
1159195793245360269	1234458732784521327	2024-08-20 22:29:27.761425+00
1013714171709374494	892675627373699072	2024-08-21 05:52:05.230304+00
1272767175106629644	672178593371127808	2024-08-20 22:52:02.66083+00
1017700720486645760	1271741574459691040	2024-08-21 05:57:09.704683+00
1085429478349611009	1231607483030569030	2024-08-21 06:00:08.866734+00
1126781793136300063	1088761100503371839	2024-08-20 15:45:10.781523+00
1107438016127053824	892675627373699072	2024-08-20 11:10:50.597257+00
1113550012996128818	892675627373699072	2024-08-20 18:39:29.559293+00
1124491144567455764	1234198250995712073	2024-08-20 20:23:38.778399+00
1189082348239724614	1234198250995712073	2024-08-20 20:24:29.844983+00
960140100900122624	1234198250995712073	2024-08-20 11:34:57.984382+00
1230422648773677098	1234198250995712073	2024-08-20 12:47:24.777818+00
1182002795574992900	1274119155431379045	2024-08-20 18:40:46.146745+00
1207440787277611121	1266078689783844919	2024-08-20 12:53:35.018138+00
1169420045047312424	1239885748484964362	2024-08-20 14:09:16.861132+00
798144411438678026	1231607483030569030	2024-08-20 14:46:15.665193+00
1119720853949665340	1234198250995712073	2024-08-20 20:27:23.553449+00
1189290835372675142	1234198250995712073	2024-08-20 20:29:26.223851+00
893579946520367135	946800234804166697	2024-08-20 21:09:51.478036+00
1207130869563654190	1274163487312187435	2024-08-20 21:18:48.726+00
1007269696216776775	1088761100503371839	2024-08-20 16:17:18.481313+00
1211100773291794433	892675627373699072	2024-08-20 22:11:34.859022+00
1256776762352992348	892675627373699072	2024-08-20 23:14:37.856755+00
711117164144361473	892675627373699072	2024-08-20 22:12:28.200627+00
1097039770489737287	892675627373699072	2024-08-20 22:12:31.945394+00
763919195209334794	1273716079151022183	2024-08-20 18:45:38.859723+00
1243592066345205819	1231607483030569030	2024-08-20 15:55:47.736531+00
1098175594363109459	892675627373699072	2024-08-20 18:56:02.679978+00
735764003090858075	946800234804166697	2024-08-20 19:28:53.511569+00
1254391499169337406	1088761100503371839	2024-08-20 19:32:42.798726+00
1131457898183135252	1088761100503371839	2024-08-20 19:32:46.327795+00
1270397806598951014	1231607483030569030	2024-08-20 15:32:22.780993+00
1259995427684618285	1274163487312187435	2024-08-21 00:45:59.101374+00
1057950446939017267	1067183988315271239	2024-08-21 06:15:34.722994+00
1227141800871985203	1088761100503371839	2024-08-21 06:45:32.011538+00
1202643199206887507	892675627373699072	2024-08-21 00:56:33.123162+00
715618943703711834	892675627373699072	2024-08-21 03:25:04.624553+00
1200500411757502545	1274119155431379045	2024-08-20 20:12:29.722336+00
1226918236960985108	1088761100503371839	2024-08-21 03:39:28.079205+00
\.


--
-- Data for Name: selfprefix; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.selfprefix (user_id, prefix) FROM stdin;
1169601140804042842	,
987183275560820806	
187747524646404105	
1243274323402293259	
1130715311897858180	''''
595239050273619969	,
\.


--
-- Data for Name: spotify; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spotify (user_id, access_token) FROM stdin;
\.


--
-- Data for Name: starboard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.starboard (guild_id, channel_id, emoji, count, role_id) FROM stdin;
1202055026797707316	1269988492738428971	💀	3	\N
1266971195761234002	1274614446291030026	☠️	1	\N
\.


--
-- Data for Name: starboard_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.starboard_messages (guild_id, channel_id, message_id, starboard_message_id) FROM stdin;
\.


--
-- Data for Name: stickymessage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stickymessage (guild_id, channel_id, message) FROM stdin;
1202055026797707316	1269988490737745993	use ,br create to create a custom role
1202055026797707316	1269988472291328072	you must be level <@&1269988416527929386>+ to claim this gw
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (guild_id, author_id, name, response) FROM stdin;
1254536563186991184	1169601140804042842	pic	to get pic perms rep /higher
\.


--
-- Data for Name: ticket_topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket_topics (guild_id, name, description) FROM stdin;
1273788483336667191	NOT A CULT GET ACCESS SOON	grow grow grow
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tickets (guild_id, open_embed, category_id, logs, support_id) FROM stdin;
1273788483336667191	\N	\N	\N	1274369789678325837
\.


--
-- Data for Name: timezone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.timezone (user_id, zone) FROM stdin;
\.


--
-- Data for Name: trial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trial (guild_id, end_date) FROM stdin;
\.


--
-- Data for Name: trials; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trials (guild_id, expires) FROM stdin;
\.


--
-- Data for Name: username_track; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.username_track (guild_id, webhook_url) FROM stdin;
\.


--
-- Data for Name: usernames; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usernames (user_id, user_name, "time") FROM stdin;
1229545026699264090	doxingskids	1722646367
765826906234683424	emilysupport24	1722721159
838599966367940630	zoe.wentzelm	1722721165
926637236236201984	alantotamoks	1722721178
1045217579683299329	kaliuah	1722726462
1226733263612285049	blalaala	1722738268
821190815799967766	.sukugo	1722738274
1216618686593372181	is7gakb5jwb5rhwb6fv	1722739561
893316860135739393	ju1_.	1722741132
1012421109364305971	.purestcay.	1722746178
656627584574160896	gentlewhir	1722750303
866183443971702806	kwittyval	1722752160
810238078131896380	fuerza.360	1722752346
933410560924602378	ieatdogsforbreakfast.	1722752643
1116719260413210675	larpingcurrency	1722753070
1069089657977061426	unimaginablefantasy	1722753257
1134232881351376956	hyenasfavorite	1722753350
1028065326547607622	cwrspe	1722754103
1199248996095512608	songsforxain	1722754137
1216851335035486270	zayriak.	1722754269
1050212406179147886	purplenurpel	1722755351
1181785991518879766	s7ofia	1722755531
1199248996095512608	attentionseekingxain	1722756551
1176747438799847437	freemyswag5	1722757435
872398839905157130	pussypounder3000_.	1722757497
943193232358117388	yukisfave	1722758288
655965792940064778	gutrevival	1722758802
996277039566962688	zfancyz	1722759138
1088816615870709911	20193f1lymf03v0l	1722759738
827300877617594388	w0ckstxrrr_	1722760346
1148842194652893326	foodbuffet	1722760765
512802834257936411	claw.enforcement	1722761122
1138825656080289836	detachablenakiffy	1722762139
1138825656080289836	xsjhna12	1722762282
1013007050126676090	miyunaners	1722762668
1260243206671564922	gl9ssx	1722763039
1170637329170432054	madeheruseless	1722763141
1171473988564828284	hyyuko	1722763947
1127731451253756025	themelonmanfr	1722764223
1167271484817932319	hiswiickc	1722764925
1210391980501372991	pcxrter.	1722765145
1210391980501372991	sirevampsct	1722765189
1198394776047849545	kuiixla	1722765424
1062899243112738906	meowziesr	1722766555
949199451967356938	sueuxu	1722768271
1255775313523249194	0030824	1722768775
737715550217830511	miayyq8	1722769231
1192247663303852062	wwokee	1722769875
1107424511294451853	reiyeasigimy	1722770298
1223785034583117924	deleted020929	1722770410
1152005409662582977	pwcifysinsss.	1722770455
853789999421325343	fnqnn	1722773305
1150040762973687848	oioioibak7016	1722773803
914611168780369940	.si.ix.	1722773841
1236748320265732268	imlosingmymental	1722773949
242752798725242880	pierceeheart	1722775819
1177383294883602531	soulsevens	1722777105
863106265591709766	inneedoffent	1722777282
848074771849281577	.guiltyx	1722777477
1029369801128300596	hectorboys	1722777554
989265279584436345	cigarettetits	1722778184
1198039842261569678	cwutepandaellaaa	1722778428
845677779147685928	drlsummerroberts	1722778590
1107288169428307999	hitlungs	1722778988
965263078310703164	lembicz.	1722779733
1125516730068893807	14uq	1722780196
584706314635313153	raphaelebita	1722780352
1114938372557905920	skusak	1722780373
1114938372557905920	afternoonharpoon	1722780510
1173792560158875721	trey08_x	1722780646
916264940317339678	rialuvsani	1722782139
633106162916786177	irisflowerswhen	1722783097
916264940317339678	rialuvsherex	1722783184
808593296992763915	batch.update	1722783925
1047260742107275444	homiesexual.milk	1722783941
550803200723386391	morigotracks	1722784203
1119980041296687104	.michiehotgf	1722784383
1143467548650786998	stuckinherthoughts	1722784866
1201435035874627594	tylerr.0001	1722786838
1109580506833621202	pr3ttyprivilegee	1722786982
1090394066912555089	chlosqvn	1722787099
1009378201119756360	princessajuli	1722787202
1012421109364305971	.lostcay.	1722787640
734512545850982511	rottenkiss	1722787854
663108610280259605	hhhhh_444	1722788293
1083256134502207569	lushvst	1722788613
1040101292296646736	kazuucidio	1722789046
886329056042315848	kauyidin	1722789527
1178066454441099315	lovinqqval	1722789889
1205514811430150155	eafgirl.	1722790604
1131711944336879698	.hinaaz.	1722791091
1182832275453382657	.ilikejupiter	1722791387
937521472048615474	evkysvt	1722791488
1075893794312036502	joseff9007	1722792085
931102832508141571	widjdj.	1722792109
869765195122225233	catnisito	1722792836
869765195122225233	sodkasfajsahsjjaksjasd	1722792959
1220556320713998338	geto.vspp	1722793385
1092684803884720138	smokinhapack	1722793741
894933450765795351	rwibbun	1722793968
830061590921084960	undead.vampire	1722794048
1127731451253756025	gameslutt	1722794158
907436814925705297	kysathr	1722795542
1195711555447304232	xstarved	1722795878
1079202406006538341	jay.d9	1722796816
864048318556405760	yoveloo	1722797176
1112832044393824309	.harudoll	1722797179
1093621422674432142	rrcapone	1722797884
1172287521422589955	revengerevengerevenge	1722798834
783840111644508160	bunsizedboy	1722798867
720336192628981842	idgaflowla	1722799006
775130043235303455	arewethrough	1722799758
1057910436055490581	diie4your	1722801113
755544681776939008	tucewuce	1722801707
775130043235303455	iplantoleavetheinterent	1722802843
882341102722646077	whatsaheartt3	1722802969
979010120577065021	kimtaehyungcomepegme	1722803021
1025739540725514260	witchcraftlola	1722804394
835772840376008715	monkeybuttari	1722804543
951241304426299393	zx0h.l	1722805399
1021847755460710420	poeta.torturadaa	1722806696
1004273376430411877	adrislover2000	1722807056
806775164972171264	redstone.academics	1722807264
1162313350269636629	solsstices	1722807370
589214848353566739	luvpawzz	1722807557
799390166900801546	9k11_5874	1722807909
550492777490808854	slutchie	1722808303
1222181645738840067	_leesliee	1722808352
806775164972171264	mercenariezz	1722808489
1134175916680024107	zkaxiacensdqq.	1722808675
1134175916680024107	lusiaxdd	1722808897
1168302712681668632	ilovedext	1722809741
1095823651397455914	r6threat.	1722809922
1109855298409213993	chuusarahabaki	1722811079
1104543036056281099	v1rg1nn	1722811260
1135922824075300934	ittybitttymaee	1722811722
915857291843076157	dwllscig	1722811751
1084133590763327548	9.11.bomberme	1722812547
1181660656433369124	ppunkete	1722815487
1181660656433369124	dolljung	1722816099
1187854446470897756	mnnsp	1722813311
1007827457488994315	fwshua	1722817273
999092836836319295	kyianlovesrui	1722813621
1115745338125463663	.hquntedollq	1722815122
1036588330328014968	kid.rape	1722816582
732310214887342110	k.y.s.123	1722817219
512114978732507137	laceribbn	1722817290
578141849332613121	akillerimp	1722817557
1062487545545490442	zayforlife.	1722817826
732310214887342110	hate.niggersz	1722817953
989543768145420328	koalalana.	1722818093
999092836836319295	kyianlovesmylo	1722818376
999092836836319295	kyianlovesrui	1722818410
1163947465444171787	g6bu	1722819486
1184330992073318501	imtryingmyhardest.	1722819827
1203775794992914488	btw_akz	1722821102
1204184953764577328	genkakunahito	1722821645
809980849252466698	emoluv	1722821728
970112484973350932	1lovetyler	1722821874
1203775794992914488	btwikrm	1722821993
1204184953764577328	genkakunahito1	1722822039
1160249184839024662	syth3y	1722822554
1182097785223385222	mya20000000008	1722822557
920661944900395030	triodramas	1722822692
973788647197380638	dorkdorkdordorkdork	1722822775
932312553416171520	blbrady	1722823396
655965792940064778	despairess	1722823920
933154896058925076	soobinsoobing	1722824115
527622118461014027	pankocrmbs.	1722824136
431183027725664257	sp9des	1722824466
1053893435473543289	4xviinv	1722824859
925096747942936577	the_queerestenby	1722825098
792977432105451540	yrenenenenne	1722825224
1107732753014870066	just7myah	1722825310
925096747942936577	the_superstraight	1722825331
1122175095163592805	9vkn	1722826746
1156803057238151190	vampr0ject_w	1722827555
1092160743861919764	desiredtobehiseboy	1722827870
1220866504300560414	.whayyuikkj	1722828505
1097428353432178728	burntyourlovenotes	1722828896
792977432105451540	sswan_lake	1722829675
786199530337075222	funeralknife	1722829890
1117353327823429663	minhotel	1722830099
897222678065344532	rsy.n12	1722830667
1260955952442773595	ffleexy	1722830997
520999050565124125	dqeu	1722831881
1031295935755603980	only4_kb	1722832317
1259709597694824469	28530	1722832619
928117022804549723	x3jl	1722832809
947518417911578734	ilovemybfmeow534	1722833373
795178278600048650	yas5769	1722833930
520999050565124125	____________0003	1722834212
517558169879445534	fraudgeisha	1722835458
1100625878423195679	diacrse	1722835600
1052345826162245682	hauntingmorgue	1722836680
849367692083331074	moossball	1722836757
1103197519825088523	avewaevy	1722836877
1015976677521764432	.jaixz	1722837325
885047453970235402	teriyxaki	1722837619
1021279773923737611	passthablunttososa	1722837675
1109855298409213993	freakyosamu	1722837821
1138619745441165512	so.saaa	1722837855
816474786233450527	latinoluvrrrr	1722838244
813260675803643904	regret.gov	1722838458
942292714588897301	kiya7276	1722838812
1218309682234654802	yocsarah	1722839234
818851140749885480	strqwberriis	1722839269
1000586297330634793	carvvedb	1722839511
1000586297330634793	reynarenn	1722839554
1000586297330634793	carvvedb	1722839572
945508783805845554	seekforguidance	1722839824
945508783805845554	fworgetpaws	1722840047
945508783805845554	seekforguidance	1722840047
770878110522015774	taekeisan.	1722840294
1165109711713091654	ogforeverlastin	1722840445
867253464420450315	ilikemen2927383	1722840927
1247184438522286234	vamp._777	1722842892
856929930461446186	lxte_.	1722843150
1007155219576135770	soulstains	1722845521
1236402028612423750	mandyyyyyyyyyyyyyyyyyyy	1722846802
862446933510979604	tetsutime	1722846835
960476367462477856	strawberrigfie273	1722850186
792008802483961876	mozeqius	1722850848
1129761776012107867	snipedbyscarred	1722851352
792008802483961876	ajiaoqiu	1722851681
867680031382831174	jungwonsfatass	1722852142
1225908069645549672	leakedisla	1722852817
802161951295406121	fashionkillaaa.	1722853123
1198858307851534448	whokilled_jenn	1722853273
1148501433059127318	covetedgirl	1722853675
859299965804085278	love4milfs	1722854289
1148501433059127318	vyseuuu	1722854543
1016967016462159924	rocco.77	1722855456
874900426904989707	phsychadelic.symphony	1722855707
787696601538756648	.mikotokayano.	1722855707
1086865081859579995	angelichweart	1722857029
717463288144986142	poetiqees	1722857070
901482039881134154	chukiyo	1722857957
589214848353566739	wolverinearmpitlicker	1722858166
1144718437877301258	kggabrielz09	1722859704
1141818075793064038	gorification	1722859756
1012692394778570843	iza.wyd	1722860031
901482039881134154	mocamii	1722860151
964253190893764683	l6cl	1722862274
855804241212866560	1ml.syringe	1722862692
1025739540725514260	abby.pawss	1722862692
1180273187699839007	upth	1722863251
734512545850982511	sexbrat	1722864502
1134844244360695828	emawemaaa	1722866368
873301875712200764	rqqqfeen	1722866619
871371842164777011	.wishyoucalled	1722866922
891583409359568956	wave2neveah	1722867784
781865236499398726	alisparadis.com	1722867878
1111776406528081951	imamentalgirl	1722867915
874727933825155103	gollic_1	1722867939
979704330716327986	dedf1shh.	1722868027
1148017316622258276	ilymstupid	1722868515
1224792108691361840	derangedschiphrenicslut	1722868754
923732223943909406	galaxy_glayzz	1722869930
1169348482008617002	xhhhhhhhhhhhhhhhh	1722870026
1150899779975532635	pawpaya	1722871722
1007286475399897178	skibiditoiletfan19738	1722872593
878210674977820692	s7mmerr	1722872658
895400391771049994	eseo._.	1722874119
1058025676395003954	z0mbiegrll	1722874297
719275031863230534	http.inumaki	1722874453
1047630662133350470	deararya	1722876143
761670860175966239	kllstar	1722876191
761670860175966239	toujourscole	1722876294
977704055843463188	h136.	1722876704
1092931334172839978	awourra	1722877660
923411768888422470	pinksamura1	1722877916
1149083662449639586	blwoddycece	1722878903
1219672999557333112	c0rpsette	1722879033
1007534913442021416	444gore	1722879567
837466526524375050	passmeareefa	1722880771
937018261340569660	closetooyouuu	1722881816
1213924010551672903	zaraxsli	1722881962
959961935883931658	kxllswxtch2	1722882277
1148244484270858250	.restlesswithouthim	1722882278
1147406848689979452	scwenemonster	1723688802
1104626885394190396	_p4rshub	1723689256
1266163322521387108	killaxold	1723689582
1201503308565729300	killaxrewarding	1723689987
1047630662133350470	not.ix.alt	1723690076
1051706357214105691	earlearlearlearlearl	1723691827
748200391098761277	sexologicals	1723692114
692585818035847261	freakycages	1723692505
692585818035847261	stinkleon	1723692625
692585818035847261	freakycages	1723692952
656627584574160896	o__vu	1723693171
668701011137003521	planetofdubba	1723693541
781301244035465276	muichirosno1fan	1723694290
1165781156789243965	kamuiownsme123	1723695354
1051998991920935012	heardthelies	1723695727
992742310410461204	meatballmiles	1723695933
1055289939098619905	theymarrii	1723696019
915757351309545493	yurfavexgf	1723696330
1148294412397465631	i4yves	1723696995
1190485001897250869	kaigoated	1723698543
1159311536830034031	itzzzsleepyyyy	1723698660
1097428353432178728	ypyeo	1723699719
872126705404370974	defacings	1723699800
1171473988564828284	kyyotooo	1723699875
1059681654156820510	tobias_100293	1723700570
1227483370695561236	loveslits.	1723701277
1227483370695561236	qzwmeowlol	1723701375
884970662198935603	iornorder	1723701874
1171060128817094773	kieskey	1723702000
545034922075881502	igotmanyproblems	1723702076
965580421012291585	dwolista	1723702632
545034922075881502	viviantookurheart	1723702642
1116109910707544226	whiteshirtbluejeans	1723702645
1228510120414154762	hachoou.	1723702677
736098138674298920	chvcjg	1723702932
1133934838244712541	gh0uls.	1723703412
1059091118702219335	girlkisser74	1723703415
809980849252466698	topflm	1723703774
880160678588088421	emmviss	1723704025
1003511708217782324	kitkat.katkit	1723707162
1146755006972833803	yalanlixas	1723709084
1111524807201267793	ssuicideonline	1723711201
737715550217830511	lakeso_1	1723711294
1093503527478898739	ryniee	1723711568
858435932185296898	ssuckmydick	1723712709
701973596133654588	andreww84115	1723713222
1101185653166833664	yaenplayz	1723713956
935761554710880276	mksl	1723714659
882178445361184809	borgoyjala	1723714845
1124605861860487198	desirelv	1723714877
849277122610593802	drunkoffpatron	1723714911
1129778837140545536	luvscarss	1723717055
1141029986355138580	aviationairways_	1723718383
1168682931309518943	tojilover12_	1723719590
931100652942290954	jazshusband	1723720390
1065694038327566486	tonysfangirl.	1723720830
899828441506021446	swnci	1723720882
786421185175879680	shewolfz	1723721127
977704055843463188	inmyrestlessnights	1723721686
900541120637976647	gemgalaxies.mcdonalds.worker	1723721888
772780370013061120	sony4_lol	1723722139
1025723646293053450	blep_100	1723722309
1216055126691676163	woundedcuts.	1723723026
1245680066545848411	age.bait	1723723379
1004857528120774697	mqj9	1723724484
1134705942643089489	.omkymel	1723725025
571961110417244162	hanachickenuggets	1723725791
999145658026037329	themostguapo	1723728468
1120689675573661747	bountwies	1723728925
965201507295313980	._.springto	1723729643
921172053346910278	imu._u	1723729916
1161854410612289686	1130201	1723730866
1250538606406406174	zxnewrs	1723731749
1251763725522698251	.yayaballs.	1723734489
1106804550708506676	_lvlies	1723736077
960667948631076894	7misfits	1723736202
916264940317339678	rialuvssho	1723736413
571961110417244162	unconscientious	1723736706
854828702956126218	wangjilover	1723737421
1223268534939811851	aiyayi	1723737455
847898909140975678	real_albinauric.	1723737987
1216820680184561756	juneoir	1723738131
1243274323402293259	evelina.bot	1723739508
789464249260179497	obsessedwithjustin	1723739915
838950502251233300	ryumasfuneral	1723739949
898771887067381790	cutesexyanimethickgirlareli	1723741877
527598530852814851	ivyjnx	1723742563
1057910436055490581	ttrpo3t	1723742763
1183196741617598505	06l7	1723743235
845008767656525885	babystps	1723743479
1241607726539472897	corruptjapan	1723743763
965352588667129886	bllezter	1723744024
1116579599871123467	ppvys	1723745146
1165109711713091654	wyacreedem	1723745153
1203775794992914488	btw_ikrm	1723745527
462067570540019743	myronnz	1723746345
1217657327109537923	playfawn.	1723746470
1201979774113677382	vrblxed	1723746523
1131241152985698324	mylittlej	1723746689
1133890501129535578	kaylaoreo1229	1723746779
835794328721817600	ttitss	1723746924
1086421415110131813	fl9wted	1723747478
1263943354131939379	slays.mlf	1723747960
1086421415110131813	crazybutcutegreekgirl	1723748192
1241607726539472897	pwaisemel	1723748366
1010026272551862362	flickiesandblickys	1723748370
1010026272551862362	deleteherfiles	1723748806
1197225218024947835	ezrandx.	1723749005
572283846339592213	oddball17i	1723749054
1204742065343168565	vxillaiin	1723749317
866435791625388052	aihell.	1723749595
957553525469093889	sassy.fruitcake	1723750047
1217657327109537923	poutypup_	1723750112
1010026272551862362	flickiesandblickys	1723750234
1125120663087230997	fembfie	1723750320
1077076468099719199	kller8181	1723751029
959894788612710420	keiko.oo	1723751575
587288428052217857	xdrago34	1723751637
1208094271865884754	hierarchist	1723752843
1115418190613327932	xx_passivo_xx	1723753111
866435791625388052	fagexterminator.	1723753142
1067254727252922439	refusely	1723753273
1007534913442021416	4gorey	1723755272
1011363240682467400	.qu13nn	1723755397
840389774942011432	.iignoringyourcalls	1723755933
1263943354131939379	byron.mlf	1723756030
1135922824075300934	abi_rizz	1723756075
693607845505138730	beastgohan1.	1723756266
693607845505138730	unknownperson21_	1723756407
1165291601459953737	chiibando	1723758102
1013549652496367626	r0ul3tt3_sh4rk	1723758131
681964073528983594	ovrrthnkk	1723758216
1247904306909413409	creepyssccl	1723758392
1236748320265732268	takara6	1723758566
1197357459522727936	holdingyouclose	1723759982
866596854389407745	scarlittlee	1723760495
1141322011566682184	holdontightt	1723760498
1093207576201678858	ridingcoleforlife	1723760662
945508783805845554	onigirikoni	1723760776
1146134204162261123	salxxz	1723760947
1146134204162261123	.habibisal	1723761063
844707920331538442	vdrasher	1723762063
748860819906756629	yoellv	1723762167
999660052187185233	ccwrruptt.	1723762729
808396532306280489	_curedmysoul	1723762926
808396532306280489	.longhairedghost	1723763087
1063795905989464094	bruisedbvnny	1723763421
1154902358225080350	dessiicakess	1723763780
1077576450997223486	krulzie	1723764628
1175143131449139240	fakelag14ticks	1723765018
1226126949542531152	grlwri	1723765170
1143630113385218159	krissnigga	1723765593
698487471893381160	tu_chinini_	1723766297
1143630113385218159	krissoverflow	1723766363
830061590921084960	akanecore	1723767035
1023328382580170782	5osita	1723767158
877536495949471764	lamemerreur	1723767322
1074102734963355699	his.number1fan	1723767694
1140227900377944105	13kissesfromkitty	1723767774
1001392817706381373	hisfavoritegirl._	1723768115
1125233106912284762	softdoll	1723768448
811122332880994314	angeltunezz	1723769217
659656944331522048	hurtsworse.	1723769615
1222729296074903644	.l1ttlebodyb1gheart.	1723770016
1190303605824163963	ghostmimii.	1723770040
1185002309827186840	shigyraki	1723770163
954147871169585163	hislitldoll.	1723770240
954147871169585163	aslosergirl.	1723770354
1163947465444171787	imspidermanhahah	1723770396
849047775148245052	luvstzu	1723770632
726879847279886337	comracc	1723770957
674781875197313056	.loveeyou	1723771252
662413939249774602	zimpurrz	1723771253
1105257775581364375	cuttingthepainaway	1723771275
1137640423716819054	meowifiee	1723771431
705147972081680454	swtcarolina	1723771432
870762947083919440	suic1dee_	1723771657
1160393217678774372	9lv9	1723771691
1196966794020278323	therealvao	1723772743
750765841003577385	dzeaster_	1723772773
1198039842261569678	koolaidella	1723774355
1090736232872558693	.ffarah	1723775380
447931429515558931	anisxa	1723776367
1243424086714224826	lostangelinsight	1723777372
1185453384329854986	sleepyangel00	1723778405
1054217575086690344	xencatt	1723778695
1004671767886958702	uqerzigs	1723778967
1039870394926125087	yannii3089	1723779476
838950502251233300	blurredthoughts	1723779587
676716000342835200	.abyxsog_	1723779947
692585818035847261	stinkleon	1723780381
692585818035847261	leons.exe	1723780442
692585818035847261	stinkleon	1723780800
692585818035847261	leons.exe	1723780913
1126424755776520203	r_peachy	1723781274
692585818035847261	stinkleon	1723782423
1189872542513627178	kyurowa	1723782817
561677704081047574	carleebelle	1723782954
1006927414477205614	nocturnelace	1723783025
1200930962549264466	ageknk	1723783387
737715550217830511	miayya	1723783486
1139770988742054010	intercourseangel12	1723783988
764197155941515284	xzisa.	1723785350
993974200626847815	palaye.r0yale	1723785815
932486124637663273	amberlikefire	1723787570
561677704081047574	auvoidall	1723788529
735119062585049229	pretty.pinkprincess	1723791365
1191222290034196511	rainy.hearts	1723791396
1000897479300096060	kimmi.satoshii	1723795051
1203775794992914488	kyzz_x0	1723795423
991939612761137182	vangshi.	1723795794
1051244542982094900	jessmywomanfr	1723795839
568553263658565663	illegalwhore	1723796562
568553263658565663	ethansforever	1723796685
1141517572290908232	bloody.nwk0	1723796901
1066681548511916042	ssickfem	1723798576
1201349513814749328	carter120150r91095091	1723798607
1222487547825885194	slutbehavior	1723799191
836156777128001567	everlastingasthemoon	1723799239
836156777128001567	.highbythebeach	1723799550
966751874965471293	yoonsiim	1723800407
870783051519631360	concealmysoul	1723802460
899828441506021446	r6ww	1723803785
1176618594885451900	lucasfangirlll	1723803860
897718994138722324	eveeleeo	1723805166
1126016327967047680	.enzoxdd	1723806018
1126016327967047680	.pwupestopdominant	1723806164
923299067860246588	rottingravecorpse	1723806499
456142160077783040	unfiltered.version.of.yourself	1723806994
1023557052322291752	awecide	1723807300
893612236155785257	topiaszn	1723808059
1063875749033021501	2high4.youu	1723808675
585470841882673166	oubessyx	1723808816
820480374630645761	leehannies	1723809067
964253190893764683	f9ic	1723811163
1009378201119756360	kittypawsjuli	1723811990
806001291708596284	notzayra	1723813890
1089916318100226089	userrjemile	1723815399
1147663977040592966	sebbylolol	1723815476
872284261359693864	hisgorgeousblasian	1723816604
1133890501129535578	kayamwa	1723816876
981278163302768680	.6mar	1723817871
763514122419175434	revealable	1723818233
847015013352996874	depresswhiterabbit	1723818369
1192945960528138250	whonak.	1723818947
547828835496886273	roll.cayke	1723819760
817520415865438248	polexyz	1723820117
1029745304175644702	supa_snack	1723820184
1152931836046094387	alzuv	1723820194
1166097676299927662	evrynny	1723821004
1017331521025216532	caughtinadaze	1723821012
1201405609904439368	.cath3r	1723821824
1037686822425333821	pornstaa	1723822426
1037686822425333821	nwqv	1723823224
1125233106912284762	jaysire	1723823429
882188455550025758	bl4cfther	1723824552
1097299261894447164	therealpawsi	1723825077
882856037961568277	laiiners_	1723827696
1133743204425019532	urfavvxena	1723828296
1081969860176773230	ayvlin	1723829198
797691011773497375	missedyourtouch	1723829325
973788647197380638	exhaleoncethinktwice	1723829908
1079032412601847879	swibbledib	1723830410
1103810150088835103	alexrvas	1723830435
1213370012643885086	tinaryx._	1723830736
704237449655746643	skibidirizzler69420_9_11	1723830829
724990162962087968	.drvgss	1723831308
988275300104298536	.onlyangels	1723831345
994167820680179732	ruoolie	1723831376
775875505114710017	mviyii	1723831622
949784733502558239	._minjii_.	1723831672
1149083662449639586	idkcecexd	1723832347
1241785980382351424	9ceq	1723832464
771453843502137395	pawsvi	1723832465
1149083662449639586	88cia.	1723832531
771453843502137395	kitichus	1723832579
1116953937174614028	bludonmytires	1723833342
1116953937174614028	07sblades	1723833424
1113183473331605685	mrduck.04	1723833614
1191171831554654229	extrtion	1723833629
1183928737130086491	lostss0ul	1723833691
988787667858771990	drugfein.	1723833704
943551317027225640	syciatric	1723833964
1191171831554654229	synapsex.com	1723833978
1255552624577613874	greasylube	1723834029
1067963115993567383	.kyy1	1723834161
1042162126611034133	9marwa	1723834263
943551317027225640	sillyswagkitty	1723834777
1017963004429606954	exs.0	1723835703
1135739749563367424	xwym	1723835770
994575216158179348	childeswifey_	1723836643
1136292462520959057	dylanss._	1723836783
1136292462520959057	dvlanss_	1723837029
1224792108691361840	looksims	1723837289
711163434128900157	reapr_gen	1723837752
833371288314839041	ketchupmeow	1723837778
1004857528120774697	fjlaa.	1723837898
540690202662797342	patient444	1723838123
811664143215755275	.idleanz	1723838565
939055855284924468	bestonlineplayer	1723838681
1178066454441099315	_galaxiess_	1723838687
1146517704430333992	kwiticats	1723839166
1074028283374604398	lacemykorset	1723839513
1178062571698401316	godsllght	1723839642
1204222838446366720	ruinherthighs	1723839763
1148278394686034016	2.6.9.5.9	1723839934
1115746324940341289	poetcupids	1723840129
1115746324940341289	georgiatennant	1723840184
518519459066150922	_angelnet	1723840302
1224151131656032259	jonbonjoviii	1723840344
1163261336499789915	hunchbackpancakelover	1723841244
1028293891763478628	iluvrafomg	1723841307
1170739324267016223	niasoreal	1723841942
1215379347309862946	giantsyko	1723842501
1170739324267016223	ongitsxavier	1723842581
1251204839870955521	texicious	1723843211
991188146127650969	7.18.29.	1723843274
1023557052322291752	pwizda	1723843517
899213094117580810	joohaa_.	1723843591
1230235516079968400	leni44444	1723844115
835772840376008715	eriksfangirl	1723844149
991731670036262974	whoskirah	1723844345
819870189662633984	kyshaylee	1723845541
747861915824554005	.chanin.	1723846206
1165041580302925855	z3n_he4rtzmennn	1723846305
663111989945696307	lowkeyxaw	1723846385
1214288664360656899	ritualbf	1723846405
1099044095676129320	aaaaaaaaaeu	1723846753
801631734445244417	xoxosela	1723847775
968691214926905344	xmelcraxker	1723847947
1079489147162611863	evverlark	1723848246
1209558148852219936	bigbackwadi	1723848699
988275300104298536	forever.angels	1723848988
988275300104298536	.onlyangels	1723849792
709056062057087076	enhaenhaenhaypen	1723849842
1108583678898089994	begoatedalex	1723850142
1173899303773806621	kawaki0001	1723850360
313343441717428224	superstar70	1723850361
313343441717428224	awkward44	1723850597
313343441717428224	superstar70	1723850618
1017331521025216532	20050709	1723850654
313343441717428224	awkward44	1723850696
1129775209205989507	ezra_i	1723850861
518519459066150922	coffeesys	1723850871
313343441717428224	superstar70	1723850882
903485329028296764	yeonkkii	1723850969
1113277189358616586	mistkilistenerxd	1723850976
313343441717428224	awkward44	1723850977
313343441717428224	superstar70	1723850987
313343441717428224	awkward44	1723851100
313343441717428224	superstar70	1723851284
313343441717428224	awkward44	1723851333
313343441717428224	superstar70	1723851445
313343441717428224	awkward44	1723851471
991188146127650969	imliterallymitsuri	1723851839
313343441717428224	superstar70	1723851962
313343441717428224	awkward44	1723851992
1051706357214105691	unknown2203737	1723852016
996638553217966121	bloodstainseverywhere	1723852018
313343441717428224	superstar70	1723852058
1129799328555348038	hurtmyfeeliings	1723852164
691099290029916201	fixatedonyou	1723852690
987690302250823750	klvrsuieo	1723852758
1211832010478452758	realxpvs	1723852770
1118661045536423996	qurveilz	1723852886
1022277742819037266	long_gonejake	1723852950
617840703564677134	silentl.yyy	1723852951
1129775209205989507	ezra_nyik	1723853097
837791595923374140	llonesomelove	1723853397
942635580955721798	ayitseli	1723853979
700734084707516478	hugscutely	1723854845
739833717467513022	fwallen_angel	1723855135
840671821296828416	blondednatt	1723855164
776252825054871582	dnatello	1723855579
1209558148852219936	chainzsww	1723855676
663111989945696307	lowkeylimited	1723856173
1134105763925729310	riinest.	1723856610
879108659307757638	heartablazee	1723856796
1074387770849636493	lacediary	1723857218
942635580955721798	earlsweatshirttluvr	1723857252
949399572189417563	chlo.disc	1723857415
987518977716654120	dollif1ed	1723857679
763136110091698207	fentiva	1723859101
910581414183972894	dearesttscar	1723859432
395695250867486720	zombiecopters	1723860043
922496849720516659	.707angel	1723860072
942635580955721798	ayitseli	1723860530
964253190893764683	8lyl	1723862356
1211028759226880092	carlitos123_357	1723862894
786199530337075222	onmydagger	1723863259
1071483805887627375	destroyedwounds	1723863580
1194324450905165946	mixedpwncess	1723864096
1170329565168676941	hurturselfxd.	1723864129
1089824983708073995	sahdaskjldhasjkh3425kjh345jk34hj	1723864138
987206213370540032	mysicklove	1723864342
929504080777330708	anne.case143	1723864965
429765886686003203	nayeonpop	1723865423
1111776406528081951	flunkc	1723866898
1226647061990998066	abuseheroine	1723867152
933484545871867945	desiredxun	1723867585
1070494664173572096	.hurting4him.	1723868403
932708451308671087	catnisita	1723869017
869765195122225233	catnisito	1723869024
1132976344674861087	piinkfent	1723869757
1074102734963355699	abby.xx00	1723869939
429765886686003203	imabouttanut	1723870144
929602946407223338	cernieanne	1723870876
1138236322490880080	unpr	1723871133
866855192096145418	babayaga8698	1723871488
1091826266539307118	pipplp	1723872198
841296631182000148	jonahhhhhhh	1723874030
1177136867393671258	zero_gtfo	1723875460
1146830643976736779	maybe.im.inside.ur.closet	1723877282
999246712436699227	alustsoul	1723878628
776340527346876416	rv6c	1723878646
776340527346876416	fraudscrlpt	1723878753
833371288314839041	ecl1pzex	1723878994
1173119305290879069	peachydolli.	1723879516
942452987064897566	holycrapitskarasuna	1723879546
934108396616044565	_xshan.	1723880092
934108396616044565	_l1z08zz.	1723880653
713351938103836703	reversethiscurse	1723881514
816958565377245194	spveck	1723881596
1183196741617598505	ascendancies	1723881838
704660947184123944	erenyaer	1723882400
1254813790634119198	waiahh	1723888390
1105094950615535626	fqurpxe	1723888626
1113183473331605685	bigcoochiedestroyer69	1723890004
1151253077949677641	.66n.	1723892227
724990162962087968	112.824.382.22	1723892645
1194314216895684610	rrlay	1723893566
852591192130191411	bwurnout	1723893714
852591192130191411	sweetlaced	1723893820
789592100156080128	hxpear	1723894316
1254813790634119198	crwei	1723895193
686482847933923359	rinnychuuuuu	1723895842
686482847933923359	rinnythewinniethepooh	1723895936
1112181284723240960	blewmy9	1723895991
945965903688921128	smearedwithblood	1723896067
1022277742819037266	jada_thecutest	1723896536
760571876979769444	44mia.	1723897841
983245787041497108	doorrwww	1723898875
810719692943261748	_psev	1723902383
802091724934479882	.000143	1723903090
1074668481867419758	s4nica	1723903181
717112274757746710	lb2229399399003	1723903426
1043721488622178336	deeperlake	1723903724
885650922565414952	hookergirlydude	1723903872
1087024851098816595	reprase	1723905281
1065090148498407424	iikazrn	1723905544
1164164778978181120	backstwabbed	1723905809
395695250867486720	roflcoptah6	1723905869
656996558910390292	toby_opium	1723905966
1242165978289406002	aceclears	1723906358
672731347508396033	yannuhizme.	1723906362
729213108383645756	outgrimes	1723907072
1190048102258851925	bloodydesk	1723907234
1187863283168985154	ak69nl	1723908015
627757677518389248	dragul.a	1723909496
1003649580627411014	.wav3s_	1723909502
901531691468849152	5jla	1723909782
1078127587349504080	3.drpepper	1723910425
667189385149546546	pettyemo	1723910566
579265867406245888	polaroid27	1723910781
886710940005961768	.petitgirllee	1723910785
1139920927434489956	lolamamii	1723912566
1058042275181105242	oxuns	1723912713
809978440270217268	lesky9165	1723912784
1261794642047799336	configkruzi	1723913030
1167794415453089893	m1lkyri	1723913185
832028895296487474	misty.hq	1723913408
748160383281266748	walangusernamed2	1723914003
431183027725664257	6ades	1723915669
1093951853676466227	nixghtmared	1723915823
929504080777330708	111bliss	1723915925
1259709597694824469	btcjq	1723916087
1122944432648503386	sjejsjsjsjsjjs	1723916404
1042162126611034133	9mazy	1723916413
1194314216895684610	xst4c	1723916508
1177136867393671258	overdose.wrld_	1723916685
1143195047261655040	memokawaii	1723917170
1274343771223625748	CashBot#6689	1723917237
1006580513416429583	i.am.tao	1723917524
1236802415748190282	avdvz.	1723917958
667189385149546546	freakvampyre	1723918071
738680445566320711	legdivorcer	1723918769
1118661045536423996	iwatchsilentlysleep	1723921054
831351125541781506	kia4aa	1723921535
989603394115227679	.sslweepyy	1723921620
1143039351077474305	bipolaristt	1723922016
1093503527478898739	ryrimu	1723922018
923768561363746816	poptart584	1723922074
863758032914350080	seraphic.reverie	1723922573
863758032914350080	cvezeeus	1723922759
1019338028717723698	his.gonerx	1723923036
1067972675701588038	itsmeee.___	1723923241
965352588667129886	uursea	1723923978
831351125541781506	blehforleh	1723924594
891024405528981554	437882767737m	1723924644
1138236322490880080	unexcused	1723924992
1139920927434489956	jaydensmybaby	1723925034
700080477872324789	sexvictims.	1723925143
994296635842642020	bwaieesw	1723925405
895727999532548146	iluv.xanax	1723925768
933138092339122196	cashinzia	1723926089
793910171150581781	rolexx4658	1723926089
269566447326461954	anthonyy_angeldust	1723926108
1194135419508494346	.chaitea.	1723926679
988827333744001074	exuberant_kitten_6969	1723927532
1081969860176773230	aiblover4000	1723927661
1211832010478452758	zzazzaazzazzaazzzazazzaaazzazaaz	1723928435
842441176593203220	d7tz	1723928791
974863316893720636	2kzia	1723928894
1045452453757341776	tiyq	1723929026
1139197025385189437	hishooni	1723929069
1045452453757341776	internallyruined	1723929087
1183928737130086491	sleepykittenleyy	1723929236
1128812109770268782	.fakeicia.	1723929548
1113914373249957898	kissableboy	1723929623
890694479735054376	hannahzxn	1723929726
511267665591926806	iwroteyoualetter	1723929861
1128812109770268782	condonica	1723930480
967542650662174730	sizify	1723930762
1048945046440919080	bunnyrabitoli	1723932011
895727999532548146	miss.puffpuffpass	1723932397
991084121977663559	.blazedgenie	1723932603
1006291861117341790	queefmaster431	1723932669
991084121977663559	nerd.liciousz	1723932877
1176747438799847437	adamsandlernoticemepls	1723933381
1003847837974528091	dangerouscheonye	1723934044
955616362066243624	beauty1nd3ath	1723934146
1202148756758478848	galorings	1723934852
884894495114661929	skullztheone	1723935084
874782276809027625	wuzxa_	1723935419
1024393888892465182	.faelvs	1723935891
1004273376430411877	tojifushigurostittiemilk69	1723935987
1202148756758478848	londonsgf	1723936338
1023328382580170782	prettyghostgirl	1723937105
1202148756758478848	galorings	1723937913
756411707701723186	chronicallytired.lmao	1723938537
1135456762301001759	.miskyo	1723939142
1120870078729162813	jay444jay.	1723939541
997587805096136725	cursedd0ll	1723939632
725820609661108314	maniiacc	1723939642
1005475763706941501	c4sh.arii	1723939865
1255482607290810369	prettyprincess182734	1723939904
1103467530816868473	luvilenz	1723940099
1057185308531241000	dearlynakahara	1723940616
1180141745955143741	6gsz	1723941296
763450540276449290	sukug0	1723941732
1046228617253888030	.livewithoutyourlove	1723941860
827950722418737152	emonnie282	1723942853
872570091038998529	greturr	1723943229
1255552624577613874	nut_grease	1723943297
996166309379330048	codvy	1723948272
1013315276563042425	lilgangstaprince	1723948583
879520585313566752	avidelane	1723950466
1012867322635112629	nocompliaxdxd	1723950537
748383293543809167	finkkal	1723951823
1224241979886538792	insomnicgirl	1723953461
1105029048264044565	luwsttt	1723955837
1144869743006851163	vwmr	1723956526
1144869743006851163	anonymous10101010101	1723956735
1228092938639249514	retracedmysoul	1723956751
960289911678840832	exotkrx	1723957043
1051869183681495081	zwoji	1723958744
832028895296487474	e.goth	1723960064
1257229420280680530	oyioku	1723960302
1032221197171171388	sevynsl	1723960858
1115770502309478460	yoongwzzx	1723961110
1059370788735692820	.itadorrii	1723961576
794841826124890142	lahnnii	1723961743
1213626286099144755	lesbians001	1723961945
1181785991518879766	onndeada	1723962425
842191293723181107	hom1cidez.	1723963723
960289911678840832	nat2pretty	1723964149
842191293723181107	slityouristz	1723964391
1148545678029623316	qvbx.	1723966064
1125198943324745730	k.ot_1	1723966659
1222487547825885194	men_are.trash	1723966714
1017825818665304185	swaxyauu	1723966714
977793068256354304	abelspatek	1723967792
1001532152090996886	extqctguns	1723968265
836060307964690432	nyctxphle	1723968842
1146368422763048990	user_46603	1723969113
1242701426711330838	mrsked	1723969826
1228216192720961617	wockhardttd	1723971097
1076595559755948203	notthedwposned.	1723971384
818110646713319446	anoth3r.livy	1723971507
966328743679389717	kkazek_	1723971671
946233597130588240	donz_.	1723972248
1114705780722122822	feenforit	1723972808
599754647153934346	meo.arz	1723972994
851806688122372106	pearl.4	1723973204
761785081768443904	jemiku	1723973720
617117647221293199	rxxxx1_	1723974200
994477706714550374	eternallytay	1723974308
994477706714550374	f1lthytay	1723976738
394978004855554049	heavensen7	1723976741
748860819906756629	myyoel	1723977742
916256032425115709	cutieeeenl	1723978902
1059091118702219335	maikisser74	1723980041
1257334685777006613	gworepup	1723981526
1056558691282853928	dh1s.g1rlfr	1723981573
1095357814748217355	usernotshocked	1723987109
999145658026037329	pinanganakparapumatayngtao	1723987459
973679944465002496	roxxx.only	1723987609
1142653361984901200	03qhni	1723987732
1038797112474878047	tears.xp	1723987869
973679944465002496	roxxx.only4u	1723987898
1003664489822044284	mimiloloolxd	1723987941
1113336598864597042	.vxmpcore	1723988900
873019462146736138	6unlol	1723989087
1190160994450821222	citylife.ee	1723989462
1061552327011602493	maemeows	1723990531
973168320058646568	ifeelkiss.	1723990733
1149589841886068736	xursva	1723991073
1247904306909413409	kawaiiblasianegirluwudaddysgirl	1723991380
893891937944338442	bananapiee3093	1723991899
920661944900395030	wolverinefanboy	1723992758
994232953691439245	kouta.na	1723993120
994232953691439245	zenaku.yami	1723993382
1027822916517236787	carvdhiswrist	1723993571
861640361667461141	1lyroha	1723993823
1209611727977717822	iioyo	1723993966
1113521744012128336	myyaeri	1723994240
1014571040736825394	miyaalvr	1723994901
1014571040736825394	lucaz.garci	1723995190
1185453384329854986	sadangelsounds00	1723995774
992970949987160155	webgirl.	1723996429
1153140539651276820	.defnotknox.	1723996533
928779902172430416	unwravel	1723997172
868185740796899359	knowjoshua	1723997721
1063531077156737024	dan11ella	1723997885
1074179491255046195	whyamihere5	1723998249
813243607343300634	bleehd	1723998427
767753081692880997	loserpuppyboy	1723998505
794011156435042315	dolletteluvz	1723998519
1122670111698976818	p6rq	1723998547
1014023730994888744	fallen._4ng3l	1723999355
372493704868397056	sasafira.	1724000224
997587805096136725	cursingdolls	1724000500
997587805096136725	babyleah123	1724000510
997587805096136725	cursingdolls	1724000513
1250646109454471188	luniii444	1724000526
1006927414477205614	9.0.7.6	1724000804
886329056042315848	heartgox	1724000922
404006065488003088	aavoidant	1724001483
703846082051964959	lalabop	1724001889
941036494154498061	v3r.ixo	1724001934
886329056042315848	sillymonkeykayla	1724002462
926373724721139713	xoxo.ang3l	1724002700
483278026772316170	twistedphonk	1724002904
945468536439050280	meowmeowmeeoworfijiushcfeurgfdje	1724003108
483278026772316170	htroigsjeldkhpn37	1724003239
1035974362286784584	6wiyy	1724003298
1208524145944694824	monkeychigga	1724004063
1043663176853631117	after8teenn	1724004109
1115076687865057321	goshly	1724004141
655965792940064778	gutteredcuts	1724005261
1116841859898150974	regresas	1724005496
880418258602307636	dev1lshh	1724006106
1108583678898089994	begoatedniya	1724006211
856674632270348298	icedpumpkinspicelattes	1724007006
676251906263220244	valentimes	1724007293
1098012929737109575	katiwuh	1724007326
1112784469376634931	kissofdall	1724007621
1133743204425019532	xenssx	1724008811
478420374963355669	lcx.world	1724008935
1210372926734475264	witheringlyrose	1724009492
775875505114710017	meiyilolxd	1724009673
1161376308870258728	honorablee.	1724009865
760649401911476264	iwuwuuwwu	1724010872
1148501433059127318	sweets11120	1724010994
1065136966401802290	memories472	1724011085
474112608241451009	yeatfy	1724011128
474112608241451009	homicids	1724011152
1199470537441808484	acideth	1724011714
689831638590423085	sethhzz	1724011847
1199470537441808484	purrnine	1724011972
866356722461442068	.xvel	1724011979
866356722461442068	_xcllrz	1724012269
1225663063240347743	.forgethepast	1724012683
808099807339347969	viq6	1724012925
696455460827562117	lunatias	1724012945
763490492431466507	freakyfrog6969	1724013042
1161421809825087568	ilovetoxicspearmen	1724013062
1216055126691676163	begoatedangel	1724013200
1120054541027639296	fehndiii	1724013851
548049311045255170	twistedmybones.	1724014484
863516300327780372	ihateeveryone229	1724014800
685254531415539752	szkns	1724014843
685254531415539752	yqruichi.	1724014887
609334772807761920	biggestmovielover	1724015237
1068916176048115742	r8la	1724015613
1148501433059127318	needypuppi	1724017178
1054056003894792193	candy._109	1724017358
854561113551405116	doyorgias	1724018171
1008499976822870066	6axely	1724019045
592257596249997322	cyclops.123	1724019093
582439528938078228	cxptived	1724019372
1141029986355138580	_luckyisthebest_	1724019926
244917552050864128	c_vy	1724019946
1230298297508429934	.vny1	1724020087
1075745942478794773	megxsq	1724020135
813410967542169652	sydnie_xv	1724021124
1106826423479586816	brook.luvbot	1724021480
1093183278581829683	44sapphire	1724021491
1007094778808254566	.mitsv	1724021519
1194376685949304965	melinvqo	1724022288
696455460827562117	eonromi	1724022665
668332877926105088	sayattokiido.	1724023262
992819806157930616	haunteddesire	1724023858
1059370788735692820	setyourhouseablaze.	1724024362
1090669543933886525	aerindors	1724024613
560190186718232580	yoonjibunnie	1724024884
893579946520367135	minecraftashywashy	1724027263
1095001071274954842	orphicaa	1724028068
849367692083331074	tweekrot	1724029466
1202036252237647932	2be_lost	1724029474
1097252314605166782	onyusuf	1724029832
732399224007950397	xxenzii	1724029859
1179434447091810307	bloodonmyboobs	1724016342
1237049383938293872	yinnniee	1724016348
854561113551405116	cacapedochis	1724018599
952029462130737183	4myoui	1724019173
973537025783365652	ravvnet	1724020140
854096274486984734	edge_the_brood	1724023369
1001532152090996886	iznazi	1724025325
1265173845334298718	silqrs	1724027284
721198996873412628	illrot	1724017497
973788647197380638	idekimjustbored21823	1724023019
1049122095231152148	sinraaq	1724023351
1228878611012911175	yocorpsee	1724024120
949769899029450782	mitskiswife	1724024786
1013257343162662992	cwuore	1724025246
928034836906651768	._qseng	1724026366
920760782814318622	e.eternity.	1724027737
1097671543460470895	.angeliczz	1724028048
755614637021724755	rottingemi	1724028190
937018261340569660	factg0t	1724029030
657014235968045066	wh0sbri	1724029329
989286630147887114	bloodycorset_	1724029919
1224503801122390207	ssezs	1724029997
1097252314605166782	5uryt	1724030447
1190072448230625380	jslvl	1724031080
307469505112834051	xexaras	1724031660
1082337081721892864	jess_isacutie	1724032177
1094469475677507685	stackingmybands	1724032357
714189735995899906	.visabella.	1724032532
1158506432581353483	mksscuad7	1724033315
646715443004047373	m9xt	1724033466
867253464420450315	zoblyrii	1724033941
1190776911035629708	holasoyshell	1724034148
885603954455625808	st4r4elle	1724034648
1233368726187937845	bohoegrl	1724035647
558841010206277672	.sushiitrash	1724035739
805504332358221855	yqey	1724036361
1173075860702646340	egocentrc	1724037182
1083185821387079700	yoursuicidedoll.	1724037269
1124468251410317434	deadlock_pls_freak_me	1724038257
986774049315229727	kylsdc	1724038280
988787667858771990	o72y.	1724038372
969908522609422407	.kissxkizumi	1724038462
480417819326939137	yh123123	1724038668
1235174668785291338	yennsz	1724039182
706348116651016262	brackobama2008	1724039207
943017689201410078	meowsias	1724039966
758144244337868821	1lovebillieeilish	1724040043
1146637979473940521	lostinfraud	1724040318
1146637979473940521	5276120	1724040670
1163261336499789915	k.urumi	1724040706
1216055126691676163	zombiesincali	1724041161
1116863353550282853	whoiconic	1724041658
971004841075806208	ns_gabberh4x	1724042119
1113306237296185425	julianschapstick	1724043702
1173457659182198794	munkyoo22	1724044905
1213924010551672903	zqrha	1724045067
1190072448230625380	authlift	1724045270
1243424086714224826	cuttingissk	1724045603
932288735104614400	offx.zen._	1724046304
1164495763523518464	evaswagg	1724046481
1207042021513240647	extortion_.2	1724047010
662413939249774602	realityisanillusionn	1724047116
1111289940521799690	ss4intmabaitnabata	1724047619
1086421415110131813	ermwhatthesigmma	1724050582
307469505112834051	pookszy	1724050668
1004857528120774697	6821953963145	1724050768
1143467548650786998	amrinhaha	1724051414
1048158937498800198	nevzval_.	1724052171
970434925704654888	soulprncess	1724052262
1241562158232371254	djwrt	1724052590
970434925704654888	cwutesanriogrl	1724054247
1248829149607493682	onlydaizy	1724056226
957307018664890370	embracinng	1724056821
957307018664890370	4.04.24	1724057164
704099212878676053	amyy._s	1724057950
1194862905234042972	aangelzdiorr	1724058556
916343507571077130	leakedvictim	1724061655
624736205350764544	xo.blu	1724063789
1108453100806737920	ilovehassansm	1724063970
1213626286099144755	u.wk	1724064191
1043721488622178336	.angelforyou.	1724064622
687650537025306767	mewgelmon	1724064885
933289038893416449	mzki.s	1724065596
1180792547329708114	hanabicidal	1724065663
1092160743861919764	prettiestboydoll	1724066657
1025130581777985566	hamidabenson	1724066670
882341102722646077	naiirah	1724067413
1047630662133350470	qxbcm	1724067943
539560138743480321	wtftrag	1724068166
748860819906756629	hotandspicylatina	1724068279
1192891200349421630	am_b3rry	1724068715
940834319910445077	nayeonsnumber1fan_889977	1724069299
737620936131346453	alipendrik	1724070096
1060211213897834616	_fighterjet_	1724070280
721198996873412628	r1dealonglover	1724071205
1004684571239002173	pzkg	1724071206
832998473632710656	ak0nlol	1724071225
1004684571239002173	brokeloner	1724071290
527622118461014027	leikoku.	1724072483
1111776406528081951	bbalpacajen	1724072766
885428233649131560	rawjus	1724073094
681596730952646823	9bipolargirl11	1724076141
916343507571077130	edenfangirl	1724076715
1189686090873966824	carmenstinks	1724077211
1001189207802392717	hauntwd	1724077235
1084347432604815462	mozzarelladreams_	1724077796
1133578686424162454	98aeh	1724079331
1183196741617598505	abhoring	1724079571
805718226712526858	gray6605	1724079679
792008802483961876	illunaes	1724079721
1023328382580170782	sombreghostgirl	1724080381
540690202662797342	gwendolynn_rosehearts	1724080471
1189686090873966824	peterratajczyk	1724080702
1258193768390066278	voldwya.	1724080910
1105144029915648121	ur.locall_ka3li	1724080934
955642225923092550	luvrhiiaa	1724080969
1192247663303852062	affectionnn	1724080989
955642225923092550	.vopk	1724081205
1192247663303852062	iisowated	1724081361
907923132407513098	shdwqr	1724081628
854439578610302977	riipkai	1724082615
1140552170660442172	xx.kima__	1724082821
520999050565124125	dreams_lost	1724083289
698487471893381160	la_pitufinita	1724083402
520999050565124125	hearts6131	1724083437
886347672368345088	yqps	1724084107
750379503179661444	youhadyourchances	1724084820
925835195117076500	moon_latte1	1724085340
1226126949542531152	goodlilgrl	1724085922
916256032425115709	fuckdclove	1724086684
1258193768390066278	taxgivemeowner	1724087056
882341102722646077	allysfangirl	1724087075
1059443201410342912	fyozaist	1724087136
1085386053579440179	cia.monkeypox	1724088022
187747524646404105	psutil	1724088137
1017700720486645760	bloodhoundnn	1724088451
817486911581061190	r.intori	1724089144
1153052350177616012	staineddoll	1724089153
1124655380522344589	zalgopaws.	1724089290
187747524646404105	psutil123	1724089603
1201031298584686604	kittykazuu	1724089707
1146134204162261123	justmehabibii	1724089911
1110034507983245354	sznder	1724090050
938989061996179466	sl44pyhe4d	1724090886
1204222838446366720	ruinhergutss	1724090954
1005551421267136572	asdwsdfs	1724091351
419670793656729602	loucolere	1724091516
1125120663087230997	bbyujin	1724092257
1063875749033021501	pvnk_cunk	1724092509
1005883794882039959	1wrth	1724096407
1171473988564828284	312xi	1724100294
738680445566320711	ad0lf.hitler_1945	1724105609
836315847207157810	swaggydood23	1724108007
1165034320277295187	mxklvrs	1724108628
925096747942936577	the_straightesteris	1724109789
1205514811430150155	hhauntedby.eaf	1724092402
860224770788425739	expectcd	1724094590
1273591451800043533	0wrthh	1724096309
1191848067683598429	wrd4liah	1724100274
1048698306127212554	8rra	1724100632
996638553217966121	dweadluv	1724100860
1128800611492696124	stwabewir	1724100964
1252289741429149730	litwlcutie	1724105184
1012122479772323881	creamat1on.	1724110853
1131940146539942051	umiu.u	1724113652
1160393217678774372	s.o.rr.o.w.	1724113717
1131770130062397451	glosticcssss1	1724114671
1205763939279962124	silentstudio	1724092547
1083791244913823844	leftinthecemetery.	1724092597
1135922824075300934	aliezr.	1724094144
994985777563963546	_.xia1.	1724095204
761379455377080370	exuviae.	1724095225
1273591451800043533	biggesthaters	1724096135
857736044316459018	unrevelized	1724096271
861724754712330260	ihaveautism62	1724097696
986589773663727616	whimp6r	1724099485
499657700242620416	lmpair	1724106819
854534240309739550	jayjipie	1724108597
1139197025385189437	eelqa.	1724109542
1066681548511916042	wockyss	1724092606
1087024851098816595	1dge	1724100491
1062899243112738906	ifhy.lia	1724104086
934873204344885348	rizzerr0012	1724105007
1201905820372303884	4coffn.	1724107665
951677186279092225	your_.local_.mha_.nerd	1724092634
615221767241465887	bloodcumshit	1724094003
1051998991920935012	cut062	1724096018
1060647498986827932	z.umii	1724096296
1083791244913823844	urmqmq112	1724093599
887503187282653255	dianabzh1	1724098171
1241607726539472897	ilovemygfn0815	1724100736
775408137178972250	nljaynl	1724102129
1224833676152668185	blowza	1724105996
1048698306127212554	4waa	1724094862
1067641780167778364	yechanns	1724095466
1236748320265732268	ttantalizing	1724103771
855097872458055680	girlfriendofadeadboy	1724104001
1223330167376576693	sleepynesstisityism	1724105207
808099807339347969	99veil	1724105219
1252289741429149730	beggingyoutoloveme	1724105588
1230235516079968400	leni82283	1724106896
725426904974229574	ricetheundead_	1724110555
1005883794882039959	0wrth	1724095516
1060647498986827932	kr.ve	1724096414
887503187282653255	slumptdd	1724098118
781318822341902356	stolenorgans	1724100838
1054217575086690344	tsurinii	1724101115
1168400608382955573	ccutz	1724106728
1178223580098613248	desireezzy	1724098869
759803687366950922	zedaapulia	1724109603
1012122479772323881	thebopies	1724110864
852201792767131699	boo071431	1724111124
1137640423716819054	mazzyyz	1724111334
963533694436524083	99sss	1724111673
551370624799473664	nenigerl671	1724112081
825746455037476927	unirulyyy.	1724112090
1145872613688746015	dark_87353	1724112518
988709852849266758	buttfuck123	1724112795
663403913990504461	domifelesege	1724112971
844766997732524082	forelsket.1977	1724113036
844766997732524082	forelsk3t.	1724113079
593699913498492938	rydlly	1724113123
895451078160695297	soulfreckles	1724113583
598588316287238306	arachnophilia_	1724113810
472491337720266762	river38	1724114101
909333032916365323	komimimu	1724114727
965481215371137114	vill4nuvq	1724115071
1117561156995924110	dariphobic	1724115102
925096747942936577	the_queeresteris	1724115120
1195058714223325226	shiki.zk	1724115132
1067641780167778364	kyuudeds	1724115677
877536495949471764	hangherself	1724116034
775408137178972250	99dayz	1724117255
1133954555105775776	darlynyanei	1724117376
1176618594885451900	hurt0148	1724117719
775561081698910209	sanct1mony	1724118278
525070824055504897	itoshicore.	1724118366
1086045835277635668	lul1qvsxi	1724118722
704715891111362620	.drdroid	1724118840
704715891111362620	leylani23	1724119173
869023689008623686	aurealx	1724119210
821080846299168788	aerigi.	1724119418
1123333321435394070	14blunts	1724119684
1110303151489286306	xlvo.	1724119691
1114667056105783487	23karla	1724119735
1114667056105783487	zdrente	1724120080
1213586377841578018	atleenia	1724120978
1105029048264044565	evsgrave	1724121661
1222973436935147591	hauntsonmz	1724121907
964253190893764683	___zii	1724122107
723307586941747241	.craxherx	1724122182
888267047086211102	horrortalez	1724122190
888267047086211102	horrordustenthusiast	1724122206
928779902172430416	femalefatality	1724122787
887109041673867314	llxznz	1724123529
845677779147685928	inlovewmyhayden	1724124415
972879277630562345	sillykittykiki	1724124842
991921488309530655	prettytheft_	1724125339
802317615363391508	floraez	1724125583
932708451308671087	lastimandolos	1724125880
629084498092490762	.zxwbie	1724125983
920940702702112799	sstarturn	1724126481
1216851335035486270	samzgoof	1724128410
1028065326547607622	mwasyv	1724129492
1150162808298807348	bootyeater2000	1724129856
1156392403385725008	tomuchwockinmysystem	1724130363
883566042578845706	jf.elix	1724130814
916908241177415752	peppronipizza	1724131399
809769032676671519	ava.moon	1724131471
863438924356386846	angel_acoustic	1724131543
709397031180959766	.curehissoul	1724131619
827300877617594388	kxdabouttabag32k	1724132061
962004928325378061	zombiecvtz	1724134250
1032309142901248142	the.true.manipulator	1724134309
1037686822425333821	needycumslut	1724134721
1139059868683219044	niniekitten	1724135049
1147663977040592966	izzygetsilly	1724135080
1077370130654318674	raithful.	1724135159
1245680066545848411	thecountlessdiamond	1724135419
1173899303773806621	decapitating.	1724135488
1146925167075917868	dwesiredlove	1724136684
973788647197380638	linesupmynose75	1724137081
1146967822782705705	maia.io	1724137547
1051869183681495081	statuesque.	1724137607
1251204839870955521	sematarybbqsauce	1724138145
1157363859955400744	bledtears	1724143022
996607643684708514	sadbunny9	1724144041
797430830749581342	belkisokrates	1724146197
863106265591709766	bb4nka	1724146546
1270432386487812140	possessorr	1724146970
1141554328306450614	666kezio.chu666	1724147200
1183928737130086491	imlostfrbutwtv	1724147218
544930342046269466	bigbossbrsk	1724147910
1044713875536355448	mizukaser	1724148245
1148262657963602122	ilikehedgehogsmorethanu	1724148247
763514122419175434	mar983	1724148479
1008130792087633960	sleepyzelly	1724148712
1255552624577613874	vxenaax7zero	1724149757
1120689675573661747	strawbiecake25	1724150465
718565889351352451	icanmakeitworse.	1724151325
1212474474943877181	byfronband	1724151969
972526459698683904	eidssyl	1724153277
896299692202274816	cher.riies	1724153595
769399843931815956	decendeath	1724154798
793577087659147264	1619309	1724155187
853152468674281504	.kuronumaa	1724156222
775123839021088826	itszdesired	1724156597
1030480355624505345	happilittlesealpup	1724156784
954147871169585163	sssilentlvrr.	1724157064
775875505114710017	bleedingthough	1724157427
864229492363755541	jivb	1724157723
793577087659147264	wertixik32	1724159220
904850624368230430	noodlegirl836	1724159813
716583727467200554	aefurry	1724159820
1017656017682706473	.4ish_scv4s	1724161504
943551317027225640	stalledinterest	1724162461
325300878095679488	5mdonkey	1724162726
325300878095679488	.donkeyxz	1724163111
902507281936175184	bubba_5617	1724163497
1189378700232372326	zombie_ellen	1724164183
1220504504387244072	warcreater	1724164588
989194045513400402	aartexyc	1724164734
816037647654584431	imtheactualdrakeyop	1724164885
1272140342493446236	atentiesmecherau	1724165662
736648979789643846	jay.sg34	1724166249
1265792158825451622	4pyramids	1724166366
1246526003652857876	scrumcakeswoah	1724167161
1029870691543166996	saokyu	1724167911
1113521744012128336	awwaeri	1724167966
883322856249901106	marlon_ehrich	1724168309
1265792158825451622	plnkbirthday	1724168355
1161349069453672541	.zoeyy	1724169087
986128361313153114	3800rz	1724169396
1107496850250010645	4ojz	1724170157
742072509016571955	jangwonn	1724170642
1211369062404194305	leavemealone91101	1724170733
1196948276851777726	venpup.	1724171706
1070494664173572096	sobermysoul	1724173191
930240908891414578	lostinhiseyes123	1724174471
804725652703674399	2221112222	1724174653
1169348482008617002	vozrcm	1724175040
816037647654584431	dessolosall	1724175861
804725652703674399	jakx23m	1724175941
1061373095685918770	hx3_1	1724176575
728997074586304533	melodie4335	1724176869
1157712873724858398	aman.x	1724176976
1133934838244712541	.ghouls.	1724179198
900541120637976647	1l0v3y0uuu	1724184012
1001326085729955890	theywannabshae	1724187756
988547074494701628	24blonde	1724190740
808396532306280489	.m8lly	1724179901
1081969860176773230	aiblover	1724180776
1210270057058275448	adamsprincess.	1724181466
1171114067897897052	m14w1111	1724182283
1163947465444171787	splena	1724192097
824412450425143326	chaos_snacks	1724192495
1225908069645549672	cwrsenta	1724179911
1105258832139137095	_kitty11_	1724188365
1105258832139137095	wockluvsme	1724188400
1078127587349504080	drrpepperrr	1724190656
1015944275814518794	kavethamcanonreal	1724195165
942698108113006602	howtoneverstopbeinsad	1724180117
886347672368345088	stripprs.	1724184473
1005152479983456340	diddycord	1724187905
1036588330328014968	55ins	1724180234
968853539587768350	perk4332	1724186639
1107395265398329404	rwemorseful	1724190730
804862405183406102	rileynuggie	1724192701
1143195047261655040	kawaiidoxx	1724180951
1224792108691361840	incels.org	1724184134
988547074494701628	persuadistktty	1724190119
1047630662133350470	16282920372928203792829292	1724181204
820386126388789299	.unwanted.q	1724181635
1191556191193682052	sophiwophii	1724183198
1132509631206391889	ryuzakiz0_o	1724184385
968853539587768350	vehjn	1724187779
1152005409662582977	mwanlpulated.	1724188284
954928686845546606	awwari.	1724194253
1210270057058275448	pwpcutie	1724181283
930240908891414578	gonegirl9628	1724184246
891808468170866739	777unkown777	1724184623
916264940317339678	rialuvsyou	1724185884
1051299755822694451	hesmyvital	1724185898
1182703058975727631	deathbyherhands	1724186599
781318822341902356	tbhjade	1724189232
1196948276851777726	preytoy.	1724191971
497467007361482775	smokinshifr	1724184581
1182002795574992900	smokedmybrainn	1724186618
981165828131156048	kassobean	1724188405
1149832298284449934	sethhlolz	1724189404
1152005409662582977	stuckinhisgrave.	1724188560
1119282942557036575	mamariaia	1724188563
1186100835898368051	erykiq_1.	1724195191
1086045835277635668	1loveqvsxi_	1724195322
863917588215496704	.sativa.	1724195425
596075717435850752	lobotomylvr_	1724195472
1184681600701694024	loveintokyoo	1724195799
815666439695368224	luvqueenmimi	1724200347
821538388808040458	deleted_user_6c8a15e13e1	1724200718
1170329565168676941	nopotentials	1724200848
777674763186733116	ikm.mnji	1724200988
518519459066150922	coffeehehehe	1724201637
1264653183376949310	770973973	1724201638
1123333321435394070	herlustvictim	1724202297
679645308166209575	forsakencravings	1724202478
1136358788090302584	laylaluvd1cks	1724207136
823781680863117322	m0rguekitty.	1724207162
956725448467939369	s084721	1724208732
956725448467939369	aikouia	1724208755
1104234507063808123	sasutoka	1724208772
1136358788090302584	ef123123	1724210408
1125946662792204338	koolazi	1724210457
815995292885188629	gabehales_	1724210713
548852083420430337	gaben___	1724211172
922787691639234582	awwgf	1724211513
1048945046440919080	thatpersonoli	1724214389
801631734445244417	selaxor	1724215006
884488723776028684	yearningforyou	1724215405
707550549150531584	kura09255	1724215745
1241189065533947916	yofavr	1724216211
1022331903388438610	.rinnyluvv	1724216419
968853539587768350	perk4332	1724217089
838950502251233300	attracthislove	1724218664
1094810535511474226	ratokawaizento	1724218840
700080477872324789	85760	1724219063
869765195122225233	lastimandolas	1724219613
770949861088559105	ying0999	1724221217
603407946457677849	berserkerwithguts	1724221401
396491776422051840	zell__bell	1724221720
\.


--
-- Data for Name: uwu_lock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uwu_lock (guild_id, user_id) FROM stdin;
950153022405763124	214753146512080907
\.


--
-- Data for Name: vcs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vcs (user_id, voice) FROM stdin;
\.


--
-- Data for Name: vm_buttons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vm_buttons (guild_id, action, label, emoji, style) FROM stdin;
1268777695244980389	lock		<:lock:1234223571694518333>	gray
1268777695244980389	unlock		<:unlock:1234223586412073011>	gray
1268777695244980389	hide		<:ghost:1234223641869156362>	gray
1268777695244980389	reveal		<:unghost:1234223631056244847>	gray
1268777695244980389	rename		<:rename:1234223687679479879>	gray
1268777695244980389	decrease		<:minus:1234223725004460053>	gray
1268777695244980389	increase		<:plus:1234223750266880051>	gray
1268777695244980389	info		<:info:1234223791949746287>	gray
1268777695244980389	kick		<:kick:1234223809876463657>	gray
1268777695244980389	claim		<:claim:1234223830667624528>	gray
1254536563186991184	lock		<:lock:1234223571694518333>	gray
1254536563186991184	unlock		<:unlock:1234223586412073011>	gray
1254536563186991184	hide		<:ghost:1234223641869156362>	gray
1254536563186991184	reveal		<:unghost:1234223631056244847>	gray
1254536563186991184	rename		<:rename:1234223687679479879>	gray
1254536563186991184	decrease		<:minus:1234223725004460053>	gray
1254536563186991184	increase		<:plus:1234223750266880051>	gray
1254536563186991184	info		<:info:1234223791949746287>	gray
1254536563186991184	kick		<:kick:1234223809876463657>	gray
1254536563186991184	claim		<:claim:1234223830667624528>	gray
1202055026797707316	lock		<:lock:1234223571694518333>	gray
1202055026797707316	unlock		<:unlock:1234223586412073011>	gray
1202055026797707316	hide		<:ghost:1234223641869156362>	gray
1202055026797707316	reveal		<:unghost:1234223631056244847>	gray
1202055026797707316	rename		<:rename:1234223687679479879>	gray
1202055026797707316	decrease		<:minus:1234223725004460053>	gray
1202055026797707316	increase		<:plus:1234223750266880051>	gray
1202055026797707316	info		<:info:1234223791949746287>	gray
1202055026797707316	kick		<:kick:1234223809876463657>	gray
1202055026797707316	claim		<:claim:1234223830667624528>	gray
950153022405763124	lock		<:lock:1234223571694518333>	gray
950153022405763124	unlock		<:unlock:1234223586412073011>	gray
950153022405763124	hide		<:ghost:1234223641869156362>	gray
950153022405763124	reveal		<:unghost:1234223631056244847>	gray
950153022405763124	rename		<:rename:1234223687679479879>	gray
950153022405763124	decrease		<:minus:1234223725004460053>	gray
950153022405763124	increase		<:plus:1234223750266880051>	gray
950153022405763124	info		<:info:1234223791949746287>	gray
950153022405763124	kick		<:kick:1234223809876463657>	gray
950153022405763124	claim		<:claim:1234223830667624528>	gray
1274119155431379045	lock		<:lock:1234223571694518333>	gray
1274119155431379045	unlock		<:unlock:1234223586412073011>	gray
1274119155431379045	hide		<:ghost:1234223641869156362>	gray
1274119155431379045	reveal		<:unghost:1234223631056244847>	gray
1274119155431379045	rename		<:rename:1234223687679479879>	gray
1274119155431379045	decrease		<:minus:1234223725004460053>	gray
1274119155431379045	increase		<:plus:1234223750266880051>	gray
1274119155431379045	info		<:info:1234223791949746287>	gray
1274119155431379045	kick		<:kick:1234223809876463657>	gray
1274119155431379045	claim		<:claim:1234223830667624528>	gray
1274163487312187435	lock		<:lock:1234223571694518333>	gray
1274163487312187435	unlock		<:unlock:1234223586412073011>	gray
1274163487312187435	hide		<:ghost:1234223641869156362>	gray
1274163487312187435	reveal		<:unghost:1234223631056244847>	gray
1274163487312187435	rename		<:rename:1234223687679479879>	gray
1274163487312187435	decrease		<:minus:1234223725004460053>	gray
1274163487312187435	increase		<:plus:1234223750266880051>	gray
1274163487312187435	info		<:info:1234223791949746287>	gray
1274163487312187435	kick		<:kick:1234223809876463657>	gray
1274163487312187435	claim		<:claim:1234223830667624528>	gray
\.


--
-- Data for Name: voicemaster; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.voicemaster (guild_id, channel_id, interface_id) FROM stdin;
1268777695244980389	1269125186490204191	1269125187547168850
1254536563186991184	1270004756584202345	1270004758400340022
1202055026797707316	1270033918757699625	1270033920536088627
950153022405763124	1273478465991213119	1273478466863501432
1274119155431379045	1274761412744446043	1274761413302423697
1274163487312187435	1274820990215651440	1274820991071162389
\.


--
-- Data for Name: warns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.warns (guild_id, user_id, author_id, "time", reason) FROM stdin;
1274119155431379045	1261972871824015402	1130715311897858180	18/08/24 at 12:17 PM	NSFW Conversation
1274119155431379045	1261972871824015402	1130715311897858180	18/08/24 at 12:18 PM	Threatening to Demote everyone (he's a member)
\.


--
-- Data for Name: webhook; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.webhook (guild_id, code, url, channel, name, avatar) FROM stdin;
950153022405763124	VYOVDac5	https://discord.com/api/webhooks/1274438276308144272/ZAZOY_-U3FBuyyNNy2WScbKDn9rVBT37xxkQUeoXK3LGq7keuPWE6TilpTm3qHWH8pbe	<#1274204210711498854>	hi	https://cdn.discordapp.com/avatars/759066377256042557/a422ed769385c40c18939ba1a923d0c6.png?size=1024
950153022405763124	TgeE2Esa	https://discord.com/api/webhooks/1274438459628716073/jXYqYqOO79ihLi9gPzWXJlzuU6VQo3HDBjKkRYJmFFH6WGUUCWHRNFLp4uM4Zu82Upk1	<#1274204210711498854>	hi	https://cdn.discordapp.com/avatars/759066377256042557/a422ed769385c40c18939ba1a923d0c6.png?size=1024
950153022405763124	laTQ14ML	https://discord.com/api/webhooks/1274438568458194985/KIav8_Ue252w5i7jOehhzwzkKorOy2F4sFGKmnkDFnGxUaa3M15mDfnYyGxc9iff3eHU	<#1274204210711498854>	hi	https://cdn.discordapp.com/avatars/759066377256042557/a422ed769385c40c18939ba1a923d0c6.png?size=1024
950153022405763124	eVjlYJz1	https://discord.com/api/webhooks/1274439245725040715/VduskLuircJasbfOTNRvMErWu_kJNVLyjEQv8PPIWprBs1oh9LZCwiJbUfZkDXcZtIh_	<#1274204210711498854>	hi	https://cdn.discordapp.com/avatars/759066377256042557/a422ed769385c40c18939ba1a923d0c6.png?size=1024
\.


--
-- Data for Name: welcome; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.welcome (guild_id, channel_id, message) FROM stdin;
1202055026797707316	1269988494319681559	hai {user.mention}
950153022405763124	1274204210711498854	{embed}{content: welcome {user.mention}}$v{description: open a <#1269410533707223208>  to get your server authorized}$v{color: CCCCFF}
\.


--
-- Data for Name: whitelist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.whitelist (guild_id, user_id) FROM stdin;
1266971195761234002	1269370561872527381
1266971195761234002	1122063718495305788
\.


--
-- Data for Name: whitelist_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.whitelist_state (guild_id, embed) FROM stdin;
1266971195761234002	default
\.


--
-- Data for Name: xray; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.xray (guild_id, target_id, webhook_url) FROM stdin;
\.


--
-- Name: archive archive_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive
    ADD CONSTRAINT archive_pkey PRIMARY KEY (guild_id, channel_id);


--
-- Name: autopfp autopfp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autopfp
    ADD CONSTRAINT autopfp_pkey PRIMARY KEY (guild_id, type, category);


--
-- Name: autoping autoping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autoping
    ADD CONSTRAINT autoping_pkey PRIMARY KEY (guild_id, channel_id);


--
-- Name: autoreact autoreact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autoreact
    ADD CONSTRAINT autoreact_pkey PRIMARY KEY (guild_id, trigger);


--
-- Name: autoreacts autoreacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autoreacts
    ADD CONSTRAINT autoreacts_pkey PRIMARY KEY (guild_id, trigger, reaction);


--
-- Name: autorole autorole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autorole
    ADD CONSTRAINT autorole_pkey PRIMARY KEY (guild_id, role_id);


--
-- Name: avatar_history avatar_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avatar_history
    ADD CONSTRAINT avatar_history_pkey PRIMARY KEY (user_id);


--
-- Name: avatars avatars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.avatars
    ADD CONSTRAINT avatars_pkey PRIMARY KEY (user_id, key);


--
-- Name: blacklist blacklist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blacklist
    ADD CONSTRAINT blacklist_pkey PRIMARY KEY (id, type);


--
-- Name: error_codes error_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.error_codes
    ADD CONSTRAINT error_codes_pkey PRIMARY KEY (code);


--
-- Name: global_disabled_cmds global_disabled_cmds_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.global_disabled_cmds
    ADD CONSTRAINT global_disabled_cmds_pkey PRIMARY KEY (cmd);


--
-- Name: jail_members jail_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jail_members
    ADD CONSTRAINT jail_members_pkey PRIMARY KEY (guild_id, user_id);


--
-- Name: lock_role lock_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lock_role
    ADD CONSTRAINT lock_role_pkey PRIMARY KEY (role_id);


--
-- Name: lockdown_ignore lockdown_ignore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lockdown_ignore
    ADD CONSTRAINT lockdown_ignore_pkey PRIMARY KEY (channel_id);


--
-- Name: logging logging_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logging
    ADD CONSTRAINT logging_pkey PRIMARY KEY (guild_id);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (key);


--
-- Name: number_counter number_counter_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.number_counter
    ADD CONSTRAINT number_counter_pkey PRIMARY KEY (guild_id, channel_id);


--
-- Name: restore restore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restore
    ADD CONSTRAINT restore_pkey PRIMARY KEY (guild_id, user_id);


--
-- Name: selfprefix selfprefix_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selfprefix
    ADD CONSTRAINT selfprefix_pkey PRIMARY KEY (user_id);


--
-- Name: stickymessage stickymessage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stickymessage
    ADD CONSTRAINT stickymessage_pkey PRIMARY KEY (guild_id, channel_id);


--
-- Name: trial trial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trial
    ADD CONSTRAINT trial_pkey PRIMARY KEY (guild_id);


--
-- Name: trials trials_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trials
    ADD CONSTRAINT trials_pkey PRIMARY KEY (guild_id);


--
-- Name: whitelist_state whitelist_state_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.whitelist_state
    ADD CONSTRAINT whitelist_state_pkey PRIMARY KEY (guild_id);


--
-- PostgreSQL database dump complete
--

