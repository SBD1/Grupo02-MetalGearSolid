from classes.ControlaBanco import ControlaBanco
from settings import desenha_cabecalho
from classes.Player import Player
from listaEstatisticas import lista_estatisticas
from preparaMissao import prepara_missao
import time


def detalhar_missao(numero_da_missao, player: Player):
    desenha_cabecalho()

    banco = ControlaBanco()
    missao = banco.select("missao", "titulo, descricao", f"idMissao = {numero_da_missao}")
    objetivos_principais = banco.select("objetivo", "descricao", f"idMissao = {numero_da_missao} and tipo = 'PRINCIPAL' ")
    objetivos_secundarios = banco.select("objetivo", "descricao", f"idMissao = {numero_da_missao} and tipo = 'SECUNDARIO'")

    titulo_missao = missao[0][0]
    descricao_missao = missao[0][1]

    print(f"Título: {titulo_missao}")
    print(f"Descrição: {descricao_missao}")

    print("Objetivos principais: ")

    printa_descricao(objetivos_principais)

    print("Objetivos secundarios: ")

    printa_descricao(objetivos_secundarios)

    print("""Para iniciar a missão, digite "iniciar". """)
    print("""Para ver as estatísticas de cumprimento da missão, digite "estatisticas".""")
    print("""Para voltar digite 'voltar'. """)

    while True:
        entrada_do_jogador = input(">> ").strip()

        if entrada_do_jogador == "estatisticas" :
            lista_estatisticas(numero_da_missao, player)
            break
        elif entrada_do_jogador == "iniciar":
            prepara_missao(player, numero_da_missao)
            break
        elif entrada_do_jogador == "voltar":
            break
        else:
            print("Entrada invalida")


def printa_descricao(objetivos):
    for objetivo in objetivos:
        descricao_objetivo = objetivo[0]
        print("\t - " + descricao_objetivo)
    print()
