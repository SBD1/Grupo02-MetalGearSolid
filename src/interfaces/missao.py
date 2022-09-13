from classes.ControlaBanco import ControlaBanco
from settings import desenha_cabecalho

def comanda_mapa(player: Player,id_missao):

    while True:
        desenha_cabecalho()
        mapa = Mapa(id_missao)
        mapa.desenha_mapa()

