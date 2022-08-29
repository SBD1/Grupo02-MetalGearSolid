INSERT INTO NPC 
(idUniforme, idUnidade, nome, qtdVida, nivelDesenvBase, nivelCombate, nivelSuporte,nivelMedica,nivelInteligencia)
VALUES
(5, 1,'Kazemiro Miller',20,8,7,5,6,10), 
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

-- Posicionando NPCS nos mapas
UPDATE NPC
SET idMapa = 2, pontoX = 0,pontoY = 2
WHERE idNPC = 1;

UPDATE NPC
SET idMapa = 2, pontoX = 1,pontoY = 1
WHERE nome = 'Andre do Gato';

UPDATE NPC
SET idMapa = 1, pontoX = 3,pontoY = 0
WHERE nome = 'Tobey Maguire';

UPDATE NPC
SET idMapa = 1, pontoX = 1,pontoY = 1
WHERE nome = 'Seu Vagem';

UPDATE NPC
SET idMapa = 1, pontoX = 4,pontoY = 2
WHERE nome = 'Pescotapa';

UPDATE NPC
SET idMapa = 1, pontoX = 4,pontoY = 2
WHERE nome = 'Cabo Loso';

UPDATE NPC
SET idMapa = 1, pontoX = 3,pontoY = 2
WHERE nome = 'Suzuki';
