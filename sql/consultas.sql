select 
    u.tipo, u.qtdsoldados, u.nivel,
    n.nome, n.qtdvida, n.niveldesenvbase, n.nivelcombate
from unidade u
inner join npc n on
n.idunidade = u.idunidade

