from menuMissoes import interface_menu_missoes
from classes.ControlaBanco import ControlaBanco
from classes.Player import Player
from settings import desenha_cabecalho
import time

MENSAGEM_INTERFACE_CARREGAMENTO = """Insira o seu nome de usuário.
Caso queira voltar ao menu principal, digite "voltar"."""


def interface_carregamento_jogo():

    banco = ControlaBanco()
    time.sleep(0.2)
    desenha_cabecalho()
    time.sleep(0.3)
    print(MENSAGEM_INTERFACE_CARREGAMENTO)
    time.sleep(1)

    entrada_do_jogador = input(">> ")
    while entrada_do_jogador != "voltar":
        player = banco.select("Player", "nome, idPlayer", f"nome = '{entrada_do_jogador}'")

        if not player:
            time.sleep(0.2)
            print("Insira um nome existente no sistema!")
            time.sleep(0.5)
            print("""Caso queira voltar ao menu principal, digite "voltar". """)
            time.sleep(0.5)
        else:

            nome_player = player[0][0]
            id_player = player[0][1]
            time.sleep(0.2)
            print(f"""Carregando o jogo do usuário "{nome_player}"...""")
            time.sleep(1)

            interface_menu_missoes(Player(nome_player, id_player))

            break

        entrada_do_jogador = input(">> ")


def trata_entrada(entrada):
    pass
