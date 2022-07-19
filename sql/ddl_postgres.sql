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


-- public.basemae definition

-- Drop table

-- DROP TABLE basemae;

CREATE TABLE basemae (
	idbasemae int4 NOT NULL,
	produtomilitarbruto int4 NOT NULL,
	idplayer int4 NOT NULL
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


-- public.npcequipaarma definition

-- Drop table

-- DROP TABLE npcequipaarma;

CREATE TABLE npcequipaarma (
	idnpc int4 NULL,
	idarma int4 NULL
);


-- public.npcusaitem definition

-- Drop table

-- DROP TABLE npcusaitem;

CREATE TABLE npcusaitem (
	idnpc int4 NULL,
	iditem int4 NULL
);


-- public.player definition

-- Drop table

-- DROP TABLE player;

CREATE TABLE player (
	idplayer int4 NOT NULL,
	nome bpchar(30) NOT NULL,
	idnpc int4 NULL,
	CONSTRAINT player_pk PRIMARY KEY (idplayer)
);


-- public.playercumpremissao definition

-- Drop table

-- DROP TABLE playercumpremissao;

CREATE TABLE playercumpremissao (
	idplayer int4 NOT NULL,
	idestatistica int4 NULL,
	idmissao int4 NULL
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


-- public.terreno definition

-- Drop table

-- DROP TABLE terreno;

CREATE TABLE terreno (
	idterreno int4 NOT NULL,
	descricao varchar(500) NULL,
	vegetacao bpchar(50) NULL,
	CONSTRAINT terreno_pk PRIMARY KEY (idterreno)
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


-- public.uniforme definition

-- Drop table

-- DROP TABLE uniforme;

CREATE TABLE uniforme (
	iduniforme int4 NOT NULL,
	nome bpchar(30) NULL,
	defesa int4 NULL,
	CONSTRAINT uniforme_pk PRIMARY KEY (iduniforme)
);


-- public.uniformecamuflaterreno definition

-- Drop table

-- DROP TABLE uniformecamuflaterreno;

CREATE TABLE uniformecamuflaterreno (
	idterreno int4 NULL,
	iduniforme int4 NULL,
	taxacamuflagem int4 NULL
);


-- public.item definition

-- Drop table

-- DROP TABLE item;

CREATE TABLE item (
	iditem int4 NOT NULL,
	nome bpchar(30) NULL,
	descricao varchar(100) NULL,
	dano int4 NULL,
	CONSTRAINT item_pk PRIMARY KEY (iditem)
);


-- public.requisitoconsomerecurso definition

-- Drop table

-- DROP TABLE requisitoconsomerecurso;

CREATE TABLE requisitoconsomerecurso (
	idrecurso int4 NULL,
	idrequisito int4 NULL,
	quantidade int4 NULL
);


-- public.mapaposicionarecurso definition

-- Drop table

-- DROP TABLE mapaposicionarecurso;

CREATE TABLE mapaposicionarecurso (
	idmapa int4 NULL,
	idrecurso int4 NULL,
	pontox int4 NULL,
	pontoy int4 NULL,
	quantidade int4 NULL
);


-- public.requisitodependeunidade definition

-- Drop table

-- DROP TABLE requisitodependeunidade;

CREATE TABLE requisitodependeunidade (
	idunidade int4 NULL,
	idrequisito varchar NULL,
	nivelunidade int4 NULL
);


-- public.projeto definition

-- Drop table

-- DROP TABLE projeto;

CREATE TABLE projeto (
	idprojeto int4 NOT NULL,
	idarma int4 NULL,
	pontox int4 NULL,
	pontoy int4 NULL,
	idmapa int4 NULL,
	iduniforme int4 NULL,
	iditem int4 NULL,
	CONSTRAINT projeto_pk PRIMARY KEY (idprojeto)
);


-- public.requisito definition

-- Drop table

-- DROP TABLE requisito;

CREATE TABLE requisito (
	idrequisito int4 NOT NULL,
	tipo bool NULL,
	idprojeto int4 NULL,
	CONSTRAINT requisito_pk PRIMARY KEY (idrequisito)
);


-- public.mapa definition

-- Drop table

-- DROP TABLE mapa;

CREATE TABLE mapa (
	idmapa int4 NOT NULL,
	tamanho int4 NULL,
	nome bpchar(20) NULL,
	CONSTRAINT mapa_pk PRIMARY KEY (idmapa)
);


-- public.mapatemmapa definition

-- Drop table

-- DROP TABLE mapatemmapa;

CREATE TABLE mapatemmapa (
	idmapadono int4 NULL,
	idmapa int4 NULL,
	pontox int4 NULL,
	pontoy int4 NULL
);


-- public.missao definition

-- Drop table

-- DROP TABLE missao;

CREATE TABLE missao (
	idmissao int4 NOT NULL,
	titulo bpchar(50) NULL,
	descricao varchar(500) NULL,
	textofinal text NULL,
	CONSTRAINT missao_pk PRIMARY KEY (idmissao)
);


-- public.objetivo definition

-- Drop table

-- DROP TABLE objetivo;

CREATE TABLE objetivo (
	idobjetivo int4 NOT NULL,
	idmissao int4 NULL,
	descricao varchar(200) NULL,
	cumprido bool NULL,
	tipo bool NULL,
	pontox int4 NULL,
	pontoy int4 NULL,
	CONSTRAINT objetivo_pk PRIMARY KEY (idobjetivo)
);


-- public.estatistica definition

-- Drop table

-- DROP TABLE estatistica;

CREATE TABLE estatistica (
	idestatistica int4 NOT NULL,
	nummovimentos int4 NULL,
	numheadshots int4 NULL,
	numabates int4 NULL,
	numnocautes int4 NULL,
	codinome varchar(30) NULL,
	CONSTRAINT estatistica_pk PRIMARY KEY (idestatistica)
);


-- public.codinome definition

-- Drop table

-- DROP TABLE codinome;

CREATE TABLE codinome (
	codinome varchar(30) NOT NULL,
	descricao varchar(300) NULL,
	requisito varchar(200) NULL,
	CONSTRAINT codinome_pk PRIMARY KEY (codinome)
);
