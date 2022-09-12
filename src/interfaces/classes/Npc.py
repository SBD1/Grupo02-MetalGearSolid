from classes.ControlaBanco import ControlaBanco
from classes.Uniforme import Uniforme

class NPC:
    def __init__(self,idNpc):
        self.id_npc = idNpc
        self.conector = ControlaBanco()

        linha = self.conector.select("NPC","nome,qtdVida,idUniforme",f"idNPC = {self.idNpc}")[0]
        self.nome = linha[0]
        self.qtd_vida = linha[1]
        self.uniforme = Uniforme(linha[2])

    def lista_equipamento(self):
        pass
