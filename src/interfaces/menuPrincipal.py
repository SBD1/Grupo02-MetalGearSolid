from novoJogo import interface_novo_jogo
from carregaJogo import interface_carregamento_jogo
from settings import desenha_cabecalho, desenha_saida
import time

def interface_exit():
    desenha_saida()
    return True


MENSAGEM_MENU = """Bem-vindo ao Metal Gear Solid V.\n
    Escolha uma opção: \n
    N - NOVO JOGO
    C - CARREGAR JOGO
    S - SAIR \n"""

ENTRADAS_ACEITAS = {
    'N': interface_novo_jogo,
    'C': interface_carregamento_jogo,
    'S': interface_exit
}


def interface_menu_principal():
    quer_sair = False
    while not quer_sair:

        time.sleep(0.3)
        desenha_cabecalho()
        time.sleep(0.5)
        print(MENSAGEM_MENU)
        time.sleep(0.3)

        entrada_jogador = input(">> ")
        try:
            quer_sair = ENTRADAS_ACEITAS[entrada_jogador]()
        except KeyError:
            print("Valor invalido!")
