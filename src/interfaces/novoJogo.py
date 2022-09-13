from menuMissoes import interface_menu_missoes
from classes.ControlaBanco import ControlaBanco
from classes.Player import Player
from settings import desenha_cabecalho
import time

MENSAGEM_INTERFACE_NOVO_JOGO = """Insira o seu nome de usuário.
Esse nome será utilizado para identificá-lo e para carregar o progresso.
Caso queira voltar ao menu principal, digite "voltar"."""


def interface_novo_jogo():

    banco = ControlaBanco()
    time.sleep(0.3)
    desenha_cabecalho()
    time.sleep(0.5)
    print(MENSAGEM_INTERFACE_NOVO_JOGO)
    time.sleep(2)
    entrada_do_jogador = input(">> ")

    while entrada_do_jogador != "voltar":

        player = banco.select("Player", "nome, idPlayer", f"nome = '{entrada_do_jogador}'")

        if player:

            nome_player = player[0][0]
            time.sleep(0.2)
            print(f"O usuário {nome_player} já existe no sistema.")
            time.sleep(0.3)
        else:
            banco.insert("Player", "nome", f"'{entrada_do_jogador}'")
            time.sleep(0.2)
            print(f"""O player "{entrada_do_jogador}" foi cadastrado no sistema.""")
            dados_player = banco.select("player", "nome, idPlayer", f"nome = '{entrada_do_jogador}' ")
            time.sleep(1)

            nome_player = dados_player[0][0]
            id_player = dados_player[0][1]

            print("Iniciando o jogo...")

            time.sleep(1.5)
            interface_menu_missoes(Player(nome_player, id_player))
            break

        entrada_do_jogador = input(">> ")


