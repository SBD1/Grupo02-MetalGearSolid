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

        print(self.linha)
        time.sleep(100)

