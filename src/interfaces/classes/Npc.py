from classes.ControlaBanco import ControlaBanco
from classes.Uniforme import Uniforme
from classes.Arma import Arma
import time


class NPC:
    def __init__(self, id_npc):
        self.id_npc = id_npc
        self.conector = ControlaBanco()

        linha = self.conector.select("NPC", "nome,qtdVida,idUniforme", f"idNPC = {self.id_npc}")[0]
        self.nome = linha[0]
        self.qtd_vida = linha[1]
        self.uniforme = Uniforme(linha[2])
        self.linha_arma = self.conector.select("NPCequipaArma", "*", f"idNPC = {id_npc}")
        print(self.linha_arma)
        time.sleep(100)

    def lista_equipamento(self):
        print("id_npc = " + str(self.id_npc))
        print("nome = " + self.nome)
        print("qtd_vida = " + str(self.qtd_vida))
        self.uniforme.listar()

