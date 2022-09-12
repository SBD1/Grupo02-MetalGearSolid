from classes.Player import Player
from classes.ControlaBanco import ControlaBanco
from classes.Arma import Arma
from settings import desenha_cabecalho
import time

opcoes = '''
Digite: 'voltar' para sair.

Digite: 'primaria' para selecionar 2 armas primarias
Digite: 'secundaria' para selecionar 2 armas secundarias
Digite: 'uniforme' para selecionar um uniforme

Digite: 'iniciar' para iniciar a missao.
'''

ENTRADAS_ACEITAS = ['primaria', 'secundaria', 'uniforme', 'iniciar', 'voltar']


def prepara_missao(player: Player, id_missao: int):
    entrada_do_jogador = ''
    while entrada_do_jogador != 'voltar':
        desenha_cabecalho()
        print("\t\tEquipamentos atuais:")
        print("-----------------------------------------------------------------------------------")
        time.sleep(2)
        player.npc.lista_equipamento()
        time.sleep(2)
        print(opcoes)
        time.sleep(2)

        entrada_do_jogador = input(">> ").strip()

        while entrada_do_jogador not in ENTRADAS_ACEITAS:
            entrada_do_jogador = input(">> ").strip()
        
        if entrada_do_jogador == 'primaria':
            player = equipa_primaria(player)
            continue
        elif entrada_do_jogador == 'secundaria':
            player = equipa_secundaria(player)
            continue
        elif entrada_do_jogador == 'uniforme':
            pass
        elif entrada_do_jogador == 'iniciar':
            pass

       # print("Se você deseja iniciar o jogo, digite 'iniciar'. ")
       # print("S")


def equipa_primaria(player: Player):
    conector = ControlaBanco()
    lista_id_armas_primarias = conector.select("Arma", "idArma", """tipo= 'PRIMARIA'""")
    print("\n\tListagem Arma")
    time.sleep(1)
    for id_arma in lista_id_armas_primarias:
        _id_arma = id_arma[0]
        arma = Arma(_id_arma)
        arma.listar()
        time.sleep(2)
    print("Digite um ou dois id_arma para selecionar as armas primárias")
    time.sleep(1)
    armas_escolhidas = input(">> ").split()

    try:
        lista_id = [int(i) for i in armas_escolhidas]
        if len(lista_id) > 2:
            print("Digite, no máximo, 2 ids!")
            time.sleep(2)
        else:
            player.npc.armasPrimarias = []
            for i in lista_id:
                player.npc.armasPrimarias.append(Arma(i))

    except ValueError:
        print("Digite ids válidos!")
        time.sleep(2)

    return player


def equipa_secundaria(player: Player):
    conector = ControlaBanco()
    lista_id_armas_secundarias = conector.select("Arma", "idArma", """tipo= 'SECUNDARIA'""")
    print("\n\tListagem Arma")
    time.sleep(1)
    for id_arma in lista_id_armas_secundarias:
        _id_arma = id_arma[0]
        arma = Arma(_id_arma)
        arma.listar()
        time.sleep(2)
    print("Digite um ou dois id_arma para selecionar as armas secundarias")
    time.sleep(1)
    armas_escolhidas = input(">> ").split()

    try:
        lista_id = [int(i) for i in armas_escolhidas]
        if len(lista_id) > 2:
            print("Digite, no máximo, 2 ids!")
            time.sleep(2)
        else:
            player.npc.armasSecundarias= []
            for i in lista_id:
                player.npc.armasSecundarias.append(Arma(i))

    except ValueError:
        print("Digite ids válidos!")
        time.sleep(2)

    return player

