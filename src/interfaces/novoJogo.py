from menuMissoes import interface_menu_missoes
from classes.ControlaBanco import ControlaBanco
from settings import desenha_cabecalho
import time

MENSAGEM_INTERFACE_NOVO_JOGO = """Insira o seu nome de usuário.
Esse nome será utilizado para identificá-lo e para carregar o progresso.
Caso queira voltar ao menu principal, digite "voltar"."""


def interface_novo_jogo():

    banco = ControlaBanco()
    desenha_cabecalho()
    print(MENSAGEM_INTERFACE_NOVO_JOGO)
    entrada_do_jogador = input(">> ")

    while entrada_do_jogador != "voltar":

        player = banco.select("Player", "nome", f"nome = '{entrada_do_jogador}'")

        if player:

            nome_player = player[0][0]

            print(f"O usuário {nome_player} já existe no sistema. Por favor, insira um nome válido!")
            print("""Caso queira voltar ao menu principal, digite "voltar". """)
        else:
            banco.insert("Player", "nome", f"'{entrada_do_jogador}'")
            print(f"""O player "{entrada_do_jogador}" foi cadastrado no sistema.""")

            time.sleep(2)

            print("Iniciando o jogo...")

            time.sleep(3)
            interface_menu_missoes()
            break

        entrada_do_jogador = input(">> ")


