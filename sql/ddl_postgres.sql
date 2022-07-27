CREATE TABLE arma (
	idarma serial4 NOT NULL,
	dano int4 NOT NULL,
	maxbalas int4 NOT NULL,
	probacerto int4 NOT NULL,
	txdisparo int4 NOT NULL,
	nome varchar(50) NOT NULL,
	tampente int4 NOT NULL,
	tipo varchar(50) NOT NULL,
	penetracao int4 NOT NULL,
	tipomunicao varchar(30) NOT NULL,
	CONSTRAINT arma_pkey PRIMARY KEY (idarma)
);

CREATE TABLE estatistica (
	idestatistica serial4 NOT NULL,
	nummovimentos int4 NOT NULL,
	numheadshots int4 NOT NULL,
	numabates int4 NOT NULL,
	numnocautes int4 NOT NULL,
	codinomenome varchar(30) NOT NULL,
	codinomedescricao varchar(300) NOT NULL,
	codinomerequisito varchar(200) NOT NULL,
	CONSTRAINT estatistica_pkey PRIMARY KEY (idestatistica)
);

CREATE TABLE item (
	iditem serial4 NOT NULL,
	nome varchar(30) NOT NULL,
	descricao varchar(100) NOT NULL,
	dano int4 NOT NULL,
	CONSTRAINT item_pkey PRIMARY KEY (iditem)
);

CREATE TABLE mapa (
	idmapa serial4 NOT NULL,
	tamanho int4 NOT NULL,
	nome varchar(20) NOT NULL,
	CONSTRAINT mapa_pkey PRIMARY KEY (idmapa)
);

CREATE TABLE missao (
	idmissao serial4 NOT NULL,
	titulo varchar(50) NOT NULL,
	descricao varchar(500) NOT NULL,
	textofinal text NOT NULL,
	CONSTRAINT missao_pkey PRIMARY KEY (idmissao)
);

CREATE TABLE nivelnpc (
	idnivel serial4 NOT NULL,
	desenvbase int4 NOT NULL,
	combate int4 NOT NULL,
	suporte int4 NOT NULL,
	medica int4 NOT NULL,
	inteligencia int4 NOT NULL,
	CONSTRAINT nivelnpc_pkey PRIMARY KEY (idnivel)
);

CREATE TABLE terreno (
	idterreno serial4 NOT NULL,
	descricao varchar(500) NOT NULL,
	vegetacao varchar(50) NOT NULL,
	CONSTRAINT terreno_pkey PRIMARY KEY (idterreno)
);

CREATE TABLE uniforme (
	iduniforme serial4 NOT NULL,
	nome varchar(30) NOT NULL,
	defesa int4 NOT NULL,
	CONSTRAINT uniforme_pkey PRIMARY KEY (iduniforme)
);

CREATE TABLE mapatemmapa (
	idmapadono int4 NOT NULL,
	idmapa int4 NOT NULL,
	pontox int4 NOT NULL,
	pontoy int4 NOT NULL,
	CONSTRAINT mapatemmapa_fk FOREIGN KEY (idmapa) REFERENCES mapa(idmapa) ON DELETE RESTRICT,
	CONSTRAINT mapatemmapa_fk_1 FOREIGN KEY (idmapadono) REFERENCES mapa(idmapa) ON DELETE RESTRICT
);

CREATE TABLE objetivo (
	idobjetivo serial4 NOT NULL,
	idmissao int4 NOT NULL,
	descricao varchar(200) NOT NULL,
	cumprido bool NOT NULL,
	tipo bool NOT NULL,
	pontox int4 NOT NULL,
	pontoy int4 NOT NULL,
	CONSTRAINT objetivo_pkey PRIMARY KEY (idobjetivo),
	CONSTRAINT objetivo_fk FOREIGN KEY (idmissao) REFERENCES missao(idmissao) ON DELETE RESTRICT
);

CREATE TABLE projeto (
	idprojeto serial4 NOT NULL,
	idarma int4 NOT NULL,
	pontox int4 NOT NULL,
	pontoy int4 NOT NULL,
	idmapa int4 NOT NULL,
	iduniforme int4 NOT NULL,
	iditem int4 NOT NULL,
	CONSTRAINT projeto_pkey PRIMARY KEY (idprojeto),
	CONSTRAINT projeto_fk FOREIGN KEY (idarma) REFERENCES arma(idarma) ON DELETE RESTRICT,
	CONSTRAINT projeto_fk_1 FOREIGN KEY (idmapa) REFERENCES mapa(idmapa) ON DELETE RESTRICT,
	CONSTRAINT projeto_fk_2 FOREIGN KEY (iduniforme) REFERENCES uniforme(iduniforme) ON DELETE RESTRICT,
	CONSTRAINT projeto_fk_3 FOREIGN KEY (iditem) REFERENCES item(iditem) ON DELETE RESTRICT
);

CREATE TABLE requisito (
	idrequisito serial4 NOT NULL,
	tipo bool NOT NULL,
	idprojeto int4 NOT NULL,
	CONSTRAINT requisito_pkey PRIMARY KEY (idrequisito),
	CONSTRAINT requisito_fk FOREIGN KEY (idprojeto) REFERENCES projeto(idprojeto) ON DELETE RESTRICT
);

CREATE TABLE uniformecamuflaterreno (
	idterreno int4 NOT NULL,
	iduniforme int4 NOT NULL,
	taxacamuflagem int4 NOT NULL,
	CONSTRAINT uniformecamuflaterreno_fk FOREIGN KEY (idterreno) REFERENCES terreno(idterreno) ON DELETE RESTRICT,
	CONSTRAINT uniformecamuflaterreno_fk_1 FOREIGN KEY (iduniforme) REFERENCES uniforme(iduniforme) ON DELETE RESTRICT
);

CREATE TABLE basemae (
	idbasemae serial4 NOT NULL,
	produtomilitarbruto int4 NOT NULL,
	idplayer int4 NOT NULL,
	CONSTRAINT basemae_pkey PRIMARY KEY (idbasemae),
	CONSTRAINT basemae_fk FOREIGN KEY (idplayer) REFERENCES player(idplayer) ON DELETE RESTRICT
);

CREATE TABLE mapaposicionarecurso (
	idmapa int4 NOT NULL,
	idrecurso int4 NOT NULL,
	pontox int4 NOT NULL,
	pontoy int4 NOT NULL,
	quantidade int4 NOT NULL,
	CONSTRAINT mapaposicionarecurso_fk FOREIGN KEY (idmapa) REFERENCES mapa(idmapa) ON DELETE RESTRICT,
	CONSTRAINT mapaposicionarecurso_fk_1 FOREIGN KEY (idrecurso) REFERENCES recurso(idrecurso) ON DELETE RESTRICT
);

CREATE TABLE npc (
	idnpc serial4 NOT NULL,
	nome varchar(30) NOT NULL,
	categoria varchar(30) NOT NULL,
	habilidade varchar(30) NOT NULL,
	qtdvida int4 NOT NULL,
	idnivel int4 NOT NULL,
	iduniforme int4 NOT NULL,
	idunidade int4 NOT NULL,
	CONSTRAINT npc_pkey PRIMARY KEY (idnpc),
	CONSTRAINT npc_fk FOREIGN KEY (idnivel) REFERENCES nivelnpc(idnivel) ON DELETE RESTRICT,
	CONSTRAINT npc_fk_1 FOREIGN KEY (iduniforme) REFERENCES uniforme(iduniforme) ON DELETE RESTRICT,
	CONSTRAINT npc_fk_2 FOREIGN KEY (idunidade) REFERENCES unidade(idunidade) ON DELETE RESTRICT
);

CREATE TABLE npcequipaarma (
	idnpc int4 NOT NULL,
	idarma int4 NOT NULL,
	CONSTRAINT npcequipaarma_fk FOREIGN KEY (idnpc) REFERENCES npc(idnpc) ON DELETE RESTRICT,
	CONSTRAINT npcequipaarma_fk_1 FOREIGN KEY (idarma) REFERENCES arma(idarma) ON DELETE RESTRICT
);

CREATE TABLE npcusaitem (
	idnpc int4 NOT NULL,
	iditem int4 NOT NULL,
	CONSTRAINT npcusaitem_fk FOREIGN KEY (idnpc) REFERENCES npc(idnpc) ON DELETE RESTRICT,
	CONSTRAINT npcusaitem_fk_1 FOREIGN KEY (iditem) REFERENCES item(iditem) ON DELETE RESTRICT
);

CREATE TABLE player (
	idplayer serial4 NOT NULL,
	nome varchar(30) NOT NULL,
	idnpc int4 NOT NULL,
	CONSTRAINT player_pkey PRIMARY KEY (idplayer),
	CONSTRAINT player_fk FOREIGN KEY (idnpc) REFERENCES npc(idnpc) ON DELETE RESTRICT
);

CREATE TABLE playercumpremissao (
	idplayer int4 NOT NULL,
	idestatistica int4 NOT NULL,
	idmissao int4 NOT NULL,
	CONSTRAINT playercumpremissao_fk FOREIGN KEY (idplayer) REFERENCES player(idplayer) ON DELETE RESTRICT,
	CONSTRAINT playercumpremissao_fk_1 FOREIGN KEY (idestatistica) REFERENCES estatistica(idestatistica) ON DELETE RESTRICT,
	CONSTRAINT playercumpremissao_fk_2 FOREIGN KEY (idmissao) REFERENCES missao(idmissao) ON DELETE RESTRICT
);

CREATE TABLE recurso (
	idrecurso serial4 NOT NULL,
	idbasemae int4 NOT NULL,
	qtdbruto int4 NOT NULL,
	qtdprocessado int4 NOT NULL,
	tipo varchar(30) NOT NULL,
	CONSTRAINT recurso_pkey PRIMARY KEY (idrecurso),
	CONSTRAINT recurso_fk FOREIGN KEY (idbasemae) REFERENCES basemae(idbasemae) ON DELETE RESTRICT
);

CREATE TABLE requisitoconsomerecurso (
	idrecurso int4 NOT NULL,
	idrequisito int4 NOT NULL,
	quantidade int4 NOT NULL,
	CONSTRAINT requisitoconsomerecurso_fk FOREIGN KEY (idrecurso) REFERENCES recurso(idrecurso) ON DELETE RESTRICT,
	CONSTRAINT requisitoconsomerecurso_fk_1 FOREIGN KEY (idrequisito) REFERENCES requisito(idrequisito) ON DELETE RESTRICT
);

CREATE TABLE requisitodependeunidade (
	idunidade int4 NOT NULL,
	idrequisito varchar NOT NULL,
	nivelunidade int4 NOT NULL,
	CONSTRAINT requisitodependeunidade_fk FOREIGN KEY (idunidade) REFERENCES unidade(idunidade) ON DELETE RESTRICT
);

CREATE TABLE unidade (
	idunidade serial4 NOT NULL,
	nivel int4 NOT NULL,
	qtdsoldados int4 NOT NULL,
	tipo varchar(30) NOT NULL,
	maxsoldados int4 NOT NULL,
	idbasemae int4 NOT NULL,
	CONSTRAINT unidade_pkey PRIMARY KEY (idunidade),
	CONSTRAINT unidade_fk FOREIGN KEY (idbasemae) REFERENCES basemae(idbasemae) ON DELETE RESTRICT
);
