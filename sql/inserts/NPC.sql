INSERT INTO NPC 
(idUniforme, idUnidade, nome, qtdVida, nivelDesenvBase, nivelCombate, nivelSuporte,nivelMedica,nivelInteligencia)
VALUES
(5, 1,'Kazuhira Miller',20,8,7,5,6,10), 
(4, 1,'Quiet',100,5,4,5,6,1), 
(4, 1,'Sgt. John Owen',100,3,5,10,6,7), 
(4, 1,'Revolver Ocelot',100,10,10,10,10,10), 
(4, 4,'Psycho Mantis',100,3,6,5,6,8), 
(1, 4,'Cpt. Lizard Basil',100,10,10,10,10,10), 
(3, 4,'Sgt. Fyodor Vitaly',100,5,5,5,5,5), 
(3, 3,'Pvt. Johnson',100,5,5,5,5,5), 
(3, 3,'Pvt. Lomonosov',100,5,5,5,5,5), 
(3, 3,'Pvt. Sevastyanov',100,5,5,5,5,5), 
(3, 3,'Cpt. Jones',100,5,5,5,5,5), 
(3, 3,'Sgt. Robertson',100,3,2,5,3,1), 
(3, 3,'Pvt. Richards',100,10,4,5,6,7), 
(5, 2,'Pvt. Jordan',100,3,4,5,6,1), 
(5, 2,'Pvt. Patrickson',100,5,7,5,6,8), 
(5, 2,'Cpt. Nasir',100,3,4,5,6,9), 
(5, 2,'Sgt. Kofi',100,5,10,5,6,6), 
(1, 4,'Pvt. Dost',100,5,4,5,7,7), 
(1, 4,'Pvt. Akrami',100,5,4,5,3,8), 
(1, 4,'Pvt. Qarlooq',100,3,9,5,6,3), 
(1, 4,'Pvt. Farhad',100,2,4,1,8,7);

-- Posicionando NPCS nos mapas
UPDATE NPC
SET idMapa = 2, pontoX = 0,pontoY = 2
WHERE idNPC = 1;

UPDATE NPC
SET idMapa = 2, pontoX = 1,pontoY = 1
WHERE nome = 'Cpt. Nasir';

UPDATE NPC
SET idMapa = 1, pontoX = 3,pontoY = 0
WHERE nome = 'Pvt. Dost';

UPDATE NPC
SET idMapa = 1, pontoX = 1,pontoY = 1
WHERE nome = 'Pvt. Qarlooq';

UPDATE NPC
SET idMapa = 1, pontoX = 4,pontoY = 2
WHERE nome = 'Pvt. Farhad';

UPDATE NPC
SET idMapa = 1, pontoX = 4,pontoY = 2
WHERE nome = 'Sgt. Kofi';

UPDATE NPC
SET idMapa = 1, pontoX = 3,pontoY = 2
WHERE nome = 'Pvt. Akrami';
