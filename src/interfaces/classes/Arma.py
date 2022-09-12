from classes.ControlaBanco import ControlaBanco
import time


class Arma:
    def __init__(self, id_arma):
        self.banco = ControlaBanco()
        self.id_arma = id_arma
        self.linha = self.banco.select("Arma", "*", f"idArma = {id_arma}")[0]
        self.nome = self.linha[1]
        self.dano = self.linha[2]
        self.max_balas = self.linha[3]
        self.probabilidade_acerto = self.linha[4]
        self.taxa_disparo = self.linha[5]
        self.tamanho_pente = self.linha[6]
        self.penetracao = self.linha[7]
        self.municao_letal = self.linha[8]
        self.tipo = self.linha[9]

    def listar(self):

        print("id : " + str(self.id_arma))

        print("\nArma: {}\nDano: {}\nTotal balas: {}\nProbabilidade de Acerto: {}%\nTaxa de disparo: {}\nTamanho do pente: {}\nPenetracao: {}\nMunicao Letal: {}\nTipo da arma: {}\n".format(
        self.nome,
        self.dano,
        self.tamanho_pente,
        self.probabilidade_acerto,
        self.taxa_disparo,
        self.max_balas,
        self.penetracao,
        self.municao_letal,
        self.tipo
        ))
