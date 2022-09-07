from classes.ControlaBanco import ControlaBanco
from settings import desenha_cabecalho

MENSAGEM_INTERFACE_NOVO_JOGO = """Insira o seu nome de usuário.
Esse nome será utilizado para identificá-lo e para carregar o progresso.
Caso queira voltar ao menu principal, digite "voltar"."""


def interface_novo_jogo():
    # TRATAMENTO DE EXCEÇÕES: CASO O USUÁRIO DIGITE UM NOME JÁ EXISTENTE NO SISTEMA.
    # PRECISA CONECTAR NO BD

    banco = ControlaBanco()
    desenha_cabecalho()
    print(MENSAGEM_INTERFACE_NOVO_JOGO)
    entrada_do_jogador = input(">> ")

    while entrada_do_jogador != "voltar":

        player = banco.select("Player", "nome", f"nome = '{entrada_do_jogador}'")

        if player:
            print("Esse nome já existe no sistema. Por favor, insira um nome válido!")
            print("""Caso queira voltar ao menu principal, digite "voltar". """)
        else:
            banco.insert("Player", "nome", f"'{entrada_do_jogador}'")
            break                           # Aqui, precisamos decidir se vamos direcionar o usuário direto para a interface de seleção de missões ou
                                            # se vamos dizer que o nome foi cadastrado no sistema e, a partir disso, informá-lo de que ele deve entrar
                                            # na interface de carregamento de jogo para acessá-lo.

        entrada_do_jogador = input(">> ")


