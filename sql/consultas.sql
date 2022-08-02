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

-- Mostrar todos os mapas e seus tamanhos
select nome, tamanho || 'x' || tamanho as tamanho from mapa;

-- Mostrar descrição dos objetivos do Mapa com id 1 (nesse caso, o mapa amazônia)
select descricao, '(' || pontoX || ', ' || pontoY || ')' as localizacao, tipo from objetivo where idMapa = 1;

-- Listagem de todos os objetivos e o mapa na qual se encontram, assim como suas
-- propriedades (tipo, localizcao) 
select 
	m.nome as nome_mapa, 
	o.descricao as descricao_objetivo,
	o.tipo,
	'(' || o.pontoX || ', ' || o.pontoY || ')' as localizacao 
from objetivo o inner join mapa m on o.idmapa = m.idmapa order by m.nome asc;

-- listagem das missoes
select titulo, descricao from missao;

-- listagem das missoes e seus respectivos mapas
select
	ma.nome as nome_mapa,
	mi.titulo as titulo_missao,
	mi.descricao as descricao_missao
from mapa ma inner join missao mi on ma.idmissao = mi.idmissao;

-- relaçao dos mapas que contem mapas, mostra o nome do mapa dono, o mapa que o
-- mapa dono contém, o tamanho dele e a localizacao dele no mapa grande
select 
	md.nome as mapa_dono_nome,
	m.nome as mapa_nome,
	m.tamanho || 'x' || m.tamanho as mapa_tamanho,
	'(' || mtm.pontoX || ', ' || mtm.pontoY || ')' as localizacao
from mapatemmapa mtm
inner join mapa md on 
mtm.idmapadono = md.idmapa
inner join mapa m on 
mtm.idmapa = m.idmapa 

-- mostra quantidade de ocorrencias existentes das tabelas
select count(*) from mapa;
select count(*) from objetivo;
select count(*) from missao;

