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

    for objetivo in objetivos_principais:
        print("\t - " + objetivo[0])

    print("Objetivos secundarios: ")

    for objetivo in objetivos_secundarios:
        print("\t - " + objetivo[0])

    input("PARAAAA")
