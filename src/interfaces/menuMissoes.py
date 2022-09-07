from classes.ControlaBanco import ControlaBanco
from settings import desenha_cabecalho, player
import time

MENSAGEM_INTERFACE_MENU_MISSOES = """Caso queira voltar ao menu principal, digite "voltar".
Caso queira ver os detalhes de uma missão específica e/ou jogá-la, digite "detalhar numero_da_missao",
onde numero_da_missao é o número da missão escolhida. """


def interface_menu_missoes():

    banco = ControlaBanco()
    missoes_disponiveis = banco.select("missao", "titulo, descricao", "idMissao = 2")

    print("As seguintes missões estão disponíveis: ")
    numero_da_missao: int = 1

    for missao in missoes_disponiveis:
        titulo_missao = missao[0]
        descricao_missao = missao[1]

        print(f"Missão #{numero_da_missao}: {titulo_missao}")
        print(f"Descrição: {descricao_missao}\n")

        numero_da_missao = numero_da_missao + 1

    quantidade_de_missoes_disponiveis = numero_da_missao - 1

    print(MENSAGEM_INTERFACE_MENU_MISSOES)

    entrada_do_jogador = input(">> ")
    entrada_do_jogador = entrada_do_jogador.split()

    while trata_entrada(entrada_do_jogador, quantidade_de_missoes_disponiveis):
        print("Insira uma entrada válida!")
        entrada_do_jogador = input(">> ")
        entrada_do_jogador = entrada_do_jogador.split()

    if entrada_do_jogador[0] == "voltar":
        print("usuario quer sair")
        time.sleep(1)
    else:
        print("usuario quer detalhar as missões")
        time.sleep(1)


def trata_entrada(entrada, quantidade_de_missoes_disponiveis):  # refatorar quando possível
    if len(entrada) > 2:
        return True
    if entrada[0] != "voltar" and entrada[0] != "detalhar":
        return True

    if len(entrada) == 1:
        return False

    if int(entrada[1]) < 1 or int(entrada[1]) > quantidade_de_missoes_disponiveis:
        return True
