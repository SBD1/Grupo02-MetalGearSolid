from classes.ControlaBanco import ControlaBanco

class Uniforme:
    def __init__(self,idUniforme):
        self.id_uniforme = idUniforme
        self.conector = ControlaBanco()

        linha = self.conector.select("Uniforme","nome,defesa")[0]
        self.nome = linha[0]
        self.defesa = linha[1]

    def camufla(self,idTerreno):
        self.camuflagem = 0
