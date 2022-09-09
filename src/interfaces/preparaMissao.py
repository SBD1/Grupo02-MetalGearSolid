from classes.Player import Player
from classes.ControlaBanco import ControlaBanco
from settings import desenha_cabecalho
import time


def prepara_missao(player: Player, id_missao: int):
    desenha_cabecalho()
    banco = ControlaBanco()

    print("idmissao = " + str(id_missao))
    print(banco.select("Mapa", "idMapa, nome", f"idMissao = {id_missao}"))

