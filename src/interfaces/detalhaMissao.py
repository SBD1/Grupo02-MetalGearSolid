from classes.ControlaBanco import ControlaBanco
from settings import desenha_cabecalho
from classes.Player import Player
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
    printa_estatisticas(numero_da_missao, player)


def printa_descricao(objetivos):
    for objetivo in objetivos:
        descricao_objetivo = objetivo[0]
        print("\t - " + descricao_objetivo)


def trata_entrada(entrada): # funcao ainda não pensada
    return entrada


def printa_estatisticas(numero_da_missao, player):
    banco = ControlaBanco()
    estatisticas = banco.select("PlayerCumpreMissao", "idEstatistica", f"idPlayer = {player.id_player} and idMissao = {numero_da_missao}")

    if estatisticas:
        for estatistica in estatisticas:
            id_estatistica = estatistica[0]
            tuplas = banco.select("Estatistica", "numMovimentos,  numHeadshots, numAbates, numNocautes, nomeCodinome", f"idEstatistica = {id_estatistica}")
            i = 1
            for tupla in tuplas:
                print(f"Conjunto de estatísticas #{i}")
                num_movimentos = tupla[0]
                num_headshots = tupla[1]
                num_abates = tupla[2]
                num_nocautes = tupla[3]
                nome_codinome = tupla[4]
                print(f"\t - Codinome: {nome_codinome}")
                print(f"\t - Número de movimentos: {num_movimentos}")
                print(f"\t - Número de headshots: {num_headshots}")
                print(f"\t - Número de abates: {num_abates}")
                print(f"\t - Número de nocautes: {num_nocautes}")

                i += 1

    else:
        print(f"O player {player.nome} ainda não jogou a missao {numero_da_missao}")

    input(">> ")
