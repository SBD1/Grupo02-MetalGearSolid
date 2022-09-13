-- Incluir os tipos ENUM.
CREATE TYPE tipoArma AS ENUM ('PRIMARIA','SECUNDARIA');
CREATE TYPE tipoObjetivo AS ENUM ('PRINCIPAL','SECUNDARIO'); 
CREATE TYPE tipoProjeto AS ENUM ('DESENVOLVIMENTO','USO');
CREATE TYPE tipoItem AS ENUM ('CONSUMIVEL', 'DANO');

CREATE TYPE tipoUnidade AS ENUM ('COMBATE','MEDICA','INTELIGENCIA','DESENVBASE','SUPORTE');
  -- PMB (Produto Militar Bruto)
CREATE TYPE tipoRecurso AS ENUM (
  'METALPRECIOSO', 'METALSECUNDARIO', 'METALPRIMARIO', 
  'PMB', 'PLANTA', -- PMB e PLANTA foram pensados como sendo materiais processados apenas.
  'COMBUSTIVEL','MATERIALBIOLOGICO');

-- Tabelas independentes: Arma, codinome, Uniforme, Missao, Item, Terreno.
CREATE TABLE IF NOT EXISTS Arma (
	idArma SERIAL PRIMARY KEY,
	nome char(50) NOT NULL,
	dano int NOT NULL,
	maxBalas int NOT NULL,
	probAcerto int NOT NULL CHECK (probAcerto >= 0 AND probAcerto < 101),
	txDisparo int NOT NULL,
	tamPente int NOT NULL,
	penetracao int NOT NULL,
  	municaoLetal Boolean NOT NULL,
	tipo tipoArma NOT NULL
);

CREATE TABLE IF NOT EXISTS codinome (
  nomeCodinome char(30) PRIMARY KEY,
  descricao varchar(300) NOT NULL,
  requisito varchar(200) NOT NULL
);

CREATE TABLE IF NOT EXISTS Uniforme (
	idUniforme SERIAL PRIMARY KEY,
	nome char(40) NOT NULL,
	defesa int NOT NULL
);

CREATE TABLE IF NOT EXISTS Missao (
	idMissao SERIAL PRIMARY KEY,
	titulo varchar(50) NOT NULL,
	descricao varchar(500) NOT NULL
);

CREATE TABLE IF NOT EXISTS Item (
	idItem SERIAL PRIMARY KEY,
	tipo tipoItem NOT NULL

);

CREATE TABLE IF NOT EXISTS Consumivel (
	idItem int NOT NULL,
	txAumentoDanoArma int NOT NULL CHECK (txAumentoDanoArma >= 0 AND txAumentoDanoArma < 101),
	txAumentoCamuflagem int NOT NULL CHECK (txAumentoCamuflagem >= 0 AND txAumentoCamuflagem < 101),
	txAumentoDefesa int NOT NULL CHECK (txAumentoDefesa >= 0 AND txAumentoDefesa < 101),
	txRecuperacaoVida int NOT NULL CHECK (txRecuperacaoVida >= 0 AND txRecuperacaoVida < 101),
	descricao varchar(100) NOT NULL,
	nome varchar(35) NOT NULL,


	CONSTRAINT FK_id_item FOREIGN KEY(idItem) REFERENCES Item(idItem)
)INHERITS (Item);

CREATE TABLE IF NOT EXISTS Dano (
	idItem int NOT NULL,
	qntDano int NOT NULL,
	proNocaute int NOT NULL CHECK (proNocaute >= 0 AND proNocaute < 101),
	descricao varchar(100) NOT NULL,
	nome varchar(35) NOT NULL,

	CONSTRAINT FK_id_item FOREIGN KEY(idItem) REFERENCES Item(idItem)
)INHERITS (Item);

CREATE TABLE IF NOT EXISTS Terreno (
	idTerreno SERIAL PRIMARY KEY,
	descricao varchar(500) NOT NULL,
	vegetacao varchar(50) NOT NULL
);

-- Tabelas dependentes
CREATE TABLE IF NOT EXISTS Player (
	idPlayer SERIAL PRIMARY KEY,
	idNPC int,
	nome char(30) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Unidade (
	idUnidade SERIAL PRIMARY KEY,
  	idPlayer int NOT NULL,
	nivel int NOT NULL,
	qtdSoldados int NOT NULL,
	maxSoldados int NOT NULL,
	tipo tipoUnidade NOT NULL,

  CONSTRAINT FK_player_unidade FOREIGN KEY(idPlayer) REFERENCES Player(idPlayer)
);


CREATE TABLE IF NOT EXISTS Recurso (
	idRecurso SERIAL PRIMARY KEY,
	idPlayer int NOT NULL,
	qtdBruto int NOT NULL,
	qtdProcessado int NOT NULL,
	tipo tipoRecurso NOT NULL,

  CONSTRAINT FK_player_recurso FOREIGN KEY(idPlayer) REFERENCES Player(idPlayer)
);

CREATE TABLE IF NOT EXISTS Estatistica (
	idEstatistica SERIAL PRIMARY KEY,
	numMovimentos int NOT NULL,
	numHeadshots int NOT NULL,
	numAbates int NOT NULL,
	numNocautes int NOT NULL,
	nomeCodinome varchar(30) NOT NULL,

  CONSTRAINT FK_nomeCodinome FOREIGN KEY(nomeCodinome) REFERENCES codinome(nomeCodinome)
);

CREATE TABLE IF NOT EXISTS Mapa (
	idMapa SERIAL PRIMARY KEY,
	tamanho int NOT NULL,
	nome char(50) NOT NULL,
  idMissao int NOT NULL,
  idTerreno int NOT NULL,

  CONSTRAINT FK_idMissao_Mapa FOREIGN KEY(idMissao) REFERENCES Missao(idMissao),
  CONSTRAINT FK_idTerreno_Mapa FOREIGN KEY(idTerreno) REFERENCES Terreno(idTerreno)
);

CREATE TABLE IF NOT EXISTS NPC (
	idNPC SERIAL PRIMARY KEY,
	idUniforme int NOT NULL,
	idUnidade int,
	idMapa int,
	nome char(50) NOT NULL,
	qtdVida int NOT NULL,
	nivelDesenvBase int NOT NULL CHECK (nivelDesenvBase > 0 AND nivelDesenvBase <= 10),
	nivelCombate int NOT NULL CHECK (nivelCombate > 0 AND nivelCombate <= 10),
	nivelSuporte int NOT NULL CHECK (nivelSuporte > 0 AND nivelSuporte <= 10),
	nivelMedica int NOT NULL CHECK (nivelMedica > 0 AND nivelMedica <= 10),
	nivelInteligencia int NOT NULL CHECK (nivelInteligencia > 0 AND nivelInteligencia <= 10),
	pontoX int,
	pontoY int,

  CONSTRAINT FK_uniforme_npc FOREIGN KEY(idUniforme) REFERENCES Uniforme(idUniforme),
  CONSTRAINT FK_unidade_npc FOREIGN KEY(idUnidade) REFERENCES Unidade(idUnidade),
  CONSTRAINT FK_mapa_npc FOREIGN KEY(idMapa) REFERENCES Mapa(idMapa)
);

CREATE TABLE IF NOT EXISTS Projeto (
	idProjeto SERIAL PRIMARY KEY,
	idArma int,
	pontoX int,
	pontoY int,
	idMapa int,
	idUniforme int,
	idItem int,

  CONSTRAINT FK_arma_projeto FOREIGN KEY(idArma) REFERENCES Arma(idArma),
  CONSTRAINT FK_uniforme_projeto FOREIGN KEY(idUniforme) REFERENCES Uniforme(idUniforme),
  CONSTRAINT FK_item_projeto FOREIGN KEY(idItem) REFERENCES Item(idItem),
  CONSTRAINT FK_mapa_projeto FOREIGN KEY(idMapa) REFERENCES Mapa(idMapa)
);


CREATE TABLE IF NOT EXISTS Objetivo (
	idObjetivo SERIAL PRIMARY KEY,
 	idMapa int NOT NULL,
  	idMissao int NOT NULL,
	descricao varchar(200) NOT NULL,
	pontoX int NOT NULL,
	pontoY int NOT NULL,
	tipo tipoObjetivo NOT NULL,


  CONSTRAINT FK_mapa_objetivo FOREIGN KEY(idMapa) REFERENCES Mapa(idMapa),
  CONSTRAINT FK_missao_objetivo FOREIGN KEY(idMissao) REFERENCES Missao(idMissao)
);

-- Tabelas de relacionamentos

CREATE TABLE IF NOT EXISTS EstatisticaMarcaObjetivo(
	idObjetivo int NOT NULL,
  	idEstatistica int NOT NULL,
	cumprido boolean NOT NULL,

  CONSTRAINT FK_estatistica_estatisticamarcaobjetivo FOREIGN KEY(idEstatistica) REFERENCES Estatistica(idEstatistica),
  CONSTRAINT FK_objetivo_estatisticamarcaobjetivo FOREIGN KEY(idObjetivo) REFERENCES Objetivo(idObjetivo),
  CONSTRAINT PK_estatisticamarcaobjetivo PRIMARY KEY(idObjetivo,idEstatistica)
);

CREATE TABLE IF NOT EXISTS MapaTemMapa (
	idMapaDono int NOT NULL,
	idMapa int NOT NULL,
	pontoX int NOT NULL,
	pontoY int NOT NULL,

  CONSTRAINT FK_MapaDono FOREIGN KEY(idMapaDono) REFERENCES Mapa(idMapa),
  CONSTRAINT FK_Mapa FOREIGN KEY(idMapa) REFERENCES Mapa(idMapa),
  CONSTRAINT PK_composta_MAPA PRIMARY KEY(idMapaDono,idMapa)
);

CREATE TABLE IF NOT EXISTS PlayerPegaProjeto (
  idPlayer int NOT NULL,
  idProjeto int NOT NULL,
  concluido boolean NOT NULL,
  encontrado boolean NOT NULL,

  CONSTRAINT FK_player_playerpegaprojeto FOREIGN KEY(idPlayer) REFERENCES Player(idPlayer),
  CONSTRAINT FK_projeto_playerpegaprojeto FOREIGN KEY(idProjeto) REFERENCES Projeto(idProjeto),
  CONSTRAINT PK_playerpegaprojeto PRIMARY KEY(idPlayer,idProjeto)
);

CREATE TABLE IF NOT EXISTS MapaPosicionaRecurso (
	idMapa int NOT NULL,
	idRecurso int NOT NULL,
	pontoX int NOT NULL,
	pontoY int NOT NULL,
	qtdBruto int NOT NULL,
	qtdProcessado int NOT NULL,

  CONSTRAINT FK_mapa_mapaposicionarecurso FOREIGN KEY(idMapa) REFERENCES Mapa(idMapa),
  CONSTRAINT FK_recurso_mapaposicionarecurso FOREIGN KEY(idRecurso) REFERENCES Recurso(idRecurso),
  CONSTRAINT PK_mapaposicionarecurso PRIMARY KEY(idMapa,idRecurso)
);

CREATE TABLE IF NOT EXISTS NPCEquipaArma (
	idNPC int NOT NULL,
	idArma int NOT NULL,

  CONSTRAINT FK_npc_npcequipaarma FOREIGN KEY(idNPC) REFERENCES NPC(idNPC),
  CONSTRAINT FK_arma_npcequipaarma FOREIGN KEY(idArma) REFERENCES Arma(idArma),
  CONSTRAINT PK_npcequipaarma PRIMARY KEY(idNPC,idArma)
);

CREATE TABLE IF NOT EXISTS NPCUsaItem (
	idNPC int NOT NULL,
	idItem int NOT NULL,
  	quantidade int NOT NULL,
  
  CONSTRAINT FK_npc_npcequipaitem FOREIGN KEY(idNPC) REFERENCES NPC(idNPC),
  CONSTRAINT FK_arma_npcequipaitem FOREIGN KEY(idItem) REFERENCES Item(idItem),
  CONSTRAINT PK_npcequipaitem PRIMARY KEY(idNPC,idItem)
);

CREATE TABLE IF NOT EXISTS ProjetoConsomeRecurso (
	idProjeto int NOT NULL,
	idRecurso int NOT NULL,
	qtdProcessado int NOT NULL DEFAULT 0,
	tipo tipoProjeto NOT NULL,

  CONSTRAINT FK_projeto_projetoconsomerecurso FOREIGN KEY(idProjeto) REFERENCES Projeto(idProjeto),
  CONSTRAINT FK_recurso_projetoconsomerecurso FOREIGN KEY(idRecurso) REFERENCES Recurso(idRecurso),
  CONSTRAINT PK_projetoconsomerecurso PRIMARY KEY(idProjeto,idRecurso)
);

CREATE TABLE IF NOT EXISTS ProjetoDependeUnidade (
	idProjeto int NOT NULL,
	idUnidade int NOT NULL,
	nivelUnidade int NOT NULL DEFAULT 0,
	tipo tipoProjeto NOT NULL,

  CONSTRAINT FK_requisito_projetoconsomerecurso FOREIGN KEY(idProjeto) REFERENCES Projeto(idProjeto),
  CONSTRAINT FK_unidade_projetoconsomerecurso FOREIGN KEY(idUnidade) REFERENCES Unidade(idUnidade),
  CONSTRAINT PK_projetodependeunidade PRIMARY KEY(idProjeto,idUnidade)
);

CREATE TABLE IF NOT EXISTS UniformeCamuflaTerreno (
	idTerreno int NOT NULL,
	idUniforme int NOT NULL,
	taxaCamuflagem int NOT NULL CHECK (taxaCamuflagem >= 0 AND taxaCamuflagem < 101),

  CONSTRAINT FK_terreno_uniformecamufraterreno FOREIGN KEY(idTerreno) REFERENCES Terreno(idTerreno),
  CONSTRAINT FK_uniforme_uniformecamufraterreno FOREIGN KEY(idUniforme) REFERENCES Terreno(idTerreno),
  CONSTRAINT PK_uniformecamuflaterreno PRIMARY KEY(idTerreno,idUniforme)
);

CREATE TABLE IF NOT EXISTS PlayerCumpreMissao (
	idPlayer int NOT NULL,
	idEstatistica int NOT NULL,
	idMissao int NOT NULL,

  CONSTRAINT FK_player_playercumpremissao FOREIGN KEY(idPlayer) REFERENCES Player(idPlayer),
  CONSTRAINT FK_estatistica_playercumpremissao FOREIGN KEY(idEstatistica) REFERENCES Estatistica(idEstatistica),
  CONSTRAINT FK_missao_playercumpremissao FOREIGN KEY(idMissao) REFERENCES Missao(idMissao),

  CONSTRAINT PK_playercumpremissao PRIMARY KEY(idPlayer,idEstatistica,idMissao)
);

