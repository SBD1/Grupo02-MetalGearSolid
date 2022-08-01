-- Incluir os tipos ENUM.
CREATE TYPE tipoArma AS ENUM ('PRIMARIA','SECUNDARIA');
CREATE TYPE tipoObjetivo AS ENUM ('PRINCIPAL','SECUNDARIO');
CREATE TYPE tipoRequisito AS ENUM ('DESENVOLVIMENTO','USO');

CREATE TYPE tipoUnidade AS ENUM ('COMBATE','MEDICA','INTELIGENCIA','DESENVBASE','SUPORTE');
  -- PMB (Produto Militar Bruto)
CREATE TYPE tipoRecurso AS ENUM (
  'METALPRECIOSO', 'METALSECUNDARIO', 'METALPRIMARIO', 
  'PMB', 'PLANTA', -- PMB e PLANTA foram pensados como sendo materiais processados apenas.
  'COMBUSTIVEL','MATERIALBIOLOGICO');

-- Tabelas independentes: Arma, BaseMae, codinome, Uniforme, Missao, Item, Terreno.
CREATE TABLE IF NOT EXISTS Arma (
	idArma SERIAL PRIMARY KEY,
	nome char(50) NOT NULL,
	dano int NOT NULL,
	maxBalas int NOT NULL,
	probAcerto int NOT NULL,
	txDisparo int NOT NULL,
	tamPente int NOT NULL,
	penetracao int NOT NULL,
  municaoLetal Boolean NOT NULL,
	tipo tipoArma NOT NULL
);

CREATE TABLE IF NOT EXISTS BaseMae (
	idBaseMae SERIAL PRIMARY KEY
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
	nome char(30) NOT NULL,
	descricao varchar(100) NOT NULL,
	dano int NOT NULL,
  probNocaute int NOT NULL
);

CREATE TABLE IF NOT EXISTS Terreno (
	idTerreno SERIAL PRIMARY KEY,
	descricao varchar(500) NOT NULL,
	vegetacao varchar(50) NOT NULL
);

-- Tabelas dependentes
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
	nome char(20) NOT NULL,
  idMissao int NOT NULL,

  CONSTRAINT FK_idMissao_Mapa FOREIGN KEY(idMissao) REFERENCES Missao(idMissao)
);

CREATE TABLE IF NOT EXISTS Projeto (
	idProjeto SERIAL PRIMARY KEY,
	idArma int NOT NULL,
	pontoX int NOT NULL,
	pontoY int NOT NULL,
	idMapa int NOT NULL,
	idUniforme int NOT NULL,
	idItem int NOT NULL,

  CONSTRAINT FK_arma_projeto FOREIGN KEY(idArma) REFERENCES Arma(idArma),
  CONSTRAINT FK_uniforme_projeto FOREIGN KEY(idUniforme) REFERENCES Uniforme(idUniforme),
  CONSTRAINT FK_item_projeto FOREIGN KEY(idItem) REFERENCES Item(idItem),
  CONSTRAINT FK_mapa_projeto FOREIGN KEY(idMapa) REFERENCES Mapa(idMapa)
);

CREATE TABLE IF NOT EXISTS Unidade (
	idUnidade SERIAL PRIMARY KEY,
  idBaseMae int NOT NULL,
	nivel int NOT NULL,
	qtdSoldados int NOT NULL,
	maxSoldados int NOT NULL,
	tipo tipoUnidade NOT NULL,

  CONSTRAINT FK_baseMae_Unidade FOREIGN KEY(idBaseMae) REFERENCES BaseMae(idBaseMae)
);

CREATE TABLE IF NOT EXISTS NPC (
	idNPC SERIAL PRIMARY KEY,
	idUniforme int NOT NULL,
	idUnidade int NOT NULL,
	idMapa int,
	nome char(50) NOT NULL,
	qtdVida int NOT NULL,
	nivelDesenvBase int NOT NULL,
	nivelCombate int NOT NULL,
	nivelSuporte int NOT NULL,
	nivelMedica int NOT NULL,
	nivelInteligencia int NOT NULL,
	pontoX int,
	pontoY int,


  CONSTRAINT FK_uniforme_npc FOREIGN KEY(idUniforme) REFERENCES Uniforme(idUniforme),
  CONSTRAINT FK_unidade_npc FOREIGN KEY(idUnidade) REFERENCES Unidade(idUnidade),
  CONSTRAINT FK_mapa_mapa FOREIGN KEY(idMapa) REFERENCES Mapa(idMapa)
);

CREATE TABLE IF NOT EXISTS Recurso (
	idRecurso SERIAL PRIMARY KEY,
	idBasemae int NOT NULL,
	qtdBruto int NOT NULL,
	qtdProcessado int NOT NULL,
	tipo tipoRecurso NOT NULL,

  CONSTRAINT FK_baseMae_recurso FOREIGN KEY(idBaseMae) REFERENCES BaseMae(idBaseMae)
);

CREATE TABLE IF NOT EXISTS Requisito (
	idRequisito SERIAL PRIMARY KEY,
	idProjeto int NOT NULL,
	tipo tipoRequisito NOT NULL,

  CONSTRAINT FK_projeto_requisito FOREIGN KEY(idProjeto) REFERENCES Projeto(idProjeto)
);

CREATE TABLE IF NOT EXISTS Player (
	idPlayer SERIAL PRIMARY KEY,
	idNPC int NOT NULL,
  idBaseMae int Not NULL,
	nome char(30) NOT NULL,

  CONSTRAINT FK_npc_player FOREIGN KEY(idNPC) REFERENCES NPC(idNPC),
  CONSTRAINT FK_baseMae_player FOREIGN KEY(idBaseMae) REFERENCES BaseMae(idBaseMae)
);

CREATE TABLE IF NOT EXISTS Objetivo (
	idObjetivo SERIAL PRIMARY KEY,
  idMapa int NOT NULL,
	descricao varchar(200) NOT NULL,
	pontoX int NOT NULL,
	pontoY int NOT NULL,
	tipo tipoObjetivo NOT NULL,


  CONSTRAINT FK_mapa_objetivo FOREIGN KEY(idMapa) REFERENCES Mapa(idMapa)
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
	quantidade int NOT NULL,

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

  CONSTRAINT FK_npc_npcequipaitem FOREIGN KEY(idNPC) REFERENCES NPC(idNPC),
  CONSTRAINT FK_arma_npcequipaitem FOREIGN KEY(idItem) REFERENCES Item(idItem),
  CONSTRAINT PK_npcequipaitem PRIMARY KEY(idNPC,idItem)
);

CREATE TABLE IF NOT EXISTS RequisitoConsomeRecurso (
	idRequisito int NOT NULL,
	idRecurso int NOT NULL,
	quantidade int NOT NULL,

  CONSTRAINT FK_requisito_requisitoconsomerecurso FOREIGN KEY(idRequisito) REFERENCES Requisito(idRequisito),
  CONSTRAINT FK_recurso_requisitoconsomerecurso FOREIGN KEY(idRecurso) REFERENCES Recurso(idRecurso),
  CONSTRAINT PK_requisitoconsomerecurso PRIMARY KEY(idRequisito,idRecurso)
);

CREATE TABLE IF NOT EXISTS RequisitoDependeUnidade (
	idRequisito int NOT NULL,
	idUnidade int NOT NULL,
	nivelUnidade int NOT NULL,

  CONSTRAINT FK_requisito_requisitoconsomerecurso FOREIGN KEY(idRequisito) REFERENCES Requisito(idRequisito),
  CONSTRAINT FK_unidade_requisitoconsomerecurso FOREIGN KEY(idUnidade) REFERENCES Unidade(idUnidade),
  CONSTRAINT PK_requisitodependeunidade PRIMARY KEY(idRequisito,idUnidade)
);

CREATE TABLE IF NOT EXISTS UniformeCamuflaTerreno (
	idTerreno int NOT NULL,
	idUniforme int NOT NULL,
	taxaCamuflagem int NOT NULL,

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

