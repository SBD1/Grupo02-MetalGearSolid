SELECT 
    u.tipo, u.qtdsoldados, u.nivel,
    n.nome, n.qtdvida, n.niveldesenvbase, n.nivelcombate
FROM unidade u
INNER JOIN npc n ON
n.idunidade = u.idunidade

select npc.nome,arma.nome 

FROM 
npc JOIN npcequipaarma  
ON npc.idnpc = npcequipaarma.idnpc 
JOIN arma ON arma.idarma = npcequipaarma.idarma;
