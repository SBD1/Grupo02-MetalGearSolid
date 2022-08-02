INSERT INTO Arma 
(nome,dano,maxBalas,tamPente,probAcerto,txDisparo,tipo,penetracao,municaoLetal)
VALUES
('AK-47',33,120,30,20,5,'PRIMARIA',50,TRUE),
('M16',20,120,30,25,3,'PRIMARIA',40,TRUE),
('GLOCK',15,80,20,15,3,'SECUNDARIA',30,TRUE),
('.38',100,30,6,50,1,'SECUNDARIA',90,TRUE),
('TASER',100,5,15,50,1,'SECUNDARIA',100,FALSE);


insert into BaseMae (idBaseMae) values (DEFAULT);

INSERT INTO codinome (
nomeCodinome, descricao, requisito)
VALUES
('Pintinho', 'Codinome dado aos soldados que acabaram de acordar', 'Codinome padrão após completar três missões'),
('Cão de Caça', 'Codinome dado aos soldados que compleram repetidas missões com stealth perfeito', 'Completar 3 missões seguidas sem matar inimigos e em stealth não sendo detectado'),
('Raposa', 'Codinome dado aos soldados que completarm repeditas missões em stealth', 'Completar 3 missões seguidas em stealth perfeito'),
('Águia', 'Codinome dado aos soldados que usaram headshots para conseguir grandes vitórias', 'Pelo menos 90% dos inimigos serem neutralizados com headshots'),
('Louva-a-deus', 'Codinome dado aos soldados que usaram a faca para conseguir grandes vitórias', 'A maioria dos inimigos devem ser neutralizados com a faca');


INSERT INTO Item
(idItem, nome, descricao, dano, probNocaute )
VALUES
(1, 'Granada de mão', 'Projétil explosivo.', 80, 80),
(2, 'Coquetel Molotov', 'Projétil que queima ao entrar em contato com a superfície.', 60, 60),
(3, 'Faca de arremesso', 'Faca de metal projetada para arremesso.', 45, 60),
(4, 'Pedra', 'Pedra comum. Pode ser usada como projétil.', 20, 80),
(5, 'Garrafa', 'Garrafa de pinga. Pode ser usada como projétil.', 20, 80);

INSERT INTO MapaPosicionaRecurso
(idMapa,idRecurso,pontoX, pontoY, quantidade)
VALUES 
(1, 8,10, 10,2000),
(1, 9, 10, 10,2000),
(5, 11, 15, 16, 3000),
(4, 13, 6, 6,2000),
(3, 12, 12, 12,2000);

INSERT INTO Mapa (idMapa, tamanho, nome, idMissao)
VALUES
(1, 30, 'Amazônia', 1),
(2, 2, 'Casa na Árvore Abandonada', 2),
(3, 30, 'Kabul, Afeganistao', 3),
(4, 10, 'Base Inimiga', 4),
(5, 30, 'Serengeti, Tanzania', 5);

INSERT INTO MapaTemMapa (idMapaDono, idMapa, pontoX, pontoY)
VALUES
(1, 2, 5, 10);
INSERT INTO Missao (titulo, descricao)
VALUES
    ('Prólogo, Despertar.','Escape the hospital.'),
    ('Membros fantasmas.','Rescue your old partner, Kazuhira Miller. He has been captured by the Soviets and is being interrogated at Ghwandai Town.'),
    ('Caminho do herói.','Eliminate the Spetsnaz detachment commander secretly involved in the scorched earth operation in Afghanistan. The target and his recon unit have occupied Shago Village and are ready to meet an assault.'),
    ('Comando e controle de guerra.','Destroy the Soviet comms equipment to prevent reinforcements being sent between outposts.'),
    ('Língua Franca','Tail the Afrikaans interpreter working with the interrogator at Kiziba Camp, and rescue the British prisoner known as the Viscount.'),
    ('Seguindo a trilha','The commander of a PF, known as the Major, has been spreading a rumor about selling nuclear weapons. Tail his subordinate, and eliminate the Major.'),
    ('Economia de guerra','Eliminate the CFA official stationed at Nova Braga Airport. He is due to conduct an inspection with a visiting arms dealer, so expect heavy security.'),
    ('The White Mamba','Eliminate the militants at Masa Village who have been pillaging nearby settlements. They are said to all be children. Extract their commander, the "White Mamba", and the group will fall apart.'),
    ('Code Talker','Make contact with and extract Code Talker, the old man who knows how to treat the pathogen affecting Mother Base. In addition to the local PF guarding the mansion where he is located, an unidentified force has been observed operating in the area.'),
    ('Skull Face','Skull Face has occupied the secret Soviet weapon design bureau OKB Zero, and advanced his plan to its final phase. Prevent the combat deployment of the upright bipedal weapon Sahelanthropus, and take vengeance on Skull Face.'),
    ('Legado amaldiçoado','Recover the two containers loaded with Code Talker''s research materials. The containers are hidden in the jungle, and XOF choppers are en route to collect them.'),
    ('O homem que vendeu o mundo','Escape the hospital.');

INSERT INTO NPCEquipaArma
(idNPC,idArma)
VALUES
(1,5),
(2,4),
(3,1),
(4,3),
(5,4),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,4),
(12,5),
(13,3),
(14,5),
(15,3),
(16,2),
(17,4),
(18,1),
(19,5),
(20,2);

INSERT INTO NPC 
(idUniforme, idUnidade, nome, qtdVida, nivelDesenvBase, nivelCombate, nivelSuporte,nivelMedica,nivelInteligencia)
VALUES
(4, 1,'Flavin do pastel',100,5,4,5,6,1), 
(4, 1,'Vei da tresoitao',100,3,5,10,6,7), 
(4, 1,'Teu pai',100,10,10,10,10,10), 
(4, 4,'Zezin',100,3,6,5,6,8), 
(1, 4,'Cabo Loso',100,10,10,10,10,10), 
(3, 4,'Lucas',100,5,5,5,5,5), 
(3, 3,'Laurao',100,5,5,5,5,5), 
(3, 3,'Mateus',100,5,5,5,5,5), 
(3, 3,'Joao',100,5,5,5,5,5), 
(3, 3,'Rafael',100,5,5,5,5,5), 
(3, 3,'Otaco',100,3,2,5,3,1), 
(3, 3,'Xaruto',100,10,4,5,6,7), 
(5, 2,'Suzuki',100,3,4,5,6,1), 
(5, 2,'Saci Perere',100,5,7,5,6,8), 
(5, 2,'Marba Rato',100,3,4,5,6,9), 
(5, 2,'Pescotapa',100,5,10,5,6,6), 
(1, 4,'Seu Vagem',100,5,4,5,7,7), 
(1, 4,'Tom Holland',100,5,4,5,3,8), 
(1, 4,'Tobey Maguire',100,3,9,5,6,3), 
(1, 4,'Andre do Gato',100,2,4,1,8,7);

INSERT INTO NPCUsaItem
(idNPC,idItem,quantidade)
VALUES
(1,5,1),
(2,4,1),
(3,1,1),
(4,2,1),
(5,5,1),
(6,3,1),
(7,3,1),
(8,5,1),
(9,1,1),
(10,2,1),
(11,3,1),
(12,3,1),
(13,5,1),
(14,3,1),
(15,4,1),
(16,4,1),
(17,2,1),
(18,1,1),
(19,4,1),
(20,2,1);

INSERT INTO Objetivo (idMapa, descricao, pontoX, pontoY, tipo)
VALUES
(1, 'Escape do hospital.', 30, 27, 'PRINCIPAL'),
(1, 'Encontre Kazuhira Miller', 29, 5, 'PRINCIPAL'),
(1, 'Extraia Kazuhira Miller', 7, 6, 'PRINCIPAL'),
(1, 'Interrogue o comandante spetsnaz', 11, 18, 'PRINCIPAL'),
(1, 'Elimine o comandante ou extraia-o para a base mãe.', 26, 21, 'PRINCIPAL'),
(1, 'Encontre o equipamento de comunicação.', 24, 3, 'PRINCIPAL'),
(1, 'Destrua o equipamento no posto de comunicação.', 15, 9, 'PRINCIPAL'),
(1, 'Extraia o Intérprete Africano', 1, 2, 'PRINCIPAL'),
(2, 'Extraia o Visconde', 1, 2, 'PRINCIPAL'),
(3, 'Neutralize o subordinado do comandante das Forças Privadas', 8, 16, 'PRINCIPAL'),
(3, 'Neutralize o comandante', 25, 19, 'PRINCIPAL'),
(3, 'Neutralize o vendedor de armas', 28, 23, 'PRINCIPAL'),
(3, 'Neutralize o oficial de Contrato das Forças da África (CFA)', 1, 2, 'PRINCIPAL'),
(3, 'Extraia o White Mamba', 1, 2, 'PRINCIPAL'),
(2, 'Extraia o Code Talker', 0, 1, 'PRINCIPAL'),
(2, 'Obtenha a fita cassete em OKB Zero', 1, 2, 'PRINCIPAL'),
(3, 'Entre em contato com Skull Face', 1, 2, 'PRINCIPAL'),
(5, 'Extraia os 2 containers com a pesquisa do code talker.', 7, 12, 'PRINCIPAL'),
(5, 'Escape do hospital', 30, 3, 'PRINCIPAL'),
(3, 'Extraia o comandante do quartel Wakh Sind', 3, 4, 'SECUNDARIO'),
(3, 'Pegue os diamantes escondidos.', 9, 0, 'SECUNDARIO'),
(3, 'Extraia o motorista do caminhão.', 8, 8, 'SECUNDARIO'),
(3, 'Obtenha as plantas medicinais perto do quartel', 1, 4, 'SECUNDARIO'),
(3, 'Obtenha os materiais processados do quartel', 2, 2, 'SECUNDARIO'),
(3, 'Extraia os 2 prisioneiros mantidos no vilarejo Wialo.', 3, 4, 'SECUNDARIO'),
(4, 'Extraia os contêineres de materiais brutos.', 3, 10, 'SECUNDARIO'),
(4, 'Obtenha os diamantes brutos escondidos.', 1, 5, 'SECUNDARIO'),
(4, 'Extraia 3 prisioneiros no campo de Kiziba', 9, 4, 'SECUNDARIO'),
(4, 'Extraia o prisioneiro mantido em Munoko ya Nioka', 7, 2, 'SECUNDARIO'),
(4, 'Extraia os containers de materiais brutos.', 10, 10, 'SECUNDARIO'),
(4, 'Obtenha os diamantes brutos.', 7, 7, 'SECUNDARIO'),
(4, 'Extraia o prisioneiro mantido no vilarejo Masa', 3, 4, 'SECUNDARIO'),
(4, 'Obtenha os diamantes brutos.', 3, 4, 'SECUNDARIO'),
(5, 'Obtenha material processado da mansão.', 10, 3, 'SECUNDARIO'),
(5, 'Obtenha os containers com materiais brutos.', 13, 2, 'SECUNDARIO'),
(5, 'Obtenha os diamantes brutos.', 3, 4, 'SECUNDARIO'),
(5, 'Obtenha material processado em OKB Zero.', 25, 1, 'SECUNDARIO'),
(5, 'Obtenha os containers com materiais brutos. ', 0, 0, 'SECUNDARIO'),
(5, 'Obtenha os diamantes brutos.', 3, 4, 'SECUNDARIO'),
(5, 'Extraia o comandante da força de segurança.Objetivos:', 3, 28, 'SECUNDARIO'),
(5, 'Elimine 6 soldados na entrada do hospital. ', 22, 4, 'SECUNDARIO');

insert into Recurso
(idBaseMae,qtdBruto,qtdProcessado,tipo)
values
(1,0,230000,'PMB'),
(1,20000,1500,'COMBUSTIVEL'),
(1,20000,3000,'METALSECUNDARIO'),
(1,20000,4500,'METALPRECIOSO'),
(1,20000,6000,'METALPRIMARIO'),
(1,0,700,'PLANTA'),
(1,15000,7500,'MATERIALBIOLOGICO'),
(1,1,1,'PMB'),
(1,1,1,'COMBUSTIVEL'),
(1,1,1,'METALSECUNDARIO'),
(1,1,1,'METALPRECIOSO'),
(1,1,1,'METALPRIMARIO'),
(1,1,1,'PLANTA'),
(1,1,1,'MATERIALBIOLOGICO');

INSERT INTO Terreno
(idTerreno, descricao, vegetacao)
VALUES
(1, 'Representa uma cidade ou um interior de uma edificacao', 'Urbano'),
(2, 'Representa um ambiente que possui uma fabrica ou indústria e seus respecrivos interiores', 'Industrial'),
(3, 'Representa ambientes arenosos ou gelidos, ambientes abertos e com pouquíssimas plantas', 'Deserto'),
(4, 'Representa uma parte do continente africano', 'Africa Central'),
(5, 'Representa ambientes com uma abundancia gigantesta de platas e alta umidade', 'Floresta');
insert into Unidade
(idBaseMae,nivel,maxSoldados,qtdSoldados,tipo)
values
(1,0,100,0,'COMBATE'),
(1,0,100,0,'MEDICA'),
(1,0,100,0,'INTELIGENCIA'),
(1,0,100,0,'DESENVBASE'),
(1,0,100,0,'SUPORTE');

INSERT INTO UniformeCamuflaTerreno (idTerreno, idUniforme, taxaCamuflagem)
VALUES
(1, 1, 60),
(2, 2, 60),
(3, 3, 70),
(4, 4, 75),
(5, 5, 80);
INSERT INTO Uniforme (idUniforme, nome, defesa)
VALUES
(1, 'Farda preta', 30),
(2, 'Farda cinza', 30),
(3, 'Lobo do deserto', 30),
(4, 'Savana', 30),
(5, 'Lone survivor', 30);

