from enum import Enum

class TipoDeSoldado(Enum):
    COMBATE = 'COMBATE'
    MEDICA = 'MEDICA'
    INTELIGENCIA = 'INTELIGENCIA'
    DESENVBASE = 'DESENVBASE'
    SUPORTE = 'SUPORTE'

class Unidade:
    def __init__(self,
                 id: int,
                 nivel: int,
                 quantidade_de_soldados: int,
                 tipo: TipoDeSoldado,
                 max_soldados: int
                 ):

        self.id = id
        self.nivel = nivel
        self.quantidade_de_soldados = quantidade_de_soldados
        self.tipo = tipo
        self.max_soldados = max_soldados
