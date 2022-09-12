from classes.Player import Player
from classes.ControlaBanco import ControlaBanco
from settings import desenha_cabecalho
import time

opcoes = '''
Digite: 'voltar' para sair.

Digite: 'primaria' para selecionar 2 armas primarias
Digite: 'secundaria' para selecionar 2 armas secundarias
Digite: 'uniforme' para selecionar um uniforme

Digite: 'iniciar' para iniciar a missao.
'''

ENTRADAS_ACEITAS = [ 'primaria', 'secundaria', 'uniforme', 'iniciar', 'voltar']


def prepara_missao(player: Player, id_missao: int):
    entrada_do_jogador = ''
    while entrada_do_jogador != 'voltar':
        desenha_cabecalho()
        print(opcoes)
        print("\t\tEquipamentos atuais:")
        print("-----------------------------------------------------------------------------------")
        player.npc.lista_equipamento()
        
        while not entrada_do_jogador in ENTRADAS_ACEITAS:
            entrada_do_jogador = input(">> ").strip()
        
        if entrada_do_jogador == 'primaria':
            pass
        elif entrada_do_jogador == 'secundaria':
            pass
        elif entrada_do_jogador == 'uniforme':
            pass
        elif entrada_do_jogador == 'iniciar':
            pass
