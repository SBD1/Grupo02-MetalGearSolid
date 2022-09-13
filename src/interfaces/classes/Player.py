from classes.ControlaBanco import ControlaBanco
from classes.Npc import NPC


class Player:
    def __init__(
            self,
            nome='',
            id_player=0
            ):

        self.conector = ControlaBanco()
        self.id_player = id_player
        self.nome = nome
        self.npc = NPC(self.conector.select("Player","idNpc",f"idPlayer={id_player}")[0][0])
        self.unidades = self.conector.select("Unidade", "idUnidade, nivel, qtdSoldados, tipo, maxSoldados", f"idPlayer={id_player}")
        self.recursos = self.conector.select("Recurso", "idRecurso, qtdBruto, qtdProcessado, tipo", f"idPlayer = {id_player}")
