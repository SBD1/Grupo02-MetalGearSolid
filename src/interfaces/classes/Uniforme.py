from classes.ControlaBanco import ControlaBanco


class Uniforme:
    def __init__(self, id_uniforme):
        self.id_uniforme = id_uniforme
        self.conector = ControlaBanco()

        linha = self.conector.select("Uniforme", "nome,defesa", f"idUniforme = {id_uniforme}")[0]
        self.nome = linha[0]
        self.defesa = linha[1]

    def listar(self):
        print("UNIFORME")
        print("ID #" + str(self.id_uniforme))
        print("Nome: " + self.nome)
        print("Defesa: " + str(self.defesa))
        print("")

    def camufla(self, idTerreno):
        self.camuflagem = 0
