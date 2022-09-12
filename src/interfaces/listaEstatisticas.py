from classes.ControlaBanco import ControlaBanco
from classes.Player import Player
from settings import desenha_cabecalho
import time


def lista_estatisticas(numero_da_missao, player):
    time.sleep(0.2)
    desenha_cabecalho()
    time.sleep(0.3)
    banco = ControlaBanco()
    estatisticas = banco.select("PlayerCumpreMissao", "idEstatistica", f"idPlayer = {player.id_player} and idMissao = {numero_da_missao}")

    if estatisticas:
        for estatistica in estatisticas:
            id_estatistica = estatistica[0]
            tuplas = banco.select("Estatistica", "numMovimentos,  numHeadshots, numAbates, numNocautes, nomeCodinome", f"idEstatistica = {id_estatistica}")
            i = 1
            for tupla in tuplas:
                print(f"Conjunto de estatísticas #{i}")
                time.sleep(0.3)
                num_movimentos = tupla[0]
                num_headshots = tupla[1]
                num_abates = tupla[2]
                num_nocautes = tupla[3]
                nome_codinome = tupla[4]
                print(f"\t - Codinome: {nome_codinome}")
                time.sleep(0.2)
                print(f"\t - Número de movimentos: {num_movimentos}")
                time.sleep(0.2)
                print(f"\t - Número de headshots: {num_headshots}")
                time.sleep(0.2)
                print(f"\t - Número de abates: {num_abates}")
                time.sleep(0.2)
                print(f"\t - Número de nocautes: {num_nocautes}")
                time.sleep(0.2)

                i += 1

    else:
        print(f"O player {player.nome} ainda não jogou a missao {numero_da_missao}")
        time.sleep(1)

    input(">> ")
