from classes.ControlaBanco import ControlaBanco
from classes.Npc import NPC

class Mapa:
    def __init__(self,id_missao):
        self.conector = ControlaBanco()

        linha = self.conector.select("Mapa",'nome,tamanho,idMapa','tamanho = (select MAX(tamanho) from mapa where idMissao = 1 group by idmissao)')[0]
        self.nome = linha[0]
        self.tamanho = linha[1]
        self.id_mapa = linha[2]

        self.objetivos = self.conector.select("Objetivo","*",f"idMapa = {self.id_mapa}")

        self.inimigos = []
        linha = self.conector.select("NPC","idNPC",f"idMapa = {self.id_mapa}")

        for id_inimigos in linha:
            self.inimigos.append(NPC(id_inimigos[0]))

        self.recursos = self.conector.select("mapaposicionarecurso","*",f"idMapa = {self.id_mapa}")

        self.submapas = []
        linha = self.conector.select("mapatemmapa","idMapa",f"idMapa = {self.id_mapa}")

        for id_submapa in linha:
            self.submapas.append(Mapa(id_submapa[0]))

    def desenha_mapa(self):
        print(f"\t\t\t\t{self.nome}")
        #for i in range(self.tamanho):
        #    for j in range(self.tamanho):
        #        pass
                #if
