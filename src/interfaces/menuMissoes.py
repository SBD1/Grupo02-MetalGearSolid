from classes.ControlaBanco import ControlaBanco
from settings import desenha_cabecalho
from classes.Player import Player
from detalhaMissao import detalhar_missao
import time

MENSAGEM_INTERFACE_MENU_MISSOES = """Caso queira voltar ao menu principal, digite "voltar".
Caso queira ver os detalhes de uma missão específica e/ou jogá-la, digite "numero_da_missao" """


ENTRADAS_ACEITAS = {
    'voltar': False,
}


def interface_menu_missoes(player: Player):
    time.sleep(0.2)
    desenha_cabecalho()
    time.sleep(0.3)
    banco = ControlaBanco()
    missoes_disponiveis = banco.select("missao", "titulo,idMissao")

    print("Lista de missões:")
    time.sleep(0.3)
    numero_da_missao = 1

    print("----------------------------------------------------------------------------------------------------------------------------------------------")

    for missao in missoes_disponiveis:
        titulo_missao = missao[0]
        id_missao = missao[1]

        rank = banco.select("PlayerCumpreMissao as pcm join Estatistica as e on pcm.idEstatistica = e.idEstatistica",
                            "nomeCodinome",
                            f"idPlayer = 1 and idMissao = {numero_da_missao}")

        print("\n")
        time.sleep(0.5)
        print(f"Missão #{id_missao}: {titulo_missao}")
        if rank:
            print(f"Rank: {rank[0][0]}")
        else:
            print("Rank : --- ")

        ENTRADAS_ACEITAS[str(numero_da_missao)] = numero_da_missao
        numero_da_missao = numero_da_missao + 1

    quantidade_de_missoes_disponiveis = numero_da_missao - 1

    time.sleep(0.3)
    print("----------------------------------------------------------------------------------------------------------------------------------------------")
    time.sleep(0.3)
    print(MENSAGEM_INTERFACE_MENU_MISSOES)

    while True:
        try:
            entrada_do_jogador = input(">> ")
            if type(ENTRADAS_ACEITAS[entrada_do_jogador]) is int:
                detalhar_missao(ENTRADAS_ACEITAS[entrada_do_jogador], player)
                break
            else:
                break
        except KeyError:
            time.sleep(0.1)
            print("Entrada invalida!!!")
            time.sleep(0.3)