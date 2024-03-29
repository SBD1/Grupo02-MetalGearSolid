from classes.Player import Player
from classes.ControlaBanco import ControlaBanco
from classes.Arma import Arma
from classes.Uniforme import Uniforme
from settings import desenha_cabecalho
from missao import comanda_mapa
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

        elif entrada_do_jogador == 'secundaria':
            player = equipa_secundaria(player)

        elif entrada_do_jogador == 'uniforme':
            player = equipa_uniforme(player)

        elif entrada_do_jogador == 'iniciar':
            comanda_mapa(player,id_missao)
            break


def equipa_primaria(player: Player):
    conector = ControlaBanco()
    lista_id_armas_primarias = conector.select("Arma", "idArma", """tipo= 'PRIMARIA'""")
    print("\n\tListagem Armas Primárias")
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
    print("\n\tListagem Armas Secundárias")
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


def equipa_uniforme(player: Player):
    conector = ControlaBanco()
    lista_uniformes = conector.select("Uniforme", "idUniforme,nome,defesa")
    print("\n\tListagem Uniformes")
    time.sleep(1)
    for uniforme in lista_uniformes:
        id_uniforme = uniforme[0]
        uniforme = Uniforme(id_uniforme)
        uniforme.listar()
        time.sleep(2)

    print("Digite um id_uniforme para selecionar o uniforme! ")
    time.sleep(1)
    uniforme_escolhido = input(">> ").split()

    try:
        lista_id = [int(i) for i in uniforme_escolhido]
        if len(lista_id) > 1:
            print("Digite, no máximo, 1 id!")
            time.sleep(2)
        else:
            player.npc.uniforme = Uniforme(lista_id[0])

    except ValueError:
        print("Digite um id válido!")
        time.sleep(2)

    return player

