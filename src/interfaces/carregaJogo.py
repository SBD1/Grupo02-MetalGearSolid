from classes.ControlaBanco import ControlaBanco
from settings import desenha_cabecalho

MENSAGEM_INTERFACE_CARREGAMENTO = """Insira o seu nome de usuário.
Caso queira voltar ao menu principal, digite "voltar"."""


def interface_carregamento_jogo():

    banco = ControlaBanco()

    desenha_cabecalho()
    print(MENSAGEM_INTERFACE_CARREGAMENTO)

    entrada_do_jogador = input(">> ")
    while entrada_do_jogador != "voltar":
        nome = banco.select("Player", "nome", f"nome = '{entrada_do_jogador}'")

        if not nome:
            print("Insira um nome existente no sistema!")
            print("""Caso queira voltar ao menu principal, digite "voltar". """)
        else:
            print(nome)

        entrada_do_jogador = input(">> ")


def trata_entrada(entrada):
    pass
