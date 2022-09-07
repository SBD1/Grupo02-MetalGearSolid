from ControlaBanco import ControlaBanco

class Player:
    def __init__(self,nome=''):
        self.conector = ControlaBanco()

        self.nome = nome
        self.npc = None
        self.unidades = None
        self.recursos = None
