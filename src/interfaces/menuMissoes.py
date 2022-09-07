from classes.ControlaBanco import ControlaBanco
from settings import desenha_cabecalho, player


def interface_menu_missoes():
    banco = ControlaBanco()
    missoes_disponiveis = banco.select("missao", "titulo, descricao", "idMissao = 2")
    titulo_missao = missoes_disponiveis[0][0]
    descricao_missao = missoes_disponiveis[0][1]

    print(titulo_missao)
    print(descricao_missao)

    print(missoes_disponiveis)

    print(player)
