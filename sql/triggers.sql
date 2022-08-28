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

CREATE TRIGGER insert_player AFTER INSERT ON Player 
    FOR EACH ROW EXECUTE FUNCTION insert_player();

