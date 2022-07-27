CREATE TABLE Arma (
	idArma SERIAL PRIMARY KEY,
	dano int4 NOT NULL,
	maxBalas int4 NOT NULL,
	probAcerto int4 NOT NULL,
	txDisparo int4 NOT NULL,
	nome varchar(50) NOT NULL,
	tampente int4 NOT NULL,
	tipo varchar(50) NOT NULL,
	penetracao int4 NOT NULL,
	tipoMunicao varchar(30) NOT NULL
);

CREATE TABLE BaseMae (
	idBaseMae SERIAL PRIMARY KEY,
	produtoMilitarBruto int4 NOT NULL,
	idPlayer int4 NOT NULL
);

CREATE TABLE Estatistica (
	idEstatistica SERIAL PRIMARY KEY,
	numMovimentos int4 NOT NULL,
	numHeadshots int4 NOT NULL,
	numAbates int4 NOT NULL,
	numNocautes int4 NOT NULL,
	codinomeNome varchar(30) NOT NULL,
	codinomeDescricao varchar(300) NOT NULL,
	codinomeRequisito varchar(200) NOT NULL
);

CREATE TABLE Item (
	idItem SERIAL PRIMARY KEY,
	nome varchar(30) NOT NULL,
	descricao varchar(100) NOT NULL,
	dano int4 NOT NULL
);

CREATE TABLE Mapa (
	idMapa SERIAL PRIMARY KEY,
	tamanho int4 NOT NULL,
	nome varchar(20) NOT NULL
);

CREATE TABLE MapaPosicionaRecurso (
	idMapa SERIAL PRIMARY KEY,
	idRecurso int4 NOT NULL,
	pontoX int4 NOT NULL,
	pontoY int4 NOT NULL,
	quantidade int4 NOT NULL
);

CREATE TABLE MapaTemMapa (
	idMapaDono int4 NOT NULL,
	idMapa int4 NOT NULL,
	pontoX int4 NOT NULL,
	pontoY int4 NOT NULL
);

CREATE TABLE Missao (
	idMissao SERIAL PRIMARY KEY,
	titulo varchar(50) NOT NULL,
	descricao varchar(500) NOT NULL,
	textoFinal text NOT NULL
);

CREATE TABLE NivelNpc (
	idNivel SERIAL PRIMARY KEY,
	desenvBase int4 NOT NULL,
	combate int4 NOT NULL,
	suporte int4 NOT NULL,
	medica int4 NOT NULL,
	inteligencia int4 NOT NULL
);

CREATE TABLE Npc (
	idNpc SERIAL PRIMARY KEY,
	nome varchar(30) NOT NULL,
	categoria varchar(30) NOT NULL,
	habilidade varchar(30) NOT NULL,
	qtdVida int4 NOT NULL,
	idNivel int4 NOT NULL,
	idUniforme int4 NOT NULL,
	idUnidade int4 NOT NULL
);

CREATE TABLE NpcEquipaArma (
	idNpc int4 NOT NULL,
	idArma int4 NOT NULL
);

CREATE TABLE NpcUsaItem (
	idNpc int4 NOT NULL,
	idItem int4 NOT NULL
);

CREATE TABLE Objetivo (
	idObjetivo SERIAL PRIMARY KEY,
	idMissao int4 NOT NULL,
	descricao varchar(200) NOT NULL,
	cumprido bool NOT NULL,
	tipo bool NOT NULL,
	pontoX int4 NOT NULL,
	pontoY int4 NOT NULL
);

CREATE TABLE Player (
	idPlayer SERIAL PRIMARY KEY,
	nome varchar(30) NOT NULL,
	idNpc int4 NOT NULL
);

CREATE TABLE PlayerCumpreMissao (
	idPlayer int4 NOT NULL,
	idEstatistica int4 NOT NULL,
	idMissao int4 NOT NULL
);

CREATE TABLE Projeto (
	idProjeto SERIAL PRIMARY KEY,
	idArma int4 NOT NULL,
	pontoX int4 NOT NULL,
	pontoY int4 NOT NULL,
	idMapa int4 NOT NULL,
	idUniforme int4 NOT NULL,
	idItem int4 NOT NULL
);

CREATE TABLE Recurso (
	idRecurso SERIAL PRIMARY KEY,
	idBasemae int4 NOT NULL,
	qtdBruto int4 NOT NULL,
	qtdProcessado int4 NOT NULL,
	tipo varchar(30) NOT NULL
);

CREATE TABLE Requisito (
	idRequisito SERIAL PRIMARY KEY,
	tipo bool NOT NULL,
	idProjeto int4 NOT NULL
);

CREATE TABLE RequisitoConsomeRecurso (
	idRecurso int4 NOT NULL,
	idRequisito int4 NOT NULL,
	quantidade int4 NOT NULL
);

CREATE TABLE RequisitoDependeUnidade (
	idUnidade int4 NOT NULL,
	idRequisito varchar NOT NULL,
	nivelUnidade int4 NOT NULL
);

CREATE TABLE Terreno (
	idTerreno SERIAL PRIMARY KEY,
	descricao varchar(500) NOT NULL,
	vegetacao varchar(50) NOT NULL
);

CREATE TABLE Unidade (
	idUnidade SERIAL PRIMARY KEY,
	nivel int4 NOT NULL,
	qtdSoldados int4 NOT NULL,
	tipo varchar(30) NOT NULL,
	maxSoldados int4 NOT NULL,
	idBaseMae int4 NOT NULL
);

CREATE TABLE Uniforme (
	idUniforme SERIAL PRIMARY KEY,
	nome varchar(30) NOT NULL,
	defesa int4 NOT NULL
);

CREATE TABLE UniformeCamuflaTerreno (
	idTerreno int4 NOT NULL,
	idUniforme int4 NOT NULL,
	taxaCamuflagem int4 NOT NULL
);
