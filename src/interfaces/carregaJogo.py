from src.settings import MENSAGEM_INTERFACE_CARREGAMENTO


def interface_carregamento_jogo():

    mensagem_da_interface = MENSAGEM_INTERFACE_CARREGAMENTO

    print(mensagem_da_interface)

    entrada_do_jogador = input(">> ").split()
    # TRATAMENTO DE EXCEÇÕES: CASO O USUÁRIO INSIRA UM NOME NÃO EXISTENTE NO SISTEMA.
    trata_entrada(entrada_do_jogador)


def trata_entrada(entrada):
    pass
