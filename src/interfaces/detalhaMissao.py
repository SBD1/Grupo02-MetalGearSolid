from classes.ControlaBanco import ControlaBanco
from settings import desenha_cabecalho
from classes.Player import Player
from listaEstatisticas import lista_estatisticas
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

    entrada_do_jogador = input(">> ").split()

    entrada_do_jogador = trata_entrada(entrada_do_jogador)

    #  a função abaixo só deve ser chamada quando a entrada do jogador for 'estatisticas'.
    lista_estatisticas(numero_da_missao, player)


def printa_descricao(objetivos):
    for objetivo in objetivos:
        descricao_objetivo = objetivo[0]
        print("\t - " + descricao_objetivo)


def trata_entrada(entrada): # funcao ainda não pensada
    return entrada

