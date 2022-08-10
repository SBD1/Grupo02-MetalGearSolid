from enum import Enum


class TipoDeArma(Enum):
    PRIMARIA = 'PRIMARIA'
    SECUNDARIA = 'SECUNDARIA'

class Arma:
    def __init__(self,
                 dano: int,
                 max_balas: int,
                 prob_acerto:int,
                 taxa_disparo: int,
                 nome: str,
                 tamanho_do_pente: int,
                 tipo: TipoDeArma,
                 penetracao: int,
                 municao_letal: bool
                 ):

        self.dano = dano
        self.max_balas = max_balas
        self.prob_acerto = prob_acerto
        self.taxa_disparo = taxa_disparo
        self.nome = nome
        self.tamanho_do_pente = tamanho_do_pente
        self.tipo = tipo
        self.penetracao = penetracao
        self.municao_letal = municao_letal
