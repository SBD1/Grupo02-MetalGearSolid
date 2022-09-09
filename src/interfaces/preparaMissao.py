from classes.Player import Player
from classes.ControlaBanco import ControlaBanco
from settings import desenha_cabecalho
import time


def prepara_missao(player: Player, id_missao: int):
    desenha_cabecalho()
    banco = ControlaBanco()

    mapas_missao = banco.select("Mapa", "idMapa, nome", f"idMissao = {id_missao}")

    for mapa in mapas_missao:
        # terreno = banco.select("Terreno", "", "")
        # temos que mexer no DDL antes de mexer aqui...
        pass
