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

CREATE OR REPLACE TRIGGER verifica_objetivo BEFORE INSERT ON Objetivo
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
	RETURN NEW;
END;
$insert_player$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER insert_player AFTER INSERT ON Player 
    FOR EACH ROW EXECUTE FUNCTION insert_player();

