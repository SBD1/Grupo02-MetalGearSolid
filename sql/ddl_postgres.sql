-- public.player definition

-- Drop table

-- DROP TABLE player;

CREATE TABLE player (
	idplayer int4 NOT NULL,
	nome bpchar(30) NOT NULL,
	idnpc int4 NULL,
	CONSTRAINT player_pk PRIMARY KEY (idplayer)
);


-- public.npc definition

-- Drop table

-- DROP TABLE npc;

CREATE TABLE npc (
	idnpc int4 NOT NULL,
	nome bpchar(30) NULL,
	categoria bpchar(30) NULL,
	habilidade bpchar(30) NULL,
	qtdvida int4 NULL,
	idnivel int4 NULL,
	iduniforme int4 NULL,
	idunidade int4 NULL,
	CONSTRAINT npc_pk PRIMARY KEY (idnpc)
);


-- public.basemae definition

-- Drop table

-- DROP TABLE basemae;

CREATE TABLE basemae (
	idbasemae int4 NOT NULL,
	produtomilitarbruto int4 NOT NULL,
	idplayer int4 NOT NULL
);


-- public.recurso definition

-- Drop table

-- DROP TABLE recurso;

CREATE TABLE recurso (
	idrecurso int4 NOT NULL,
	idbasemae int4 NULL,
	qtdbruto int4 NULL,
	qtdprocessado int4 NULL,
	tipo bpchar(30) NULL,
	CONSTRAINT recurso_pk PRIMARY KEY (idrecurso)
);


-- public.uniforme definition

-- Drop table

-- DROP TABLE uniforme;

CREATE TABLE uniforme (
	iduniforme int4 NOT NULL,
	nome bpchar(30) NULL,
	defesa int4 NULL,
	CONSTRAINT uniforme_pk PRIMARY KEY (iduniforme)
);


-- public.npcusaitem definition

-- Drop table

-- DROP TABLE npcusaitem;

CREATE TABLE npcusaitem (
	idnpc int4 NULL,
	iditem int4 NULL
);


-- public.nivelnpc definition

-- Drop table

-- DROP TABLE nivelnpc;

CREATE TABLE nivelnpc (
	idnivel int4 NOT NULL,
	desenvbase int4 NULL,
	combate int4 NULL,
	suporte int4 NULL,
	medica int4 NULL,
	inteligencia int4 NULL,
	CONSTRAINT nivelnpc_pk PRIMARY KEY (idnivel)
);


-- public.npcequipaarma definition

-- Drop table

-- DROP TABLE npcequipaarma;

CREATE TABLE npcequipaarma (
	idnpc int4 NULL,
	idarma int4 NULL
);


-- public.playercumpremissao definition

-- Drop table

-- DROP TABLE playercumpremissao;

CREATE TABLE playercumpremissao (
	idplayer int4 NOT NULL,
	idestatistica int4 NULL,
	idmissao int4 NULL
);


-- public.arma definition

-- Drop table

-- DROP TABLE arma;

CREATE TABLE arma (
	idarma int4 NOT NULL,
	dano int4 NULL,
	maxbalas int4 NULL,
	probacerto int4 NULL,
	txdisparo int4 NULL,
	nome bpchar(50) NULL,
	tampente int4 NULL,
	tipo bpchar(50) NULL,
	penetracao int4 NULL,
	tipomunicao bpchar(30) NULL,
	CONSTRAINT arma_pk PRIMARY KEY (idarma)
);


-- public.unidade definition

-- Drop table

-- DROP TABLE unidade;

CREATE TABLE unidade (
	idunidade int4 NULL,
	nivel int4 NULL,
	qtdsoldados int4 NULL,
	tipo bpchar(30) NULL,
	maxsoldados int4 NULL,
	idbasemae int4 NULL
);


-- public.uniformecamuflaterreno definition

-- Drop table

-- DROP TABLE uniformecamuflaterreno;

CREATE TABLE uniformecamuflaterreno (
	idterreno int4 NULL,
	iduniforme int4 NULL,
	taxacamuflagem int4 NULL
);


-- public.terreno definition

-- Drop table

-- DROP TABLE terreno;

CREATE TABLE terreno (
	idterreno int4 NOT NULL,
	descricao varchar(500) NULL,
	vegetacao bpchar(50) NULL,
	CONSTRAINT terreno_pk PRIMARY KEY (idterreno)
);
