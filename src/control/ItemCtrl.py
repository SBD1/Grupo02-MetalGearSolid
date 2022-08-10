class Item:
    def __init__(self,
                 id: int,
                 descricao: str,
                 dano: int,
                 probabilidade_nocaute: int
                 ):

        self.id = id
        self.descricao = descricao
        self.dano = dano
        self.probabilidade_nocaute = probabilidade_nocaute