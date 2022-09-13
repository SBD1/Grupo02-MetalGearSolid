CREATE OR REPLACE FUNCTION atualiza_playerpegaprojeto() RETURNS trigger as $atualiza_playerpegaprojeto$
DECLARE
	qtd_processado INTEGER;
	idMapaProjeto INTEGER;
BEGIN
	select qtdProcessado into qtd_processado
	from ProjetoConsomeRecurso where idProjeto = NEW.idProjeto;

	IF qtd_processado = 0 THEN
		NEW.concluido = true;	
	END IF;

	select idMapa from Projeto into idMapaProjeto 
	where idProjeto = NEW.idProjeto;

	if idMapaProjeto IS NULL THEN
		NEW.encontrado = true;
	END IF;

	RETURN NEW;
END;
$atualiza_playerpegaprojeto$ language plpgsql;

CREATE OR REPLACE TRIGGER atualiza_playerpegaprojeto BEFORE INSERT ON PlayerPegaProjeto
	FOR EACH ROW EXECUTE FUNCTION atualiza_playerpegaprojeto();


CREATE OR REPLACE FUNCTION verifica_tamanho_mapadono() RETURNS trigger as $verifica_tam_mapadono$
DECLARE
	tamanhoMapa INTEGER;
BEGIN
	select tamanho into tamanhoMapa
	from Mapa where idMapa = NEW.idMapaDono;

	IF (NEW.pontoX < 0 or NEW.pontoX >= tamanhoMapa) or (NEW.pontoY < 0 or NEW.pontoY >= tamanhoMapa) THEN
		RAISE EXCEPTION 'Tamanho do mapa dono inválido';
	END IF;

	RETURN NEW;
END;
$verifica_tam_mapadono$ language plpgsql;

CREATE OR REPLACE TRIGGER verifica_tam_mapadono BEFORE INSERT OR UPDATE ON MapaTemMapa 
	FOR EACH ROW EXECUTE FUNCTION verifica_tamanho_mapadono();


CREATE OR REPLACE FUNCTION verifica_tamanho_mapa() RETURNS trigger as $verifica_tam_mapa$
DECLARE
	tamanhoMapa INTEGER;
BEGIN
	select tamanho into tamanhoMapa
	from Mapa where idMapa = NEW.idMapa;

	IF (NEW.pontoX < 0 or NEW.pontoX >= tamanhoMapa) or (NEW.pontoY < 0 or NEW.pontoY >= tamanhoMapa) THEN
		RAISE EXCEPTION 'Tamanho do mapa inválido';
	END IF;

	RETURN NEW;
END;
$verifica_tam_mapa$ language plpgsql;

CREATE OR REPLACE TRIGGER verifica_tam_mapa BEFORE INSERT OR UPDATE ON Projeto 
	FOR EACH ROW EXECUTE FUNCTION verifica_tamanho_mapa();

CREATE OR REPLACE TRIGGER verifica_tam_mapa BEFORE INSERT OR UPDATE ON Objetivo 
	FOR EACH ROW EXECUTE FUNCTION verifica_tamanho_mapa();

CREATE OR REPLACE TRIGGER verifica_tam_mapa BEFORE INSERT OR UPDATE ON MapaPosicionaRecurso 
	FOR EACH ROW EXECUTE FUNCTION verifica_tamanho_mapa();

CREATE OR REPLACE TRIGGER verifica_tam_mapa BEFORE INSERT OR UPDATE ON Npc 
	FOR EACH ROW EXECUTE FUNCTION verifica_tamanho_mapa();



CREATE OR REPLACE FUNCTION verifica_pos_objetivo() RETURNS trigger as $verifica_objetivo$
DECLARE
	qtdEntidadesCoordenada INTEGER := 0;
	temp INTEGER;

BEGIN
	-- verifica se tem NPC na coordenada
	select count(*) into temp
	from NPC where pontoX = NEW.pontoX and pontoY = NEW.pontoY;	
	
	qtdEntidadesCoordenada := qtdEntidadesCoordenada + temp;
	-- verifica se tem recurso na coordenada

	select count(*) into temp
	from MapaPosicionaRecurso where pontoX = NEW.pontoX and pontoY = NEW.pontoY;	

	qtdEntidadesCoordenada := qtdEntidadesCoordenada + temp;
	-- verifica se tem submapa na coordenada

	select count(*) into temp
	from MapaTemMapa where pontoX = NEW.pontoX and pontoY = NEW.pontoY;

	qtdEntidadesCoordenada = qtdEntidadesCoordenada + temp;
	-- verifica se tem projeto na coordenada

	select count(*) into temp
	from Projeto where pontoX = NEW.pontoX and pontoY = NEW.pontoY;

	qtdEntidadesCoordenada := qtdEntidadesCoordenada + temp;

	if qtdEntidadesCoordenada = 0 THEN
		RAISE EXCEPTION 'Não há Recurso, NPC, Submapa ou Projeto posicionado na coordenada inserida.';
	END IF;

	RETURN NEW;
END;
$verifica_objetivo$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER verifica_objetivo BEFORE INSERT OR UPDATE ON Objetivo
	FOR EACH ROW EXECUTE FUNCTION verifica_pos_objetivo();

CREATE OR REPLACE FUNCTION insert_player() RETURNS trigger as $insert_player$
DECLARE
	novoIdNpc INTEGER;
	idUnidadeCombate INTEGER;
BEGIN
	-- criação de recursos para cada player
	insert into Recurso
		(idPlayer,qtdBruto,qtdProcessado,tipo)
	values
		(NEW.idPlayer,0,230000,'PMB'),
		(NEW.idPlayer,0,700,'PLANTA'),
		(NEW.idPlayer,20000,1500,'COMBUSTIVEL'),
		(NEW.idPlayer,20000,3000,'METALSECUNDARIO'),
		(NEW.idPlayer,20000,4500,'METALPRECIOSO'),
		(NEW.idPlayer,20000,6000,'METALPRIMARIO'),
		(NEW.idPlayer,15000,7500,'MATERIALBIOLOGICO');
		
	-- criação de unidades pro player
	-- aqui foi separado os inserts pq precisamos do id da unidade de
	-- combate

	insert into Unidade
		(idPlayer,nivel,maxSoldados,qtdSoldados,tipo)
	VALUES
		(NEW.idPlayer,10,100,0,'COMBATE')
	RETURNING idUnidade into idUnidadeCombate;

	insert into Unidade
		(idPlayer,nivel,maxSoldados,qtdSoldados,tipo)
	values
		(NEW.idPlayer,0,100,0,'MEDICA'),
		(NEW.idPlayer,0,100,0,'INTELIGENCIA'),
		(NEW.idPlayer,0,100,0,'DESENVBASE'),
		(NEW.idPlayer,0,100,0,'SUPORTE');

	-- inserção do big boss
	INSERT INTO NPC 
		(idUniforme, idUnidade, nome, qtdVida, nivelDesenvBase, nivelCombate, nivelSuporte,nivelMedica,nivelInteligencia)
	VALUES
		(4, idUnidadeCombate, 'Big boss',100,5,4,5,6,1)
	RETURNING idNpc into novoIdNpc;

	-- atibui Big Boss ao Player;
	UPDATE Player set idNpc = novoIdNpc WHERE idPlayer = NEW.idPlayer;
	RETURN NULL;
END;
$insert_player$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER insert_player AFTER INSERT ON Player 
    FOR EACH ROW EXECUTE FUNCTION insert_player();

