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

        self.armasPrimarias = []
        self.armasSecundarias = []
        linha = self.conector.select("NPCequipaArma", "idArma", f"idNPC = {id_npc}")

        for l in linha:
            arma = Arma(l[0])
            if arma.tipo in 'PRIMARIA':
                self.armasPrimarias.append(arma)
            else:
                self.armasSecundarias.append(arma)

    def lista_equipamento(self):

        self.uniforme.listar()
        time.sleep(2)

        for arma_primaria in self.armasPrimarias:
            arma_primaria.listar()

        for arma_secundaria in self.armasSecundarias:
            arma_secundaria.listar()
