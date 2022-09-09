from classes.ControlaBanco import ControlaBanco
from settings import desenha_cabecalho
from classes.Player import Player
import time

MENSAGEM_INTERFACE_MENU_MISSOES = """Caso queira voltar ao menu principal, digite "voltar".
Caso queira ver os detalhes de uma missão específica e/ou jogá-la, digite "detalhar numero_da_missao" """


def interface_menu_missoes(player: Player):

    desenha_cabecalho()
    banco = ControlaBanco()
    missoes_disponiveis = banco.select("missao", "titulo,idMissao")

    print("Lista de missões:")
    numero_da_missao = 1

    print("----------------------------------------------------------------------------------------------------------------------------------------------")

    for missao in missoes_disponiveis:
        titulo_missao = missao[0]
        id_missao = missao[1]

        rank = banco.select("PlayerCumpreMissao as pcm join Estatistica as e on pcm.idEstatistica = e.idEstatistica",
                            "nomeCodinome",
                            f"idPlayer = 1 and idMissao = {numero_da_missao}")

        print("\n")
        print(f"Missão #{id_missao}: {titulo_missao}")
        if rank:
            print(f"Rank: {rank[0][0]}")
        else:
            print("Rank = --- ")

        numero_da_missao = numero_da_missao + 1

    quantidade_de_missoes_disponiveis = numero_da_missao - 1

    print("----------------------------------------------------------------------------------------------------------------------------------------------")
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
        detalhar_missao()
        time.sleep(1)


def trata_entrada(entrada, quantidade_de_missoes_disponiveis):  # função que trata a entrada do jogador
    if len(entrada) > 2: # caso haja mais de 2 strings na entrada
        return True
    if entrada[0] != "voltar" and entrada[0] != "detalhar":
        return True

    if len(entrada) == 1:  # se a entrada for voltar ou detalhar, vai entrar nesse if. Nesse caso, devemos sair do loop.
        return False

    if int(entrada[1]) < 1 or int(entrada[1]) > quantidade_de_missoes_disponiveis:   # caso o numero da missão não esteja dentro do escopo aceito
        return True
