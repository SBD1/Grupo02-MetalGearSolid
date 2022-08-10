class NPC:
    def __init__(self,
                 id:int,
                 nome: str,
                 quantidade_de_vida: int,
                 id_uniforme: int,
                 id_unidade: int,
                 nivel_desenvolvimento_base: int,
                 nivel_combate: int,
                 nivel_suporte: int,
                 nivel_medica: int,
                 nivel_inteligencia: int
                 ):

        self.id = id
        self.nome = nome
        self.quantidade_de_vida = quantidade_de_vida
        self.id_uniforme = id_uniforme
        self.id_unidade = id_unidade
        self.nivel_desenvolvimento_base = nivel_desenvolvimento_base
        self.nivel_combate = nivel_combate
        self.nivel_suporte = nivel_suporte
        self.nivel_medica = nivel_medica
        self.nivel_inteligencia = nivel_inteligencia