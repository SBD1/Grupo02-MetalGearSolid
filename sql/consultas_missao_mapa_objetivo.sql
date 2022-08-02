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

-- mostra quantidade de ocorrencias existentes das tabelas
select count(*) from mapa;
select count(*) from objetivo;
select count(*) from missao;

